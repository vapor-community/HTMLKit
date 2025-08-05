import HTMLKit

/// A view that represents a progress bar.
///
/// Use `Progress` to indicate and observe task progress.
///
/// ```swift
/// Progress(value: "50", total: "100") {
/// }
/// ```
public struct Progress: View, Modifiable, Identifiable {
    
    /// The unique identifier of the progress.
    internal var id: String?
    
    /// The maximum value for the progress.
    internal let total: String
    
    /// The actual value of the progress.
    internal let value: String
    
    /// The body content of the progress.
    internal var content: [Content]
    
    /// The class names for the progress.
    internal var classes: [String]
    
    /// The event handlers on the progress.
    internal var events: [String]?
    
    /// Create a progress.
    ///
    /// - Parameters:
    ///   - value: The current value to indicate progress.
    ///   - total: The total value to reach.
    ///   - content: The progress's content.
    public init(value: Float, total: Float, @ContentBuilder<Content> content: () -> [Content]) {
        
        self.total = String(total)
        self.value = String(value)
        self.content = content()
        self.classes = ["progress"]
    }
    
    public var body: Content {
        Vector {
            Path {
                total
            }
            .class("mark")
            Path {
                value
            }
            .class("mark")
        }
        .namespace("https://www.w3.org/2000/svg")
        .class(classes.joined(separator: " "))
        .modify(unwrap: id) {
            $0.id($1)
        }
    }
    
    /// Set the identifier for the progress.
    ///
    /// - Parameter value: The value of the identifier.
    ///
    /// - Returns: The progress.
    public func tag(_ value: String) -> Progress {
        return self.mutate(id: value)
    }
    
    /// Set the style for the progress.
    ///
    /// - Parameter style: The option to apply to.
    ///
    /// - Returns: The progress
    public func progressStyle(_ style: Tokens.ProgressStyle) -> Progress {
        return self.mutate(class: "style:\(style.value)")
    }
    
    /// Set a tint color for the progress.
    ///
    /// - Parameter color: The color to apply to.
    ///
    /// - Returns: The progress
    public func tint(_ color: Tokens.TintColor) -> Progress {
        return self.mutate(class: "tint:\(color.value)")
    }
}
