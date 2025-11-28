import HTMLKit

/// A view that represents a chart mark.
///
/// Use `BarMark` to display a bar graph.
///
/// ```swift
/// Chart {
///     BarMark(value: 50, label: "Lorem ipsum")
///         .foregroundColor(.random)
///     BarMark(value: 50, label: "Lorem ipsum")
///         .foregroundColor(.random)
/// }
/// ```
public struct BarMark: View, Modifiable {
    
    /// The value of the mark.
    internal let value: Int
    
    /// The title of the mark.
    internal let label: String
    
    /// The class names of the bar mark.
    internal var classes: [String]
    
    /// Create a bar mark.
    ///
    /// - Parameters:
    ///   - value: The value at which to plot the mark.
    ///   - label: The title used to label the mark.
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
    
    /// Fill the foreground for the mark.
    ///
    /// - Parameter color: The color to use for the foreground.
    ///
    /// - Returns: The mark
    public func foregroundColor(_ color: Tokens.ForegroundColor) -> BarMark {
        return self.mutate(classes: "foreground:\(color.value)")
    }
}
