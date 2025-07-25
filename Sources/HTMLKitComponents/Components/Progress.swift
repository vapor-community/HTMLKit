import HTMLKit

/// A component that displays the progress of a task.
public struct Progress: View, Modifiable, Identifiable {
    
    internal var id: String?
    
    /// The maximum value for the progress.
    internal let total: String
    
    /// The actual value of the progress.
    internal let value: String
    
    /// The content of the view.
    internal var content: [Content]
    
    /// The classes of the view.
    internal var classes: [String]
    
    /// The events of the view.
    internal var events: [String]?
    
    /// Creates a progress view.
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
    
    public func tag(_ value: String) -> Progress {
        return self.mutate(id: value)
    }
    
    public func progressStyle(_ style: Tokens.ProgressStyle) -> Progress {
        return self.mutate(class: "style:\(style.value)")
    }
    
    public func tint(_ color: Tokens.TintColor) -> Progress {
        return self.mutate(class: "tint:\(color.value)")
    }
}
