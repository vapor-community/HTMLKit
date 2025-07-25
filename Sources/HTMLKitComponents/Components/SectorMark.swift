import HTMLKit

public struct SectorMark: View, Modifiable {
    
    /// The value of the mark.
    internal var value: Int
    
    /// The title of the mark.
    internal var label: String
    
    /// The classes of the sector mark.
    internal var classes: [String]
    
    /// Creates a sector mark.
    public init(value: Int, label: String) {
        
        self.value = value
        self.label = label
        self.classes = ["mark type:pie"]
    }
    
    public var body: Content {
        HTMLKit.Group {
            Path {
                "\(value)"
            }
        }
        .class(classes.joined(separator: " "))
    }
    
    public func foregroundColor(_ color: Tokens.ForegroundColor) -> SectorMark {
        return self.mutate(class: "foreground:\(color.value)")
    }
}
