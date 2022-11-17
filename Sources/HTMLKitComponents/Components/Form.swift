/*
 Abstract:
 The file contains everything related to form.
 */

import HTMLKit

/// A component that collects form controls.
public struct Form: Component {
    
    /// The content of the container.
    internal var content: [FormElement]
    
    /// The classes of the container.
    internal var classes: [String]
    
    /// The events of the container.
    internal var events: [String]?
    
    /// Creates a form container.
    public init(@ContentBuilder<FormElement> content: () -> [FormElement]) {
        
        self.content = content()
        self.classes = ["form"]
    }
    
    /// Creates a form container.
    internal init(content: [FormElement], classes: [String], events: [String]?) {
        
        self.content = content
        self.classes = classes
        self.events = events
    }
    
    public var body: AnyContent {
        HTMLKit.Form {
            content
        }
        .method(.post)
        .class(classes.joined(separator: " "))
    }
}

/// A component that displays the name of the form control.
public struct FieldLabel: Component {
    
    /// The identifier of the element the label is related to.
    internal let id: TemplateValue<String>
    
    /// The content of the label.
    internal var content: [AnyContent]
    
    /// The classes of the label.
    internal var classes: [String]
    
    /// The events of the label.
    internal var events: [String]?
    
    /// Creates a field label.
    public init(for id: TemplateValue<String>, @ContentBuilder<AnyContent> content: () -> [AnyContent]) {
      
        self.id = id
        self.content = content()
        self.classes = ["label"]
    }
    
    /// Creates a field label.
    internal init(for id: TemplateValue<String>, content: [AnyContent], classes: [String], events: [String]?) {
      
        self.id = id
        self.content = content
        self.classes = classes
        self.events = events
    }
    
    public var body: AnyContent {
        Label {
            content
        }
        .for(id.rawValue)
        .class(classes.joined(separator: " "))
    }
}

/// A component that displays an editable form control.
public struct TextField: Component {
    
    /// The identifier of the field.
    internal let name: TemplateValue<String>
    
    /// The content of the field.
    internal let value: TemplateValue<String?>
    
    /// The classes of the field.
    internal var classes: [String]
    
    /// The events of the field.
    internal var events: [String]?
    
    /// Creates a text field.
    public init(name: TemplateValue<String>, value: TemplateValue<String?> = .constant(nil)) {
        
        self.name = name
        self.value = value
        self.classes = ["input", "type:textfield"]
    }
    
    /// Creates a text field.
    internal init(name: TemplateValue<String>, value: TemplateValue<String?>, classes: [String], events: [String]?) {
        
        self.name = name
        self.value = value
        self.classes = classes
        self.events = events
    }
    
    public var body: AnyContent {
        Input()
            .type(.text)
            .id(name)
            .name(name)
            .class(classes.joined(separator: " "))
            .modify(unwrap: value) {
                $0.value($1)
            }
    }
    
    /// The behaviour of the text field.
    public var scripts: AnyContent {
        
        if let events = self.events {
            return [Script { events }]
        }
        
        return []
    }
}

extension TextField: InputModifier {
    
    public func borderShape(_ shape: Tokens.BorderShape) -> TextField {
        
        var newSelf = self
        newSelf.classes.append(shape.rawValue)
        
        return newSelf
    }
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> TextField {
        
        var newSelf = self
        newSelf.classes.append(color.rawValue)
        
        return newSelf
    }
}

/// A component that displays a editable and expandable form control.
public struct TextEditor: Component {
    
    /// The identifier of the editor.
    internal let name: TemplateValue<String>
    
    /// The number of lines.
    internal var rows: Int = 1
    
    /// The content of the editor.
    internal var content: [String]
    
    /// The classes of the editor.
    internal var classes: [String]
    
    /// The events of the editor.
    internal var events: [String]?
    
    /// Creates a text editor.
    public init(name: TemplateValue<String>, @ContentBuilder<String> content: () -> [String]) {
        
        self.name = name
        self.content = content()
        self.classes = ["input", "type:texteditor"]
    }
    
    /// Creates a text editor.
    internal init(name: TemplateValue<String>, rows: Int, content: [String], classes: [String], events: [String]?) {
        
        self.name = name
        self.rows = rows
        self.content = content
        self.classes = classes
        self.events = events
    }
    
    public var body: AnyContent {
        TextArea {
            content
        }
        .id(name)
        .name(name)
        .class(classes.joined(separator: " "))
        .rows(rows)
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
        
        var newSelf = self
        newSelf.classes.append(shape.rawValue)
        
        return newSelf
    }
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> TextEditor {
        
        var newSelf = self
        newSelf.classes.append(color.rawValue)
        
        return newSelf
    }
}

/// A component that displays a form control
public struct CheckField: Component {
    
    /// The identifier of the field.
    internal let name: TemplateValue<String>
    
