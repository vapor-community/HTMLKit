/*
 Abstract:
 The file contains the form elements. The html-element 'form' only allows these elements to be its descendants.
 
 Note:
 If you about to add something to the file, stick to the official documentation to keep the code consistent.
 */

import OrderedCollections

/// The element represents a typed data field to allow the user to edit the data.
///
/// ```html
/// <input>
/// ```
public struct Input: EmptyElement {

    internal var name: String { "input" }

    internal var attributes: OrderedDictionary<String, Any>?

    public init() {}
    
    internal init(attributes: OrderedDictionary<String, Any>?) {
        self.attributes = attributes
    }
}

extension Input: AcceptAttribute, AlternateAttribute, AutocompleteAttribute, CheckedAttribute, DisabledAttribute, FormAttribute, FormActionAttribute, HeightAttribute, ListAttribute, MaximumValueAttribute, MaximumLengthAttribute, MinimumValueAttribute, MinimumLengthAttribute, MultipleAttribute, NameAttribute, PatternAttribute, PlaceholderAttribute, ReadyOnlyAttribute, RequiredAttribute, SizeAttribute, SourceAttribute, StepAttribute, TypeAttribute, ValueAttribute, WidthAttribute {
    
    public func accept(_ value: String) -> Input {
        return mutate(accept: value)
    }
    
    public func accept(_ value: Property<String>) -> Input {
        return mutate(accept: value)
    }
    
    public func alternate(_ value: String) -> Input {
        return mutate(alternate: value)
    }
    
    public func alternate(_ value: Property<String>) -> Input {
        return mutate(alternate: value)
    }
    
    public func hasCompletion(_ value: Bool) -> Input {
        return mutate(autocomplete: value)
    }
    
    public func hasCompletion(_ value: Property<Bool>) -> Input {
        return mutate(autocomplete: value)
    }
    
    public func checked() -> Input {
        return mutate(checked: "checked")
    }
    
    public func disabled() -> Input {
        return mutate(disabled: "disabled")
    }
    
    public func form(_ value: String) -> Input {
        return mutate(form: value)
    }
    
    public func form(_ value: Property<String>) -> Input {
        return mutate(form: value)
    }
    
    public func formAction(_ value: String) -> Input {
        return mutate(formaction: value)
    }
    
    public func formAction(_ value: Property<String>) -> Input {
        return mutate(formaction: value)
    }
    
    public func height(_ size: Int) -> Input {
        return mutate(height: size)
    }
    
    public func height(_ size: Property<Int>) -> Input {
        return mutate(height: size)
    }
    
    public func list(_ value: String) -> Input {
        return mutate(list: value)
    }
    
    public func list(_ value: Property<String>) -> Input {
        return mutate(list: value)
    }
    
    public func maximum(_ value: String) -> Input {
        return mutate(max: value)
    }
    
    public func maximum(length value: Int) -> Input {
        return mutate(maxlength: value)
    }
    
    public func maximum(length value: Property<Int>) -> Input {
        return mutate(maxlength: value)
    }
    
    public func minimum(_ value: String) -> Input {
        return mutate(min: value)
    }
    
    public func minimum(length value: Int) -> Input {
        return mutate(minlength: value)
    }
    
    public func minimum(length value: Property<Int>) -> Input {
        return mutate(minlength: value)
    }
    
    public func multiple() -> Input {
        return mutate(multiple: "multiple")
    }
    
    public func name(_ value: String) -> Input {
        return mutate(name: value)
    }
    
    public func name(_ value: Property<String>) -> Input {
        return mutate(name: value)
    }
    
    public func pattern(_ regex: String) -> Input {
        return mutate(pattern: regex)
    }
    
    public func pattern(_ regex: Property<String>) -> Input {
        return mutate(pattern: regex)
    }
    
    public func placeholder(_ value: String) -> Input {
        return mutate(placeholder: value)
    }
    
    public func placeholder(_ value: Property<String>) -> Input {
        return mutate(placeholder: value)
    }
    
    public func readonly() -> Input {
        return mutate(readonly: "readonly")
    }
    
