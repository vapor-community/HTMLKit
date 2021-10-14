import Foundation


public protocol HTML {

    /// A value indicating if the template should render when it is used as localization info
    var renderWhenLocalizing: Bool { get }

    /// Renders a compiled template to an HTML document
    ///
    /// - Parameter manager: A manager that contains the context
    /// - Returns: An HTML document
    /// - Throws: If the HTML can not be rendered for some reason
    func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String

    /// Brews a mappable object in to a formula
    ///
    ///     formula.add(string: "<\(name)/>")   // A constant string
    ///     formula.add(self)                   // Not able to be predetermand
    ///
    /// - Parameter formula: The formula to brew in to
    /// - Throws: If there occured some error
    func prerender(_ formula: HTMLRenderer.Formula) throws

    /// The script needed to render the underlying HTML
    var scripts: HTML { get }
}

extension HTML {
    public var renderWhenLocalizing: Bool { return true }
    public var scripts: HTML { "" }
}

/// Concats two values
public func + (lhs: HTML, rhs: HTML) -> HTML {
    var output: Array<HTML> = []

    if let list = lhs as? Array<HTML> {
        output.append(contentsOf: list)
    } else {
        output.append(lhs)
    }

    if let list = rhs as? Array<HTML> {
        output.append(list)
    } else {
        output.append(rhs)
    }
    return output
}

/// Concats second value to the first one
public func +=(lhs: inout HTML, rhs: HTML) {
    lhs = lhs + rhs
}


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


public enum HTMLIdentifier {
    case id(String)
    case `class`(String)
}

/// An attribute on a node
///
///     HTMLAttributeNode.class("text-dark") // <... class="text-dark"/>
public struct HTMLAttribute {

    public enum Method: String {
        case post
        case get
    }

    /// The attribute to set
    public let attribute: String

    /// The value of the attribute
    public let value: HTML?

    /// A condition that evaluates if an attributes should be rendered
    public let isIncluded: Conditionable

    public init(attribute: String, value: HTML?, isIncluded: Conditionable = true) {
        self.attribute = attribute
        self.value = value
        self.isIncluded = isIncluded
    }
}

extension HTMLAttribute: HTML {
    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        try IF(isIncluded) {
            attribute
            IF(value != nil) {
                "='" + (value ?? "") + "'"
            }
        }.render(with: manager)
    }

    public func prerender(_ formula: HTMLRenderer.Formula) throws {
        try IF(isIncluded) {
            attribute
            IF(value != nil) {
                "='" + (value ?? "") + "'"
            }
        }.prerender(formula)
    }
}

public protocol AddableAttributeNode: HTML, GlobalAttributes {

    var attributes: [HTMLAttribute] { get }

    func add(_ attribute: HTMLAttribute, withSpace: Bool) -> Self

    func add(attributes: [HTMLAttribute], withSpace: Bool) -> Self

    func value(of attribute: String) -> HTML?
}

public protocol AttributeNode: AddableAttributeNode {

    func copy(with attributes: [HTMLAttribute]) -> Self

    func modify(if condition: Conditionable, modifyer: (Self) -> Self) -> Self

    func wrapAttributes(with condition: Conditionable) -> [HTMLAttribute]
}

extension Array where Element == HTMLAttribute {
    public func add(attribute: HTMLAttribute) -> [HTMLAttribute] {
        var attributes = self
        for (index, attr) in attributes.enumerated() {
            if attr.attribute == attribute.attribute {
                guard
                    let value = attr.value,
                    let newValue = attribute.value
                else {
                    break
                }
                var values: [HTML] = [IF(attr.isIncluded) {value}]
                values.append(IF(attr.isIncluded && attribute.isIncluded) { " " })
                values.append(IF(attribute.isIncluded) { newValue })
                attributes.append(.init(attribute: attr.attribute, value: values, isIncluded: attr.isIncluded || attribute.isIncluded))
                attributes.remove(at: index)
                return attributes
            }
        }
        return attributes + [attribute]
    }

