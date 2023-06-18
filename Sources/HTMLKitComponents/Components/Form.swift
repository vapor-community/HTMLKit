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
    
    /// The content of the container.
    internal var content: [FormElement]
    
    /// The classes of the container.
    internal var classes: [String]
    
    /// The events of the container.
    internal var events: [String]?
    
    /// Creates a form.
    public init(method: Values.Method, @ContentBuilder<FormElement> content: () -> [FormElement]) {
        
        self.method = method
        self.content = content()
        self.classes = ["form"]
    }
    
    /// Creates a form.
    internal init(method: Values.Method, content: [FormElement], classes: [String], events: [String]?, id: String?) {
        
        self.method = method
        self.content = content
        self.classes = classes
        self.events = events
        self.id = id
    }
    
    public var body: Content {
        HTMLKit.Form {
            content
        }
        .method(method)
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
    
    public func id(_ value: String) -> Form {
        return self.mutate(id: value)
    }
}

extension Form: FormModifier {

    public func onSubmit(perfom action: Actions) -> Form {
        
        if action.description == "validate" {
            return self.mutate(submitevent: action.script, validation: true)
        }
        
        return self.mutate(submitevent: action.script, validation: false)
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
    
    /// Creates a field label.
    internal init(for id: String, content: [Content], classes: [String], events: [String]?) {
      
        self.id = id
        self.content = content
        self.classes = classes
        self.events = events
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
public struct TextField: View, Modifiable {
    
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
    
    /// Creates a text field.
    internal init(name: String, prompt: String?, value: String?, classes: [String], events: [String]?) {
        
        self.name = name
        self.prompt = prompt
        self.value = value
        self.classes = classes
        self.events = events
    }
    
    public var body: Content {
        Input()
            .type(.text)
            .id(name)
            .name(name)
            .class(classes.joined(separator: " "))
            .modify(unwrap: value) {
                $0.value($1)
            }
            .modify(unwrap: prompt) {
                $0.placeholder($1)
            }
    }
}

extension TextField: InputModifier {
    
    public func disabled(_ condition: Bool) -> TextField {
        
        if condition {
            return self.mutate(inputstate: Tokens.ViewState.disabled.rawValue)
        }
        
        return self
    }
    
    public func focusColor(_ color: Tokens.FocusColor) -> TextField {
        return self.mutate(focuscolor: color.rawValue)
    }
}

extension TextField: ViewModifier {
    
    public func opacity(_ value: Tokens.OpacityValue) -> TextField {
        return self.mutate(opacity: value.rawValue)
    }
    
    public func zIndex(_ index: Tokens.PositionIndex) -> TextField {
        return self.mutate(zindex: index.rawValue)
    }
    
    public func hidden() -> TextField {
        return self.mutate(viewstate: Tokens.ViewState.hidden.rawValue)
    }
    
    public func padding(_ length: Tokens.BoxPadding) -> TextField {
        return self.mutate(padding: length.rawValue)
    }
    
    public func borderColor(_ color: Tokens.BorderColor) -> TextField {
        return self.mutate(bordercolor: color.rawValue)
    }
    
    public func borderShape(_ shape: Tokens.BorderShape) -> TextField {
        return self.mutate(bordershape: shape.rawValue)
    }
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> TextField {
        return self.mutate(backgroundcolor: color.rawValue)
    }
    
    public func colorScheme(_ scheme: Tokens.ColorScheme) -> TextField {
        return self.mutate(scheme: scheme.rawValue)
    }
    
    public func frame(width: Tokens.ColumnSize, offset: Tokens.ColumnOffset? = nil) -> TextField {
        
        if let offset {
            return self.mutate(frame: [width.rawValue, offset.rawValue])
        }
        
        return self.mutate(class: width.rawValue)
    }
}

/// A component that displays a editable and expandable form control.
public struct TextEditor: View, Modifiable {
    
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
    
    /// Creates a text editor.
    internal init(name: String, prompt: String?, rows: Int, content: [String], classes: [String], events: [String]?) {
        
        self.name = name
        self.prompt = prompt
        self.rows = rows
        self.content = content
        self.classes = classes
        self.events = events
    }
    
    public var body: Content {
        TextArea {
            content
        }
        .id(name)
        .name(name)
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
}

extension TextEditor: InputModifier {
    
    public func disabled(_ condition: Bool) -> TextEditor {
        
        if condition {
            return self.mutate(inputstate: Tokens.ViewState.disabled.rawValue)
        }
        
        return self
    }
    
    public func focusColor(_ color: Tokens.FocusColor) -> TextEditor {
        return self.mutate(focuscolor: color.rawValue)
    }
}

extension TextEditor: ViewModifier {
    
    public func opacity(_ value: Tokens.OpacityValue) -> TextEditor {
        return self.mutate(opacity: value.rawValue)
    }
    
    public func zIndex(_ index: Tokens.PositionIndex) -> TextEditor {
        return self.mutate(zindex: index.rawValue)
    }
    
    public func hidden() -> TextEditor {
        return self.mutate(viewstate: Tokens.ViewState.hidden.rawValue)
    }
    
    public func padding(_ length: Tokens.BoxPadding) -> TextEditor {
        return self.mutate(padding: length.rawValue)
    }
    
    public func borderColor(_ color: Tokens.BorderColor) -> TextEditor {
        return self.mutate(bordercolor: color.rawValue)
    }
    
    public func borderShape(_ shape: Tokens.BorderShape) -> TextEditor {
        return self.mutate(bordershape: shape.rawValue)
    }
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> TextEditor {
        return self.mutate(backgroundcolor: color.rawValue)
    }
    
    public func colorScheme(_ scheme: Tokens.ColorScheme) -> TextEditor {
        return self.mutate(scheme: scheme.rawValue)
    }
    
    public func frame(width: Tokens.ColumnSize, offset: Tokens.ColumnOffset? = nil) -> TextEditor {
        
        if let offset {
            return self.mutate(frame: [width.rawValue, offset.rawValue])
        }
        
        return self.mutate(class: width.rawValue)
    }
}

/// A component that displays a form control
public struct CheckField: View, Modifiable {
    
    /// The identifier of the field.
    internal let name: String
    
    /// The content of the field.
    internal let value: String
    
    /// The content of the field.
    internal var content: String
    
    /// The classes of the field.
    internal var classes: [String]
    
    /// Creates a check field.
    public init(name: String, value: String, content: () -> String) {
        
        self.name = name
        self.value = value
        self.content = content()
        self.classes = ["checkfield"]
    }
    
    /// Creates a check field.
    internal init(name: String, value: String, content: String, classes: [String]) {
        
        self.name = name
        self.value = value
        self.content = content
        self.classes = classes
    }
    
    public var body: Content {
        Input()
            .type(.checkbox)
            .id(name)
            .name(name)
            .value(value)
            .class(classes.joined(separator: " "))
        Label {
            content
        }
        .class("label")
        .for(name)
    }
}

extension CheckField: InputModifier {
    
    public func disabled(_ condition: Bool) -> CheckField {
        
        if condition {
            return self.mutate(inputstate: Tokens.ViewState.disabled.rawValue)
        }
        
        return self
    }
    
    public func focusColor(_ color: Tokens.FocusColor) -> CheckField {
        return self.mutate(focuscolor: color.rawValue)
    }
}

extension CheckField: ViewModifier {
    
    public func opacity(_ value: Tokens.OpacityValue) -> CheckField {
        return self.mutate(opacity: value.rawValue)
    }
    
    public func zIndex(_ index: Tokens.PositionIndex) -> CheckField {
        return self.mutate(zindex: index.rawValue)
    }
    
    public func hidden() -> CheckField {
        return self.mutate(viewstate: Tokens.ViewState.hidden.rawValue)
    }
    
    public func padding(_ length: Tokens.BoxPadding) -> CheckField {
        return self.mutate(padding: length.rawValue)
    }
    
    public func borderColor(_ color: Tokens.BorderColor) -> CheckField {
        return self.mutate(bordercolor: color.rawValue)
    }
    
    public func borderShape(_ shape: Tokens.BorderShape) -> CheckField {
        return self.mutate(bordershape: shape.rawValue)
    }
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> CheckField {
        return self.mutate(backgroundcolor: color.rawValue)
    }
    
    public func colorScheme(_ scheme: Tokens.ColorScheme) -> CheckField {
        return self.mutate(scheme: scheme.rawValue)
    }
    
    public func frame(width: Tokens.ColumnSize, offset: Tokens.ColumnOffset? = nil) -> CheckField {
        
        if let offset {
            return self.mutate(frame: [width.rawValue, offset.rawValue])
        }
        
        return self.mutate(class: width.rawValue)
    }
}

/// A component that displays
public struct RadioSelect: View, Modifiable {
    
    /// The identifier of the select.
    internal let name: String
    
    /// The content of the select.
    internal let value: String
    
    /// The content of the select.
    internal var content: String
    
    /// The classes of the select.
    internal var classes: [String]
    
    /// Creates a radio select.
    public init(name: String, value: String, content: () -> String) {
        
        self.name = name
        self.value = value
        self.content = content()
        self.classes = ["radioselect"]
    }
    
    /// Creates a radio select.
    internal init(name: String, value: String, content: String, classes: [String]) {
        
        self.name = name
        self.value = value
        self.content = content
        self.classes = classes
    }
    
    public var body: Content {
        Input()
            .type(.radio)
            .id(name)
            .name(name)
            .value(value)
            .class(classes.joined(separator: " "))
        Label {
            content
        }
        .class("label")
        .for(name)
    }
}

extension RadioSelect: InputModifier {
    
    public func disabled(_ condition: Bool) -> RadioSelect {
        
        if condition {
            return self.mutate(inputstate: Tokens.ViewState.disabled.rawValue)
        }
        
        return self
    }
    
    public func focusColor(_ color: Tokens.FocusColor) -> RadioSelect {
        return self.mutate(focuscolor: color.rawValue)
    }
}

extension RadioSelect: ViewModifier {
    
    public func opacity(_ value: Tokens.OpacityValue) -> RadioSelect {
        return self.mutate(opacity: value.rawValue)
    }
    
    public func zIndex(_ index: Tokens.PositionIndex) -> RadioSelect {
        return self.mutate(zindex: index.rawValue)
    }
    
    public func hidden() -> RadioSelect {
        return self.mutate(viewstate: Tokens.ViewState.hidden.rawValue)
    }
    
    public func padding(_ length: Tokens.BoxPadding) -> RadioSelect {
        return self.mutate(padding: length.rawValue)
    }
    
    public func borderColor(_ color: Tokens.BorderColor) -> RadioSelect {
        return self.mutate(bordercolor: color.rawValue)
    }
    
    public func borderShape(_ shape: Tokens.BorderShape) -> RadioSelect {
        return self.mutate(bordershape: shape.rawValue)
    }
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> RadioSelect {
        return self.mutate(backgroundcolor: color.rawValue)
    }
    
    public func colorScheme(_ scheme: Tokens.ColorScheme) -> RadioSelect {
        return self.mutate(scheme: scheme.rawValue)
    }
    
    public func frame(width: Tokens.ColumnSize, offset: Tokens.ColumnOffset? = nil) -> RadioSelect {
        
        if let offset {
            return self.mutate(frame: [width.rawValue, offset.rawValue])
        }
        
        return self.mutate(class: width.rawValue)
    }
}

/// A component that displays
public struct SelectField: View, Modifiable {
    
    /// The identifier of the field.
    internal let name: String
    
    /// The content of the field.
    internal var content: [InputElement]
    
    /// The classes of the field.
    internal var classes: [String]
    
    /// The events of the field.
    internal var events: [String]?
    
    /// Creates a select field.
    public init(name: String, @ContentBuilder<InputElement> content: () -> [InputElement]) {
        
        self.name = name
        self.content = content()
        self.classes = ["selectfield"]
    }
    
    /// Creates a select field.
    internal init(name: String, content: [InputElement], classes: [String], events: [String]?) {
        
        self.name = name
        self.content = content
        self.classes = classes
        self.events = events
    }
    
    public var body: Content {
        Division {
            Input()
                .type(.text)
                .id(name)
                .name(name)
                .class("selectfield-textfield")
            Division {
                content
            }
            .class("selectfield-optionlist")
        }
        .class(classes.joined(separator: " "))
    }
}

extension SelectField: InputModifier {
    
    public func disabled(_ condition: Bool) -> SelectField {
        
        if condition {
            return self.mutate(inputstate: Tokens.ViewState.disabled.rawValue)
        }
        
        return self
    }

    public func focusColor(_ color: Tokens.FocusColor) -> SelectField {
        return self.mutate(focuscolor: color.rawValue)
    }
}

extension SelectField: ViewModifier {
    
    public func opacity(_ value: Tokens.OpacityValue) -> SelectField {
        return self.mutate(opacity: value.rawValue)
    }
    
    public func zIndex(_ index: Tokens.PositionIndex) -> SelectField {
        return self.mutate(zindex: index.rawValue)
    }
    
    public func hidden() -> SelectField {
        return self.mutate(viewstate: Tokens.ViewState.hidden.rawValue)
    }
    
    public func padding(_ length: Tokens.BoxPadding) -> SelectField {
        return self.mutate(padding: length.rawValue)
    }
    
    public func borderColor(_ color: Tokens.BorderColor) -> SelectField {
        return self.mutate(bordercolor: color.rawValue)
    }
    
    public func borderShape(_ shape: Tokens.BorderShape) -> SelectField {
        return self.mutate(bordershape: shape.rawValue)
    }
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> SelectField {
        return self.mutate(backgroundcolor: color.rawValue)
    }
    
    public func colorScheme(_ scheme: Tokens.ColorScheme) -> SelectField {
        return self.mutate(scheme: scheme.rawValue)
    }
    
    public func frame(width: Tokens.ColumnSize, offset: Tokens.ColumnOffset? = nil) -> SelectField {
        
        if let offset {
            return self.mutate(frame: [width.rawValue, offset.rawValue])
        }
        
        return self.mutate(class: width.rawValue)
    }
}

/// A component that displays
public struct Option: View, Modifiable {
    
    /// The identifier of the field.
    internal let value: String
    
    internal let content: String
    
    /// The classes of the field.
    internal var classes: [String]
    
    /// Creates a select field.
    public init(value: String, content: () -> String) {
        
        self.value = value
        self.content = content()
        self.classes = ["option"]
    }
    
    /// Creates a select field.
    internal init(value: String, content: String, classes: [String]) {
        
        self.value = value
        self.content = content
        self.classes = classes
    }
    
    public var body: Content {
        ListItem {
            content
        }
        .class(classes.joined(separator: " "))
    }
}

/// A component that displays
public struct SecureField: View, Modifiable {
    
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
    
    /// Creates a password field.
    internal init(name: String, prompt: String?, value: String?, classes: [String], events: [String]?) {
        
        self.name = name
        self.prompt = prompt
        self.value = value
        self.classes = classes
        self.events = events
    }
    
    public var body: Content {
        Input()
            .type(.password)
            .id(name)
            .name(name)
            .class(classes.joined(separator: " "))
            .modify(unwrap: value) {
                $0.value($1)
            }
            .modify(unwrap: prompt) {
                $0.placeholder($1)
            }
    }
}

extension SecureField: InputModifier {
    
    public func disabled(_ condition: Bool) -> SecureField {
        
        if condition {
            return self.mutate(inputstate: Tokens.ViewState.disabled.rawValue)
        }
        
        return self
    }
    
    public func focusColor(_ color: Tokens.FocusColor) -> SecureField {
        return self.mutate(focuscolor: color.rawValue)
    }
}

extension SecureField: ViewModifier {
    
    public func opacity(_ value: Tokens.OpacityValue) -> SecureField {
        return self.mutate(opacity: value.rawValue)
    }
    
    public func zIndex(_ index: Tokens.PositionIndex) -> SecureField {
        return self.mutate(zindex: index.rawValue)
    }
    
    public func hidden() -> SecureField {
        return self.mutate(viewstate: Tokens.ViewState.hidden.rawValue)
    }
    
    public func padding(_ length: Tokens.BoxPadding) -> SecureField {
        return self.mutate(padding: length.rawValue)
    }
    
    public func borderColor(_ color: Tokens.BorderColor) -> SecureField {
        return self.mutate(bordercolor: color.rawValue)
    }
    
    public func borderShape(_ shape: Tokens.BorderShape) -> SecureField {
        return self.mutate(bordershape: shape.rawValue)
    }
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> SecureField {
        return self.mutate(backgroundcolor: color.rawValue)
    }
    
    public func colorScheme(_ scheme: Tokens.ColorScheme) -> SecureField {
        return self.mutate(scheme: scheme.rawValue)
    }
    
    public func frame(width: Tokens.ColumnSize, offset: Tokens.ColumnOffset? = nil) -> SecureField {
        
        if let offset {
            return self.mutate(frame: [width.rawValue, offset.rawValue])
        }
        
        return self.mutate(class: width.rawValue)
    }
}

/// A component that displays
public struct Slider: View, Modifiable {
    
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
    
    /// Creates a slider.
    internal init(name: String, classes: [String], events: [String]?) {
        
        self.name = name
        self.classes = classes
        self.events = events
    }
    
    public var body: Content {
        Input()
            .type(.range)
            .id(name)
            .name(name)
            .class(classes.joined(separator: " "))
    }
}

extension Slider: InputModifier {
    
    public func disabled(_ condition: Bool) -> Slider {
        
        if condition {
            return self.mutate(inputstate: Tokens.ViewState.disabled.rawValue)
        }
        
        return self
    }
    
    public func focusColor(_ color: Tokens.FocusColor) -> Slider {
        return self.mutate(focuscolor: color.rawValue)
    }
}

extension Slider: ViewModifier {
    
    public func opacity(_ value: Tokens.OpacityValue) -> Slider {
        return self.mutate(opacity: value.rawValue)
    }
    
    public func zIndex(_ index: Tokens.PositionIndex) -> Slider {
        return self.mutate(zindex: index.rawValue)
    }
    
    public func hidden() -> Slider {
        return self.mutate(viewstate: Tokens.ViewState.hidden.rawValue)
    }
    
    public func padding(_ length: Tokens.BoxPadding) -> Slider {
        return self.mutate(padding: length.rawValue)
    }
    
    public func borderColor(_ color: Tokens.BorderColor) -> Slider {
        return self.mutate(bordercolor: color.rawValue)
    }
    
    public func borderShape(_ shape: Tokens.BorderShape) -> Slider {
        return self.mutate(bordershape: shape.rawValue)
    }
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> Slider {
        return self.mutate(backgroundcolor: color.rawValue)
    }
    
    public func colorScheme(_ scheme: Tokens.ColorScheme) -> Slider {
        return self.mutate(scheme: scheme.rawValue)
    }
    
    public func frame(width: Tokens.ColumnSize, offset: Tokens.ColumnOffset? = nil) -> Slider {
        
        if let offset {
            return self.mutate(frame: [width.rawValue, offset.rawValue])
        }
        
        return self.mutate(class: width.rawValue)
    }
}

/// A component that displays
public struct DatePicker: View, Modifiable {
    
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
    
    /// Creates a date picker.
    internal init(name: String, value: String?, classes: [String], events: [String]?) {
        
        self.name = name
        self.value = value
        self.classes = classes
        self.events = events
    }
    
    public var body: Content {
        Division {
            Input()
                .type(.text)
                .class("datepicker-datefield")
                .id(name)
                .name(name)
                .modify(unwrap: value) {
                    $0.value($1)
                }
            self.calendar
        }
        .class(classes.joined(separator: " "))
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
            return self.mutate(inputstate: Tokens.ViewState.disabled.rawValue)
        }
        
        return self
    }
    
    public func focusColor(_ color: Tokens.FocusColor) -> DatePicker {
        return self.mutate(focuscolor: color.rawValue)
    }
}

extension DatePicker: ViewModifier {
    
    public func opacity(_ value: Tokens.OpacityValue) -> DatePicker {
        return self.mutate(opacity: value.rawValue)
    }
    
    public func zIndex(_ index: Tokens.PositionIndex) -> DatePicker {
        return self.mutate(zindex: index.rawValue)
    }
    
    public func hidden() -> DatePicker {
        return self.mutate(viewstate: Tokens.ViewState.hidden.rawValue)
    }
    
    public func padding(_ length: Tokens.BoxPadding) -> DatePicker {
        return self.mutate(padding: length.rawValue)
    }
    
    public func borderColor(_ color: Tokens.BorderColor) -> DatePicker {
        return self.mutate(bordercolor: color.rawValue)
    }
    
    public func borderShape(_ shape: Tokens.BorderShape) -> DatePicker {
        return self.mutate(bordershape: shape.rawValue)
    }
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> DatePicker {
        return self.mutate(backgroundcolor: color.rawValue)
    }
    
    public func colorScheme(_ scheme: Tokens.ColorScheme) -> DatePicker {
        return self.mutate(scheme: scheme.rawValue)
    }
    
    public func frame(width: Tokens.ColumnSize, offset: Tokens.ColumnOffset? = nil) -> DatePicker {
        
        if let offset {
            return self.mutate(frame: [width.rawValue, offset.rawValue])
        }
        
        return self.mutate(class: width.rawValue)
    }
}

/// A component that displays
public struct SearchField: View, Modifiable {
    
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
    
    /// Creates a search field.
    internal init(name: String, prompt: String?, value: String?, classes: [String], events: [String]?) {
        
        self.name = name
        self.prompt = prompt
        self.value = value
        self.classes = classes
        self.events = events
    }
    
    public var body: Content {
        Input()
            .type(.search)
            .id(name)
            .name(name)
            .class(classes.joined(separator: " "))
            .modify(unwrap: value) {
                $0.value($1)
            }
            .modify(unwrap: prompt) {
                $0.placeholder($1)
            }
    }
}

extension SearchField: InputModifier {
    
    public func disabled(_ condition: Bool) -> SearchField {
        
        if condition {
            return self.mutate(inputstate: Tokens.ViewState.disabled.rawValue)
        }
        
        return self
    }
    
    public func focusColor(_ color: Tokens.FocusColor) -> SearchField {
        return self.mutate(focuscolor: color.rawValue)
    }
}

extension SearchField: ViewModifier {
    
    public func opacity(_ value: Tokens.OpacityValue) -> SearchField {
        return self.mutate(opacity: value.rawValue)
    }
    
    public func zIndex(_ index: Tokens.PositionIndex) -> SearchField {
        return self.mutate(zindex: index.rawValue)
    }
    
    public func hidden() -> SearchField {
        return self.mutate(viewstate: Tokens.ViewState.hidden.rawValue)
    }
    
    public func padding(_ length: Tokens.BoxPadding) -> SearchField {
        return self.mutate(padding: length.rawValue)
    }
    
    public func borderColor(_ color: Tokens.BorderColor) -> SearchField {
        return self.mutate(bordercolor: color.rawValue)
    }
    
    public func borderShape(_ shape: Tokens.BorderShape) -> SearchField {
        return self.mutate(bordershape: shape.rawValue)
    }
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> SearchField {
        return self.mutate(backgroundcolor: color.rawValue)
    }
    
    public func colorScheme(_ scheme: Tokens.ColorScheme) -> SearchField {
        return self.mutate(scheme: scheme.rawValue)
    }
    
    public func frame(width: Tokens.ColumnSize, offset: Tokens.ColumnOffset? = nil) -> SearchField {
        
        if let offset {
            return self.mutate(frame: [width.rawValue, offset.rawValue])
        }
        
        return self.mutate(class: width.rawValue)
    }
}

/// A component that displays the progress of a task.
public struct Progress: View {
    
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
    
    /// Creates a progress bar.
    internal init(maximum: Float, value: String, content: [Content], classes: [String], events: [String]?) {
        
        self.maximum = maximum
        self.value = value
        self.content = content
        self.classes = classes
        self.events = events
    }
    
    public var body: Content {
        HTMLKit.Progress {
            content
        }
        .value(value)
        .maximum(maximum)
        .class(classes.joined(separator: " "))
    }
}

/// A component to edit and format text content.
public struct TextPad: View, Modifiable {
    
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
    
    /// Creates a textpad.
    internal init(name: String, prompt: String?, rows: Int, content: [String], classes: [String]) {
        
        self.name = name
        self.prompt = prompt
        self.rows = rows
        self.content = content
        self.classes = classes
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
                    Symbol(system: "text.alignleft")
                }
                .class("toolbar-tool")
                ListItem {
                    Symbol(system: "text.aligncenter")
                }
                .class("toolbar-tool")
                ListItem {
                    Symbol(system: "text.alignright")
                }
                .class("toolbar-tool")
                ListItem {
                    Symbol(system: "text.alignjustify")
                }
                .class("toolbar-tool")
            }
            .class("textpad-toolbar")
            TextArea {
                content
            }
            .id(name)
            .name(name)
            .rows(rows)
            .class("textpad-content")
        }
        .class(classes.joined(separator: " "))
    }
    
