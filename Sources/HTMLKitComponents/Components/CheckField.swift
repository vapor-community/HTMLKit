import HTMLKit

/// A view that represents a check field.
///
/// Use `CheckField` to present a list of options, where multiple options can be selected.
///
/// ```swift
/// Picker(name: "lorem", selection: "ipsum") {
///     CheckField(value: "ipsum") {
///         "Lorem ipsum"
///     }
///     .tag("ipsum")
/// }
/// ```
public struct CheckField: View, Modifiable, Selectable, Identifiable {
    
    /// The unique identifer of the field.
    internal var id: String?
    
    /// The name of the field.
    internal var name: String?
    
    /// The content of the field.
    internal var value: String
    
    /// The selection status of the field.
    internal var isSelected: Bool

    /// The body content of the field.
    internal let content: Content
    
    /// The class names for the field.
    internal var classes: [String]
    
    /// Create a check field.
    ///
    /// - Parameters:
    ///   - value: The current value of the field.
    ///   - content: The label content for the field.
    public init(value: String, content: () -> String) {
        
        self.value = value
        self.isSelected = false
        self.content = content()
        self.classes = ["checkfield"]
    }
    
    /// Create a check field.
    ///
    /// - Parameters:
    ///   - localizedStringKey: The key of the localized string used as the label.
    ///   - value: The current value of the field.
    public init(_ localizedStringKey: LocalizedStringKey, value: String) {
        
        self.value = value
        self.isSelected = false
        self.content = [LocalizedString(key: localizedStringKey)]
        self.classes = ["checkfield"]
    }
    
    public var body: Content {
        Division {
            Input()
                .type(.checkbox)
                .value(value)
                .checked(isSelected)
                .class("checkinput")
                .modify(unwrap: name) {
                    $0.name($1)
                }
                .modify(unwrap: id)  {
                    $0.id($1)
                }
            Label {
                content
            }
            .modify(unwrap: id)  {
                $0.for($1)
            }
        }
        .class(classes.joined(separator: " "))
    }
    
    /// Set the identifier for the field.
    ///
    /// - Parameter value: The value of the identifier.
    ///
    /// - Returns: The field
    public func tag(_ value: String) -> CheckField {
        self.mutate(id: value)
    }
}

extension CheckField: InputModifier {
    
    public func disabled(_ condition: Bool = true) -> CheckField {
        
        if condition {
            return self.mutate(inputstate: Tokens.ViewState.disabled.value)
        }
        
        return self
    }
    
    public func focusColor(_ color: Tokens.FocusColor) -> CheckField {
        return self.mutate(focuscolor: color.value)
    }
}

extension CheckField: ViewModifier {
    
    public func opacity(_ value: Tokens.OpacityValue) -> CheckField {
        return self.mutate(opacity: value.value)
    }
    
    public func zIndex(_ index: Tokens.PositionIndex) -> CheckField {
        return self.mutate(zindex: index.value)
    }
    
    public func hidden(_ condition: Bool = true) -> CheckField {
        
        if condition {
            return self.mutate(viewstate: Tokens.ViewState.hidden.value)
        }
        
        return self
    }
    
    public func padding(insets: EdgeSet = .all, length: Tokens.PaddingLength = .small) -> CheckField {
        return self.mutate(padding: length.value, insets: insets)
    }
    
    public func border(_ color: Tokens.BorderColor, width: Tokens.BorderWidth = .small) -> CheckField {
        return self.mutate(border: color.value, width: width.value)
    }
    
    public func borderShape(_ shape: Tokens.BorderShape) -> CheckField {
        return self.mutate(bordershape: shape.value)
    }
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> CheckField {
        return self.mutate(backgroundcolor: color.value)
    }
    
    public func colorScheme(_ scheme: Tokens.ColorScheme) -> CheckField {
        return self.mutate(scheme: scheme.value)
    }
    
    public func frame(width: Tokens.ViewWidth, height: Tokens.ViewHeight? = nil, alignment: Tokens.FrameAlignment? = nil) -> CheckField {
        return self.mutate(frame: width.value, height: height?.value, alignment: alignment?.value)
    }
    
    public func margin(insets: EdgeSet = .all, length: Tokens.MarginLength = .small) -> CheckField {
        return self.mutate(margin: length.value, insets: insets)
    }
}
