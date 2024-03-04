/*
 Abstract:
 The file contains a chart component.
 */

import HTMLKit

public struct Chart: View {
    
    /// The content of the chart.
    internal var content: [VectorElement]
    
    /// The classes of the chart.
    internal var classes: [String]
    
    /// Creates a chart.
    public init(@ContentBuilder<VectorElement> content: () -> [VectorElement]) {
        
        self.content = content()
        self.classes = ["chart"]
    }
    
    public var body: Content {
        Vector {
            content
        }
        .namespace("https://www.w3.org/2000/svg")
        .class(classes.joined(separator: " "))
    }
}

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
            Circle {
                "\(value)"
            }
            .radius(100)
        }
        .class(classes.joined(separator: " "))
    }
    
    public func foregroundColor(_ color: Tokens.ForegroundColor) -> SectorMark {
        return self.mutate(class: "foreground:\(color.value)")
    }
}
