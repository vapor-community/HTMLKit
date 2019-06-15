import Foundation

/// The different escaping options for a variable
///
/// - unsafeNone: No escaping. This will render the variable as given
/// - safeHTML: This will escape characters that may cause security problems
public enum EscapingOption: CustomDebugStringConvertible {
    case unsafeNone
    case safeHTML

    public var debugDescription: String {
        switch self {
        case .unsafeNone: return "Unsafe"
        case .safeHTML: return "Safe"
        }
    }
}

//enum ContextReferance<T, Value> where T : ContextualTemplate {
//    case root(T.Type)
//    case keyPath(KeyPath<T.Context, Value>)
//}

/// A struct containing the different structs to render a HTML document
public struct HTML {

    /// An attribute on a node
    ///
    ///     AttributeNode.class("text-dark") // <... class="text-dark"/>
    public struct Attribute {

        public enum Method: String {
            case post
            case get
        }

        /// The attribute to set
        public let attribute: String

        /// The value of the attribute
        public let value: View?

        public init(attribute: String, value: View?) {
            self.attribute = attribute
            self.value = value
        }
    }

//    /// A node that wrap around any content that is renderable
//    ///
//    ///     DataNode(name: "img", attributes: [.src("url")]) // <img src="url"/>
//    public struct DataNode<Root: ContextualTemplate> {
//
//        /// The name of the type of node
//        ///
//        ///     name = "img" // <img .../>
//        ///     name = "link" // <link .../>
//        public let name: String
//
//        /// The attributes in an node
//        ///
//        ///     attributes = [.class("text-dark")] // <`nodeName` class="text-dark"/>
//        public let attributes: [Attribute]
//
//        /// A attribute that will be added based on some context
//        ///
//        ///     img.if(\.isChecked, add: .checked)
//        public let dynamicAttributes: View
//
//        public init(name: String, attributes: [Attribute] = [], dynamicAttributes: View = "") {
//            self.name = name
//            self.attributes = attributes
//            self.dynamicAttributes = dynamicAttributes
//        }
//    }
//
//    /// A node that wrap around any content that is renderable
//    ///
//    ///     ContentNode(name: "div", content: "Some text") // <div>Some text</div>
//    public struct ContentNode<Root : ContextualTemplate> {
//
//        /// The name of the type of node
//        ///
//        ///     name = "div" // <div>...</div>
//        ///     name = "p" // <p>...</p>
//        public let name: String
//
//        /// The attributes in an node
//        ///
//        ///     attributes = [.class("text-dark")] // <`nodeName` class="text-dark">...</`nodeName`>
//        public let attributes: [Attribute]
//
//        /// A attribute that will be added based on some context
//        ///
//        ///     img.if(\.isChecked, add: .checked)
//        public let dynamicAttributes: View
//
//        /// The content to be wrapped
//        ///
//        ///     content = "Some text" // <...>Some text</...>
//        public let content: View
//        
//
//        public init(name: String, attributes: [Attribute] = [], content: View = "", dynamicAttributes: View = "") {
//            self.name = name
//            self.attributes = attributes
//            self.content = content
//            self.dynamicAttributes = dynamicAttributes
//        }
//    }
}


extension HTML.Attribute: View {
    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        if let value = value {
            return try "\(attribute)='\(value.render(with: manager))'"
        } else {
            return "\(attribute)"
        }
    }

    public func prerender<T>(_ formula: HTMLRenderer.Formula<T>) throws {
        formula.add(string: attribute)
        if let value = value {
            formula.add(string: "='")
            try value.prerender(formula)
            formula.add(string: "'")
        }
    }
}


public protocol AttributeNode: View {

    var name: String { get }

    var attributes: [HTML.Attribute] { get set }

    func add(_ attribute: HTML.Attribute) -> Self
}

public protocol DataNode: AttributeNode {
    init(attributes: [HTML.Attribute])
}

extension DataNode {
    public func add(_ attribute: HTML.Attribute) -> Self {
        .init(attributes: attributes + [attribute])
    }
}

public protocol ContentNode: AttributeNode {

    var content: View { get }

    init(attributes: [HTML.Attribute], content: View)
}

extension ContentNode {
    public func add(_ attribute: HTML.Attribute) -> Self {
        .init(attributes: attributes + [attribute], content: content)
    }
}

extension AttributeNode {
    public func prerender<T>(_ formula: HTMLRenderer.Formula<T>) throws {
        formula.add(string: "<\(name)")
        try attributes.forEach {
            formula.add(string: " ")
            try $0.prerender(formula)
        }
        formula.add(string: ">")
    }

    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        try "<\(name)" + attributes.reduce("") { try $0 + " \($1.render(with: manager))" } + ">"
    }
}


extension ContentNode {
    public func prerender<T>(_ formula: HTMLRenderer.Formula<T>) throws {
        formula.add(string: "<\(name)")
        try attributes.forEach {
            formula.add(string: " ")
            try $0.prerender(formula)
        }
        formula.add(string: ">")
        try content.prerender(formula)
        formula.add(string: "</\(name)>")
    }

    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        try "<\(name)"
            + attributes.reduce("") { try $0 + " \($1.render(with: manager))" }
            + ">\(content.render(with: manager))</\(name)>"
    }
}
