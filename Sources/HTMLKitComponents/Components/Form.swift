/*
 Abstract:
 The file contains everything related to form component.
 */

import HTMLKit

/// A component that collects form controls.
public struct Form: View, Actionable {
    
    /// The identifier of the form.
    public var id: String?
    
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

/// A component that displays the name of the form control.
public struct FieldLabel: View {
    
    /// The identifier of the element the label is related to.
    internal let id: String
    
    /// The content of the label.
    internal var content: [Content]
    
    /// The classes of the label.
    internal var classes: [String]
    
    /// The events of the label.
    internal var events: [String]?
    
    /// Creates a field label.
    public init(for id: String, @ContentBuilder<Content> content: () -> [Content]) {
      
        self.id = id
        self.content = content()
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

/// A component that displays an editable form control.
public struct TextField: View, Modifiable, Identifiable {
    
    public var id: String?
    
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
    
    /// Creates a text field.
    public init(name: String, prompt: String? = nil, value: String? = nil) {
        
        self.name = name
        self.prompt = prompt
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
    
    public func borderColor(_ color: Tokens.BorderColor) -> TextField {
        return self.mutate(bordercolor: color.value)
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
    
    public func frame(width: Tokens.ColumnSize, offset: Tokens.ColumnOffset? = nil) -> TextField {
        return mutate(frame: width.value, offset: offset?.value)
    }
    
    public func margin(insets: EdgeSet = .all, length: Tokens.MarginLength = .small) -> TextField {
        return self.mutate(margin: length.value, insets: insets)
    }
}

/// A component that displays a editable and expandable form control.
public struct TextEditor: View, Modifiable, Identifiable {
    
    public var id: String?
    
    /// The identifier of the editor.
    internal let name: String
    
    /// The placeholder for the field value.
    internal let prompt: String?
    
    /// The number of lines.
    internal var rows: Int = 3
    
    /// The content of the editor.
    internal var content: [String]
    
    /// The classes of the editor.
    internal var classes: [String]
    
    /// The events of the editor.
    internal var events: [String]?
    
    /// Creates a text editor.
    public init(name: String, prompt: String? = nil, @ContentBuilder<String> content: () -> [String]) {
        
        self.name = name
        self.prompt = prompt
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
    
    public func borderColor(_ color: Tokens.BorderColor) -> TextEditor {
        return self.mutate(bordercolor: color.value)
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
    
    public func frame(width: Tokens.ColumnSize, offset: Tokens.ColumnOffset? = nil) -> TextEditor {
        return mutate(frame: width.value, offset: offset?.value)
    }
    
    public func margin(insets: EdgeSet = .all, length: Tokens.MarginLength = .small) -> TextEditor {
        return self.mutate(margin: length.value, insets: insets)
    }
}

public struct Picker: View, Modifiable, Identifiable {
    
    public var id: String?

    internal let name: String
    
    internal let selection: String?
    
    internal let content: [Selectable]
    
    internal var classes: [String]
    
    public init(name: String, selection: String? = nil, @ContentBuilder<Selectable> content: () -> [Selectable]) {
        
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
    public var id: String?
    
    /// The identifier for the field.
    public var name: String?
    
    /// The content of the field.
    public var value: String
    
    /// The selection status of the field.
    public var isSelected: Bool

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
    
    public func borderColor(_ color: Tokens.BorderColor) -> CheckField {
        return self.mutate(bordercolor: color.value)
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
    
    public func frame(width: Tokens.ColumnSize, offset: Tokens.ColumnOffset? = nil) -> CheckField {
        return mutate(frame: width.value, offset: offset?.value)
    }
    
    public func margin(insets: EdgeSet = .all, length: Tokens.MarginLength = .small) -> CheckField {
        return self.mutate(margin: length.value, insets: insets)
    }
}

/// A component that displays
public struct RadioSelect: View, Modifiable, Selectable, Identifiable {
    
    /// The identifier for the label.
    public var id: String?
    
    /// The identifier of the select.
    public var name: String?
    
    /// The content of the select.
    public var value: String
    
    /// The selection status of the select.
    public var isSelected: Bool
    
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
    
    public func borderColor(_ color: Tokens.BorderColor) -> RadioSelect {
        return self.mutate(bordercolor: color.value)
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
    
    public func frame(width: Tokens.ColumnSize, offset: Tokens.ColumnOffset? = nil) -> RadioSelect {
        return mutate(frame: width.value, offset: offset?.value)
    }
    
    public func margin(insets: EdgeSet = .all, length: Tokens.MarginLength = .small) -> RadioSelect {
        return self.mutate(margin: length.value, insets: insets)
    }
}

/// A component that displays
public struct SelectField: View, Modifiable, Identifiable {
    
    public var id: String?
    
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
    public init(name: String, prompt: String? = nil, selection: String? = nil, @ContentBuilder<Selectable> content: () -> [Selectable]) {
        
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
    
    public func borderColor(_ color: Tokens.BorderColor) -> SelectField {
        return self.mutate(bordercolor: color.value)
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
    
    public func frame(width: Tokens.ColumnSize, offset: Tokens.ColumnOffset? = nil) -> SelectField {
        return mutate(frame: width.value, offset: offset?.value)
    }
    
    public func margin(insets: EdgeSet = .all, length: Tokens.MarginLength = .small) -> SelectField {
        return self.mutate(margin: length.value, insets: insets)
    }
}

/// A component that displays
public struct SecureField: View, Modifiable, Identifiable {
    
    public var id: String?
    
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
    
    public func borderColor(_ color: Tokens.BorderColor) -> SecureField {
        return self.mutate(bordercolor: color.value)
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
    
    public func frame(width: Tokens.ColumnSize, offset: Tokens.ColumnOffset? = nil) -> SecureField {
        return mutate(frame: width.value, offset: offset?.value)
    }
    
    public func margin(insets: EdgeSet = .all, length: Tokens.MarginLength = .small) -> SecureField {
        return self.mutate(margin: length.value, insets: insets)
    }
}

/// A component that displays
public struct Slider: View, Modifiable, Identifiable {
    
    public var id: String?
    
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
    
    public func borderColor(_ color: Tokens.BorderColor) -> Slider {
        return self.mutate(bordercolor: color.value)
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
    
    public func frame(width: Tokens.ColumnSize, offset: Tokens.ColumnOffset? = nil) -> Slider {
        return mutate(frame: width.value, offset: offset?.value)
    }
    
    public func margin(insets: EdgeSet = .all, length: Tokens.MarginLength = .small) -> Slider {
        return self.mutate(margin: length.value, insets: insets)
    }
}

/// A component that displays
public struct DatePicker: View, Modifiable, Identifiable {
    
    public var id: String?
    
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
    
    public func borderColor(_ color: Tokens.BorderColor) -> DatePicker {
        return self.mutate(bordercolor: color.value)
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
    
    public func frame(width: Tokens.ColumnSize, offset: Tokens.ColumnOffset? = nil) -> DatePicker {
        return mutate(frame: width.value, offset: offset?.value)
    }
    
    public func margin(insets: EdgeSet = .all, length: Tokens.MarginLength = .small) -> DatePicker {
        return self.mutate(margin: length.value, insets: insets)
    }
}

/// A component that displays
public struct SearchField: View, Modifiable, Identifiable {
    
    public var id: String?
    
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
    
    public func borderColor(_ color: Tokens.BorderColor) -> SearchField {
        return self.mutate(bordercolor: color.value)
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
    
    public func frame(width: Tokens.ColumnSize, offset: Tokens.ColumnOffset? = nil) -> SearchField {
        return mutate(frame: width.value, offset: offset?.value)
    }
    
    public func margin(insets: EdgeSet = .all, length: Tokens.MarginLength = .small) -> SearchField {
        return self.mutate(margin: length.value, insets: insets)
    }
}

/// A component that displays the progress of a task.
public struct Progress: View, Identifiable {
    
    public var id: String?
    
    internal let maximum: Float
    
    internal let value: String
    
    /// The content of the view.
    internal var content: [Content]
    
    /// The classes of the view.
    internal var classes: [String]
    
    /// The events of the view.
    internal var events: [String]?
    
    /// Creates a progress view.
    public init(maximum: Float, value: Float, @ContentBuilder<Content> content: () -> [Content]) {
        
        self.maximum = maximum
        self.value = String(value)
        self.content = content()
        self.classes = ["progress"]
    }
    
    public var body: Content {
        HTMLKit.Progress {
            content
        }
        .value(value)
        .maximum(maximum)
        .class(classes.joined(separator: " "))
        .modify(unwrap: id) {
            $0.id($1)
        }
    }
    
    public func tag(_ value: String) -> Progress {
        return self.mutate(id: value)
    }
}

/// A component to edit and format text content.
public struct TextPad: View, Modifiable, Identifiable {
    
    public var id: String?
    
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
            UnorderedList {
                ListItem {
                    Paragraph {
                        "B"
                    }
                }
                .class("toolbar-tool command:bold")
                ListItem {
                    Paragraph {
                        "I"
                    }
                }
                .class("toolbar-tool command:italic")
                ListItem {
                    Paragraph {
                        "U"
                    }
                }
                .class("toolbar-tool command:underline")
                ListItem {
                    Paragraph {
                        "S"
                    }
                }
                .class("toolbar-tool command:strikethrough")
                ListItem {
                    Symbol(system: .text(.left))
                }
                .class("toolbar-tool")
                ListItem {
                    Symbol(system: .text(.center))
                }
                .class("toolbar-tool")
                ListItem {
                    Symbol(system: .text(.right))
                }
                .class("toolbar-tool")
                ListItem {
                    Symbol(system: .text(.justify))
                }
                .class("toolbar-tool")
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
    
    public func borderColor(_ color: Tokens.BorderColor) -> TextPad {
        return self.mutate(bordercolor: color.value)
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
    
    public func frame(width: Tokens.ColumnSize, offset: Tokens.ColumnOffset? = nil) -> TextPad {
        return mutate(frame: width.value, offset: offset?.value)
    }
    
    public func margin(insets: EdgeSet = .all, length: Tokens.MarginLength = .small) -> TextPad {
        return self.mutate(margin: length.value, insets: insets)
    }
}

/// A component that displays
public struct FileDialog: View, Modifiable, Identifiable {
    
    public var id: String?
    
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
    
    public func borderColor(_ color: Tokens.BorderColor) -> FileDialog {
        return self.mutate(bordercolor: color.value)
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
    
    public func frame(width: Tokens.ColumnSize, offset: Tokens.ColumnOffset? = nil) -> FileDialog {
        return mutate(frame: width.value, offset: offset?.value)
    }
    
    public func margin(insets: EdgeSet = .all, length: Tokens.MarginLength = .small) -> FileDialog {
        return self.mutate(margin: length.value, insets: insets)
    }
}
