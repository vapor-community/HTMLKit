
import Foundation
import Lingo
import Vapor

/// A struct containing the differnet formulas for the different views.
///
///     try renderer.add(template: WelcomeView())           // Builds the formula
///     try renderer.render(WelcomeView.self)               // Renders the formula
public struct HTMLRenderer {

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
    var formulaCache: [String : Any]

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
    public func renderRaw<T: ContextualTemplate>(_ type: T.Type, with context: T.Context) throws -> String {
        guard let formula = formulaCache[String(reflecting: T.self)] as? Formula<T.Context> else {
            throw Errors.unableToFindFormula
        }
        return try formula.render(with: context, lingo: lingo, locale: nil)
    }

    /// Renders a `StaticView` formula
    ///
    ///     try renderer.render(WelcomeView.self)
    ///
    /// - Parameter type: The view type to render
    /// - Returns: Returns a rendered view in a raw `String`
    /// - Throws: If the formula do not exists, or if the rendering process fails
    public func renderRaw<T>(_ type: T.Type) throws -> String where T : StaticView {
        guard let formula = formulaCache[String(reflecting: T.self)] as? Formula<T.Context> else {
            throw Errors.unableToFindFormula
        }
        return try formula.render(with: .init(), lingo: lingo, locale: nil)
    }

    /// Renders a `ContextualTemplate` formula
    ///
    ///     try renderer.render(WelcomeView.self)
    ///
    /// - Parameters:
    ///   - type: The view type to render
    ///   - context: The needed context to render the view with
    /// - Returns: Returns a rendered view in a `HTTPResponse`
    /// - Throws: If the formula do not exists, or if the rendering process fails
    public func render<T: ContextualTemplate>(_ type: T.Type, with context: T.Context) throws -> HTTPResponse {
        return try HTTPResponse(headers: .init([("content-type", "text/html; charset=utf-8")]), body: renderRaw(type, with: context))
    }

    /// Renders a `StaticView` formula
    ///
    ///     try renderer.render(WelcomeView.self)
    ///
    /// - Parameter type: The view type to render
    /// - Returns: Returns a rendered view in a `HTTPResponse`
    /// - Throws: If the formula do not exists, or if the rendering process fails
    public func render<T>(_ type: T.Type) throws -> HTTPResponse where T : StaticView {
        return try HTTPResponse(headers: .init([("content-type", "text/html; charset=utf-8")]), body: renderRaw(type))
    }

    /// Brews a formula for later use
    ///
    ///     try renderer.add(template: WelcomeView.self)
    ///
    /// - Parameter type: The view type to brew
    /// - Throws: If the brewing process fails for some reason
    public mutating func add<T: ContextualTemplate>(template view: T) throws {
        let formula = Formula(view: T.Context.self, calendar: calendar, timeZone: timeZone)
        try view.build().brew(formula)
        formulaCache[String(reflecting: T.self)] = formula
    }

