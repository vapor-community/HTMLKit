import Foundation
import Lingo

/// A struct containing the different formulas for the different views.
///
///     try renderer.add(template: WelcomeView())           // Builds the formula
///     try renderer.render(WelcomeView.self)               // Renders the formula
public class HTMLRenderer: Renderable {

    static let empty = ContextManager<Void>(rootContext: ())

    /// The different Errors that can happen when rendering or pre-rendering a template
    public enum Errors: LocalizedError {
        case unableToFindFormula
        case unableToRetriveValue
        case unableToRegisterKeyPath
        case unableToAddVariable
        case unableToCastVariable

        public var errorDescription: String? {
            switch self {
            case .unableToFindFormula:      return "Unable to find a formula for the given view type"
            case .unableToRetriveValue:     return "Unable to retrive the wanted value in the context"
            case .unableToRegisterKeyPath:  return "Unable to register a KeyPath when creating the template formula"
            case .unableToAddVariable:      return "Unable to add variable to formula"
            case .unableToCastVariable:     return "Unable to cast value when retriving variable"
            }
        }

        public var recoverySuggestion: String? {
            switch self {
            case .unableToFindFormula:
                return "Remember to add the template to the renderer with .add(template: ) or .add(view: )"
            default: return nil
            }
        }
    }

    /// A cache that contains all the brewed `Template`'s
    var formulaCache: [ObjectIdentifier: Formula]

    /// The localization to use when rendering
    var lingo: Lingo?

    /// The calendar to use when rendering dates
    public var calendar: Calendar = Calendar(identifier: .gregorian)

    /// The time zone to use when rendering dates
    public var timeZone: TimeZone = TimeZone(secondsFromGMT: 0) ?? TimeZone.current

    public init() {
        formulaCache = [:]
    }

    public func render<T: HTMLTemplate>(raw type: T.Type, with context: T.Context) throws -> String {
        guard let formula = formulaCache[ObjectIdentifier(type)] else {
            throw Errors.unableToFindFormula
        }
        return try formula.render(with: context, lingo: lingo)
    }

    public func render<T: HTMLPage>(raw type: T.Type) throws -> String {
        guard let formula = formulaCache[ObjectIdentifier(type)] else {
            throw Errors.unableToFindFormula
        }
        return try formula.render(with: (), lingo: lingo)
    }

    /// Adds a forumla to the renderer
    ///
    ///     try renderer.add(view: WelcomeView())
    ///
    /// - Parameter view: The view type to add
    /// - Throws: If the pre-rendering process fails for some reason
    public func add<T: HTMLTemplate>(view: T) throws {
        let formula = Formula()
        try view.prerender(formula)
        formulaCache[ObjectIdentifier(T.self)] = formula
    }

    /// Adds a forumla to the renderer
    ///
    ///     try renderer.add(view: WelcomeView())
    ///
    /// - Parameter view: The view type to add
    /// - Throws: If the pre-rendering process fails for some reason
    public func add<T: HTMLPage>(view: T) throws {
        let formula = Formula()
        try view.prerender(formula)
        formulaCache[ObjectIdentifier(T.self)] = formula
    }

    //    /// Brews a formula for later use
    //    ///
    //    ///     try renderer.add(template: WelcomeView.self)
    //    ///
    //    /// - Parameter type: The view type to brew
    //    /// - Throws: If the brewing process fails for some reason
    //    public mutating func add<T: LocalizedTemplate>(template view: T) throws {
    //        let formula = Formula(context: T.self, calendar: calendar, timeZone: timeZone)
    //        formula.localePath = T
    ////        guard formula.localePath != nil else {
    ////            throw Localize<T, NoContext>.Errors.missingLocalePath
    ////        }
    //        try view.build().prerender(formula)
    //        formulaCache[String(reflecting: T.self)] = formula
    //    }

