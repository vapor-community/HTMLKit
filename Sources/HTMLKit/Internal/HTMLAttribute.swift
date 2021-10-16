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
