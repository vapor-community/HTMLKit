
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
        let attribute: String

        /// The value of the attribute
        let value: Mappable?
    }

    /// A node that wrap around any content that is renderable
    ///
    ///     DataNode(nodeName: "img", attributes: [.src("url")]) // <img src="url"/>
    public struct DataNode {

        /// The name of the type of node
        ///
        ///     nodeName = "img" // <img .../>
        ///     nodeName = "link" // <link .../>
        var nodeName: String

        /// The attributes in an node
        ///
        ///     attributes = [.class("text-dark")] // <`nodeName` class="text-dark"/>
        var attributes: [AttributeNode]
    }

    /// A node that wrap around any content that is renderable
    ///
    ///     ContentNode(nodeName: "div", content: "Some text") // <div>Some text</div>
    public struct ContentNode {

        /// The name of the type of node
        ///
        ///     nodeName = "div" // <div>...</div>
        ///     nodeName = "p" // <p>...</p>
        var nodeName: String

        /// The attributes in an node
        ///
        ///     attributes = [.class("text-dark")] // <`nodeName` class="text-dark">...</`nodeName`>
        var attributes: [AttributeNode]

        /// The content to be wrapped
        ///
        ///     content = "Some text" // <...>Some text</...>
        var content: Mappable
    }

    /// A variable making it possible to lazily insert variables
    ///
    ///     div(children: variable(\.name))     // May leed to "<div>Mats</div>", deepending in the context given
    public struct Variable<Root, Value> where Root: ContextualTemplate, Value: Mappable {

        /// The key-path to the variable to render
        let keyPath: KeyPath<Root.Context, Value>
    }

    /// Making it possible to embed othet templates in a View
    ///
    ///     embed(SomeView.self, viewConfig: .init(...), contextKey: \.context)
    public struct EmbedViewTemplate<E, T> where E: ContextualTemplate, T: ViewTemplate {

        /// The type of the template
        let templateType: T.Type

        /// The view context needed to render the view.
        /// This is a variable on in order to prerender the view
        let viewContext: T.ViewContext

        /// The key-path the the needed content
        let contextKeyPath: KeyPath<E.Context, T.Context>
    }

    /// Making it possible to embed othet templates in a View
    ///
    ///     embed(SomeView.self, contextKey: \.context)
    public struct EmbedTemplate<E, T> where E: ContextualTemplate, T: Template {

        /// The type of the template
        let templateType: T.Type

        /// The key-path the the needed content
        let contextKeyPath: KeyPath<E.Context, T.Context>
    }

    /// A struct making it possible to have a for each loop in the template
    ///
    ///     forEach(\.collection, render: CollectionView.self)
    public struct ForEach<Root: ContextualTemplate, Value: Template> {

        let view: Value.Type

        /// The path to the collection to loop
        let collectionPath: KeyPath<Root.Context, [Value.Context]>
    }

    public struct IF<Root> {
        var conditions: [(KeyPath<Root, Bool>, Any.Type)]
    }

    public struct Renderer {

        enum Errors: Error {
            case unableToFindFormula
        }

        var formulaCache: [String : Any]

        init() {
            formulaCache = [:]
        }

        func render<T: Template>(_ type: T.Type, with context: T.Context) throws -> String {
            guard let formula = formulaCache["\(T.self)"] as? Formula<T> else {
                throw Errors.unableToFindFormula
            }
            return try formula.render(with: context)
        }

        mutating func brewFormula<T: Template>(for type: T.Type) throws {
            let formula = Formula(view: type)
            try type.init().brew(formula)
            formulaCache["\(T.self)"] = formula
        }

        public class Formula<T: Template> {

            let viewType: T.Type
            private var contextPaths: [String : AnyKeyPath]
            private var ingredient: [Mappable]

            init(view: T.Type) {
                self.viewType = view
                contextPaths = [:]
                ingredient = []
            }

            func register<Root, Value>(from: Root.Type, to: Value.Type, using keyPath: KeyPath<Root.Context, Value.Context>) where Root: ContextualTemplate, Value: ContextualTemplate {
                if Root.self == viewType {
                    contextPaths["\(Value.self)"] = keyPath
                } else if let joinPath = contextPaths["\(Root.self)"] {
                    contextPaths["\(Value.self)"] = joinPath.appending(path: keyPath)
                } else {
                    print("Unable to register: ", keyPath)
                }
            }

            func add<Root, Value>(variable: Variable<Root, Value>) {
                if Root.self == viewType {
                    ingredient.append(variable)
                } else if let joinPath = contextPaths["\(Root.self)"] as? KeyPath<T.Context, Root.Context> {
                    let newVariable = Variable<T, Value>(keyPath: joinPath.appending(path: variable.keyPath))
                    ingredient.append(newVariable)
                } else {
                    print("Unable to add variable from \(Root.self), to \(Value.self): ", variable)
                }
            }

            func add(string: String) {
                if let last = ingredient.last as? String {
                    _ = ingredient.removeLast()
                    ingredient.append(last + string)
                } else {
                    ingredient.append(string)
                }
            }

            func add(mappable: Mappable) {
                ingredient.append(mappable)
            }

            func render(with context: T.Context) throws -> String {
                return try ingredient.reduce("") { try $0 + $1.map(for: viewType, with: context) }
            }
        }
    }
}

