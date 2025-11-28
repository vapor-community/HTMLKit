import HTMLKit

/// A view that represents a scrollable area.
///
/// Use `Scroll` when the content might exceed the visible bounds.
///
/// ```swift
/// Scroll {
///     HStack {
///         Card {
///             Text {
///                 "Lorem ipsum..."
///             }
///         } header: {
///             Image(source: "...png")
///         }
///         Card {
///             Text {
///                 "Lorem ipsum..."
///             }
///         } header: {
///             Image(source: "...png")
///         }
///     }
/// }
/// ```
public struct Scroll: View {
    
    /// The body content of the scroll.
    internal let content: [Content]
    
    /// The class names for the scroll.
    internal var classes: [String]
    
    /// Create a scroll.
    ///
    /// - Parameters:
    ///   - showIndicators: Whether the scroll indicators should show up.
    ///   - content: The scroll's content.
    public init(showIndicators: Bool = true, @ContentBuilder<Content> content: () -> [Content]) {
        
        self.content = content()
        self.classes = ["scroll"]
        
        if showIndicators != true {
            self.classes.append("indicators:false")
        }
    }
    
    public var body: Content {
        Division {
            content
        }
        .class(classes.joined(separator: " "))
    }
}