    public func add(attributes: [HTMLAttribute]) -> [HTMLAttribute] {
        var newNode = self
        for attribute in attributes {
            newNode = newNode.add(attribute: attribute)
        }
        return newNode
    }

    public func wrapAttributes(with condition: Conditionable) -> [HTMLAttribute] {
        self.map { attribute in
            if let value = attribute.value {
                return HTMLAttribute(
                    attribute: attribute.attribute,
                    value: value,
                    isIncluded: condition
                )
            } else {
                return HTMLAttribute(
                    attribute: attribute.attribute,
                    value: nil,
                    isIncluded: condition
                )
            }
        }
    }
}

extension AttributeNode {

    public func add(_ attribute: HTMLAttribute, withSpace: Bool = true) -> Self {
        return copy(with: attributes.add(attribute: attribute))
    }

    public func add(attributes: [HTMLAttribute], withSpace: Bool = true) -> Self {
        return self.copy(with: self.attributes.add(attributes: attributes))
    }

    public func value(of attribute: String) -> HTML? {
        attributes.first(where: { $0.attribute == attribute })?.value
    }

    public func modify(if condition: Conditionable, modifyer: (Self) -> Self) -> Self {
        let emptyNode = self.copy(with: [])
        let modified = modifyer(emptyNode)
        return self.add(attributes: modified.wrapAttributes(with: condition))
    }

    public func modify<Value>(unwrap value: TemplateValue<Value?>, modifyer: (TemplateValue<Value>, Self) -> Self) -> Self {
        switch value {
        case .constant(let optional):
            guard let value = optional else {
                return self
            }
            let emptyNode = self.copy(with: [])
            let modified = modifyer(.constant(value), emptyNode)

            return self.add(attributes: modified.attributes)
        case .dynamic(let context):
            let emptyNode = self.copy(with: [])
            var modified: Self!
            if context.isMascadingOptional {
                modified = modifyer(.dynamic(context.unsafeCast(to: Value.self)), emptyNode)
            } else {
                modified = modifyer(.dynamic(context.unsafelyUnwrapped), emptyNode)
            }

            return self.add(attributes: modified.wrapAttributes(with: context.isDefinded))
        }
    }

    public func wrapAttributes(with condition: Conditionable) -> [HTMLAttribute] {
        attributes.map { attribute in
            if let value = attribute.value {
                return HTMLAttribute(
                    attribute: attribute.attribute,
                    value: value,
                    isIncluded: condition
                )
            } else {
                return HTMLAttribute(
                    attribute: attribute.attribute,
                    value: nil,
                    isIncluded: condition
                )
            }
        }
    }
}

public protocol DatableNode: AttributeNode {

    var name: String { get }

    init(attributes: [HTMLAttribute])
}

extension DatableNode {
    public func copy(with attributes: [HTMLAttribute]) -> Self {
        .init(attributes: attributes)
    }
}

public protocol ContentNode: AttributeNode {

    var name: String { get }

    var content: HTML { get }

    init(attributes: [HTMLAttribute], content: HTML)
}

extension ContentNode {
    public func copy(with attributes: [HTMLAttribute]) -> Self {
        .init(attributes: attributes, content: content)
    }

    public var scripts: HTML { content.scripts }
}

extension DatableNode {
    public func prerender(_ formula: HTMLRenderer.Formula) throws {
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
    public func prerender(_ formula: HTMLRenderer.Formula) throws {
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

extension HTMLIdentifier: HTML {
    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        switch self {
        case .class(let name): return ".\(name)"
        case .id(let name): return "#\(name)"
        }
    }

    public func prerender(_ formula: HTMLRenderer.Formula) throws {
        switch self {
        case .class(let name): formula.add(string: ".\(name)")
        case .id(let name): formula.add(string: "#\(name)")
        }
    }
}
