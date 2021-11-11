/// The struct is for
///
///
public struct HTMLAttribute {

    public let attribute: String

    public let value: HTMLContent?

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
                "=\"" + (value ?? "") + "\""
            }
        }.render(with: manager)
    }

    public func prerender(_ formula: HTMLRenderer.Formula) throws {
        try IF(isIncluded) {
            attribute
            IF(value != nil) {
                "=\"" + (value ?? "") + "\""
            }
        }.prerender(formula)
    }
}
