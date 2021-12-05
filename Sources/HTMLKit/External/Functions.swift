/// # Description:
/// The file contains basic functions.
///
/// # Note:
/// If you about to add something to the file, stick to the official documentation to keep the code consistent.
///
/// # Authors:
/// Mats Moll: https://github.com/matsmoll
/// Mattes Mohr: https://github.com/mattesmohr

/// # Description:
/// The function is for
///
/// # References:
///
public struct Unwrap: Component {

    let content: IF

    public init<A>(_ value: TemplateValue<A?>, @ContentBuilder<AnyContent> content: (TemplateValue<A>) -> AnyContent) {
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

    public func `else`(@ContentBuilder<AnyContent> content: () -> AnyContent) -> AnyContent {
        self.content.else(render: content)
    }
}
