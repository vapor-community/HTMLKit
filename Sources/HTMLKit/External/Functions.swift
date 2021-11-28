/// The function is for
///
///
public struct Unwrap: Component {

    let content: IF

    public init<A>(_ value: TemplateValue<A?>, @ContentBuilder content: (TemplateValue<A>) -> AnyContent) {
        var ifContent: AnyContent = ""
        if value.isMasqueradingOptional {
            ifContent = content(value.unsafeCast(to: A.self))
        } else {
            switch value {
            case .constant(let value):
                if value != nil {
                    ifContent = content(.constant(value!))
                }
            case .dynamic(let variable):
                ifContent = content(.dynamic(variable.unsafelyUnwrapped))
            }
        }
        self.content = IF(value.isDefined) {
            ifContent
        }
    }

    init(content: IF) {
        self.content = content
    }

    public var body: AnyContent {
        content
    }

    public func `else`(@ContentBuilder content: () -> AnyContent) -> AnyContent {
        self.content.else(render: content)
    }
}
