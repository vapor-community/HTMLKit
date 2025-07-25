import HTMLKit

/// A view that represents a search field.
///
/// Use `SearchField` to find information in content.
///
/// ```swift
/// SearchField(name: "lorem", prompt: "Lorem ipsum")
/// ```
public struct SearchField: View, Modifiable, Identifiable {
    
    /// The identifier of the field.
    internal var id: String?
    
    /// The name of the field.
    internal let name: String
    
    /// The placeholder for the field value.
    internal let prompt: PromptType?
    
    /// The content of the field.
    internal let value: String?
    
    /// The classes of the field.
    internal var classes: [String]
    
    /// The events of the field.
    internal var events: [String]?
    
    /// Create a search field.
    ///
    /// - Parameters:
    ///   - name: The name to assign to the field.
    ///   - prompt: The prompt to guide the user.
    ///   - value: The value to edit within the field.
    @_disfavoredOverload
    public init(name: String, prompt: String? = nil, value: String? = nil) {
        
        self.name = name
        self.value = value
        self.prompt = prompt.map(PromptType.string(_:))
        self.classes = ["searchfield"]
    }
    
    /// Create a search field.
    ///
    /// - Parameters:
    ///   - name: The name to assign to the field.
    ///   - prompt: The key of the localized string to guide the user.
    ///   - value: The value to edit within the field.
    public init(name: String, prompt: LocalizedStringKey? = nil, value: String? = nil) {
        
        self.name = name
        self.value = value
        self.prompt = prompt.map(PromptType.value(_:))
        self.classes = ["searchfield"]
    }
    
    public var body: Content {
        Input()
            .type(.search)
            .name(name)
            .modify(unwrap: id) {
                $0.id($1)
            }
            .class(classes.joined(separator: " "))
            .modify(unwrap: value) {
                $0.value($1)
            }
            .modify(unwrap: prompt) {
                $0.placeholder($1)
            }
    }
    
    public func tag(_ value: String) -> SearchField {
        return self.mutate(id: value)
    }
}

extension SearchField: InputModifier {
    
    public func disabled(_ condition: Bool) -> SearchField {
        
        if condition {
            return self.mutate(inputstate: Tokens.ViewState.disabled.value)
        }
        
        return self
    }
    
    public func focusColor(_ color: Tokens.FocusColor) -> SearchField {
        return self.mutate(focuscolor: color.value)
    }
}

extension SearchField: ViewModifier {
    
    public func opacity(_ value: Tokens.OpacityValue) -> SearchField {
        return self.mutate(opacity: value.value)
    }
    
    public func zIndex(_ index: Tokens.PositionIndex) -> SearchField {
        return self.mutate(zindex: index.value)
    }
    
    public func hidden() -> SearchField {
        return self.mutate(viewstate: Tokens.ViewState.hidden.value)
    }
    
    public func hidden(_ condition: Bool) -> SearchField {
        
        if condition {
            return self.mutate(viewstate: Tokens.ViewState.hidden.value)
        }
        
        return self
    }
    
    public func padding(insets: EdgeSet = .all, length: Tokens.PaddingLength = .small) -> SearchField {
        return self.mutate(padding: length.value, insets: insets)
    }
    
    public func border(_ color: Tokens.BorderColor, width: Tokens.BorderWidth = .small) -> SearchField {
        return self.mutate(border: color.value, width: width.value)
    }
    
    public func borderShape(_ shape: Tokens.BorderShape) -> SearchField {
        return self.mutate(bordershape: shape.value)
    }
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> SearchField {
        return self.mutate(backgroundcolor: color.value)
    }
    
    public func colorScheme(_ scheme: Tokens.ColorScheme) -> SearchField {
        return self.mutate(scheme: scheme.value)
    }
    
    public func frame(width: Tokens.ViewWidth, height: Tokens.ViewHeight? = nil, alignment: Tokens.FrameAlignment? = nil) -> SearchField {
        return mutate(frame: width.value, height: height?.value, alignment: alignment?.value)
    }
    
    public func margin(insets: EdgeSet = .all, length: Tokens.MarginLength = .small) -> SearchField {
        return self.mutate(margin: length.value, insets: insets)
    }
}