    /// The content of the field.
    internal let value: TemplateValue<String>
    
    /// The classes of the field.
    internal var classes: [String]
    
    /// Creates a check field.
    public init(name: TemplateValue<String>, value: TemplateValue<String>) {
        
        self.name = name
        self.value = value
        self.classes = ["input", "type:checkfield"]
    }
    
    /// Creates a check field.
    internal init(name: TemplateValue<String>, value: TemplateValue<String>, classes: [String]) {
        
        self.name = name
        self.value = value
        self.classes = classes
    }
    
    public var body: AnyContent {
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
        
        var newSelf = self
        newSelf.classes.append(shape.rawValue)
        
        return newSelf
    }
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> CheckField {
        
        var newSelf = self
        newSelf.classes.append(color.rawValue)
        
        return newSelf
    }
}

/// A component that displays
public struct RadioSelect: Component {
    
    /// The identifier of the select.
    internal let name: TemplateValue<String>
    
    /// The content of the select.
    internal let value: TemplateValue<String>
    
    /// The classes of the select.
    internal var classes: [String]
    
    /// Creates a radio select.
    public init(name: TemplateValue<String>, value: TemplateValue<String>) {
        
        self.name = name
        self.value = value
        self.classes = ["input", "type:radioselect"]
    }
    
    /// Creates a radio select.
    internal init(name: TemplateValue<String>, value: TemplateValue<String>, classes: [String]) {
        
        self.name = name
        self.value = value
        self.classes = classes
    }
    
    public var body: AnyContent {
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
        
        var newSelf = self
        newSelf.classes.append(shape.rawValue)
        
        return newSelf
    }
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> RadioSelect {
        
        var newSelf = self
        newSelf.classes.append(color.rawValue)
        
        return newSelf
    }
}

/// A component that displays
public struct SelectField: Component {
    
    /// The identifier of the field.
    internal let name: TemplateValue<String>
    
    /// The content of the field.
    internal var content: [InputElement]
    
    /// The classes of the field.
    internal var classes: [String]
    
    /// The events of the field.
    internal var events: [String]?
    
    /// Creates a select field.
    public init(name: TemplateValue<String>, @ContentBuilder<InputElement> content: () -> [InputElement]) {
        
        self.name = name
        self.content = content()
        self.classes = ["input", "type:selectfield"]
    }
    
    /// Creates a select field.
    internal init(name: TemplateValue<String>, content: [InputElement], classes: [String], events: [String]?) {
        
        self.name = name
        self.content = content
        self.classes = classes
        self.events = events
    }
    
    public var body: AnyContent {
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
        
        var newSelf = self
        newSelf.classes.append(shape.rawValue)
        
        return newSelf
    }
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> SelectField {
        
        var newSelf = self
        newSelf.classes.append(color.rawValue)
        
        return newSelf
    }
}

/// A component that displays
public struct SecureField: Component {
    
    /// The identifier of the field.
    internal let name: TemplateValue<String>
    
    /// The content of the field.
    internal let value: TemplateValue<String?>
    
    /// The classes of the field.
    internal var classes: [String]
    
    /// The events of the field.
    internal var events: [String]?
    
    /// Creates a password field.
    public init(name: TemplateValue<String>, value: TemplateValue<String?> = .constant(nil)) {
        
        self.name = name
        self.value = value
        self.classes = ["input", "type:securefield"]
    }
    
    /// Creates a password field.
    internal init(name: TemplateValue<String>, value: TemplateValue<String?>, classes: [String], events: [String]?) {
        
        self.name = name
        self.value = value
        self.classes = classes
        self.events = events
    }
    
    public var body: AnyContent {
        Input()
            .type(.password)
            .id(name)
            .name(name)
            .class(classes.joined(separator: " "))
            .modify(unwrap: value) {
                $0.value($1)
            }
    }
    
    /// The behaviour of the field.
    public var scripts: AnyContent {
        
        if let events = self.events {
            return [Script { events }]
        }
        
        return []
    }
}

extension SecureField: InputModifier {
    
    public func borderShape(_ shape: Tokens.BorderShape) -> SecureField {
        
        var newSelf = self
        newSelf.classes.append(shape.rawValue)
        
        return newSelf
    }
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> SecureField {
        
        var newSelf = self
        newSelf.classes.append(color.rawValue)
        
        return newSelf
    }
}

/// A component that displays
public struct Slider: Component {
    
    /// The identifier of the slider.
    internal let name: TemplateValue<String>
    
    /// The classes of the slider.
    internal var classes: [String]
    
    /// The events of the slider.
    internal var events: [String]?
    
    /// Creates a slider.
    public init(name: TemplateValue<String>) {
        
        self.name = name
        self.classes = ["input", "type:slider"]
    }
    