    public func required() -> Input {
        return mutate(required: "required")
    }
    
    public func size(_ size: Int) -> Input {
        return mutate(size: size)
    }
    
    public func size(_ size: Property<Int>) -> Input {
        return mutate(size: size)
    }
    
    public func source(_ value: String) -> Input {
        return mutate(source: value)
    }
    
    public func source(_ value: Property<String>) -> Input {
        return mutate(source: value)
    }
    
    public func step(_ size: Int) -> Input {
        return mutate(step: size)
    }
    
    public func step(_ size: Property<Int>) -> Input {
        return mutate(step: size)
    }
    
    public func type(_ value: Values.Input) -> Input {
        return mutate(type: value.rawValue)
    }
    
    public func value(_ value: String) -> Input {
        return mutate(value: value)
    }
    
    public func value(_ value: Property<String>) -> Input {
        return mutate(value: value)
    }
    
    public func width(_ size: Int) -> Input {
        return mutate(width: size)
    }
    
    public func width(_ size: Property<Int>) -> Input {
        return mutate(width: size)
    }
}

/// The element represents a caption for a form control.
///
/// ```html
/// <label></label>
/// ```
public struct Label: ContentElement {

    internal var name: String { "label" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [Content]

    public init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [Content]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Label: ForAttribute {
    
    public func `for`(_ value: String) -> Label {
        return mutate(for: value)
    }
    
    public func `for`(_ value: Property<String>) -> Label {
        return mutate(for: value)
    }
}

extension Label: Localizable {
    
    public init(_ localizedKey: String) {
        self.content = [LocalizedStringKey(key: localizedKey)]
    }
    
    public init<T: Encodable>(_ localizedKey: String, with context: Property<T>) {
        self.content = [LocalizedStringKey(key: localizedKey, context: context)]
    }
}

/// The element represents a control for selecting amongst a set of options.
///
/// ```html
/// <select></select>
/// ```
public struct Select: ContentElement {

    internal var name: String { "select" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [Content]

    public init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [Content]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Select: AutocompleteAttribute, DisabledAttribute, FormAttribute, MultipleAttribute, NameAttribute, RequiredAttribute, SizeAttribute {
    
    public func hasCompletion(_ value: Bool) -> Select {
        return mutate(autocomplete: value)
    }
    
    public func hasCompletion(_ value: Property<Bool>) -> Select {
        return mutate(autocomplete: value)
    }
    
    public func disabled() -> Select {
        return mutate(disabled: "disabled")
    }
    
    public func form(_ value: String) -> Select {
        return mutate(form: value)
    }
    
    public func form(_ value: Property<String>) -> Select {
        return mutate(form: value)
    }
    
    public func multiple() -> Select {
        return mutate(multiple: "multiple")
    }
    
    public func name(_ value: String) -> Select {
        return mutate(name: value)
    }
    
    public func name(_ value: Property<String>) -> Select {
        return mutate(name: value)
    }
    
    public func required() -> Select {
        return mutate(required: "required")
    }
    
    public func size(_ size: Int) -> Select {
        return mutate(size: size)
    }
    
    public func size(_ size: Property<Int>) -> Select {
        return mutate(size: size)
    }
}

/// The element represents a multiline plain text edit control.
///
/// ```html
/// <textarea></textarea>
/// ```
public struct TextArea: ContentElement {
        
    internal var name: String { "textarea" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [String]

    public init(@ContentBuilder<String> content: () -> [String]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [String]) {
        self.attributes = attributes
        self.content = content
    }
}

extension TextArea: AutocompleteAttribute, ColumnsAttribute, DisabledAttribute, FormAttribute, MaximumLengthAttribute, MinimumLengthAttribute, NameAttribute, PlaceholderAttribute, ReadyOnlyAttribute, RequiredAttribute, RowsAttribute, WrapAttribute {

    public func hasCompletion(_ value: Bool) -> TextArea {
        return mutate(autocomplete: value)
    }
    
    public func hasCompletion(_ value: Property<Bool>) -> TextArea {
        return mutate(autocomplete: value)
    }
    
    public func columns(_ size: Int) -> TextArea {
        return mutate(cols: size)
    }
    
    public func columns(_ size: Property<Int>) -> TextArea {
        return mutate(cols: size)
    }
    
    public func disabled() -> TextArea {
        return mutate(disabled: "disabled")
    }
    
    public func form(_ value: String) -> TextArea {
        return mutate(form: value)
    }
    
    public func form(_ value: Property<String>) -> TextArea {
        return mutate(form: value)
    }
    
    public func maximum(length value: Int) -> TextArea {
        return mutate(maxlength: value)
    }
    
    public func maximum(length value: Property<Int>) -> TextArea {
        return mutate(maxlength: value)
    }
    
    public func minimum(length value: Int) -> TextArea {
        return mutate(minlength: value)
    }
    
    public func minimum(length value: Property<Int>) -> TextArea {
        return mutate(minlength: value)
    }
    
    public func name(_ value: String) -> TextArea {
        return mutate(name: value)
    }
    
    public func name(_ value: Property<String>) -> TextArea {
        return mutate(name: value)
    }
    
    public func placeholder(_ value: String) -> TextArea {
        return mutate(placeholder: value)
    }
    
    public func placeholder(_ value: Property<String>) -> TextArea {
        return mutate(placeholder: value)
    }
    
    public func readonly() -> TextArea {
        return mutate(readonly: "readonly")
    }
    
    public func required() -> TextArea {
        return mutate(required: "required")
    }
    
    public func rows(_ size: Int) -> TextArea {
        return mutate(rows: size)
    }
    
    public func rows(_ size: Property<Int>) -> TextArea {
        return mutate(rows: size)
    }
    
    public func wrap(_ value: Values.Wrapping) -> TextArea {
        return mutate(wrap: value.rawValue)
    }
}

/// The element represents a comment output.
///
/// ```html
/// <button></button>
/// ```
public struct Button: ContentElement {

    internal var name: String { "button" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [Content]

    public init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [Content]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Button: DisabledAttribute, FormAttribute, FormActionAttribute, NameAttribute, TypeAttribute, ValueAttribute {

    public func disabled() -> Button {
        return mutate(disabled: "disabled")
    }
    
    public func form(_ value: String) -> Button {
        return mutate(form: value)
    }
    
    public func form(_ value: Property<String>) -> Button {
        return mutate(form: value)
    }
    
    public func formAction(_ value: String) -> Button {
        return mutate(formaction: value)
    }
    
    public func formAction(_ value: Property<String>) -> Button {
        return mutate(formaction: value)
    }
    
    public func name(_ value: String) -> Button {
        return mutate(name: value)
    }
    
    public func name(_ value: Property<String>) -> Button {
        return mutate(name: value)
    }
    
    public func type(_ value: Values.Button) -> Button {
        return mutate(type: value.rawValue)
    }
    
    public func value(_ value: String) -> Button {
        return mutate(value: value)
    }
    
    public func value(_ value: Property<String>) -> Button {
        return mutate(value: value)
    }
}

extension Button: Localizable {
    
    public init(_ localizedKey: String) {
        self.content = [LocalizedStringKey(key: localizedKey)]
    }
    
    public init<T: Encodable>(_ localizedKey: String, with context: Property<T>) {
        self.content = [LocalizedStringKey(key: localizedKey, context: context)]
    }
}

/// The element represents a set of form controls grouped together.
///
/// ```html
/// <fieldset></fieldset>
/// ```
public struct Fieldset: ContentElement {
    
    internal var name: String { "fieldset" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [Content]

    public init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [Content]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Fieldset: DisabledAttribute, FormAttribute, NameAttribute {

    public func disabled() -> Fieldset {
        return mutate(disabled: "disabled")
    }
    
    public func form(_ value: String) -> Fieldset {
        return mutate(form: value)
    }
    
    public func form(_ value: Property<String>) -> Fieldset {
        return mutate(form: value)
    }
    
    public func name(_ value: String) -> Fieldset {
        return mutate(name: value)
    }
    
    public func name(_ value: Property<String>) -> Fieldset {
        return mutate(name: value)
    }
}
