import HTMLKit

/// A view that represents a radio select.
///
/// Use `RadioSelect` to present a list of options, where only one option can be selected.
///
/// ```swift
/// Picker(name: "lorem", selection: "ipsum") {
///     RadioSelect(value: "ipsum") {
///         "Lorem ipsum"
///     }
///     .tag("ipsum")
/// }
/// ```
public struct RadioSelect: View, Modifiable, Selectable, Identifiable {
    
    /// The unique identifier of the select.
    internal var id: String?
    
    /// The name of the select.
    internal var name: String?
    
    /// The content of the select.
    internal var value: String
    
    /// The selection status of the select.
    internal var isSelected: Bool
    
    /// The body content of the select.
    internal var content: Content
    
    /// The class names for the select.
    internal var classes: [String]
    
    /// Create a radio select.
    ///
    /// - Parameters:
    ///   - value: The current value of the select.
    ///   - content: The label content for the select.
    public init(value: String, content: () -> String) {
        
        self.value = value
        self.isSelected = false
        self.content = content()
        self.classes = ["radioselect"]
    }
    
    /// Create a radio select.
    ///
    /// - Parameters:
    ///   - localizedStringKey: The key of the localized string used as the label.
    ///   - value: The current value of the select.
    public init(_ localizedStringKey: LocalizedStringKey, value: String) {
        
        self.value = value
        self.isSelected = false
        self.content = [LocalizedString(key: localizedStringKey)]
        self.classes = ["radioselect"]
    }
    
    public var body: Content {
        Division {
            Input()
                .type(.radio)
                .value(value)
                .checked(isSelected)
                .class("radioinput")
                .modify(unwrap: name) {
                    $0.name($1)
                }
                .modify(unwrap: id) {
                    $0.id($1)
                }
            Label {
                content
            }
            .modify(unwrap: id) {
                $0.for($1)
            }
        }
        .class(classes)
    }
    
    /// Set the identifier for the select.
    ///
    /// - Parameter value: The value of the identifier.
    ///
    /// - Returns: The select
    public func tag(_ value: String) -> RadioSelect {
        self.mutate(id: value)
    }
}

extension RadioSelect: InputModifier {
    
    public func disabled(_ condition: Bool = true) -> RadioSelect {
        
        if condition {
            return self.mutate(inputstate: Tokens.ViewState.disabled.value)
        }
        
        return self
    }
    
    public func focusColor(_ color: Tokens.FocusColor) -> RadioSelect {
        return self.mutate(focuscolor: color.value)
    }
}

extension RadioSelect: ViewModifier {
    
    public func opacity(_ value: Tokens.OpacityValue) -> RadioSelect {
        return self.mutate(opacity: value.value)
    }
    
    public func zIndex(_ index: Tokens.PositionIndex) -> RadioSelect {
        return self.mutate(zindex: index.value)
    }
    
    public func hidden(_ condition: Bool = true) -> RadioSelect {
        
        if condition {
            return self.mutate(viewstate: Tokens.ViewState.hidden.value)
        }
        
        return self
    }
    
    public func padding(insets: EdgeSet = .all, length: Tokens.PaddingLength = .small) -> RadioSelect {
        return self.mutate(padding: length.value, insets: insets)
    }
    
    public func border(_ color: Tokens.BorderColor, width: Tokens.BorderWidth = .small, shape: Tokens.BorderShape? = nil) -> RadioSelect {
        return self.mutate(border: color.value, width: width.value, shape: shape?.value)
    }
    
    @available(*, deprecated, message: "Use the border(_:width:shape:) modifier instead.")
    public func borderShape(_ shape: Tokens.BorderShape) -> RadioSelect {
        return self.mutate(bordershape: shape.value)
    }
    
    @available(*, deprecated, message: "Use the background(_:) modifier instead.")
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> RadioSelect {
        return self.mutate(backgroundcolor: color.value)
    }
    
    public func background(_ color: Tokens.BackgroundColor) -> RadioSelect {
        return self.mutate(backgroundcolor: color.value)
    }
    
    public func colorScheme(_ scheme: Tokens.ColorScheme) -> RadioSelect {
        return self.mutate(scheme: scheme.value)
    }
    
    public func frame(width: Tokens.ViewWidth, height: Tokens.ViewHeight? = nil, alignment: Tokens.FrameAlignment? = nil) -> RadioSelect {
        return self.mutate(frame: width.value, height: height?.value, alignment: alignment?.value)
    }
    
    public func margin(insets: EdgeSet = .all, length: Tokens.MarginLength = .small) -> RadioSelect {
        return self.mutate(margin: length.value, insets: insets)
    }
}
