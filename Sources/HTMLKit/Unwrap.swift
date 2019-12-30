
public struct Unwrap: HTMLComponent {

    let content: IF

    public init<A>(_ value: TemplateValue<A?>, @HTMLBuilder content: (TemplateValue<A>) -> HTML) {
        var ifContent: HTML = ""
        if value.isMasqueradingOptional {
            ifContent = content(value.unsafeCast(to: A.self))
        } else {
            ifContent = content(value.unsafelyUnwrapped)
        }
        self.content = IF(value.isDefined) {
            ifContent
        }
    }

    init(content: IF) {
        self.content = content
    }

    public var body: HTML {
        content
    }

    public func `else`(@HTMLBuilder content: () -> HTML) -> HTML {
        self.content.else(render: content)
    }
}
