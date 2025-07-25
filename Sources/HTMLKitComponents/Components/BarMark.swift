import HTMLKit

public struct BarMark: View, Modifiable {
    
    /// The value of the mark.
    internal var value: Int
    
    /// The title of the mark.
    internal var label: String
    
    /// The classes of the bar mark.
    internal var classes: [String]
    
    /// Creates a bar mark.
    public init(value: Int, label: String) {
        
        self.value = value
        self.label = label
        self.classes = ["mark type:bar"]
    }
    
    public var body: Content {
        HTMLKit.Group {
            Rectangle {
                "\(value)"
            }
            Custom(name: "text") {
                label
            }
            .custom(key: "class", value: "mark-label")
        }
        .class(classes.joined(separator: " "))
    }
    
    public func foregroundColor(_ color: Tokens.ForegroundColor) -> BarMark {
        return self.mutate(class: "foreground:\(color.value)")
    }
}
