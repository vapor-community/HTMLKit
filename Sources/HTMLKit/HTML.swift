
//public protocol Condition {
//    associatedtype Root: ContextualTemplate
//    associatedtype Value
//    func evaluate(with context: Root.Context) -> Bool
//}
//
//public struct Equal<Root, Value>: Condition where Root: ContextualTemplate, Value: Equatable {
//    let path: KeyPath<Root.Context, Value>
//    let value: Value
//
//    public func evaluate(with context: Root.Context) -> Bool {
//        return context[keyPath: path] == value
//    }
//}
//
//public struct LessThen<Root, Value>: Condition where Root: ContextualTemplate, Value: Comparable {
//    let path: KeyPath<Root.Context, Value>
//    let value: Value
//
//    public func evaluate(with context: Root.Context) -> Bool {
//        return context[keyPath: path] < value
//    }
//}
//
//public struct GreaterThen<Root, Value>: Condition where Root: ContextualTemplate, Value: Comparable {
//    let path: KeyPath<Root.Context, Value>
//    let value: Value
//
//    public func evaluate(with context: Root.Context) -> Bool {
//        return context[keyPath: path] > value
//    }
//}
//
//public struct IFCondition<Root, Value, C> where C: Condition, Root == C.Root, Value == C.Value {
//    let condition: C
//}

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
        public let value: Mappable?
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
        public let content: Mappable
    }

    /// A variable making it possible to lazily insert variables
    ///
    ///     div(children: variable(\.name))     // May leed to "<div>Mats</div>", deepending in the context given
    public struct Variable<Root, Value> where Root: ContextualTemplate, Value: Mappable {

        /// The key-path to the variable to render
        public let keyPath: KeyPath<Root.Context, Value>
    }

    /// Making it possible to embed othet templates in a View
    ///
    ///     embed(SomeView.self, viewConfig: .init(...), contextKey: \.context)
    public struct EmbedViewTemplate<E, T> where E: ContextualTemplate, T: ViewTemplate {

        /// The type of the template
        public let templateType: T.Type

        /// The view context needed to render the view.
        /// This is a variable on in order to prerender the view
        public let viewContext: T.ViewContext

        /// The key-path the the needed content
        public let contextKeyPath: KeyPath<E.Context, T.Context>
    }

    /// Making it possible to embed othet templates in a View
    ///
    ///     embed(SomeView.self, contextKey: \.context)
    public struct EmbedTemplate<E, T> where E: ContextualTemplate, T: Template {

        /// The type of the template
        public let templateType: T.Type

        /// The key-path the the needed content
        public let contextKeyPath: KeyPath<E.Context, T.Context>
    }

    /// A struct making it possible to have a for each loop in the template
    ///
    ///     forEach(\.collection, render: CollectionView.self)
    public class ForEach<Root: ContextualTemplate, Value: Template> {

        /// The view type to render
        public let view: Value.Type

        /// The path to the collection to loop
        public let collectionPath: KeyPath<Root.Context, [Value.Context]>

        /// A local formula, in order to increase the performance
        var localFormula: Renderer.Formula<Value>

        public init(view: Value.Type, collectionPath: KeyPath<Root.Context, [Value.Context]>) {
            self.view = view
            self.collectionPath = collectionPath
            self.localFormula = Renderer.Formula(view: Value.self)
        }
    }

//    public struct IF<Root: ContextualTemplate> {
//
//        let conditions: [IFCondition<Root, Any, Any>]
//
//        let view: Mappable
//    }

    /// A struct containing the differnet formulas for the different views.
    ///
    ///     try renderer.brewFormula(for: WelcomeView.self)     // Builds the formula
    ///     try renderer.render(WelcomeView.self)               // Renders the formula
    public struct Renderer {

        enum Errors: Error {
            case unableToFindFormula
        }

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
        public func render<T: Template>(_ type: T.Type, with context: T.Context) throws -> String {
            guard let formula = formulaCache["\(T.self)"] as? Formula<T> else {
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
        public mutating func brewFormula<T: Template>(for type: T.Type) throws {
            let formula = Formula(view: type)
            try type.build().brew(formula)
            formulaCache["\(T.self)"] = formula
        }

        /// A formula for a view
        /// This contains the different parts to pice to gether, in order to increase the performance
        public class Formula<T: Template> {

            /// The view the formula is for
            let viewType: T.Type

            /// The different paths from the orignial context
            private var contextPaths: [String : AnyKeyPath]

            /// The different pices or ingredients needed to render the view
            private var ingredient: [Mappable]

            /// Init's a view
            ///
            /// - Parameters:
            ///   - view: The view type
            ///   - contextPaths: The contextPaths. *Is empty by default*
            init(view: T.Type, contextPaths: [String : AnyKeyPath] = [:]) {
                self.viewType = view
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
            public func register<Root, Value>(from: Root.Type, to: Value.Type, using keyPath: KeyPath<Root.Context, Value.Context>) where Root: ContextualTemplate, Value: ContextualTemplate {
                if Root.self == viewType {
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
                if Root.self == viewType {
                    ingredient.append(variable)
                } else if let joinPath = contextPaths["\(Root.self)"] as? KeyPath<T.Context, Root.Context> {
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
            public func add(mappable: Mappable) {
                ingredient.append(mappable)
            }

            /// Renders a formula
            ///
            /// - Parameter context: The context needed to render the formula
            /// - Returns: A rendered formula
            /// - Throws: If some of the formula fails, for some reason
            func render(with context: T.Context) throws -> String {
                return try ingredient.reduce("") { try $0 + $1.map(for: viewType, with: context) }
            }
        }
    }
}

