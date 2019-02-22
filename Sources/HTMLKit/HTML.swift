

/// A struct containing the different structs to render a HTML document
public struct HTML {

    public enum Errors: Error {
        case incorrectGenericType
    }

    /// An attribute on a node
    ///
    ///     AttributeNode.class("text-dark") // <... class="text-dark"/>
    public struct AttributeNode {

        /// The attribute to set
        public let attribute: String

        /// The value of the attribute
        public let value: CompiledTemplate?
    }

    /// A node that wrap around any content that is renderable
    ///
    ///     DataNode(nodeName: "img", attributes: [.src("url")]) // <img src="url"/>
    public struct DataNode {

        /// The name of the type of node
        ///
        ///     nodeName = "img" // <img .../>
        ///     nodeName = "link" // <link .../>
        public let nodeName: String

        /// The attributes in an node
        ///
        ///     attributes = [.class("text-dark")] // <`nodeName` class="text-dark"/>
        public let attributes: [AttributeNode]

        public init(nodeName: String, attributes: [AttributeNode] = []) {
            self.nodeName = nodeName
            self.attributes = attributes
        }
    }

    /// A node that wrap around any content that is renderable
    ///
    ///     ContentNode(nodeName: "div", content: "Some text") // <div>Some text</div>
    public struct ContentNode {

        /// The name of the type of node
        ///
        ///     nodeName = "div" // <div>...</div>
        ///     nodeName = "p" // <p>...</p>
        public let nodeName: String

        /// The attributes in an node
        ///
        ///     attributes = [.class("text-dark")] // <`nodeName` class="text-dark">...</`nodeName`>
        public let attributes: [AttributeNode]

        /// The content to be wrapped
        ///
        ///     content = "Some text" // <...>Some text</...>
        public let content: CompiledTemplate

        public init(nodeName: String, attributes: [AttributeNode] = [], content: CompiledTemplate = "") {
            self.nodeName = nodeName
            self.attributes = attributes
            self.content = content
        }
    }

    /// A variable making it possible to lazily insert variables
    ///
    ///     div(children: variable(\.name))     // May leed to "<div>Mats</div>", deepending in the context given
    public struct Variable<Root, Value> where Value: CompiledTemplate {

        /// The key-path to the variable to render
        public let keyPath: KeyPath<Root, Value>
    }

    /// Making it possible to embed othet templates in a View
    ///
    ///     embed(SomeView.self, contextKey: \.context)
    public struct EmbedTemplate<E, T> where T: ContextualTemplate {

        /// The type of the template
        public let templateType: T

        /// The key-path the the needed content
        public let contextKeyPath: KeyPath<E, T.Context>
    }

    /// A struct making it possible to have a for each loop in the template
    ///
    ///     forEach(\.collection, render: CollectionView.self)
    public class ForEach<Root: ContextualTemplate, Value: ContextualTemplate> {

        /// The view type to render
        public let view: Value

        /// The path to the collection to loop
        public let collectionPath: KeyPath<Root.Context, [Value.Context]>

        /// A local formula, in order to increase the performance
        var localFormula: Renderer.Formula<Value.Context>

        public init(view: Value, collectionPath: KeyPath<Root.Context, [Value.Context]>) {
            self.view = view
            self.collectionPath = collectionPath
            self.localFormula = Renderer.Formula(view: Value.Context.self)
        }
    }

    /// A struct making it possible to have a if in the template
    ///
    ///     renderIf(\.name == "Name", view: ...)
    public class IF<Root> where Root: ContextualTemplate {

        /// One condition in the if
        public class Condition {

            /// The condition to evaluate
            let condition: Conditionable

            /// The local formula for optimazation
            var localFormula: Renderer.Formula<Root.Context>

            /// The view to render.
            /// Set to an empty string in order to create a condition on `\.name == ""`
            /// This should probably be re designed a little
            var view: CompiledTemplate = ""

            /// Creates an if condition
            ///
            /// - Parameter condition: The condition to evaluate
            init(condition: Conditionable) {
                self.condition = condition
                localFormula = Renderer.Formula(view: Root.Context.self)
            }
        }

        /// The different conditions that can happen
        var conditions: [Condition]

        /// Create an if, with the first condition
        ///
        /// - Parameter conditions: The first condition
        init(conditions: Condition) {
            self.conditions = [conditions]
        }
    }

    /// A struct containing the differnet formulas for the different views.
    ///
    ///     try renderer.brewFormula(for: WelcomeView.self)     // Builds the formula
    ///     try renderer.render(WelcomeView.self)               // Renders the formula
    public struct Renderer {

        enum Errors: Error {
            case unableToFindFormula
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
            guard let formula = formulaCache["\(T.self)"] as? Formula<T.Context> else {
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
            let formula = Formula(view: T.Context.self)
            try view.build().brew(formula)
            formulaCache["\(T.self)"] = formula
        }

        public func render<T: TemplateBuilder>(_ type: T.Type) throws -> String {
            guard let formula = formulaCache["\(T.self)"] as? Formula<Void> else {
                throw Errors.unableToFindFormula
            }
            return try formula.render(with: ())
        }

        /// Brews a formula for later use
        ///
        ///     try renderer.brewFormula(for: WelcomeView.self)
        ///
        /// - Parameter type: The view type to brew
        /// - Throws: If the brewing process fails for some reason
        public mutating func add(view: TemplateBuilder) throws {
            let formula = Formula(view: Void.self)
            try view.build().brew(formula)
            formulaCache["\(type(of: view))"] = formula
        }

        /// Manage the differnet contextes
        /// This will remove the generic type in the render call
        public struct ContextManager<Context> {

            fileprivate let rootContext: Context

            /// The different paths from the orignial context
            fileprivate var contextPaths: [String : AnyKeyPath]

            func value<Root, Value>(at path: KeyPath<Root, Value>) throws -> Value {
                if let context = rootContext as? Root {
                    return context[keyPath: path]
                } else if let joinPath = contextPaths["\(Root.self)"] as? KeyPath<Context, Root> {
                    let finalPath = joinPath.appending(path: path)
                    return rootContext[keyPath: finalPath]
                } else {
                    throw Errors.unableToFindFormula
                }
            }
        }


        /// A formula for a view
        /// This contains the different parts to pice to gether, in order to increase the performance
        public class Formula<T> {

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
            public func register<Root, Value>(keyPath: KeyPath<Root, Value>) {
                if Root.self == T.self {
                    contextPaths["\(Value.self)"] = keyPath
                } else if let joinPath = contextPaths["\(Root.self)"] {
                    contextPaths["\(Value.self)"] = joinPath.appending(path: keyPath)
                } else {
                    print("Unable to register: ", keyPath)
                }
            }

            /// Adds a variable to the formula
            ///
            /// - Parameter variable: The variable to add
            public func add<Root, Value>(variable: Variable<Root, Value>) {
                if Root.self == T.self {
                    ingredient.append(variable)
                } else if let joinPath = contextPaths["\(Root.self)"] as? KeyPath<T, Root> {
                    let newVariable = Variable<T, Value>(keyPath: joinPath.appending(path: variable.keyPath))
                    ingredient.append(newVariable)
                } else {
                    print("Unable to add variable from \(Root.self), to \(Value.self): ", variable)
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
            func render(with context: T) throws -> String {
                let contextManager = ContextManager(rootContext: context, contextPaths: contextPaths)
                return try ingredient.reduce("") { try $0 + $1.render(with: contextManager) }
            }

            func render(with manager: ContextManager<T>) throws -> String {
                return try ingredient.reduce("") { try $0 + $1.render(with: manager) }
            }
        }
    }
}

