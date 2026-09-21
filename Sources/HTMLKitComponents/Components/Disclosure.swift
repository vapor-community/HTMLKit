import HTMLKit

/// A view that represents a disclosure view.
///
/// Use `Disclosure` to reveal or hide content when interacted with.
///
/// ```swift
/// Disclosure {
///     Text {
///         "Lorem ipsum..."
///     }
/// } label: {
///     Text {
///         "Lorem ipsum..."
///     }
/// }
/// ```
public struct Disclosure: View, Modifiable, Identifiable {
    
    /// The unique identifier of the disclosure.
    internal var id: String?
    
    /// The label of the disclosure.
    internal let label: [Content]
    
    /// The disclosure's content.
    internal let content: [Content]
    
    /// The class names for the content.
    internal var classes: [String]
        
    /// Create a disclosure.
    ///
    /// - Parameters:
    ///   - label: The label to describe the content.
    ///   - content: The disclosure's content.
    @available(*, deprecated, message: "Use the init(content:label:) initializer instead.")
    @_disfavoredOverload
    public init(_ label: any StringProtocol & Content, @ContentBuilder<Content> content: () -> [Content]) {
        
        self.label = [label]
        self.content = content()
        self.classes = ["disclosure"]
    }
    
    /// Create a disclosure.
    ///
    /// - Parameters:
    ///   - label: The key of the localized string to describe the content.
    ///   - content: The disclosure's content.
    @available(*, deprecated, message: "Use the init(content:label:) initializer instead.")
    public init(_ label: LocalizedStringKey, @ContentBuilder<Content> content: () -> [Content]) {
        
        self.label = [LocalizedString(key: label)]
        self.content = content()
        self.classes = ["disclosure"]
    }
    
    /// Create a disclosure.
    ///
    /// - Parameters:
    ///   - content: The disclosure's content.
    ///   - label: The disclosure's label.
    public init(@ContentBuilder<Content> content: () -> [Content], @ContentBuilder<Content> label: () -> [Content]) {
        
        self.label = label()
        self.content = content()
        self.classes = ["disclosure"]
    }
    
    public var body: Content {
        Details {
            Summary {
                Division {
                    label
                }
                .class("disclosure-label")
                Vector {
                    Path {
                    }
                    .draw("M7.28,2.241C6.987,1.957 6.987,1.497 7.28,1.213C7.573,0.929 8.048,0.929 8.341,1.213L14.811,7.486C15.103,7.77 15.103,8.23 14.811,8.514L8.28,14.787C7.987,15.071 7.512,15.071 7.22,14.787C6.927,14.503 6.927,14.043 7.22,13.759L13.22,8L7.28,2.241Z")
                }
                .viewBox(x: 0, y: 0, width: 20, height: 16)
                .width(20)
                .height(16)
                .namespace("http://www.w3.org/2000/svg")
                .class("disclosure-triangle")
                .accessibilityHidden()
            }
            .class("disclosure-head")
            Division {
                content
            }
            .class("disclosure-body")
        }
        .class(classes)
        .modify(unwrap: id) {
            $0.id($1)
        }
        .custom(key: "name", value: "disclosure")
    }
    
    /// Set the identifier for the disclosure.
    ///
    /// - Parameter value: The value of the identifier
    ///
    /// - Returns: The disclosure
    public func tag(_ value: String) -> Disclosure {
        return self.mutate(id: value)
    }
}
