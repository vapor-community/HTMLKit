import Foundation


public protocol HTMLContent {

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
    var scripts: HTMLContent { get }
}

extension HTMLContent {
    public var renderWhenLocalizing: Bool { return true }
    public var scripts: HTMLContent { "" }
}

/// Concats two values
public func + (lhs: HTMLContent, rhs: HTMLContent) -> HTMLContent {
    var output: Array<HTMLContent> = []

    if let list = lhs as? Array<HTMLContent> {
        output.append(contentsOf: list)
    } else {
        output.append(lhs)
    }

    if let list = rhs as? Array<HTMLContent> {
        output.append(list)
    } else {
        output.append(rhs)
    }
    return output
}

/// Concats second value to the first one
public func +=(lhs: inout HTMLContent, rhs: HTMLContent) {
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
    public let value: HTMLContent?

    /// A condition that evaluates if an attributes should be rendered
    public let isIncluded: Conditionable

    public init(attribute: String, value: HTMLContent?, isIncluded: Conditionable = true) {
        self.attribute = attribute
        self.value = value
        self.isIncluded = isIncluded
    }
}

extension HTMLAttribute: HTMLContent {
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
                var values: [HTMLContent] = [IF(attr.isIncluded) {value}]
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
