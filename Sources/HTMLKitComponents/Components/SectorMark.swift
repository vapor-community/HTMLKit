import HTMLKit

/// A view that represents a chart mark.
///
/// Use `SectorMark` to display a circle graph.
///
/// ```swift
/// Chart {
///     SectorMark(value: 50, label: "Lorem ipsum")
///         .foregroundColor(.random)
///     SectorMark(value: 50, label: "Lorem ipsum")
///         .foregroundColor(.random)
/// }
/// ```
public struct SectorMark: View, Modifiable {
    
    /// The value of the mark.
    internal let value: Int
    
    /// The title of the mark.
    internal let label: String
    
    /// The class names of the sector mark.
    internal var classes: [String]
    
    /// Create a sector mark.
    ///
    /// - Parameters:
    ///   - value: The value at which to plot the mark.
    ///   - label: The title used to label the mark.
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
        .class(classes)
    }
    
    /// Fill the foreground for the mark.
    ///
    /// - Parameter color: The color to use for the foreground.
    ///
    /// - Returns: The mark
    public func foregroundColor(_ color: Tokens.ForegroundColor) -> SectorMark {
        return self.mutate(classes: "foreground:\(color.value)")
    }
}