    /// Registers a localization directory to the renderer
    ///
    ///     try renderer.registerLocalization() // Using default values
    ///     try renderer.registerLocalization(atPath: "Localization", defaultLocale: "nb")
    ///
    /// - Parameters:
    ///   - path: A relative path to the localization folder. This is by *default* set to "Resource/Localization"
    ///   - defaultLocale: The default locale to use. This is by *default* set to "en"
    /// - Throws: If there is an error registrating the lingo
    public func registerLocalization(atPath path: String = "Resources/Localization", defaultLocale: String = "en") throws {
        lingo = try Lingo(rootPath: path, defaultLocale: defaultLocale)
    }

    /// Manage the different contexts
    /// This will remove the generic type in the render call
    public class ContextManager<Context> {

        /// The different context variables used when rendering
        var contexts: [String: Any]

        /// The lingo object that is needed to use localization
        let lingo: Lingo?

        /// The path to the selected locale to use in localization
        public var locale: String?

        init(rootContext: Context, lingo: Lingo? = nil) {
            self.contexts = ["" : rootContext]
            self.lingo = lingo
            self.locale = nil
        }

        init(contexts: [String: Any], lingo: Lingo? = nil) {
            self.contexts = contexts
            self.lingo = lingo
            self.locale = nil
        }

        /// The value for a `ContextVariable`
        ///
        /// - Returns: The value at the `ContextVariable`
        func value<Value>(for variable: HTMLContext<Value>) throws -> Value {
            if let variableContext = contexts[variable.rootId] {
                if let value = variableContext[keyPath: variable.keyPath] as? Value {
                    return value
                } else {
                    throw Errors.unableToCastVariable
                }
            } else {
                throw Errors.unableToRetriveValue
            }
        }

        func set<Value>(_ context: Value, for variable: ContextVariable<Value, Value>) {
            contexts[variable.rootId] = context
        }
    }

    /// A formula for a view
    /// This contains the different parts to pice to gether, in order to increase the performance
    public class Formula {

        /// The different pices or ingredients needed to render the view
        var ingredient: [HTMLContent]

        /// The calendar to use when rendering dates
        var calendar: Calendar

        /// The time zone to use when rendering dates
        var timeZone: TimeZone

        /// Init's a view
        ///
        /// - Parameters:
        ///   - view: The view type
        ///   - contextPaths: The contextPaths. *Is empty by default*
        init(calendar: Calendar = .current, timeZone: TimeZone = .current) {
            ingredient = []
            self.calendar = calendar
            self.timeZone = timeZone
        }

        /// Adds a static string to the formula
        ///
        /// - Parameter string: The string to add
        public func add(string: String) {
            if let last = ingredient.last as? String {
                _ = ingredient.removeLast()
                ingredient.append(last + string)
            } else {
                ingredient.append(string)
            }
        }

        /// Adds a generic `Mappable` object
        ///
        /// - Parameter mappable: The `Mappable` to add
        public func add(mappable: HTMLContent) {
            if let stringRepresentation = mappable as? String {
                add(string: stringRepresentation)
            } else {
                ingredient.append(mappable)
            }
        }

        /// Renders a formula
        ///
        /// - Parameters:
        /// - context: The context needed to render the formula
        /// - lingo: The lingo to use when rendering
        /// - Returns: A rendered formula
        /// - Throws: If some of the formula fails, for some reason
        func render<T>(with context: T, lingo: Lingo?) throws -> String {
            let contextManager = ContextManager(rootContext: context, lingo: lingo)
            return try render(with: contextManager)
        }

        /// Render a formula with a existing `ContextManager`
        /// This may be needed when using a local formula
        ///
        /// - Parameter manager: The manager to use when rendering
        /// - Returns: A rendered formula
        /// - Throws: If some of the formula fails, for some reason
        func render<U>(with manager: ContextManager<U>) throws -> String {
            return try ingredient.reduce(into: "") { $0 += try $1.render(with: manager) }
        }
    }
}
