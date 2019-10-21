
import Foundation
import Lingo

public protocol HTMLRenderable {

    //    /// Renders a `ContextualTemplate` formula
    //    ///
    //    ///     try renderer.render(WelcomeView.self)
    //    ///
    //    /// - Parameters:
    //    ///   - type: The view type to render
    //    ///   - context: The needed context to render the view with
    //    /// - Returns: Returns a rendered view in a raw `String`
    //    /// - Throws: If the formula do not exists, or if the rendering process fails
    //    func renderRaw<T: ContextualTemplate>(_ type: T.Type, with context: T.Context) throws -> String
    //
    //    /// Renders a `StaticView` formula
    //    ///
    //    ///     try renderer.render(WelcomeView.self)
    //    ///
    //    /// - Parameter type: The view type to render
    //    /// - Returns: Returns a rendered view in a raw `String`
    //    /// - Throws: If the formula do not exists, or if the rendering process fails
    //    func renderRaw<T>(_ type: T.Type) throws -> String where T: StaticView
    //
    //    /// Renders a `ContextualTemplate` formula
    //    ///
    //    ///     try renderer.render(WelcomeView.self)
    //    ///
    //    /// - Parameters:
    //    ///   - type: The view type to render
    //    ///   - context: The needed context to render the view with
    //    /// - Returns: Returns a rendered view in a `Response`
    //    /// - Throws: If the formula do not exists, or if the rendering process fails
    //    func render<T: ContextualTemplate>(_ type: T.Type, with context: T.Context) throws -> Response

    func renderRaw<T: TemplateView>(_ type: T.Type, with context: T.Value) throws -> String

    func renderRaw<T: StaticView>(_ type: T.Type) throws -> String
}

/// A struct containing the differnet formulas for the different views.
///
///     try renderer.add(template: WelcomeView())           // Builds the formula
///     try renderer.render(WelcomeView.self)               // Renders the formula
public struct HTMLRenderer: HTMLRenderable {

    /// The different Errors that can happen when rendering or pre-rendering a template
    enum Errors: LocalizedError {
        case unableToFindFormula
        case unableToRetriveValue
        case unableToRegisterKeyPath
        case unableToAddVariable

        var errorDescription: String? {
            switch self {
            case .unableToFindFormula:      return "Unable to find a formula for the given view type"
            case .unableToRetriveValue:     return "Unable to retrive the wanted value in the context"
            case .unableToRegisterKeyPath:  return "Unable to register a KeyPath when creating the template formula"
            case .unableToAddVariable:      return "Unable to add variable to formula"
            }
        }

        var recoverySuggestion: String? {
            switch self {
            case .unableToFindFormula:
                return "Remember to add the template to the renerer with .add(template: ) or .add(view: )"
            default: return nil
            }
        }
    }

    /// A cache that contains all the brewed `Template`'s
    var formulaCache: [String: Any]

    /// The localization to use when rendering
    var lingo: Lingo?

    /// The calendar to use when rendering dates
    public var calendar: Calendar = Calendar(identifier: .gregorian)

    /// The time zone to use when rendering dates
    public var timeZone: TimeZone = TimeZone(secondsFromGMT: 0) ?? TimeZone.current

    public init() {
        formulaCache = [:]
    }

    /// Renders a `ContextualTemplate` formula
    ///
    ///     try renderer.render(WelcomeView.self)
    ///
    /// - Parameters:
    ///   - type: The view type to render
    ///   - context: The needed context to render the view with
    /// - Returns: Returns a rendered view in a raw `String`
    /// - Throws: If the formula do not exists, or if the rendering process fails
    //    public func renderRaw<T: ContextualTemplate>(_ type: T.Type, with context: T.Context) throws -> String {
    //        guard let formula = formulaCache[String(reflecting: T.self)] as? Formula<T.Context> else {
    //            throw Errors.unableToFindFormula
    //        }
    //        return try formula.render(with: context, lingo: lingo, locale: nil)
    //    }

    public func renderRaw<T: TemplateView>(_ type: T.Type, with context: T.Value) throws -> String {
        guard let formula = formulaCache[String(reflecting: T.self)] as? Formula<T.Value> else {
            throw Errors.unableToFindFormula
        }
        return try formula.render(with: context, lingo: lingo)
    }

    public func renderRaw<T: StaticView>(_ type: T.Type) throws -> String {
        guard let formula = formulaCache[String(reflecting: T.self)] as? Formula<Void> else {
            throw Errors.unableToFindFormula
        }
        return try formula.render(with: (), lingo: lingo)
    }

    /// Brews a formula for later use
    ///
    ///     try renderer.add(template: WelcomeView.self)
    ///
    /// - Parameter type: The view type to brew
    /// - Throws: If the brewing process fails for some reason
    //    public mutating func add<T: ContextualTemplate>(template view: T) throws {
    //        let formula = Formula(context: T.Context.self, calendar: calendar, timeZone: timeZone)
    //        try view.build().prerender(formula)
    //        formulaCache[String(reflecting: T.self)] = formula
    //    }

    public mutating func add<T: TemplateView>(view: T) throws {
        let formula = Formula(context: T.Value.self)
        try view.prerender(formula)
        formulaCache[String(reflecting: T.self)] = formula
    }

    public mutating func add<T: StaticView>(view: T) throws {
        let formula = Formula(context: Void.self)
        try view.prerender(formula)
        formulaCache[String(reflecting: T.self)] = formula
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
    public mutating func registerLocalization(atPath path: String = "Resources/Localization", defaultLocale: String = "en") throws {
        lingo = try Lingo(rootPath: path, defaultLocale: defaultLocale)
    }

    /// Manage the differnet contextes
    /// This will remove the generic type in the render call
    public class ContextManager<Context> {

        let rootContext: Context

        /// The different context varaibles used when rendering
        var contextes: [String: Any]

        /// The lingo object that is needed to use localization
        let lingo: Lingo?

        /// The path to the selected locale to use in localization
        public var locale: String?

        init(rootContext: Context, lingo: Lingo? = nil) {
            self.rootContext = rootContext
            self.contextes = [:]
            self.lingo = lingo
            self.locale = nil
        }

        /// The value for a `ContextVariable`
        ///
        /// - Returns: The value at the `ContextVariable`
        func value<Root, Value>(for variable: ContextVariable<Root, Value>) throws -> Value {
            if variable.rootId.isEmpty,
                let path = variable.root as? KeyPath<Context, Value> {
                return rootContext[keyPath: path]
            } else if let variableContext = contextes[variable.rootId] as? Root {
                return variableContext[keyPath: variable.root]
            } else {
                throw Errors.unableToRetriveValue
            }
        }

        func set<Value>(_ context: Value, for variable: ContextVariable<Value, Value>) {
            contextes[variable.rootId] = context
        }
    }

    /// A formula for a view
    /// This contains the different parts to pice to gether, in order to increase the performance
    public class Formula<T> {

        /// The different pices or ingredients needed to render the view
        var ingredient: [View]

        /// The calendar to use when rendering dates
        var calendar: Calendar

        /// The time zone to use when rendering dates
        var timeZone: TimeZone

        /// Init's a view
        ///
        /// - Parameters:
        ///   - view: The view type
        ///   - contextPaths: The contextPaths. *Is empty by default*
        init(context: T.Type, calendar: Calendar = .current, timeZone: TimeZone = .current) {
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
        public func add(mappable: View) {
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
        func render(with context: T, lingo: Lingo?) throws -> String {
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
            return try ingredient.reduce("") { try $0 + $1.render(with: manager) }
        }
    }
}
