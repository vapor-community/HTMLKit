import HTMLKit

/// A view that represents a select field.
///
/// Use `SelectField` to present a list of options.
///
/// ```swift
/// SelectField(name: "lorem", selection: "ipsum") {
///     RadioSelect(value: "ipsum") {
///         "Lorem ipsum"
///     }
///     .tag("ipsum")
/// }
/// ```
public struct SelectField: View, Modifiable, Identifiable {
    
    /// The unique identifier of the field.
    internal var id: String?
    
    /// The name of the field.
    internal let name: String
    
    /// The content hint for the field.
    internal let prompt: PromptType?
    
    /// The selected value of the available options.
    internal let selection: String?
    
    /// The body content of the field.
    internal let content: [Selectable]
    
    /// The class names for the field.
    internal var classes: [String]
    
    /// The event handlers on the field.
    internal var events: [String]?
    
    /// Create a select field.
    ///
    /// - Parameters:
    ///   - name: The name to assign to the field.
    ///   - prompt: The prompt to guide the user.
    ///   - selection: The option to preselect.
    ///   - content: The options to choose from.
    @_disfavoredOverload
    public init(name: String, prompt: String? = nil, selection: String? = nil, @ContentBuilder<RadioSelect> content: () -> [RadioSelect]) {
        
        self.name = name
        self.prompt = prompt.map(PromptType.string(_:))
        self.selection = selection
        self.content = content()
        self.classes = ["selectfield"]
    }
    
    /// Create a select field.
    ///
    /// - Parameters:
    ///   - name: The name to assign to the field.
    ///   - prompt: The key of the localized string to guide the user.
    ///   - selection: The option to preselect.
    ///   - content: The options to choose from.
    public init(name: String, prompt: LocalizedStringKey? = nil, selection: String? = nil, @ContentBuilder<RadioSelect> content: () -> [RadioSelect]) {
        
        self.name = name
        self.prompt = prompt.map(PromptType.value(_:))
        self.selection = selection
        self.content = content()
        self.classes = ["selectfield"]
    }
    
    /// Create a select field.
    ///
    /// - Parameters:
    ///   - name: The name to assign to the field.
    ///   - prompt: The prompt to guide the user.
    ///   - selection: The option to preselect.
    ///   - content: The options to choose from.
    @_disfavoredOverload
    public init(name: String, prompt: String? = nil, selection: String? = nil, @ContentBuilder<CheckField> content: () -> [CheckField]) {
        
        self.name = name
        self.prompt = prompt.map(PromptType.string(_:))
        self.selection = selection
        self.content = content()
        self.classes = ["selectfield"]
    }
    
    /// Create a select field.
    ///
    /// - Parameters:
    ///   - name: The name to assign to the field.
    ///   - prompt: The prompt to guide the user.
    ///   - selection: The option to preselect.
    ///   - content: The options to choose from.
    public init(name: String, prompt: LocalizedStringKey? = nil, selection: String? = nil, @ContentBuilder<CheckField> content: () -> [CheckField]) {
        
        self.name = name
        self.prompt = prompt.map(PromptType.value(_:))
        self.selection = selection
        self.content = content()
        self.classes = ["selectfield"]
    }
    
    public var body: Content {
        Division {
            Input()
                .type(.text)
                .class("selectfield-textfield")
                .modify(unwrap: prompt) {
                    $0.placeholder($1)
                }
            Division {
                for item in content {
                    item.selected(item.value == selection)
                        .tag(name)
                }
            }
            .class("selectfield-optionlist")
        }
        .class(classes)
        .modify(unwrap: id) {
            $0.id($1)
        }
    }
    
    /// Set the identifier for the field.
    ///
    /// - Parameter value: The value of the identifier.
    ///
    /// - Returns: The field.
    public func tag(_ value: String) -> SelectField {
        return self.mutate(id: value)
    }
}

extension SelectField: InputModifier {
    
    public func disabled(_ condition: Bool = true) -> SelectField {
        
        if condition {
            return self.mutate(inputstate: Tokens.ViewState.disabled.value)
        }
        
        return self
    }

    public func focusColor(_ color: Tokens.FocusColor) -> SelectField {
        return self.mutate(focuscolor: color.value)
    }
}

extension SelectField: ViewModifier {
    
    public func opacity(_ value: Tokens.OpacityValue) -> SelectField {
        return self.mutate(opacity: value.value)
    }
    
    public func zIndex(_ index: Tokens.PositionIndex) -> SelectField {
        return self.mutate(zindex: index.value)
    }
    
    public func hidden(_ condition: Bool = true) -> SelectField {
        
        if condition {
            return self.mutate(viewstate: Tokens.ViewState.hidden.value)
        }
        
        return self
    }
    
    public func padding(insets: EdgeSet = .all, length: Tokens.PaddingLength = .small) -> SelectField {
        return self.mutate(padding: length.value, insets: insets)
    }
    
    public func border(_ color: Tokens.BorderColor, width: Tokens.BorderWidth = .small, shape: Tokens.BorderShape? = nil) -> SelectField {
        return self.mutate(border: color.value, width: width.value, shape: shape?.value)
    }
    
    @available(*, deprecated, message: "Use the border(_:width:shape:) modifier instead.")
    public func borderShape(_ shape: Tokens.BorderShape) -> SelectField {
        return self.mutate(bordershape: shape.value)
    }
    
    @available(*, deprecated, message: "Use the background(_:) modifier instead.")
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> SelectField {
        return self.mutate(backgroundcolor: color.value)
    }
    
    public func background(_ color: Tokens.BackgroundColor) -> SelectField {
        return self.mutate(backgroundcolor: color.value)
    }
    
    public func colorScheme(_ scheme: Tokens.ColorScheme) -> SelectField {
        return self.mutate(scheme: scheme.value)
    }
    
    public func frame(width: Tokens.ViewWidth, height: Tokens.ViewHeight? = nil, alignment: Tokens.FrameAlignment? = nil) -> SelectField {
        return self.mutate(frame: width.value, height: height?.value, alignment: alignment?.value)
    }
    
    public func margin(insets: EdgeSet = .all, length: Tokens.MarginLength = .small) -> SelectField {
        return self.mutate(margin: length.value, insets: insets)
    }
}
