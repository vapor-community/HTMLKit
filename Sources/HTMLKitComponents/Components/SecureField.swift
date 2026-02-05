import HTMLKit

/// A view that represents a secure field.
///
/// Use `SecureField` to enter sensitive data in a secure way.
///
/// ```swift
/// SecureField(name: "lorem", prompt: "Lorem ipsum")
/// ```
public struct SecureField: View, Modifiable, Identifiable {
    
    /// The unique identifer of the field.
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
    
    /// Create a secure field.
    ///
    /// - Parameters:
    ///   - name: The name to assign to the field.
    ///   - prompt: The prompt to guide the user.
    ///   - content: The text content to edit within the field.
    @_disfavoredOverload
    public init(name: String, prompt: String? = nil, value: String? = nil) {
        
        self.name = name
        self.prompt = prompt.map(PromptType.string(_:))
        self.value = value
        self.classes = ["securefield"]
    }
    
    /// Create a secure field.
    ///
    /// - Parameters:
    ///   - name: The name to assign to the field.
    ///   - prompt: The key of the localized string to guide the user.
    ///   - content: The text content to edit within the field.
    public init(name: String, prompt: LocalizedStringKey? = nil, value: String? = nil) {
        
        self.name = name
        self.prompt = prompt.map(PromptType.value(_:))
        self.value = value
        self.classes = ["securefield"]
    }
    
    public var body: Content {
        Input()
            .type(.password)
            .name(name)
            .modify(unwrap: id) {
                $0.id($1)
            }
            .class(classes)
            .modify(unwrap: value) {
                $0.value($1)
            }
            .modify(unwrap: prompt) {
                $0.placeholder($1)
            }
    }
    
    /// Set the identifier for the field.
    ///
    /// - Parameter value: The value of the identifier
    ///
    /// - Returns: The field
    public func tag(_ value: String) -> SecureField {
        return self.mutate(id: value)
    }
}

extension SecureField: InputModifier {
    
    public func disabled(_ condition: Bool = true) -> SecureField {
        
        if condition {
            return self.mutate(inputstate: Tokens.ViewState.disabled.value)
        }
        
        return self
    }
    
    public func focusColor(_ color: Tokens.FocusColor) -> SecureField {
        return self.mutate(focuscolor: color.value)
    }
}

extension SecureField: ViewModifier {
    
    public func opacity(_ value: Tokens.OpacityValue) -> SecureField {
        return self.mutate(opacity: value.value)
    }
    
    public func zIndex(_ index: Tokens.PositionIndex) -> SecureField {
        return self.mutate(zindex: index.value)
    }
    
    public func hidden(_ condition: Bool = true) -> SecureField {
        
        if condition {
            return self.mutate(viewstate: Tokens.ViewState.hidden.value)
        }
        
        return self
    }
    
    public func padding(insets: EdgeSet = .all, length: Tokens.PaddingLength = .small) -> SecureField {
        return self.mutate(padding: length.value, insets: insets)
    }
    
    public func border(_ color: Tokens.BorderColor, width: Tokens.BorderWidth = .small, shape: Tokens.BorderShape? = nil) -> SecureField {
        return self.mutate(border: color.value, width: width.value, shape: shape?.value)
    }
    
    public func borderShape(_ shape: Tokens.BorderShape) -> SecureField {
        return self.mutate(bordershape: shape.value)
    }
    
    @available(*, deprecated, message: "Use the background(_:) modifier instead.")
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> SecureField {
        return self.mutate(backgroundcolor: color.value)
    }
    
    public func background(_ color: Tokens.BackgroundColor) -> SecureField {
        return self.mutate(backgroundcolor: color.value)
    }
    
    public func colorScheme(_ scheme: Tokens.ColorScheme) -> SecureField {
        return self.mutate(scheme: scheme.value)
    }
    
    public func frame(width: Tokens.ViewWidth, height: Tokens.ViewHeight? = nil, alignment: Tokens.FrameAlignment? = nil) -> SecureField {
        return self.mutate(frame: width.value, height: height?.value, alignment: alignment?.value)
    }
    
    public func margin(insets: EdgeSet = .all, length: Tokens.MarginLength = .small) -> SecureField {
        return self.mutate(margin: length.value, insets: insets)
    }
}
