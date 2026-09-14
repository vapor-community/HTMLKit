import HTMLKit

/// A view that represents a chart mark.
///
/// Use `BarMark` to display a bar graph.
///
/// ```swift
/// Chart {
///     BarMark("Lorem ipsum", value: 50)
///         .foregroundColor(.random)
///     BarMark("Lorem ipsum", value: 50)
///         .foregroundColor(.random)
/// }
/// ```
public struct BarMark: View, Modifiable {
    
    /// The title of the mark.
    internal let label: DynamicString
    
    /// The value of the mark.
    internal let value: Int
    
    /// The class names of the bar mark.
    internal var classes: [String]
    
    /// Create a bar mark.
    ///
    /// - Parameters:
    ///   - value: The value at which to plot the mark.
    ///   - label: The title used to label the mark.
    @available(*, deprecated, message: "Use the init(label:value:) initializer instead.")
    public init(value: Int, label: String) {
        
        self.label = .literal(label)
        self.value = value
        self.classes = ["mark", "type:bar"]
    }
    
    /// Create a bar mark.
    ///
    /// - Parameters:
    ///   - label: The title used to label the mark.
    ///   - value: The value at which to plot the mark.
    @_disfavoredOverload
    public init(_ label: any StringProtocol & Content, value: Int) {
        
        self.label = .literal(String(label))
        self.value = value
        self.classes = ["mark", "type:bar"]
    }
    
    /// Create a bar mark.
    ///
    /// - Parameters:
    ///   - localizedStringKey: The key of the localized string to look for.
    ///   - value: The value at which to plot the mark.
    public init(_ localizedStringKey: LocalizedStringKey, value: Int) {
        
        self.label = .localized(localizedStringKey, nil)
        self.value = value
        self.classes = ["mark", "type:bar"]
    }
    
    public var body: Content {
        Group {
            Rectangle {
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
    public func foregroundColor(_ color: Tokens.ForegroundColor) -> BarMark {
        return self.mutate(classes: "foreground:\(color.value)")
    }
}
