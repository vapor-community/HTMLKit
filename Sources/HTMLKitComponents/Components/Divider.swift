import HTMLKit

/// A view that represents a content divider.
///
/// Use `Divider` to sperate content visually.
///
/// ```swift
/// Divider()
/// ```
public struct Divider: View {
    
    /// The class names for the divider.
    internal  var classes: [String]
    
    /// Create a divider.
    public init() {
        self.classes = ["divider"]
    }
    
    public var body: Content {
        HorizontalRule()
            .class(classes.joined(separator: " "))
    }
}
