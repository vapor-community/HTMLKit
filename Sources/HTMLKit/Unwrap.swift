
public struct Unwrap<A, B>: HTMLComponent {

    let isDefined: Conditionable
    let content: HTML

    public init(_ value: TemplateValue<A, B?>, @HTMLBuilder content: (TemplateValue<A, B>) -> HTML) {
        self.isDefined = value.isDefined
        self.content = content(value.unsafelyUnwrapped)
    }

    public var body: HTML {
        IF(isDefined) {
            content
        }
    }
}
