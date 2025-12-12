import HTMLKit

/// A view that represents a text field.
///
/// Use `TextField` to display an editable form control.
///
/// ```swift
/// TextField(name: "lorem", prompt: "Lorem ipsum", value: "Lorem ipsum")
/// ```
public struct TextField: View, Modifiable, Identifiable {
    
    /// The unique identifier of the field.
    internal var id: String?
    
    /// The name of the field.
    internal let name: String
    
    /// The content hint for the field.
    internal let prompt: PromptType?
    
    /// The content of the field.
    internal let value: String?
    
    /// The class names for the field.
    internal var classes: [String]
    
    /// The event handlers on the field.
    internal var events: [String]?
    
    /// Create a text field.
    ///
    /// - Parameters:
    ///   - name: The name to assign to the field.
    ///   - prompt: The prompt to guide the user.
    ///   - value: The value to edit within the field.
    @_disfavoredOverload
    public init(name: String, prompt: String? = nil, value: String? = nil) {
        
        self.name = name
        self.prompt = prompt.map(PromptType.string(_:))
        self.value = value
        self.classes = ["textfield"]
    }
    
    /// Create a text field.
    ///
    /// - Parameters:
    ///   - name: The name to assign to the field.
    ///   - prompt: The key of the localized string to guide the user.
    ///   - value: The value to edit within the field.
    public init(name: String, prompt: LocalizedStringKey? = nil, value: String? = nil) {
        
        self.name = name
        self.prompt = prompt.map(PromptType.value(_:))
        self.value = value
        self.classes = ["textfield"]
    }
    
    public var body: Content {
        Input()
            .type(.text)
            .name(name)
            .class(classes.joined(separator: " "))
            .modify(unwrap: id) {
                $0.id($1)
            }
            .modify(unwrap: value) {
                $0.value($1)
            }
            .modify(unwrap: prompt) {
                $0.placeholder($1)
            }
    }
    
    /// Set the identifier for the field.
    ///
    /// - Parameter value: The value of the field
    ///
    /// - Returns: The field
    public func tag(_ value: String) -> TextField {
        return self.mutate(id: value)
    }
    
    /// Set the style for the field.
    ///
    /// - Parameter style: The configuration to apply to.
    ///
    /// - Returns: The field
    public func fieldStyle(_ style: FieldConfiguration) -> TextField {
        return self.mutate(classes: style.configuration)
    }
}

extension TextField: InputModifier {
    
    public func disabled(_ condition: Bool = true) -> TextField {
        
        if condition {
            return self.mutate(inputstate: Tokens.ViewState.disabled.value)
        }
        
        return self
    }
    
    public func focusColor(_ color: Tokens.FocusColor) -> TextField {
        return self.mutate(focuscolor: color.value)
    }
}

extension TextField: ViewModifier {
    
    public func opacity(_ value: Tokens.OpacityValue) -> TextField {
        return self.mutate(opacity: value.value)
    }
    
    public func zIndex(_ index: Tokens.PositionIndex) -> TextField {
        return self.mutate(zindex: index.value)
    }
    
    public func hidden(_ condition: Bool = true) -> TextField {
        
        if condition {
            return self.mutate(viewstate: Tokens.ViewState.hidden.value)
        }
        
        return self
    }
    
    public func padding(insets: EdgeSet = .all, length: Tokens.PaddingLength = .small) -> TextField {
        return self.mutate(padding: length.value, insets: insets)
    }
    
    public func border(_ color: Tokens.BorderColor, width: Tokens.BorderWidth = .small, shape: Tokens.BorderShape? = nil) -> TextField {
        return self.mutate(border: color.value, width: width.value, shape: shape?.value)
    }
    
    @available(*, deprecated, message: "Use the border(_:width:shape:) modifier instead.")
    public func borderShape(_ shape: Tokens.BorderShape) -> TextField {
        return self.mutate(bordershape: shape.value)
    }
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> TextField {
        return self.mutate(backgroundcolor: color.value)
    }
    
    public func colorScheme(_ scheme: Tokens.ColorScheme) -> TextField {
        return self.mutate(scheme: scheme.value)
    }
    
    public func frame(width: Tokens.ViewWidth, height: Tokens.ViewHeight? = nil, alignment: Tokens.FrameAlignment? = nil) -> TextField {
        return self.mutate(frame: width.value, height: height?.value, alignment: alignment?.value)
    }
    
    public func margin(insets: EdgeSet = .all, length: Tokens.MarginLength = .small) -> TextField {
        return self.mutate(margin: length.value, insets: insets)
    }
}
