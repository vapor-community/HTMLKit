import HTMLKit

/// A view that represents a data chart.
///
/// Use `Chart`to visualize data graphically.
///
/// ```swift
/// Chart {
///     SectorMark(value: 50, label: "Lorem ipsum")
///         .foregroundColor(.random)
///     SectorMark(value: 50, label: "Lorem ipsum")
///         .foregroundColor(.random)
/// }
/// ```
public struct Chart: View, Modifiable {
    
    /// The body content of the chart.
    internal var content: [VectorElement]
    
    /// The class names for the chart.
    internal var classes: [String]
    
    /// Create a chart.
    ///
    /// - Parameter content: The chart's content.
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
    
    /// Set the inner radius for the chart.
    ///
    /// - Parameter size: The radius to cut out.
    ///
    /// - Returns: The chart
    public func innerRadius(_ color: Tokens.InnerRadius) -> Chart {
        return self.mutate(class: "radius:\(color.value)")
    }
}