    /// Sets the limit of the maximum lines.
    public func lineLimit(_ value: Int) -> TextPad {

        var newSelf = self
        newSelf.rows = value
        
        return newSelf
    }
}

extension TextPad: InputModifier {
    
    public func disabled(_ condition: Bool) -> TextPad {
        
        if condition {
            return self.mutate(inputstate: Tokens.ViewState.disabled.rawValue)
        }
        
        return self
    }
    
    public func focusColor(_ color: Tokens.FocusColor) -> TextPad {
        return self.mutate(focuscolor: color.rawValue)
    }
}

extension TextPad: ViewModifier {
    
    public func opacity(_ value: Tokens.OpacityValue) -> TextPad {
        return self.mutate(opacity: value.rawValue)
    }
    
    public func zIndex(_ index: Tokens.PositionIndex) -> TextPad {
        return self.mutate(zindex: index.rawValue)
    }
    
    public func hidden() -> TextPad {
        return self.mutate(viewstate: Tokens.ViewState.hidden.rawValue)
    }
    
    public func padding(_ length: Tokens.BoxPadding) -> TextPad {
        return self.mutate(padding: length.rawValue)
    }
    
    public func borderColor(_ color: Tokens.BorderColor) -> TextPad {
        return self.mutate(bordercolor: color.rawValue)
    }
    
    public func borderShape(_ shape: Tokens.BorderShape) -> TextPad {
        return self.mutate(bordershape: shape.rawValue)
    }
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> TextPad {
        return self.mutate(backgroundcolor: color.rawValue)
    }
    
    public func colorScheme(_ scheme: Tokens.ColorScheme) -> TextPad {
        return self.mutate(scheme: scheme.rawValue)
    }
    
    public func frame(width: Tokens.ColumnSize, offset: Tokens.ColumnOffset? = nil) -> TextPad {
        
        if let offset {
            return self.mutate(frame: [width.rawValue, offset.rawValue])
        }
        
        return self.mutate(class: width.rawValue)
    }
}
