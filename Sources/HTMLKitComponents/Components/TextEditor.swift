import HTMLKit

/// A view that represents a text editor.
///
/// Use `TextEditor` to display a editable and expandable form control.
///
/// ```swift
/// TextEditor(name: "Lorem", prompt: "Lorem ipsum") {
/// }
/// ```
public struct TextEditor: View, Modifiable, Identifiable {
    
    /// The unique identifier of the editor.
    internal var id: String?
    
    /// The name of the editor.
    internal let name: String
    
    /// The content hint for the field.
    internal let prompt: PromptType?
    
    /// The number of  visible text lines.
    internal var rows: Int = 3
    
    /// The body content of the editor.
    internal var content: [String]
    
    /// The class names for the editor.
    internal var classes: [String]
    
    /// The event handlers on the editor.
    internal var events: [String]?
    
    /// Create a text editor.
    ///
    /// - Parameters:
    ///   - name: The name to assign to the field.
    ///   - prompt: The prompt to guide the user.
    ///   - value: The value to edit within the field.
    @_disfavoredOverload
    public init(name: String, prompt: String? = nil, @ContentBuilder<String> content: () -> [String]) {
        
        self.name = name
        self.prompt = prompt.map(PromptType.string(_:))
        self.content = content()
        self.classes = ["texteditor"]
    }
    
    /// Create a text editor.
    ///
    /// - Parameters:
    ///   - name: The name to assign to the field.
    ///   - prompt: The key of the localized string to guide the user.
    ///   - value: The value to edit within the field.
    public init(name: String, prompt: LocalizedStringKey? = nil, @ContentBuilder<String> content: () -> [String]) {
        
        self.name = name
        self.prompt = prompt.map(PromptType.value(_:))
        self.content = content()
        self.classes = ["texteditor"]
    }
    
    public var body: Content {
        TextArea {
            content
        }
        .name(name)
        .modify(unwrap: id) {
            $0.id($1)
        }
        .class(classes.joined(separator: " "))
        .rows(rows)
        .modify(unwrap: prompt) {
            $0.placeholder($1)
        }
    }
    
    /// Set the limit of the maximum lines.
    ///
    /// - Parameter value: The numbers of line to limit to.
    ///
    /// - Returns: The editor
    public func lineLimit(_ value: Int) -> TextEditor {

        var newSelf = self
        newSelf.rows = value
        
        return newSelf
    }
    
    /// Set the identifier for the editor.
    ///
    /// - Parameter value: The value of the identifier.
    ///
    /// - Returns: The editor
    public func tag(_ value: String) -> TextEditor {
        return self.mutate(id: value)
    }
}

extension TextEditor: InputModifier {
    
    public func disabled(_ condition: Bool = true) -> TextEditor {
        
        if condition {
            return self.mutate(inputstate: Tokens.ViewState.disabled.value)
        }
        
        return self
    }
    
    public func focusColor(_ color: Tokens.FocusColor) -> TextEditor {
        return self.mutate(focuscolor: color.value)
    }
}

extension TextEditor: ViewModifier {
    
    public func opacity(_ value: Tokens.OpacityValue) -> TextEditor {
        return self.mutate(opacity: value.value)
    }
    
    public func zIndex(_ index: Tokens.PositionIndex) -> TextEditor {
        return self.mutate(zindex: index.value)
    }
    
    public func hidden(_ condition: Bool = true) -> TextEditor {
        
        if condition {
            return self.mutate(viewstate: Tokens.ViewState.hidden.value)
        }
        
        return self
    }
    
    public func padding(insets: EdgeSet = .all, length: Tokens.PaddingLength = .small) -> TextEditor {
        return self.mutate(padding: length.value, insets: insets)
    }
    
    public func border(_ color: Tokens.BorderColor, width: Tokens.BorderWidth = .small) -> TextEditor {
        return self.mutate(border: color.value, width: width.value)
    }
    
    public func borderShape(_ shape: Tokens.BorderShape) -> TextEditor {
        return self.mutate(bordershape: shape.value)
    }
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> TextEditor {
        return self.mutate(backgroundcolor: color.value)
    }
    
    public func colorScheme(_ scheme: Tokens.ColorScheme) -> TextEditor {
        return self.mutate(scheme: scheme.value)
    }
    
    public func frame(width: Tokens.ViewWidth, height: Tokens.ViewHeight? = nil, alignment: Tokens.FrameAlignment? = nil) -> TextEditor {
        return mutate(frame: width.value, height: height?.value, alignment: alignment?.value)
    }
    
    public func margin(insets: EdgeSet = .all, length: Tokens.MarginLength = .small) -> TextEditor {
        return self.mutate(margin: length.value, insets: insets)
    }
}
