/// The function is for
///
///
public struct Unwrap: Component {

    let content: IF

    public init<A>(_ value: TemplateValue<A?>, @ContentBuilder content: (TemplateValue<A>) -> Content) {
        var ifContent: Content = ""
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

    public var body: Content {
        content
    }

    public func `else`(@ContentBuilder content: () -> Content) -> Content {
        self.content.else(render: content)
    }
}
