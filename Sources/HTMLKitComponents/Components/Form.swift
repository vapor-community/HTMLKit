/*
 Abstract:
 The file contains everything related to form component.
 */

import HTMLKit

/// A component that collects form controls.
public struct Form: View, Actionable {
    
    /// The identifier of the form.
    internal var id: String?
    
    internal var method: HTMLKit.Values.Method
    
    internal var encoding: HTMLKit.Values.Encoding
    
    /// The content of the container.
    internal var content: [FormElement]
    
    /// The classes of the container.
    internal var classes: [String]
    
    /// The events of the container.
    internal var events: [String]?
    
    /// Creates a form.
    public init(method: Values.Method, encoding: Values.Encoding = .urlEncoded, @ContentBuilder<FormElement> content: () -> [FormElement]) {
        
        self.method = method
        self.encoding = encoding
        self.content = content()
        self.classes = ["form"]
    }
    
    public var body: Content {
        HTMLKit.Form {
            content
        }
        .method(method)
        .encoding(encoding)
        .class(classes.joined(separator: " "))
        .modify(unwrap: id) {
            $0.id($1)
        }
        if let events = self.events {
            Script {
                events
            }
        }
    }
    
    public func tag(_ value: String) -> Form {
        return self.mutate(id: value)
    }
}

extension Form: FormEvent {
    
    public func onSubmit(@ActionBuilder action: (SubmitAction) -> [Action]) -> Form {
        return self.mutate(submitevent: action(.init()))
    }
}

/// A view that represents a field label.
///
/// Use `FieldLabel` to display the name for the form control.
///
/// ```swift
/// FieldLabel(for: "lorem") {
///     "Lorem ipsum"
/// }
/// ```
public struct FieldLabel: View {
    
    /// The identifier of the element the label is related to.
    internal let id: String
    
    /// The content of the label.
    internal var content: [Content]
    
    /// The classes of the label.
    internal var classes: [String]
    
    /// The events of the label.
    internal var events: [String]?
    
    /// Create a field label.
    ///
    /// - Parameters:
    ///   - id: The identifier of the field to associate the label with.
    ///   - content: The text content to display in the label.
    public init(for id: String, @ContentBuilder<Content> content: () -> [Content]) {
      
        self.id = id
        self.content = content()
        self.classes = ["label"]
    }
    
    /// Create a field label.
    ///
    /// - Parameters:
    ///   - localizedStringKey: The key of the localized string to look for.
    ///   - id: The identifier of the field to associate the label with.
    public init(_ localizedStringKey: LocalizedStringKey, for id: String) {
        
        self.id = id
        self.content = [LocalizedString(key: localizedStringKey)]
        self.classes = ["label"]
    }
    
    public var body: Content {
        Label {
            content
        }
        .for(id)
        .class(classes.joined(separator: " "))
    }
}

/// A view that represents a text field.
///
/// Use `TextField` to display an editable form control.
///
/// ```swift
/// TextField(name: "lorem", prompt: "Lorem ipsum", value: "Lorem ipsum")
/// ```
public struct TextField: View, Modifiable, Identifiable {
    
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
    
    public func tag(_ value: String) -> TextField {
        return self.mutate(id: value)
    }
    
    public func fieldStyle(_ style: FieldConfiguration) -> TextField {
        return self.mutate(classes: style.configuration)
    }
}

extension TextField: InputModifier {
    
    public func disabled(_ condition: Bool) -> TextField {
        
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
    
    public func hidden() -> TextField {
        return self.mutate(viewstate: Tokens.ViewState.hidden.value)
    }
    
    public func hidden(_ condition: Bool) -> TextField {
        
        if condition {
            return self.mutate(viewstate: Tokens.ViewState.hidden.value)
        }
        
        return self
    }
    
    public func padding(insets: EdgeSet = .all, length: Tokens.PaddingLength = .small) -> TextField {
        return self.mutate(padding: length.value, insets: insets)
    }
    
    public func border(_ color: Tokens.BorderColor, width: Tokens.BorderWidth = .small) -> TextField {
        return self.mutate(border: color.value, width: width.value)
    }
    
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
        return mutate(frame: width.value, height: height?.value, alignment: alignment?.value)
    }
    
    public func margin(insets: EdgeSet = .all, length: Tokens.MarginLength = .small) -> TextField {
        return self.mutate(margin: length.value, insets: insets)
    }
}

/// A view that represents a text editor.
///
/// Use `TextEditor` to display a editable and expandable form control.
///
/// ```swift
/// TextEditor(name: "Lorem", prompt: "Lorem ipsum") {
/// }
/// ```
public struct TextEditor: View, Modifiable, Identifiable {
    
    internal var id: String?
    
    /// The identifier of the editor.
    internal let name: String
    
    /// The placeholder for the field value.
    internal let prompt: PromptType?
    
    /// The number of lines.
    internal var rows: Int = 3
    
    /// The content of the editor.
    internal var content: [String]
    
    /// The classes of the editor.
    internal var classes: [String]
    
    /// The events of the editor.
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
    
    /// Sets the limit of the maximum lines.
    public func lineLimit(_ value: Int) -> TextEditor {

        var newSelf = self
        newSelf.rows = value
        
        return newSelf
    }
    
    public func tag(_ value: String) -> TextEditor {
        return self.mutate(id: value)
    }
}

extension TextEditor: InputModifier {
    
