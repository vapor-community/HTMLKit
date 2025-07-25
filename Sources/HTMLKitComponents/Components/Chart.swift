/*
 Abstract:
 The file contains a chart component.
 */

import HTMLKit

public struct Chart: View, Modifiable {
    
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
    
    public func innerRadius(_ color: Tokens.InnerRadius) -> Chart {
        return self.mutate(class: "radius:\(color.value)")
    }
}
