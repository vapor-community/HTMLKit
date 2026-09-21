import HTMLKit

/// A view that represents a chart mark.
///
/// Use `SectorMark` to display a circle graph.
///
/// ```swift
/// Chart {
///     SectorMark("Lorem ipsum", value: 50)
///         .foregroundColor(.random)
///     SectorMark("Lorem ipsum", value: 50)
///         .foregroundColor(.random)
/// }
/// ```
public struct SectorMark: View, Modifiable {
    
    /// The title of the mark.
    internal let label: DynamicString
    
    /// The value of the mark.
    internal let value: Int
    
    /// The class names of the sector mark.
    internal var classes: [String]
    
    /// Create a sector mark.
    ///
    /// - Parameters:
    ///   - value: The value at which to plot the mark.
    ///   - label: The title used to label the mark.
    @available(*, deprecated, message: "Use the init(label:value:) initializer instead.")
    public init(value: Int, label: String) {
        
        self.value = value
        self.label = .literal(label)
        self.classes = ["mark", "type:pie"]
    }
    
    /// Create a sector mark.
    ///
    /// - Parameters:
    ///   - label: The title used to label the mark.
    ///   - value: The value at which to plot the mark.
    @_disfavoredOverload
    public init(label: any StringProtocol & Content, value: Int) {
        
        self.label = .literal(String(label))
        self.value = value
        self.classes = ["mark", "type:pie"]
    }
    
    /// Create a sector mark.
    ///
    /// - Parameters:
    ///   - localizedStringKey: The key of the localized string to look for.
    ///   - value: The value at which to plot the mark.
    public init(_ localizedStringKey: LocalizedStringKey, value: Int) {
        
        self.label = .localized(localizedStringKey, nil)
        self.value = value
        self.classes = ["mark", "type:pie"]
    }
    
    public var body: Content {
        Group {
            Path {
                value
            }
            Custom(name: "text") {
                if case .localized(let value, let table) = label {
                    LocalizedString(key: value, table: table)
                }
                if case .literal(let string) = label {
                    string
                }
            }
            .custom(key: "class", value: "mark-label", context: .trusted)
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