    public func disabled(_ condition: Bool) -> TextEditor {
        
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
    
    public func hidden() -> TextEditor {
        return self.mutate(viewstate: Tokens.ViewState.hidden.value)
    }
    
    public func hidden(_ condition: Bool) -> TextEditor {
        
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

public struct Picker: View, Modifiable, Identifiable {
    
    internal var id: String?

    internal let name: String
    
    internal let selection: String?
    
    internal let content: [Selectable]
    
    internal var classes: [String]
    
    public init(name: String, selection: String? = nil, @ContentBuilder<CheckField> content: () -> [CheckField]) {
        
        self.name = name
        self.selection = selection
        self.content = content()
        self.classes = ["picker"]
    }
    
    public init(name: String, selection: String? = nil, @ContentBuilder<RadioSelect> content: () -> [RadioSelect]) {
        
        self.name = name
        self.selection = selection
        self.content = content()
        self.classes = ["picker"]
    }
    
    public var body: Content {
        Division {
            for item in content {
                item.selected(item.value == selection)
                    .tag(name)
            }
        }
        .class(classes.joined(separator: " "))
        .modify(unwrap: id) {
            $0.id($1)
        }
    }
    
    public func tag(_ value: String) -> Picker {
        return self.mutate(id: value)
    }
}

/// A component that displays a form control
public struct CheckField: View, Modifiable, Selectable, Identifiable {
    
    /// The identifer for the label.
    internal var id: String?
    
    /// The identifier for the field.
    internal var name: String?
    
    /// The content of the field.
    internal var value: String
    
    /// The selection status of the field.
    internal var isSelected: Bool

    /// The content of the field.
    internal var content: String
    
    /// The classes of the field.
    internal var classes: [String]
    
    /// Creates a check field.
    public init(value: String, content: () -> String) {
    
        self.value = value
        self.isSelected = false
        self.content = content()
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
    
    public func tag(_ value: String) -> CheckField {
        self.mutate(id: value)
    }
}

extension CheckField: InputModifier {
    
    public func disabled(_ condition: Bool) -> CheckField {
        
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
    
    public func hidden() -> CheckField {
        return self.mutate(viewstate: Tokens.ViewState.hidden.value)
    }
    
    public func hidden(_ condition: Bool) -> CheckField {
        
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
        return mutate(frame: width.value, height: height?.value, alignment: alignment?.value)
    }
    
    public func margin(insets: EdgeSet = .all, length: Tokens.MarginLength = .small) -> CheckField {
        return self.mutate(margin: length.value, insets: insets)
    }
}

/// A component that displays
public struct RadioSelect: View, Modifiable, Selectable, Identifiable {
    
    /// The identifier for the label.
    internal var id: String?
    
    /// The identifier of the select.
    internal var name: String?
    
    /// The content of the select.
    internal var value: String
    
    /// The selection status of the select.
    internal var isSelected: Bool
    
    /// The content of the select.
    internal var content: String
    
    /// The classes of the select.
    internal var classes: [String]
    
    /// Creates a radio select.
    public init(value: String, content: () -> String) {
        
        self.value = value
        self.isSelected = false
        self.content = content()
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
        .class(classes.joined(separator: " "))
    }
    
    public func tag(_ value: String) -> RadioSelect {
        self.mutate(id: value)
    }
}

extension RadioSelect: InputModifier {
    
    public func disabled(_ condition: Bool) -> RadioSelect {
        
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
    
    public func hidden() -> RadioSelect {
        return self.mutate(viewstate: Tokens.ViewState.hidden.value)
    }
    
    public func hidden(_ condition: Bool) -> RadioSelect {
        
        if condition {
            return self.mutate(viewstate: Tokens.ViewState.hidden.value)
        }
        
        return self
    }
    
    public func padding(insets: EdgeSet = .all, length: Tokens.PaddingLength = .small) -> RadioSelect {
        return self.mutate(padding: length.value, insets: insets)
    }
    
    public func border(_ color: Tokens.BorderColor, width: Tokens.BorderWidth = .small) -> RadioSelect {
        return self.mutate(border: color.value, width: width.value)
    }
    
    public func borderShape(_ shape: Tokens.BorderShape) -> RadioSelect {
        return self.mutate(bordershape: shape.value)
    }
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> RadioSelect {
        return self.mutate(backgroundcolor: color.value)
    }
    
    public func colorScheme(_ scheme: Tokens.ColorScheme) -> RadioSelect {
        return self.mutate(scheme: scheme.value)
    }
    
    public func frame(width: Tokens.ViewWidth, height: Tokens.ViewHeight? = nil, alignment: Tokens.FrameAlignment? = nil) -> RadioSelect {
        return mutate(frame: width.value, height: height?.value, alignment: alignment?.value)
    }
    
    public func margin(insets: EdgeSet = .all, length: Tokens.MarginLength = .small) -> RadioSelect {
        return self.mutate(margin: length.value, insets: insets)
    }
}

/// A component that displays
public struct SelectField: View, Modifiable, Identifiable {
    
    internal var id: String?
    
    /// The identifier of the field.
    internal let name: String
    
    /// The placeholder for the field value.
    internal let prompt: String?
    
    internal let selection: String?
    
    /// The content of the field.
    internal var content: [Selectable]
    
    /// The classes of the field.
    internal var classes: [String]
    
    /// The events of the field.
    internal var events: [String]?
    
    /// Creates a select field.
    public init(name: String, prompt: String? = nil, selection: String? = nil, @ContentBuilder<RadioSelect> content: () -> [RadioSelect]) {
        
        self.name = name
        self.prompt = prompt
        self.selection = selection
        self.content = content()
        self.classes = ["selectfield"]
    }
    
    /// Creates a select field.
    public init(name: String, prompt: String? = nil, selection: String? = nil, @ContentBuilder<CheckField> content: () -> [CheckField]) {
        
        self.name = name
        self.prompt = prompt
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
        .class(classes.joined(separator: " "))
        .modify(unwrap: id) {
            $0.id($1)
        }
    }
    
    public func tag(_ value: String) -> SelectField {
        return self.mutate(id: value)
    }
}

extension SelectField: InputModifier {
    
    public func disabled(_ condition: Bool) -> SelectField {
        
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
    
    public func hidden() -> SelectField {
        return self.mutate(viewstate: Tokens.ViewState.hidden.value)
    }
    
    public func hidden(_ condition: Bool) -> SelectField {
        
        if condition {
            return self.mutate(viewstate: Tokens.ViewState.hidden.value)
        }
        
        return self
    }
    
    public func padding(insets: EdgeSet = .all, length: Tokens.PaddingLength = .small) -> SelectField {
        return self.mutate(padding: length.value, insets: insets)
    }
    
    public func border(_ color: Tokens.BorderColor, width: Tokens.BorderWidth = .small) -> SelectField {
        return self.mutate(border: color.value, width: width.value)
    }
    
    public func borderShape(_ shape: Tokens.BorderShape) -> SelectField {
        return self.mutate(bordershape: shape.value)
    }
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> SelectField {
        return self.mutate(backgroundcolor: color.value)
    }
    
    public func colorScheme(_ scheme: Tokens.ColorScheme) -> SelectField {
        return self.mutate(scheme: scheme.value)
    }
    
    public func frame(width: Tokens.ViewWidth, height: Tokens.ViewHeight? = nil, alignment: Tokens.FrameAlignment? = nil) -> SelectField {
        return mutate(frame: width.value, height: height?.value, alignment: alignment?.value)
    }
    
    public func margin(insets: EdgeSet = .all, length: Tokens.MarginLength = .small) -> SelectField {
        return self.mutate(margin: length.value, insets: insets)
    }
}

/// A component that displays
public struct SecureField: View, Modifiable, Identifiable {
    
    internal var id: String?
    
    /// The identifier of the field.
    internal let name: String
    
    /// The placeholder for the field value.
    internal let prompt: String?
    
    /// The content of the field.
    internal let value: String?
    
    /// The classes of the field.
    internal var classes: [String]
    
    /// The events of the field.
    internal var events: [String]?
    
    /// Creates a password field.
    public init(name: String, prompt: String? = nil, value: String? = nil) {
        
        self.name = name
        self.prompt = prompt
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
            .class(classes.joined(separator: " "))
            .modify(unwrap: value) {
                $0.value($1)
            }
            .modify(unwrap: prompt) {
                $0.placeholder($1)
            }
    }
    
    public func tag(_ value: String) -> SecureField {
        return self.mutate(id: value)
    }
}

extension SecureField: InputModifier {
    
    public func disabled(_ condition: Bool) -> SecureField {
        
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
    
    public func hidden() -> SecureField {
        return self.mutate(viewstate: Tokens.ViewState.hidden.value)
    }
    
    public func hidden(_ condition: Bool) -> SecureField {
        
        if condition {
            return self.mutate(viewstate: Tokens.ViewState.hidden.value)
        }
        
        return self
    }
    
    public func padding(insets: EdgeSet = .all, length: Tokens.PaddingLength = .small) -> SecureField {
        return self.mutate(padding: length.value, insets: insets)
    }
    
    public func border(_ color: Tokens.BorderColor, width: Tokens.BorderWidth = .small) -> SecureField {
        return self.mutate(border: color.value, width: width.value)
    }
    
    public func borderShape(_ shape: Tokens.BorderShape) -> SecureField {
        return self.mutate(bordershape: shape.value)
    }
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> SecureField {
        return self.mutate(backgroundcolor: color.value)
    }
    
    public func colorScheme(_ scheme: Tokens.ColorScheme) -> SecureField {
        return self.mutate(scheme: scheme.value)
    }
    
    public func frame(width: Tokens.ViewWidth, height: Tokens.ViewHeight? = nil, alignment: Tokens.FrameAlignment? = nil) -> SecureField {
        return mutate(frame: width.value, height: height?.value, alignment: alignment?.value)
    }
    
    public func margin(insets: EdgeSet = .all, length: Tokens.MarginLength = .small) -> SecureField {
        return self.mutate(margin: length.value, insets: insets)
    }
}

/// A component that displays
public struct Slider: View, Modifiable, Identifiable {
    
    internal var id: String?
    
    /// The identifier of the slider.
    internal let name: String
    
    /// The classes of the slider.
    internal var classes: [String]
    
    /// The events of the slider.
    internal var events: [String]?
    
    /// Creates a slider.
    public init(name: String) {
        
        self.name = name
        self.classes = ["slider"]
    }
    
    public var body: Content {
        Input()
            .type(.range)
            .name(name)
            .class(classes.joined(separator: " "))
            .modify(unwrap: id) {
                $0.id($1)
            }
    }
    
    public func tag(_ value: String) -> Slider {
        return self.mutate(id: value)
    }
}

extension Slider: InputModifier {
    
    public func disabled(_ condition: Bool) -> Slider {
        
        if condition {
            return self.mutate(inputstate: Tokens.ViewState.disabled.value)
        }
        
        return self
    }
    
    public func focusColor(_ color: Tokens.FocusColor) -> Slider {
        return self.mutate(focuscolor: color.value)
    }
}

extension Slider: ViewModifier {
    
    public func opacity(_ value: Tokens.OpacityValue) -> Slider {
        return self.mutate(opacity: value.value)
    }
    
    public func zIndex(_ index: Tokens.PositionIndex) -> Slider {
        return self.mutate(zindex: index.value)
    }
    
    public func hidden() -> Slider {
        return self.mutate(viewstate: Tokens.ViewState.hidden.value)
    }
    
    public func hidden(_ condition: Bool) -> Slider {
        
        if condition {
            return self.mutate(viewstate: Tokens.ViewState.hidden.value)
        }
        
        return self
    }
    
    public func padding(insets: EdgeSet = .all, length: Tokens.PaddingLength = .small) -> Slider {
        return self.mutate(padding: length.value, insets: insets)
    }
    
    public func border(_ color: Tokens.BorderColor, width: Tokens.BorderWidth = .small) -> Slider {
        return self.mutate(border: color.value, width: width.value)
    }
    
    public func borderShape(_ shape: Tokens.BorderShape) -> Slider {
        return self.mutate(bordershape: shape.value)
    }
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> Slider {
        return self.mutate(backgroundcolor: color.value)
    }
    
    public func colorScheme(_ scheme: Tokens.ColorScheme) -> Slider {
        return self.mutate(scheme: scheme.value)
    }
    
    public func frame(width: Tokens.ViewWidth, height: Tokens.ViewHeight? = nil, alignment: Tokens.FrameAlignment? = nil) -> Slider {
        return mutate(frame: width.value, height: height?.value, alignment: alignment?.value)
    }
    
    public func margin(insets: EdgeSet = .all, length: Tokens.MarginLength = .small) -> Slider {
        return self.mutate(margin: length.value, insets: insets)
    }
}

/// A component that displays
public struct DatePicker: View, Modifiable, Identifiable {
    
    internal var id: String?
    
    /// The identifier of the picker.
    internal let name: String
    
    /// The content of the picker.
    internal let value: String?
    
    /// The classes of the picker.
    internal var classes: [String]
    
    /// The events of the picker.
    internal var events: [String]?
    
    /// Creates a date picker.
    public init(name: String, value: String? = nil) {
        
        self.name = name
        self.value = value
        self.classes = ["datepicker"]
    }
    
    public var body: Content {
        Division {
            Input()
                .type(.text)
                .class("datepicker-datefield")
                .name(name)
                .modify(unwrap: value) {
                    $0.value($1)
                }
            self.calendar
        }
        .class(classes.joined(separator: " "))
        .modify(unwrap: id) {
            $0.id($1)
        }
    }
    
    public var calendar: Content {
        Division {
            UnorderedList {
                ListItem {
                    HTMLKit.Button {
                        Vector {
                            Polyline {
                            }
                            .points("10 2 4 8 10 14")
                        }
                        .viewBox("0 0 16 16")
                        .namespace("http://www.w3.org/2000/svg")
                        .fill("currentColor")
                        .strokeWidth(2)
                        .strokeLineCap(.round)
                        .strokeLineJoin(.round)
                    }
                    .type(.button)
                    .value("previous")
                }
                ListItem {
                    Bold {
                    }
                    .class("calendar-detail")
                }
                ListItem {
                    HTMLKit.Button {
                        Vector {
                            Polyline {
                            }
                            .points("6 2 12 8 6 14")
                        }
                        .viewBox("0 0 16 16")
                        .namespace("http://www.w3.org/2000/svg")
                        .fill("currentColor")
                        .strokeWidth(2)
                        .strokeLineCap(.round)
                        .strokeLineJoin(.round)
                    }
                    .type(.button)
                    .value("next")
                }
            }
            .class("calendar-navigation")
            UnorderedList {
                ListItem {
                    "Sun"
                }
                ListItem {
                    "Mon"
                }
                ListItem {
                    "Tue"
                }
                ListItem {
                    "Wed"
                }
                ListItem {
                    "Thu"
                }
                ListItem {
                    "Fri"
                }
                ListItem {
                    "Sat"
                }
            }
            .class("calendar-week")
            UnorderedList {
            }
            .class("calendar-days")
        }
        .class("datepicker-calendar")
    }
}

extension DatePicker: InputModifier {
    
    public func disabled(_ condition: Bool) -> DatePicker {
        
        if condition {
            return self.mutate(inputstate: Tokens.ViewState.disabled.value)
        }
        
        return self
    }
    
    public func focusColor(_ color: Tokens.FocusColor) -> DatePicker {
        return self.mutate(focuscolor: color.value)
    }
}

extension DatePicker: ViewModifier {
    
    public func opacity(_ value: Tokens.OpacityValue) -> DatePicker {
        return self.mutate(opacity: value.value)
    }
    
    public func zIndex(_ index: Tokens.PositionIndex) -> DatePicker {
        return self.mutate(zindex: index.value)
    }
    
    public func hidden() -> DatePicker {
        return self.mutate(viewstate: Tokens.ViewState.hidden.value)
    }
    
    public func hidden(_ condition: Bool) -> DatePicker {
        
        if condition {
            return self.mutate(viewstate: Tokens.ViewState.hidden.value)
        }
        
        return self
    }
    
    public func padding(insets: EdgeSet = .all, length: Tokens.PaddingLength = .small) -> DatePicker {
        return self.mutate(padding: length.value, insets: insets)
    }
    
    public func border(_ color: Tokens.BorderColor, width: Tokens.BorderWidth = .small) -> DatePicker {
        return self.mutate(border: color.value, width: width.value)
    }
    
    public func borderShape(_ shape: Tokens.BorderShape) -> DatePicker {
        return self.mutate(bordershape: shape.value)
    }
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> DatePicker {
        return self.mutate(backgroundcolor: color.value)
    }
    
    public func colorScheme(_ scheme: Tokens.ColorScheme) -> DatePicker {
        return self.mutate(scheme: scheme.value)
    }
    
    public func frame(width: Tokens.ViewWidth, height: Tokens.ViewHeight? = nil, alignment: Tokens.FrameAlignment? = nil) -> DatePicker {
        return mutate(frame: width.value, height: height?.value, alignment: alignment?.value)
    }
    
    public func margin(insets: EdgeSet = .all, length: Tokens.MarginLength = .small) -> DatePicker {
        return self.mutate(margin: length.value, insets: insets)
    }
}

/// A component that displays
public struct SearchField: View, Modifiable, Identifiable {
    
    internal var id: String?
    
    /// The identifier of the search field.
    internal let name: String
    
    /// The placeholder for the field value.
    internal let prompt: String?
    
    /// The content of the field.
    internal let value: String?
    
    /// The classes of the field.
    internal var classes: [String]
    
    /// The events of the field.
    internal var events: [String]?
    
    /// Creates a search field.
    public init(name: String, prompt: String? = nil, value: String? = nil) {
        
        self.name = name
        self.prompt = prompt
        self.value = value
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

/// A component that displays the progress of a task.
public struct Progress: View, Modifiable, Identifiable {
    
    internal var id: String?
    
    /// The maximum value for the progress.
    internal let total: String
    
    /// The actual value of the progress.
    internal let value: String
    
    /// The content of the view.
    internal var content: [Content]
    
    /// The classes of the view.
    internal var classes: [String]
    
    /// The events of the view.
    internal var events: [String]?
    
    /// Creates a progress view.
    public init(value: Float, total: Float, @ContentBuilder<Content> content: () -> [Content]) {
        
        self.total = String(total)
        self.value = String(value)
        self.content = content()
        self.classes = ["progress"]
    }
    
    public var body: Content {
        Vector {
            Path {
                total
            }
            .class("mark")
            Path {
                value
            }
            .class("mark")
        }
        .namespace("https://www.w3.org/2000/svg")
        .class(classes.joined(separator: " "))
        .modify(unwrap: id) {
            $0.id($1)
        }
    }
    
    public func tag(_ value: String) -> Progress {
        return self.mutate(id: value)
    }
    
    public func progressStyle(_ style: Tokens.ProgressStyle) -> Progress {
        return self.mutate(class: "style:\(style.value)")
    }
    
    public func tint(_ color: Tokens.TintColor) -> Progress {
        return self.mutate(class: "tint:\(color.value)")
    }
}

/// A component to edit and format text content.
public struct TextPad: View, Modifiable, Identifiable {
    
    internal var id: String?
    
    /// The identifier of the textpad.
    internal let name: String
    
    /// The placeholder for the field value.
    internal let prompt: String?
    
    /// The number of lines.
    internal var rows: Int = 3
    
    /// The content of the textpad.
    internal var content: [String]
    
    /// The classes of the textpad.
    internal var classes: [String]
    
    /// Creates a textpad
    public init(name: String, prompt: String? = nil, @ContentBuilder<String> content: () -> [String]) {
        
        self.name = name
        self.prompt = prompt
        self.content = content()
        self.classes = ["textpad"]
    }
    
    public var body: Content {
        Division {
            Division {
                Details {
                    Summary {
                        Vector {
                            Path {
                                Title {
                                    "More options"
                                }
                            }
                            .draw("M15.5,6.5C16.328,6.5 17,7.172 17,8C17,8.828 16.328,9.5 15.5,9.5C14.672,9.5 14,8.828 14,8C14,7.172 14.672,6.5 15.5,6.5ZM10,6.5C10.828,6.5 11.5,7.172 11.5,8C11.5,8.828 10.828,9.5 10,9.5C9.172,9.5 8.5,8.828 8.5,8C8.5,7.172 9.172,6.5 10,6.5ZM4.5,6.5C5.328,6.5 6,7.172 6,8C6,8.828 5.328,9.5 4.5,9.5C3.672,9.5 3,8.828 3,8C3,7.172 3.672,6.5 4.5,6.5Z")
                        }
                        .namespace("http://www.w3.org/2000/svg")
                        .viewBox("0 0 20 16")
                    }
                    UnorderedList {
                        ListItem {
                            HTMLKit.Button {
                                Vector {
                                    Path {
                                        Title {
                                            "Bold"
                                        }
                                    }
                                    .draw("M4.25,14.25L4.25,1.75C4.25,1.336 4.586,1 5,1L10.769,1C12.646,1 14.212,2.659 14.212,4.75C14.212,5.686 13.898,6.785 13.383,7.438C14.746,7.929 15.75,9.576 15.75,11.25C15.75,13.341 14.184,15 12.308,15L5,15C4.586,15 4.25,14.664 4.25,14.25ZM10.769,2.5L5.75,2.5C5.75,2.5 5.75,7.25 5.75,7.25L10.769,7.25C11.865,7.25 12.712,5.971 12.712,4.75C12.712,3.529 11.865,2.5 10.769,2.5ZM14.25,11.25C14.25,10.029 13.403,8.75 12.308,8.75L5.75,8.75C5.75,8.75 5.75,13.5 5.75,13.5L12.308,13.5C13.403,13.5 14.25,12.471 14.25,11.25Z")
                                }
                                .namespace("http://www.w3.org/2000/svg")
                                .viewBox("0 0 20 16")
                            }
                            .type(.button)
                            .class("toolbar-tool")
                            .custom(key: "data-command", value: "bold")
                            Span {
                                "Bold"
                            }
                            .class("tooltip")
                        }
                        ListItem {
                            HTMLKit.Button {
                                Vector {
                                    Path {
                                        Title {
                                            "Italic"
                                        }
                                    }
                                    .draw("M8.989,15L4,15C3.586,15 3.25,14.664 3.25,14.25C3.25,13.836 3.586,13.5 4,13.5L8.36,13.5L10.12,2.5L6,2.5C5.586,2.5 5.25,2.164 5.25,1.75C5.25,1.336 5.586,1 6,1C6,1 11.003,1 11.011,1L16,1C16.414,1 16.75,1.336 16.75,1.75C16.75,2.164 16.414,2.5 16,2.5L11.64,2.5L9.88,13.5L14,13.5C14.414,13.5 14.75,13.836 14.75,14.25C14.75,14.664 14.414,15 14,15C14,15 8.997,15 8.989,15Z")
                                }
                                .namespace("http://www.w3.org/2000/svg")
                                .viewBox("0 0 20 16")
                            }
                            .type(.button)
                            .class("toolbar-tool")
                            .custom(key: "data-command", value: "italic")
                            Span {
                                "Italic"
                            }
                            .class("tooltip")
                        }
                        ListItem {
                            HTMLKit.Button {
                                Vector {
                                    Path {
                                        Title {
                                            "Strikethrough"
                                        }
                                    }
                                    .draw("M6.068,7C5.894,6.829 5.745,6.646 5.621,6.45C5.305,5.95 5.148,5.39 5.148,4.771C5.148,4.09 5.341,3.454 5.727,2.862C6.113,2.27 6.678,1.821 7.42,1.514C8.162,1.208 8.987,1.054 9.894,1.054C10.894,1.054 11.775,1.215 12.539,1.537C13.302,1.859 13.89,2.333 14.301,2.959C14.711,3.584 14.932,4.292 14.963,5.083L13.252,5.212C13.16,4.36 12.849,3.716 12.318,3.28C11.788,2.845 11.004,2.627 9.968,2.627C8.888,2.627 8.102,2.825 7.608,3.221C7.115,3.616 6.868,4.093 6.868,4.651C6.868,5.136 7.043,5.534 7.392,5.847C7.736,6.16 8.632,6.48 10.083,6.808C10.373,6.874 10.644,6.938 10.898,7L6.068,7ZM14.776,9C14.787,9.014 14.797,9.029 14.806,9.044C15.181,9.599 15.368,10.238 15.368,10.962C15.368,11.679 15.162,12.355 14.751,12.99C14.34,13.625 13.75,14.118 12.98,14.471C12.211,14.824 11.345,15 10.382,15C9.161,15 8.139,14.822 7.314,14.466C6.489,14.111 5.842,13.576 5.373,12.861C4.904,12.147 4.657,11.339 4.632,10.437L6.316,10.29C6.396,10.965 6.581,11.518 6.872,11.951C7.164,12.383 7.616,12.732 8.229,12.999C8.842,13.266 9.532,13.399 10.299,13.399C10.98,13.399 11.581,13.298 12.102,13.096C12.623,12.893 13.011,12.616 13.266,12.263C13.52,11.911 13.647,11.526 13.647,11.109C13.647,10.686 13.525,10.316 13.279,10C13.034,9.685 12.629,9.419 12.065,9.205C11.922,9.149 11.709,9.081 11.428,9L14.776,9ZM17,7.277L17,8.777L3,8.777L3,7.277L17,7.277Z")
                                }
                                .namespace("http://www.w3.org/2000/svg")
                                .viewBox("0 0 20 16")
                            }
                            .type(.button)
                            .class("toolbar-tool")
                            .custom(key: "data-command", value: "strikethrough")
                            Span {
                                "Strikethrough"
                            }
                            .class("tooltip")
                        }
                        ListItem {
                            HTMLKit.Button {
                                Vector {
                                    Path {
                                        Title {
                                            "Link"
                                        }
                                    }
                                    .draw("M10.025,11.51C9.368,11.335 8.747,10.99 8.232,10.475L7.525,9.768C5.964,8.207 5.964,5.672 7.525,4.111L10.354,1.282C11.915,-0.279 14.449,-0.279 16.01,1.282L16.718,1.99C18.279,3.551 18.279,6.085 16.718,7.646L13.933,10.431C14.165,9.703 14.207,8.928 14.06,8.183L15.303,6.939C16.474,5.769 16.474,3.867 15.303,2.697C14.133,1.526 12.231,1.526 11.061,2.697L8.939,4.818C7.769,5.989 7.769,7.89 8.939,9.061C9.581,9.703 10.443,9.993 11.283,9.931C11.162,10.258 10.97,10.565 10.707,10.828L10.025,11.51ZM9.975,4.49C10.632,4.665 11.253,5.01 11.768,5.525L12.475,6.232C14.036,7.793 14.036,10.328 12.475,11.889L9.646,14.718C8.085,16.279 5.551,16.279 3.99,14.718L3.282,14.01C1.721,12.449 1.721,9.915 3.282,8.354L6.067,5.569C5.835,6.297 5.793,7.072 5.94,7.817L4.697,9.061C3.526,10.231 3.526,12.133 4.697,13.303C5.867,14.474 7.769,14.474 8.939,13.303L11.061,11.182C12.231,10.011 12.231,8.11 11.061,6.939C10.419,6.297 9.557,6.007 8.717,6.069C8.838,5.742 9.03,5.435 9.293,5.172L9.975,4.49Z")
                                }
                                .namespace("http://www.w3.org/2000/svg")
                                .viewBox("0 0 20 16")
                            }
                            .type(.button)
                            .class("toolbar-tool")
                            .custom(key: "data-command", value: "link")
                            Span {
                                "Link"
                            }
                            .class("tooltip")
                        }
                        ListItem {
                            HTMLKit.Button {
                                Vector {
                                    Path {
                                        Title {
                                            "Code"
                                        }
                                    }
                                    .draw("M11.829,2.171C11.57,1.848 11.623,1.376 11.946,1.117C12.269,0.859 12.741,0.911 13,1.234L17.546,7.532C17.765,7.805 17.765,8.195 17.546,8.469L13.171,14.883C12.913,15.206 12.44,15.259 12.117,15C11.794,14.741 11.741,14.269 12,13.946C12,13.946 16,8 16,8L11.829,2.171ZM8.288,13.946C8.547,14.269 8.495,14.741 8.171,15C7.848,15.259 7.376,15.206 7.117,14.883L2.454,8.469C2.235,8.195 2.235,7.805 2.454,7.532L6.946,1.351C7.204,1.028 7.677,0.976 8,1.234C8.323,1.493 8.376,1.965 8.117,2.288C8.117,2.288 4,8 4,8L8.288,13.946Z")
                                }
                                .namespace("http://www.w3.org/2000/svg")
                                .viewBox("0 0 20 16")
                            }
                            .type(.button)
                            .class("toolbar-tool")
                            .custom(key: "data-command", value: "code")
                            Span {
                                "Code"
                            }
                            .class("tooltip")
                        }
                    }
                }
                .class("toolbar-context")
                Menu {
                    ListItem {
                        HTMLKit.Button {
                            Vector {
                                Path {
                                    Title {
                                        "Bold"
                                    }
                                }
                                .draw("M4.25,14.25L4.25,1.75C4.25,1.336 4.586,1 5,1L10.769,1C12.646,1 14.212,2.659 14.212,4.75C14.212,5.686 13.898,6.785 13.383,7.438C14.746,7.929 15.75,9.576 15.75,11.25C15.75,13.341 14.184,15 12.308,15L5,15C4.586,15 4.25,14.664 4.25,14.25ZM10.769,2.5L5.75,2.5C5.75,2.5 5.75,7.25 5.75,7.25L10.769,7.25C11.865,7.25 12.712,5.971 12.712,4.75C12.712,3.529 11.865,2.5 10.769,2.5ZM14.25,11.25C14.25,10.029 13.403,8.75 12.308,8.75L5.75,8.75C5.75,8.75 5.75,13.5 5.75,13.5L12.308,13.5C13.403,13.5 14.25,12.471 14.25,11.25Z")
                            }
                            .namespace("http://www.w3.org/2000/svg")
                            .viewBox("0 0 20 16")
                        }
                        .type(.button)
                        .class("toolbar-tool")
                        .custom(key: "data-command", value: "bold")
                        Span {
                            "Bold"
                        }
                        .class("tooltip")
                    }
                    ListItem {
                        HTMLKit.Button {
                            Vector {
                                Path {
                                    Title {
                                        "Italic"
                                    }
                                }
                                .draw("M8.989,15L4,15C3.586,15 3.25,14.664 3.25,14.25C3.25,13.836 3.586,13.5 4,13.5L8.36,13.5L10.12,2.5L6,2.5C5.586,2.5 5.25,2.164 5.25,1.75C5.25,1.336 5.586,1 6,1C6,1 11.003,1 11.011,1L16,1C16.414,1 16.75,1.336 16.75,1.75C16.75,2.164 16.414,2.5 16,2.5L11.64,2.5L9.88,13.5L14,13.5C14.414,13.5 14.75,13.836 14.75,14.25C14.75,14.664 14.414,15 14,15C14,15 8.997,15 8.989,15Z")
                            }
                            .namespace("http://www.w3.org/2000/svg")
                            .viewBox("0 0 20 16")
                        }
                        .type(.button)
                        .class("toolbar-tool")
                        .custom(key: "data-command", value: "italic")
                        Span {
                            "Italic"
                        }
                        .class("tooltip")
                    }
                    ListItem {
                        HTMLKit.Button {
                            Vector {
                                Path {
                                    Title {
                                        "Strikethrough"
                                    }
                                }
                                .draw("M6.068,7C5.894,6.829 5.745,6.646 5.621,6.45C5.305,5.95 5.148,5.39 5.148,4.771C5.148,4.09 5.341,3.454 5.727,2.862C6.113,2.27 6.678,1.821 7.42,1.514C8.162,1.208 8.987,1.054 9.894,1.054C10.894,1.054 11.775,1.215 12.539,1.537C13.302,1.859 13.89,2.333 14.301,2.959C14.711,3.584 14.932,4.292 14.963,5.083L13.252,5.212C13.16,4.36 12.849,3.716 12.318,3.28C11.788,2.845 11.004,2.627 9.968,2.627C8.888,2.627 8.102,2.825 7.608,3.221C7.115,3.616 6.868,4.093 6.868,4.651C6.868,5.136 7.043,5.534 7.392,5.847C7.736,6.16 8.632,6.48 10.083,6.808C10.373,6.874 10.644,6.938 10.898,7L6.068,7ZM14.776,9C14.787,9.014 14.797,9.029 14.806,9.044C15.181,9.599 15.368,10.238 15.368,10.962C15.368,11.679 15.162,12.355 14.751,12.99C14.34,13.625 13.75,14.118 12.98,14.471C12.211,14.824 11.345,15 10.382,15C9.161,15 8.139,14.822 7.314,14.466C6.489,14.111 5.842,13.576 5.373,12.861C4.904,12.147 4.657,11.339 4.632,10.437L6.316,10.29C6.396,10.965 6.581,11.518 6.872,11.951C7.164,12.383 7.616,12.732 8.229,12.999C8.842,13.266 9.532,13.399 10.299,13.399C10.98,13.399 11.581,13.298 12.102,13.096C12.623,12.893 13.011,12.616 13.266,12.263C13.52,11.911 13.647,11.526 13.647,11.109C13.647,10.686 13.525,10.316 13.279,10C13.034,9.685 12.629,9.419 12.065,9.205C11.922,9.149 11.709,9.081 11.428,9L14.776,9ZM17,7.277L17,8.777L3,8.777L3,7.277L17,7.277Z")
                            }
                            .namespace("http://www.w3.org/2000/svg")
                            .viewBox("0 0 20 16")
                        }
                        .type(.button)
                        .class("toolbar-tool")
                        .custom(key: "data-command", value: "strikethrough")
                        Span {
                            "Strikethrough"
                        }
                        .class("tooltip")
                    }
                    ListItem {
                        HTMLKit.Button {
                            Vector {
                                Path {
                                    Title {
                                        "Link"
                                    }
                                }
                                .draw("M10.025,11.51C9.368,11.335 8.747,10.99 8.232,10.475L7.525,9.768C5.964,8.207 5.964,5.672 7.525,4.111L10.354,1.282C11.915,-0.279 14.449,-0.279 16.01,1.282L16.718,1.99C18.279,3.551 18.279,6.085 16.718,7.646L13.933,10.431C14.165,9.703 14.207,8.928 14.06,8.183L15.303,6.939C16.474,5.769 16.474,3.867 15.303,2.697C14.133,1.526 12.231,1.526 11.061,2.697L8.939,4.818C7.769,5.989 7.769,7.89 8.939,9.061C9.581,9.703 10.443,9.993 11.283,9.931C11.162,10.258 10.97,10.565 10.707,10.828L10.025,11.51ZM9.975,4.49C10.632,4.665 11.253,5.01 11.768,5.525L12.475,6.232C14.036,7.793 14.036,10.328 12.475,11.889L9.646,14.718C8.085,16.279 5.551,16.279 3.99,14.718L3.282,14.01C1.721,12.449 1.721,9.915 3.282,8.354L6.067,5.569C5.835,6.297 5.793,7.072 5.94,7.817L4.697,9.061C3.526,10.231 3.526,12.133 4.697,13.303C5.867,14.474 7.769,14.474 8.939,13.303L11.061,11.182C12.231,10.011 12.231,8.11 11.061,6.939C10.419,6.297 9.557,6.007 8.717,6.069C8.838,5.742 9.03,5.435 9.293,5.172L9.975,4.49Z")
                            }
                            .namespace("http://www.w3.org/2000/svg")
                            .viewBox("0 0 20 16")
                        }
                        .type(.button)
                        .class("toolbar-tool")
                        .custom(key: "data-command", value: "link")
                        Span {
                            "Link"
                        }
                        .class("tooltip")
                    }
                    ListItem {
                        HTMLKit.Button {
                            Vector {
                                Path {
                                    Title {
                                        "Code"
                                    }
                                }
                                .draw("M11.829,2.171C11.57,1.848 11.623,1.376 11.946,1.117C12.269,0.859 12.741,0.911 13,1.234L17.546,7.532C17.765,7.805 17.765,8.195 17.546,8.469L13.171,14.883C12.913,15.206 12.44,15.259 12.117,15C11.794,14.741 11.741,14.269 12,13.946C12,13.946 16,8 16,8L11.829,2.171ZM8.288,13.946C8.547,14.269 8.495,14.741 8.171,15C7.848,15.259 7.376,15.206 7.117,14.883L2.454,8.469C2.235,8.195 2.235,7.805 2.454,7.532L6.946,1.351C7.204,1.028 7.677,0.976 8,1.234C8.323,1.493 8.376,1.965 8.117,2.288C8.117,2.288 4,8 4,8L8.288,13.946Z")
                            }
                            .namespace("http://www.w3.org/2000/svg")
                            .viewBox("0 0 20 16")
                        }
                        .type(.button)
                        .class("toolbar-tool")
                        .custom(key: "data-command", value: "code")
                        Span {
                            "Code"
                        }
                        .class("tooltip")
                    }
                }
                .class("textpad-action")
                Menu {
                    ListItem {
                        HTMLKit.Button {
                            Vector {
                                Path {
                                    Title {
                                        "Undo"
                                    }
                                }
                                .draw("M5.825,6.444L9.783,9.009C10.13,9.234 10.23,9.699 10.004,10.046C9.779,10.394 9.314,10.493 8.967,10.268L2.967,6.379C2.755,6.242 2.627,6.007 2.625,5.755C2.623,5.502 2.749,5.266 2.959,5.126L8.959,1.126C9.303,0.896 9.769,0.99 9.999,1.334C10.229,1.678 10.135,2.144 9.791,2.374L5.936,4.944L12.375,4.944C15.135,4.944 17.375,7.185 17.375,9.944C17.375,12.704 15.135,14.944 12.375,14.944L10.142,14.944C9.939,14.944 9.743,14.863 9.6,14.719C9.456,14.576 9.375,14.38 9.375,14.177C9.375,13.982 9.452,13.796 9.589,13.659C9.727,13.521 9.913,13.444 10.107,13.444L12.375,13.444C14.307,13.444 15.875,11.876 15.875,9.944C15.875,8.012 14.307,6.444 12.375,6.444L5.825,6.444Z")
                            }
                            .namespace("http://www.w3.org/2000/svg")
                            .viewBox("0 0 20 16")
                        }
                        .type(.button)
                        .class("toolbar-tool state:disabled")
                        .custom(key: "data-command", value: "undo")
                        Span {
                            "Undo"
                        }
                        .class("tooltip")
                    }
                    ListItem {
                        HTMLKit.Button {
                            Vector {
                                Path {
                                    Title {
                                        "Redo"
                                    }
                                }
                                .draw("M14.175,6.444L10.217,9.009C9.87,9.234 9.77,9.699 9.996,10.046C10.221,10.394 10.686,10.493 11.033,10.268L17.033,6.379C17.245,6.242 17.373,6.007 17.375,5.755C17.377,5.502 17.251,5.266 17.041,5.126L11.041,1.126C10.697,0.896 10.231,0.99 10.001,1.334C9.771,1.678 9.865,2.144 10.209,2.374L14.064,4.944L7.625,4.944C4.865,4.944 2.625,7.185 2.625,9.944C2.625,12.704 4.865,14.944 7.625,14.944L9.858,14.944C10.061,14.944 10.257,14.863 10.4,14.719C10.544,14.576 10.625,14.38 10.625,14.177C10.625,13.982 10.548,13.796 10.411,13.659C10.273,13.521 10.087,13.444 9.893,13.444L7.625,13.444C5.693,13.444 4.125,11.876 4.125,9.944C4.125,8.012 5.693,6.444 7.625,6.444L14.175,6.444Z")
                            }
                            .namespace("http://www.w3.org/2000/svg")
                            .viewBox("0 0 20 16")
                        }
                        .type(.button)
                        .class("toolbar-tool state:disabled")
                        .custom(key: "data-command", value: "redo")
                        Span {
                            "Redo"
                        }
                        .class("tooltip")
                    }
                }
                .class("textpad-revision")
            }
            .class("textpad-toolbar")
            TextArea {
                content
            }
            .name(name)
            .rows(rows)
            .class("textpad-content")
            .modify(unwrap: prompt) {
                $0.placeholder($1)
            }
        }
        .class(classes.joined(separator: " "))
        .modify(unwrap: id) {
            $0.id($1)
        }
    }
    
    /// Sets the limit of the maximum lines.
    public func lineLimit(_ value: Int) -> TextPad {

        var newSelf = self
        newSelf.rows = value
        
        return newSelf
    }
    
    public func tag(_ value: String) -> TextPad {
        return self.mutate(id: value)
    }
}

extension TextPad: InputModifier {
    
    public func disabled(_ condition: Bool) -> TextPad {
        
        if condition {
            return self.mutate(inputstate: Tokens.ViewState.disabled.value)
        }
        
        return self
    }
    
    public func focusColor(_ color: Tokens.FocusColor) -> TextPad {
        return self.mutate(focuscolor: color.value)
    }
}

extension TextPad: ViewModifier {
    
    public func opacity(_ value: Tokens.OpacityValue) -> TextPad {
        return self.mutate(opacity: value.value)
    }
    
    public func zIndex(_ index: Tokens.PositionIndex) -> TextPad {
        return self.mutate(zindex: index.value)
    }
    
    public func hidden() -> TextPad {
        return self.mutate(viewstate: Tokens.ViewState.hidden.value)
    }
    
    public func hidden(_ condition: Bool) -> TextPad {
        
        if condition {
            return self.mutate(viewstate: Tokens.ViewState.hidden.value)
        }
        
        return self
    }
    
    public func padding(insets: EdgeSet = .all, length: Tokens.PaddingLength = .small) -> TextPad {
        return self.mutate(padding: length.value, insets: insets)
    }
    
    public func border(_ color: Tokens.BorderColor, width: Tokens.BorderWidth = .small) -> TextPad {
        return self.mutate(border: color.value, width: width.value)
    }
    
    public func borderShape(_ shape: Tokens.BorderShape) -> TextPad {
        return self.mutate(bordershape: shape.value)
    }
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> TextPad {
        return self.mutate(backgroundcolor: color.value)
    }
    
    public func colorScheme(_ scheme: Tokens.ColorScheme) -> TextPad {
        return self.mutate(scheme: scheme.value)
    }
    
    public func frame(width: Tokens.ViewWidth, height: Tokens.ViewHeight? = nil, alignment: Tokens.FrameAlignment? = nil) -> TextPad {
        return mutate(frame: width.value, height: height?.value, alignment: alignment?.value)
    }
    
    public func margin(insets: EdgeSet = .all, length: Tokens.MarginLength = .small) -> TextPad {
        return self.mutate(margin: length.value, insets: insets)
    }
}

/// A component that displays
public struct FileDialog: View, Modifiable, Identifiable {
    
    internal var id: String?
    
    /// The identifier of the search field.
    internal let name: String
    
    /// The classes of the field.
    internal var classes: [String]
    
    /// The events of the field.
    internal var events: [String]?
    
    /// Creates a search field.
    public init(name: String) {
        
        self.name = name
        self.classes = ["filedialog"]
    }
    
    public var body: Content {
        Input()
            .type(.file)
            .name(name)
            .class(classes.joined(separator: " "))
            .modify(unwrap: id) {
                $0.id($1)
            }
    }
    
    public func tag(_ value: String) -> FileDialog {
        return self.mutate(id: value)
    }
}

extension FileDialog: InputModifier {
    
    public func disabled(_ condition: Bool) -> FileDialog {
        
        if condition {
            return self.mutate(inputstate: Tokens.ViewState.disabled.value)
        }
        
        return self
    }
    
    public func focusColor(_ color: Tokens.FocusColor) -> FileDialog {
        return self.mutate(focuscolor: color.value)
    }
}

extension FileDialog: ViewModifier {
    
    public func opacity(_ value: Tokens.OpacityValue) -> FileDialog {
        return self.mutate(opacity: value.value)
    }
    
    public func zIndex(_ index: Tokens.PositionIndex) -> FileDialog {
        return self.mutate(zindex: index.value)
    }
    
    public func hidden() -> FileDialog {
        return self.mutate(viewstate: Tokens.ViewState.hidden.value)
    }
    
    public func hidden(_ condition: Bool) -> FileDialog {
        
        if condition {
            return self.mutate(viewstate: Tokens.ViewState.hidden.value)
        }
        
        return self
    }
    
    public func padding(insets: EdgeSet = .all, length: Tokens.PaddingLength = .small) -> FileDialog {
        return self.mutate(padding: length.value, insets: insets)
    }
    
    public func border(_ color: Tokens.BorderColor, width: Tokens.BorderWidth = .small) -> FileDialog {
        return self.mutate(border: color.value, width: width.value)
    }
    
    public func borderShape(_ shape: Tokens.BorderShape) -> FileDialog {
        return self.mutate(bordershape: shape.value)
    }
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> FileDialog {
        return self.mutate(backgroundcolor: color.value)
    }
    
    public func colorScheme(_ scheme: Tokens.ColorScheme) -> FileDialog {
        return self.mutate(scheme: scheme.value)
    }
    
    public func frame(width: Tokens.ViewWidth, height: Tokens.ViewHeight? = nil, alignment: Tokens.FrameAlignment? = nil) -> FileDialog {
        return mutate(frame: width.value, height: height?.value, alignment: alignment?.value)
    }
    
    public func margin(insets: EdgeSet = .all, length: Tokens.MarginLength = .small) -> FileDialog {
        return self.mutate(margin: length.value, insets: insets)
    }
}
