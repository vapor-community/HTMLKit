import Foundation

/// The different escaping options for a variable
///
/// - unsafeNone: No escaping. This will render the variable as given
/// - safeHTML: This will escape characters that may cause security problems
public enum EscapingOption {
    case unsafeNone
    case safeHTML
}

public enum ContextReferance<T, Value> where T : ContextualTemplate {
    case `self`(T.Type)
    case keyPath(KeyPath<T.Context, Value>)
}

/// A struct containing the different structs to render a HTML document
public struct HTML {

    /// An attribute on a node
    ///
    ///     AttributeNode.class("text-dark") // <... class="text-dark"/>
    public struct AttributeNode {

        /// The attribute to set
        public let attribute: String

        /// The value of the attribute
        public let value: CompiledTemplate?

        public init(attribute: String, value: CompiledTemplate?) {
            self.attribute = attribute
            self.value = value
        }
    }

    /// A node that wrap around any content that is renderable
    ///
    ///     DataNode(name: "img", attributes: [.src("url")]) // <img src="url"/>
    public struct DataNode {

        /// A `DynamicAttributable` version of `HTML.DataNode`
        public struct Dynamic<Root> {

            /// The root node
            let node: DataNode

            /// A attribute that will be added based on some context
            ///
            ///     img.if(\.isChecked, add: .checked)
            public let dynamicAttributes: CompiledTemplate

            init(name: String, attributes: [AttributeNode], dynamicAttributes: CompiledTemplate = "") {
                node = .init(name: name, attributes: attributes)
                self.dynamicAttributes = dynamicAttributes
            }

            init(node: DataNode, dynamicAttributes: CompiledTemplate = "") {
                self.node = node
                self.dynamicAttributes = dynamicAttributes
            }
        }

        /// The name of the type of node
        ///
        ///     name = "img" // <img .../>
        ///     name = "link" // <link .../>
        public let name: String

        /// The attributes in an node
        ///
        ///     attributes = [.class("text-dark")] // <`nodeName` class="text-dark"/>
        public let attributes: [AttributeNode]

        public init(name: String, attributes: [AttributeNode] = []) {
            self.name = name
            self.attributes = attributes
        }
    }

    /// A node that wrap around any content that is renderable
    ///
    ///     ContentNode(name: "div", content: "Some text") // <div>Some text</div>
    public struct ContentNode {

        /// A `DynamicAttributable` version of `HTML.ContentNode`
        public struct Dynamic<Root> {

            /// The root node
            let node: ContentNode

            /// A attribute that will be added based on some context
            ///
            ///     img.if(\.isChecked, add: .checked)
            public let dynamicAttributes: CompiledTemplate

            init(name: String, attributes: [AttributeNode], content: CompiledTemplate, dynamicAttributes: CompiledTemplate = "") {
                node = .init(name: name, attributes: attributes, content: content)
                self.dynamicAttributes = dynamicAttributes
            }

            init(node: ContentNode, dynamicAttributes: CompiledTemplate = "") {
                self.node = node
                self.dynamicAttributes = dynamicAttributes
            }
        }

        /// The name of the type of node
        ///
        ///     name = "div" // <div>...</div>
        ///     name = "p" // <p>...</p>
        public let name: String

        /// The attributes in an node
        ///
        ///     attributes = [.class("text-dark")] // <`nodeName` class="text-dark">...</`nodeName`>
        public let attributes: [AttributeNode]

        /// The content to be wrapped
        ///
        ///     content = "Some text" // <...>Some text</...>
        public let content: CompiledTemplate

        public init(name: String, attributes: [AttributeNode] = [], content: CompiledTemplate = "") {
            self.name = name
            self.attributes = attributes
            self.content = content
        }
    }
}