    /// Creates a slider.
    internal init(name: TemplateValue<String>, classes: [String], events: [String]?) {
        
        self.name = name
        self.classes = classes
        self.events = events
    }
    
    public var body: AnyContent {
        Input()
            .type(.range)
            .id(name)
            .name(name)
            .class(classes.joined(separator: " "))
    }
    
    /// The behaviour of the slider.
    public var scripts: AnyContent {
        
        if let events = self.events {
            return [Script { events }]
        }
        
        return []
    }
}

/// A component that displays
public struct DatePicker: Component {
    
    /// The identifier of the picker.
    internal let name: TemplateValue<String>
    
    /// The content of the picker.
    internal let value: TemplateValue<String?>
    
    /// The classes of the picker.
    internal var classes: [String]
    
    /// The events of the picker.
    internal var events: [String]?
    
    /// Creates a date picker.
    public init(name: TemplateValue<String>, value: TemplateValue<String?> = .constant(nil)) {
        
        self.name = name
        self.value = value
        self.classes = ["input", "type:datepicker"]
    }
    
    /// Creates a date picker.
    internal init(name: TemplateValue<String>, value: TemplateValue<String?>, classes: [String], events: [String]?) {
        
        self.name = name
        self.value = value
        self.classes = classes
        self.events = events
    }
    
    public var body: AnyContent {
        Input()
            .type(.date)
            .id(name)
            .name(name)
            .class(classes.joined(separator: " "))
            .modify(unwrap: value) {
                $0.value($1)
            }
    }
    
    /// The behaviour of the picker.
    public var scripts: AnyContent {
        
        if let events = self.events {
            return [Script { events }]
        }
        
        return []
    }
}

extension DatePicker: InputModifier {
    
    public func borderShape(_ shape: Tokens.BorderShape) -> DatePicker {
        
        var newSelf = self
        newSelf.classes.append(shape.rawValue)
        
        return newSelf
    }
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> DatePicker {
        
        var newSelf = self
        newSelf.classes.append(color.rawValue)
        
        return newSelf
    }
}

/// A component that displays
public struct SearchField: Component {
    
    /// The identifier of the search field.
    internal let name: TemplateValue<String>
    
    /// The content of the field.
    internal let value: TemplateValue<String?>
    
    /// The classes of the field.
    internal var classes: [String]
    
    /// The events of the field.
    internal var events: [String]?
    
    /// Creates a search field.
    public init(name: TemplateValue<String>, value: TemplateValue<String?> = .constant(nil)) {
        
        self.name = name
        self.value = value
        self.classes = ["input", "type:searchfield"]
    }
    
    /// Creates a search field.
    internal init(name: TemplateValue<String>, value: TemplateValue<String?>, classes: [String], events: [String]?) {
        
        self.name = name
        self.value = value
        self.classes = classes
        self.events = events
    }
    
    public var body: AnyContent {
        Input()
            .type(.search)
            .id(name)
            .name(name)
            .class(classes.joined(separator: " "))
            .modify(unwrap: value) {
                $0.value($1)
            }
    }
    
    /// The behaviour of the field.
    public var scripts: AnyContent {
        
        if let events = self.events {
            return [Script { events }]
        }
        
        return []
    }
}

extension SearchField: InputModifier {
    
    public func borderShape(_ shape: Tokens.BorderShape) -> SearchField {
        
        var newSelf = self
        newSelf.classes.append(shape.rawValue)
        
        return newSelf
    }
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> SearchField {
        
        var newSelf = self
        newSelf.classes.append(color.rawValue)
        
        return newSelf
    }
}

/// A component that displays the progress of a task.
public struct ProgressView: Component {
    
    /// The identifier of the progress view.
    internal let name: TemplateValue<String>
    
    internal let value: TemplateValue<String?>
    
    /// The content of the view.
    internal var content: [AnyContent]
    
    /// The classes of the view.
    internal var classes: [String]
    
    /// The events of the view.
    internal var events: [String]?
    
    /// Creates a progress view.
    public init(name: TemplateValue<String>, value: TemplateValue<String?> = .constant(nil), @ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        
        self.name = name
        self.value = value
        self.content = content()
        self.classes = ["progress"]
    }
    
    /// Creates a progress bar.
    internal init(name: TemplateValue<String>, value: TemplateValue<String?>, content: [AnyContent], classes: [String], events: [String]?) {
        
        self.name = name
        self.value = value
        self.content = content
        self.classes = classes
        self.events = events
    }
    
    public var body: AnyContent {
        Progress {
            content
        }
        .class(classes.joined(separator: " "))
        .modify(unwrap: value) {
            $0.value($1)
        }
    }
    
    /// The behaviour of the view.
    public var scripts: AnyContent {
        
        if let events = self.events {
            return [Script { events }]
        }
        
        return []
    }
}
