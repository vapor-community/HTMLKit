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

    public enum Identifier {
        case id(String)
        case `class`(String)
    }

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

        /// A condition that evaluates if an attributes should be rendered
        public let isIncluded: Conditionable

        public init(attribute: String, value: View?, isIncluded: Conditionable = true) {
            self.attribute = attribute
            self.value = value
            self.isIncluded = isIncluded
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
        try IF(isIncluded) {
            attribute
            IF(value != nil) {
                "='" + (value ?? "") + "'"
            }
        }.prerender(formula)
    }
}


public protocol AttributeNode: View {

    var attributes: [HTML.Attribute] { get }

    func add(_ attribute: HTML.Attribute) -> Self

    func add(attributes: [HTML.Attribute]) -> Self

    func copy(with attributes: [HTML.Attribute]) -> Self
}

extension AttributeNode {

    public func add(_ attribute: HTML.Attribute) -> Self {
        var attributes = self.attributes
        for (index, attr) in attributes.enumerated() {
            if attr.attribute == attribute.attribute {
                guard let value = attr.value, let newValue = attribute.value else {
                    break
                }
                attributes.append(.init(attribute: attr.attribute, value: [value, " ", newValue], isIncluded: attr.isIncluded))
                attributes.remove(at: index)
                return copy(with: attributes)
            }
        }
        return copy(with: attributes + [attribute])
    }

    public func add(attributes: [HTML.Attribute]) -> Self {
        var newNode = self
        for attribute in attributes {
            newNode = newNode.add(attribute)
        }
        return newNode
    }
}


public protocol DataNode: AttributeNode {

    var name: String { get }

    init(attributes: [HTML.Attribute])
}

extension DataNode {
    public func copy(with attributes: [HTML.Attribute]) -> Self {
        .init(attributes: attributes)
    }
}

public protocol ContentNode: AttributeNode {

    var name: String { get }

    var content: View { get }

    init(attributes: [HTML.Attribute], content: View)
}

extension ContentNode {
    public func copy(with attributes: [HTML.Attribute]) -> Self {
        .init(attributes: attributes, content: content)
    }
}

extension DataNode {
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

extension HTML.Identifier : View {
    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        switch self {
        case .class(let name): return ".\(name)"
        case .id(let name): return "#\(name)"
        }
    }

    public func prerender<T>(_ formula: HTMLRenderer.Formula<T>) throws {
        switch self {
        case .class(let name): formula.add(string: ".\(name)")
        case .id(let name): formula.add(string: "#\(name)")
        }
    }
}