    /// Brews a formula for later use
    ///
    ///     try renderer.add(template: WelcomeView.self)
    ///
    /// - Parameter type: The view type to brew
    /// - Throws: If the brewing process fails for some reason
    public mutating func add<T: LocalizedTemplate>(template view: T) throws {
        let formula = Formula(view: T.Context.self, calendar: calendar, timeZone: timeZone)
        formula.localePath = T.localePath
        guard formula.localePath != nil else {
            throw Localize<T, NoContext>.Errors.missingLocalePath
        }
        try view.build().brew(formula)
        formulaCache[String(reflecting: T.self)] = formula
    }

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
        let path = DirectoryConfig.detect().workDir + path
        lingo = try Lingo(rootPath: path, defaultLocale: defaultLocale)
    }

    /// Manage the differnet contextes
    /// This will remove the generic type in the render call
    public struct ContextManager<Context> {

        let rootContext: Context

        /// The different paths from the orignial context
        var contextPaths: [String : AnyKeyPath]

        /// The lingo object that is needed to use localization
        let lingo: Lingo?

        /// The path to the selected locale to use in localization
        var locale: String?

        /// Return the `Context` for a `ContextualTemplate`
        ///
        /// - Returns: The `Context`
        func value<T>(for type: T.Type) throws -> T {
            if let context = rootContext as? T {
                return context
            } else if let path = contextPaths[String(reflecting: T.self)] as? KeyPath<Context, T> {
                return rootContext[keyPath: path]
            } else {
                throw Errors.unableToRetriveValue
            }
        }

        /// The value for a `KeyPath`
        ///
        /// - Returns: The value at the `KeyPath`
        func value<Root, Value>(at path: KeyPath<Root, Value>) throws -> Value {
            if let context = rootContext as? Root {
                return context[keyPath: path]
            } else if let joinPath = contextPaths[String(reflecting: Root.self)] as? KeyPath<Context, Root> {
                let finalPath = joinPath.appending(path: path)
                return rootContext[keyPath: finalPath]
            } else {
                throw Errors.unableToRetriveValue
            }
        }
    }


    /// A formula for a view
    /// This contains the different parts to pice to gether, in order to increase the performance
    public class Formula<Context> {

        /// The different paths from the orignial context
        private var contextPaths: [String : AnyKeyPath]

        /// The different pices or ingredients needed to render the view
        private var ingredient: [CompiledTemplate]

        /// The path to the selected locale to use in localization
        var localePath: KeyPath<Context, String>?

        /// The calendar to use when rendering dates
        var calendar: Calendar

        /// The time zone to use when rendering dates
        var timeZone: TimeZone

        /// Init's a view
        ///
        /// - Parameters:
        ///   - view: The view type
        ///   - contextPaths: The contextPaths. *Is empty by default*
        init(view: Context.Type, calendar: Calendar, timeZone: TimeZone, contextPaths: [String : AnyKeyPath] = [:]) {
            self.contextPaths = contextPaths
            ingredient = []
            self.calendar = calendar
            self.timeZone = timeZone
        }

        /// Registers a key-path for later referancing
        ///
        /// - Note:
        ///     This will be needed when referencing a variable in a eembedded `ViewTemplate`.
        ///     In the `StaticTemplate` and `Template` this is not needed since the embedded views can not referance *higher* level variables.
        ///     This may be optimiced some more later.
        ///
        /// - Parameters:
        ///   - keyPath: The key-path to add
        public func register<Root, Value>(keyPath: KeyPath<Root, Value>) throws {
            if Root.self == Context.self {
                contextPaths[String(reflecting: Value.self)] = keyPath
            } else if let joinPath = contextPaths[String(reflecting: Root.self)] {
                contextPaths[String(reflecting: Value.self)] = joinPath.appending(path: keyPath)
            } else {
                print("🚨 ERROR: when pre-rendering: Unable to register: ", keyPath)
                throw Errors.unableToRegisterKeyPath
            }
        }

        /// Adds a variable to the formula
        ///
        /// - Parameter variable: The variable to add
        public func add<Root, Value>(variable: TemplateVariable<Root, Value>) throws {
            if Root.self == Context.self {
                ingredient.append(variable)
            } else {
                switch variable.referance {
                case .keyPath(let keyPath):
                    if let joinPath = contextPaths[String(reflecting: Root.self)] as? KeyPath<Context, Root> {
                        let newVariable = TemplateVariable<Context, Value>(referance: .keyPath(joinPath.appending(path: keyPath)), escaping: variable.escaping)
                        ingredient.append(newVariable)
                    } else {
                        print("🚨 ERROR: when pre-rendering: \(String(reflecting: Context.self))\n\n-- Unable to add variable from \(String(reflecting: Root.self)), to \(String(reflecting: Value.self))")
                        throw Errors.unableToAddVariable
                    }
                default: print("Trying to register a self varaiable")
                }
            }
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

        /// Adds a generic `CompiledTemplate` object
        ///
        /// - Parameter mappable: The `CompiledTemplate` to add
        public func add(mappable: CompiledTemplate) {
            ingredient.append(mappable)
        }

        /// Renders a formula
        ///
        /// - Parameters:
        ///     - context: The context needed to render the formula
        ///     - lingo: The lingo to use when rendering
        ///     - locale: The locale to render the formula in
        ///
        /// - Returns: A rendered formula
        /// - Throws: If some of the formula fails, for some reason
        func render(with context: Context, lingo: Lingo?, locale: String? = nil) throws -> String {
            let contextManager = createContextManager(with: context, lingo: lingo, locale: locale)
            return try ingredient.reduce("") { try $0 + $1.render(with: contextManager) }
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

        func createContextManager(with context: Context, lingo: Lingo?, locale: String?) -> ContextManager<Context> {
            var usedLocale = locale
            if let localePath = localePath {
                usedLocale = context[keyPath: localePath]
            }
            return ContextManager(rootContext: context, contextPaths: contextPaths, lingo: lingo, locale: usedLocale)
        }
    }
}

extension Request {

    /// Creates a `HTMLRenderer` that can render templates
    ///
    /// - Returns: A `HTMLRenderer` containing all the templates
    /// - Throws: If the shared container could not make the `HTMLRenderer`
    public func renderer() throws -> HTMLRenderer {
        return try sharedContainer.make(HTMLRenderer.self)
    }
}
