
import Foundation

/// A struct containing the differnet formulas for the different views.
///
///     try renderer.brewFormula(for: WelcomeView.self)     // Builds the formula
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
            case .unableToRetriveValue, .unableToAddVariable, .unableToRegisterKeyPath:
                return "Remember to add .embed(withPath: \\Context.contextPath) when embeding a view"
            default: return nil
            }
        }
    }

    /// A cache that contains all the brewed `Template`'s
    var formulaCache: [String : Any]

    public init() {
        formulaCache = [:]
    }

    /// Renders a brewed formula
    ///
    ///     try renderer.render(WelcomeView.self)
    ///
    /// - Parameters:
    ///   - type: The view type to render
    ///   - context: The needed context to render the view with
    /// - Returns: Returns a rendered view
    /// - Throws: If the formula do not exists, or if the rendering process fails
    public func render<T: ContextualTemplate>(_ type: T.Type, with context: T.Context) throws -> String {
        guard let formula = formulaCache[String(reflecting: T.self)] as? Formula<T> else {
            throw Errors.unableToFindFormula
        }
        return try formula.render(with: context)
    }

    /// Brews a formula for later use
    ///
    ///     try renderer.brewFormula(for: WelcomeView.self)
    ///
    /// - Parameter type: The view type to brew
    /// - Throws: If the brewing process fails for some reason
    public mutating func add<T: ContextualTemplate>(template view: T) throws {
        let formula = Formula(view: T.self)
        try view.build().brew(formula)
        formulaCache[String(reflecting: T.self)] = formula
    }

    public func render<T>(_ type: T.Type) throws -> String where T : StaticView {
        guard let formula = formulaCache[String(reflecting: T.self)] as? Formula<T> else {
            throw Errors.unableToFindFormula
        }
        return try formula.render(with: .init())
    }

    /// Brews a formula for later use
    ///
    ///     try renderer.brewFormula(for: WelcomeView.self)
    ///
    /// - Parameter type: The view type to brew
    /// - Throws: If the brewing process fails for some reason
    public mutating func add<T>(view: T) throws where T : StaticView {
        let formula = Formula(view: T.self)
        try view.build().brew(formula)
        formulaCache[String(reflecting: type(of: view))] = formula
    }

    /// Manage the differnet contextes
    /// This will remove the generic type in the render call
    public struct ContextManager<Context> {

        fileprivate let rootContext: Context

        /// The different paths from the orignial context
        fileprivate var contextPaths: [String : AnyKeyPath]

        func value<T>(for type: T.Type) throws -> T.Context where T : ContextualTemplate {
            if let context = rootContext as? T.Context {
                return context
            } else if let path = contextPaths[String(reflecting: T.Context.self)] as? KeyPath<Context, T.Context> {
                return rootContext[keyPath: path]
            } else {
                throw Errors.unableToRetriveValue
            }
        }

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
    public class Formula<T> where T : ContextualTemplate {

        /// The different paths from the orignial context
        private var contextPaths: [String : AnyKeyPath]

        /// The different pices or ingredients needed to render the view
        private var ingredient: [CompiledTemplate]

        /// Init's a view
        ///
        /// - Parameters:
        ///   - view: The view type
        ///   - contextPaths: The contextPaths. *Is empty by default*
        init(view: T.Type, contextPaths: [String : AnyKeyPath] = [:]) {
            self.contextPaths = contextPaths
            ingredient = []
        }

        /// Registers a key-path for later referancing
        ///
        /// - Note:
        ///     This will be needed when referencing a variable in a eembedded `ViewTemplate`.
        ///     In the `StaticTemplate` and `Template` this is not needed since the embedded views can not referance *higher* level variables.
        ///     This may be optimiced some more later.
        ///
        /// - Parameters:
        ///   - from: The root type (Swift complains if this is not in the function body)
        ///   - to: The value type (Swift complains if this is not in the function body)
        ///   - keyPath: The key-path to add
        public func register<Root, Value>(keyPath: KeyPath<Root, Value>) throws {
            if Root.self == T.Context.self {
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
            if Root.Context.self == T.Context.self {
                ingredient.append(variable)
            } else {
                switch variable.referance {
                case .keyPath(let keyPath):
                    if let joinPath = contextPaths[String(reflecting: Root.Context.self)] as? KeyPath<T.Context, Root.Context> {
                        let newVariable = TemplateVariable<T, Value>(referance: .keyPath(joinPath.appending(path: keyPath)), escaping: variable.escaping)
                        ingredient.append(newVariable)
                    } else {
                        print("🚨 ERROR: when pre-rendering: \(String(reflecting: T.self))\n\n-- Unable to add variable from \(String(reflecting: Root.self)), to \(String(reflecting: Value.self))")
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

        /// Adds a generic `Mappable` object
        ///
        /// - Parameter mappable: The `Mappable` to add
        public func add(mappable: CompiledTemplate) {
            ingredient.append(mappable)
        }

        /// Renders a formula
        ///
        /// - Parameter context: The context needed to render the formula
        /// - Returns: A rendered formula
        /// - Throws: If some of the formula fails, for some reason
        func render(with context: T.Context) throws -> String {
            let contextManager = ContextManager(rootContext: context, contextPaths: contextPaths)
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
    }
}
