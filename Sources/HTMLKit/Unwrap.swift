
public struct Unwrap<B>: HTMLComponent {

    let isDefined: Conditionable
    let content: HTML

    public init(_ value: TemplateValue<B?>, @HTMLBuilder content: (TemplateValue<B>) -> HTML) {
        self.isDefined = value.isDefined
        if value.isMascadingOptional {
            self.content = content(value.unsafeCast(to: B.self))
        } else {
            self.content = content(value.unsafelyUnwrapped)
        }

    }

    public var body: HTML {
        IF(isDefined) {
            content
        }
    }
}
