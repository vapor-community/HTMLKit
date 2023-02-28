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
        self.classes = ["input", "type:textfield"]
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
    
    public func borderShape(_ shape: Tokens.BorderShape) -> TextField {
        return self.mutate(bordershape: shape.rawValue)
    }
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> TextField {
        return self.mutate(backgroundcolor: color.rawValue)
    }
    
    public func disabled(_ condition: Bool) -> TextField {
        
        if condition {
            return self.mutate(state: Tokens.ViewState.disabled.rawValue)
        }
        
        return self
    }
}

/// A component that displays a editable and expandable form control.
public struct TextEditor: View, Modifiable {
    
    /// The identifier of the editor.
    internal let name: String
    
    /// The placeholder for the field value.
    internal let prompt: String?
    
    /// The number of lines.
    internal var rows: Int = 1
    
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
        self.classes = ["input", "type:texteditor"]
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
    
    public func borderShape(_ shape: Tokens.BorderShape) -> TextEditor {
        return self.mutate(bordershape: shape.rawValue)
    }
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> TextEditor {
        return self.mutate(backgroundcolor: color.rawValue)
    }
    
    public func disabled(_ condition: Bool) -> TextEditor {
        
        if condition {
            return self.mutate(state: Tokens.ViewState.disabled.rawValue)
        }
        
        return self
    }
}

/// A component that displays a form control
public struct CheckField: View, Modifiable {
    
    /// The identifier of the field.
    internal let name: String
    
    /// The content of the field.
    internal let value: String
    
    /// The classes of the field.
    internal var classes: [String]
    
    /// Creates a check field.
    public init(name: String, value: String) {
        
        self.name = name
        self.value = value
        self.classes = ["input", "type:checkfield"]
    }
    
    /// Creates a check field.
    internal init(name: String, value: String, classes: [String]) {
        
        self.name = name
        self.value = value
        self.classes = classes
    }
    
    public var body: Content {
        Input()
            .type(.checkbox)
            .id(name)
            .name(name)
            .value(value)
            .class(classes.joined(separator: " "))
    }
}

extension CheckField: InputModifier {
    
    public func borderShape(_ shape: Tokens.BorderShape) -> CheckField {
        return self.mutate(bordershape: shape.rawValue)
    }
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> CheckField {
        return self.mutate(backgroundcolor: color.rawValue)
    }
    
    public func disabled(_ condition: Bool) -> CheckField {
        
        if condition {
            return self.mutate(state: Tokens.ViewState.disabled.rawValue)
        }
        
        return self
    }
}

/// A component that displays
public struct RadioSelect: View, Modifiable {
    
    /// The identifier of the select.
    internal let name: String
    
    /// The content of the select.
    internal let value: String
    
    /// The classes of the select.
    internal var classes: [String]
    
    /// Creates a radio select.
    public init(name: String, value: String) {
        
        self.name = name
        self.value = value
        self.classes = ["input", "type:radioselect"]
    }
    
    /// Creates a radio select.
    internal init(name: String, value: String, classes: [String]) {
        
        self.name = name
        self.value = value
        self.classes = classes
    }
    
    public var body: Content {
        Input()
            .type(.radio)
            .id(name)
            .name(name)
            .value(value)
            .class(classes.joined(separator: " "))
    }
}

extension RadioSelect: InputModifier {
    
    public func borderShape(_ shape: Tokens.BorderShape) -> RadioSelect {
        return self.mutate(bordershape: shape.rawValue)
    }
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> RadioSelect {
        return self.mutate(backgroundcolor: color.rawValue)
    }
    
    public func disabled(_ condition: Bool) -> RadioSelect {
        
        if condition {
            return self.mutate(state: Tokens.ViewState.disabled.rawValue)
        }
        
        return self
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
        self.classes = ["input", "type:selectfield"]
    }
    
    /// Creates a select field.
    internal init(name: String, content: [InputElement], classes: [String], events: [String]?) {
        
        self.name = name
        self.content = content
        self.classes = classes
        self.events = events
    }
    
    public var body: Content {
        Select {
            content
        }
        .id(name)
        .name(name)
        .class(classes.joined(separator: " "))
    }
}

extension SelectField: InputModifier {
    
    public func borderShape(_ shape: Tokens.BorderShape) -> SelectField {
        return self.mutate(bordershape: shape.rawValue)
    }
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> SelectField {
        return self.mutate(backgroundcolor: color.rawValue)
    }
    
    public func disabled(_ condition: Bool) -> SelectField {
        
        if condition {
            return self.mutate(state: Tokens.ViewState.disabled.rawValue)
        }
        
        return self
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
        self.classes = ["input", "type:securefield"]
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
    
    public func borderShape(_ shape: Tokens.BorderShape) -> SecureField {
        return self.mutate(bordershape: shape.rawValue)
    }
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> SecureField {
        return self.mutate(backgroundcolor: color.rawValue)
    }
    
    public func disabled(_ condition: Bool) -> SecureField {
        
        if condition {
            return self.mutate(state: Tokens.ViewState.disabled.rawValue)
        }
        
        return self
    }
}

/// A component that displays
public struct Slider: View {
    
    /// The identifier of the slider.
    internal let name: String
    
    /// The classes of the slider.
    internal var classes: [String]
    
    /// The events of the slider.
    internal var events: [String]?
    
    /// Creates a slider.
    public init(name: String) {
        
        self.name = name
        self.classes = ["input", "type:slider"]
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
        self.classes = ["input", "type:datepicker"]
    }
    
    /// Creates a date picker.
    internal init(name: String, value: String?, classes: [String], events: [String]?) {
        
        self.name = name
        self.value = value
        self.classes = classes
        self.events = events
    }
    
    public var body: Content {
        Input()
            .type(.date)
            .id(name)
            .name(name)
            .class(classes.joined(separator: " "))
            .modify(unwrap: value) {
                $0.value($1)
            }
    }
}

extension DatePicker: InputModifier {
    
    public func borderShape(_ shape: Tokens.BorderShape) -> DatePicker {
        return self.mutate(bordershape: shape.rawValue)
    }
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> DatePicker {
        return self.mutate(backgroundcolor: color.rawValue)
    }
    
    public func disabled(_ condition: Bool) -> DatePicker {
        
        if condition {
            return self.mutate(state: Tokens.ViewState.disabled.rawValue)
        }
        
        return self
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
        self.classes = ["input", "type:searchfield"]
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
    
    public func borderShape(_ shape: Tokens.BorderShape) -> SearchField {
        return self.mutate(bordershape: shape.rawValue)
    }
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> SearchField {
        return self.mutate(backgroundcolor: color.rawValue)
    }
    
    public func disabled(_ condition: Bool) -> SearchField {
        
        if condition {
            return self.mutate(state: Tokens.ViewState.disabled.rawValue)
        }
        
        return self
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
public struct TextPad: View {
    
    /// The identifier of the textpad.
    internal let name: String
    
    /// The content of the textpad.
    internal var content: [String]
    
    /// The classes of the textpad.
    internal var classes: [String]
    
    /// Creates a textpad
    public init(name: String, @ContentBuilder<String> content: () -> [String]) {
        
        self.name = name
        self.content = content()
        self.classes = ["textpad"]
    }
    
    /// Creates a textpad.
    internal init(name: String, content: [String], classes: [String]) {
        
        self.name = name
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
            }
            .class("textpad-toolbar")
            TextArea {
                content
            }
            .id(name)
            .name(name)
            .rows(5)
            .class("textpad-content")
        }
        .class(classes.joined(separator: " "))
    }
}
