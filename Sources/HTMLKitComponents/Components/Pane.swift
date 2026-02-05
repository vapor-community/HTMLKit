import HTMLKit

/// A view that represents a tab pane.
///
/// Use `Pane` to define individual content within the tabs.
///
/// ```swift
/// Tabs(direction: .horizontal) {
///     Pane {
///         Text {
///             "Lorem ipsum..."
///         }
///     } label: {
///         Text {
///             "Lorem ipsum"
///         }
///     }
///     .tag("lorem")
/// }
/// ```
public struct Pane: View, Modifiable {
    
    /// The unique identifier of the pane.
    internal var id: String?
    
    /// The body content of the pane.
    internal let content: [Content]
    
    /// The class names for the pane.
    internal var classes: [String]
    
    /// The label content of the pane.
    internal let label: [Content]
    
    /// A badge indicator for the pane.
    internal var badge: Int?
    
    /// Create a pane.
    ///
    /// - Parameters:
    ///   - content: The pane's content.
    ///   - label: The pane's label.
    public init(@ContentBuilder<Content> content: () -> [Content], @ContentBuilder<Content> label: () -> [Content]) {
        
        self.content = content()
        self.label = label()
        self.classes = ["pane"]
    }
    
    public var body: Content {
        Division {
            content
        }
        .class(classes)
        .modify(unwrap: id) {
            $0.id($1)
        }
    }
    
    /// Set the identifier for the pane.
    ///
    /// - Parameter value: The value of the identifier.
    ///
    /// - Returns: The pane
    public func tag(_ value: String) -> Pane {
        
        var copy = self
        copy.id = value
        
        return copy
    }
    
    /// Show a badge within the pane's tab.
    ///
    /// - Parameter value: The count to show.
    ///
    /// - Returns: The pane
    public func badge(_ value: Int) -> Pane {
        
        var copy = self
        copy.badge = value
        
        return copy
    }
}
