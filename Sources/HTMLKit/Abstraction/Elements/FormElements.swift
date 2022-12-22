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
public struct Input: EmptyNode, FormElement {

    internal var name: String { "input" }

    internal var attributes: OrderedDictionary<String, Any>?

    public init() {}
    
    internal init(attributes: OrderedDictionary<String, Any>?) {
        self.attributes = attributes
    }
    
    public func modify(if condition: Bool, element: (Input) -> Input) -> Input {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (Input, T) -> Input) -> Input {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension Input: AcceptAttribute, AlternateAttribute, AutocompleteAttribute, CheckedAttribute, DisabledAttribute, FormAttribute, FormActionAttribute, HeightAttribute, ListAttribute, MaximumValueAttribute, MaximumLengthAttribute, MinimumValueAttribute, MinimumLengthAttribute, MultipleAttribute, NameAttribute, PatternAttribute, PlaceholderAttribute, ReadyOnlyAttribute, RequiredAttribute, SizeAttribute, SourceAttribute, StepAttribute, TypeAttribute, ValueAttribute, WidthAttribute {
    
    public func accept(_ value: String) -> Input {
        return mutate(accept: value)
    }
    
    public func alternate(_ value: String) -> Input {
        return mutate(alternate: value)
    }
    
    public func hasCompletion(_ value: Bool) -> Input {
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
    
    public func formAction(_ value: String) -> Input {
        return mutate(formaction: value)
    }
    
    public func height(_ size: Int) -> Input {
        return mutate(height: size)
    }
    
    public func list(_ value: String) -> Input {
        return mutate(list: value)
    }
    
    public func maximum(_ value: String) -> Input {
        return mutate(max: value)
    }
    
    public func maximum(length value: Int) -> Input {
        return mutate(maxlength: value)
    }
    
    public func minimum(_ value: String) -> Input {
        return mutate(min: value)
    }
    
    public func minimum(length value: Int) -> Input {
        return mutate(minlength: value)
    }
    
    public func multiple() -> Input {
        return mutate(multiple: "multiple")
    }
    
    public func name(_ value: String) -> Input {
        return mutate(name: value)
    }
    
    public func pattern(_ regex: String) -> Input {
        return mutate(pattern: regex)
    }
    
    public func placeholder(_ value: String) -> Input {
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
    
    public func source(_ value: String) -> Input {
        return mutate(source: value)
    }
    
    public func step(_ size: Int) -> Input {
        return mutate(step: size)
    }
    
    public func type(_ value: Values.Input) -> Input {
        return mutate(type: value.rawValue)
    }
    
    public func value(_ value: String) -> Input {
        return mutate(value: value)
    }
    
    public func width(_ size: Int) -> Input {
        return mutate(width: size)
    }
}

/// The element represents a caption for a form control.
///
/// ```html
/// <label></label>
/// ```
public struct Label: ContentNode, FormElement {

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
    
    public func modify(if condition: Bool, element: (Label) -> Label) -> Label {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (Label, T) -> Label) -> Label {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension Label: GlobalAriaAttributes, ForAttribute {
    
    public func `for`(_ value: String) -> Label {
        return mutate(for: value)
    }
    
    public func aria(atomic value: Bool) -> Label {
        return mutate(ariaatomic: value)
    }
    
    public func aria(busy value: Bool) -> Label {
        return mutate(ariabusy: value)
    }
    
    public func aria(controls value: String) -> Label {
        return mutate(ariacontrols: value)
    }
    
    public func aria(current value: Values.Accessibility.Current) -> Label {
        return mutate(ariacurrent: value.rawValue)
    }
    
    public func aria(describedBy value: String) -> Label {
        return mutate(ariadescribedby: value)
    }
    
    public func aria(details value: String) -> Label {
        return mutate(ariadetails: value)
    }
    
    public func aria(disabled value: Bool) -> Label {
        return mutate(ariadisabled: value)
    }
    
    public func aria(errorMessage value: String) -> Label {
        return mutate(ariaerrormessage: value)
    }
    
    public func aria(flowTo value: String) -> Label {
        return mutate(ariaflowto: value)
    }
    
    public func aria(hasPopup value: Values.Accessibility.Popup) -> Label {
        return mutate(ariahaspopup: value.rawValue)
    }
    
    public func aria(hidden value: Bool) -> Label {
        return mutate(ariahidden: value)
    }
    
    public func aria(invalid value: Values.Accessibility.Invalid) -> Label {
        return mutate(ariainvalid: value.rawValue)
    }
    
    public func aria(keyShortcuts value: String) -> Label {
        return mutate(ariakeyshortcuts: value)
    }
    
    public func aria(label value: String) -> Label {
        return mutate(arialabel: value)
    }
    
    public func aria(labeledBy value: String) -> Label {
        return mutate(arialabeledby: value)
    }
    
    public func aria(live value: Values.Accessibility.Live) -> Label {
        return mutate(arialive: value.rawValue)
    }
    
    public func aria(owns value: String) -> Label {
        return mutate(ariaowns: value)
    }
    
    public func aria(relevant value: Values.Accessibility.Relevant) -> Label {
        return mutate(ariarelevant: value.rawValue)
    }
    
    public func aria(roleDescription value: String) -> Label {
        return mutate(ariaroledescription: value)
    }
}

extension Label: Localizable {
    
    public init(_ localizedKey: String) {
        self.content = [LocalizedStringKey(key: localizedKey)]
    }

    public init<B>(_ localizedKey: String, with context: B) where B : Encodable {
        self.content = [LocalizedStringKey(key: localizedKey, context: context)]
    }
}

/// The element represents a control for selecting amongst a set of options.
///
/// ```html
/// <select></select>
/// ```
public struct Select: ContentNode, FormElement {

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
    
    public func modify(if condition: Bool, element: (Select) -> Select) -> Select {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (Select, T) -> Select) -> Select {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension Select: AutocompleteAttribute, DisabledAttribute, FormAttribute, MultipleAttribute, NameAttribute, RequiredAttribute, SizeAttribute {

    public func hasCompletion(_ value: Bool) -> Select {
        return mutate(autocomplete: value)
    }
    
    public func disabled() -> Select {
        return mutate(disabled: "disabled")
    }
    
    public func form(_ value: String) -> Select {
        return mutate(form: value)
    }
    
    public func multiple() -> Select {
        return mutate(multiple: "multiple")
    }
    
    public func name(_ value: String) -> Select {
        return mutate(name: value)
    }
    
    public func required() -> Select {
        return mutate(required: "required")
    }
    
    public func size(_ size: Int) -> Select {
        return mutate(size: size)
    }
}

/// The element represents a multiline plain text edit control.
///
/// ```html
/// <textarea></textarea>
/// ```
public struct TextArea: ContentNode, FormElement {
        
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
    
    public func modify(if condition: Bool, element: (TextArea) -> TextArea) -> TextArea {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (TextArea, T) -> TextArea) -> TextArea {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension TextArea: GlobalAriaAttributes, AutocompleteAttribute, ColumnsAttribute, DisabledAttribute, FormAttribute, MaximumLengthAttribute, MinimumLengthAttribute, NameAttribute, PlaceholderAttribute, ReadyOnlyAttribute, RequiredAttribute, RowsAttribute, WrapAttribute {

    public func hasCompletion(_ value: Bool) -> TextArea {
        return mutate(autocomplete: value)
    }
    
    public func columns(_ size: Int) -> TextArea {
        return mutate(cols: size)
    }
    
    public func disabled() -> TextArea {
        return mutate(disabled: "disabled")
    }
    
    public func form(_ value: String) -> TextArea {
        return mutate(form: value)
    }
    
    public func maximum(length value: Int) -> TextArea {
        return mutate(maxlength: value)
    }
    
    public func minimum(length value: Int) -> TextArea {
        return mutate(minlength: value)
    }
    
    public func name(_ value: String) -> TextArea {
        return mutate(name: value)
    }
    
    public func placeholder(_ value: String) -> TextArea {
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
    
    public func wrap(_ value: Values.Wrapping) -> TextArea {
        return mutate(wrap: value.rawValue)
    }
    
    public func aria(atomic value: Bool) -> TextArea {
        return mutate(ariaatomic: value)
    }
    
    public func aria(busy value: Bool) -> TextArea {
        return mutate(ariabusy: value)
    }
    
    public func aria(controls value: String) -> TextArea {
        return mutate(ariacontrols: value)
    }
    
    public func aria(current value: Values.Accessibility.Current) -> TextArea {
        return mutate(ariacurrent: value.rawValue)
    }
    
    public func aria(describedBy value: String) -> TextArea {
        return mutate(ariadescribedby: value)
    }
    
    public func aria(details value: String) -> TextArea {
        return mutate(ariadetails: value)
    }
    
    public func aria(disabled value: Bool) -> TextArea {
        return mutate(ariadisabled: value)
    }
    
    public func aria(errorMessage value: String) -> TextArea {
        return mutate(ariaerrormessage: value)
    }
    
    public func aria(flowTo value: String) -> TextArea {
        return mutate(ariaflowto: value)
    }
    
    public func aria(hasPopup value: Values.Accessibility.Popup) -> TextArea {
        return mutate(ariahaspopup: value.rawValue)
    }
    
    public func aria(hidden value: Bool) -> TextArea {
        return mutate(ariahidden: value)
    }
    
    public func aria(invalid value: Values.Accessibility.Invalid) -> TextArea {
        return mutate(ariainvalid: value.rawValue)
    }
    
    public func aria(keyShortcuts value: String) -> TextArea {
        return mutate(ariakeyshortcuts: value)
    }
    
    public func aria(label value: String) -> TextArea {
        return mutate(arialabel: value)
    }
    
    public func aria(labeledBy value: String) -> TextArea {
        return mutate(arialabeledby: value)
    }
    
    public func aria(live value: Values.Accessibility.Live) -> TextArea {
        return mutate(arialive: value.rawValue)
    }
    
    public func aria(owns value: String) -> TextArea {
        return mutate(ariaowns: value)
    }
    
    public func aria(relevant value: Values.Accessibility.Relevant) -> TextArea {
        return mutate(ariarelevant: value.rawValue)
    }
    
    public func aria(roleDescription value: String) -> TextArea {
        return mutate(ariaroledescription: value)
    }
}

/// The element represents a comment output.
///
/// ```html
/// <button></button>
/// ```
public struct Button: ContentNode, FormElement {

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
    
    public func modify(if condition: Bool, element: (Button) -> Button) -> Button {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (Button, T) -> Button) -> Button {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension Button: GlobalAriaAttributes, DisabledAttribute, FormAttribute, FormActionAttribute, NameAttribute, TypeAttribute, ValueAttribute {
    
    public func disabled() -> Button {
        return mutate(disabled: "disabled")
    }
    
    public func form(_ value: String) -> Button {
        return mutate(form: value)
    }
    
    public func formAction(_ value: String) -> Button {
        return mutate(formaction: value)
    }
    
    public func name(_ value: String) -> Button {
        return mutate(name: value)
    }
    
    public func type(_ value: Values.Button) -> Button {
        return mutate(type: value.rawValue)
    }
    
    public func value(_ value: String) -> Button {
        return mutate(value: value)
    }
    
    public func aria(atomic value: Bool) -> Button {
        return mutate(ariaatomic: value)
    }
    
    public func aria(busy value: Bool) -> Button {
        return mutate(ariabusy: value)
    }
    
    public func aria(controls value: String) -> Button {
        return mutate(ariacontrols: value)
    }
    
    public func aria(current value: Values.Accessibility.Current) -> Button {
        return mutate(ariacurrent: value.rawValue)
    }
    
    public func aria(describedBy value: String) -> Button {
        return mutate(ariadescribedby: value)
    }
    
    public func aria(details value: String) -> Button {
        return mutate(ariadetails: value)
    }
    
    public func aria(disabled value: Bool) -> Button {
        return mutate(ariadisabled: value)
    }
    
    public func aria(errorMessage value: String) -> Button {
        return mutate(ariaerrormessage: value)
    }
    
    public func aria(flowTo value: String) -> Button {
        return mutate(ariaflowto: value)
    }
    
    public func aria(hasPopup value: Values.Accessibility.Popup) -> Button {
        return mutate(ariahaspopup: value.rawValue)
    }
    
    public func aria(hidden value: Bool) -> Button {
        return mutate(ariahidden: value)
    }
    
    public func aria(invalid value: Values.Accessibility.Invalid) -> Button {
        return mutate(ariainvalid: value.rawValue)
    }
    
    public func aria(keyShortcuts value: String) -> Button {
        return mutate(ariakeyshortcuts: value)
    }
    
    public func aria(label value: String) -> Button {
        return mutate(arialabel: value)
    }
    
    public func aria(labeledBy value: String) -> Button {
        return mutate(arialabeledby: value)
    }
    
    public func aria(live value: Values.Accessibility.Live) -> Button {
        return mutate(arialive: value.rawValue)
    }
    
    public func aria(owns value: String) -> Button {
        return mutate(ariaowns: value)
    }
    
    public func aria(relevant value: Values.Accessibility.Relevant) -> Button {
        return mutate(ariarelevant: value.rawValue)
    }
    
    public func aria(roleDescription value: String) -> Button {
        return mutate(ariaroledescription: value)
    }
}

extension Button: Localizable {
    
    public init(_ localizedKey: String) {
        self.content = [LocalizedStringKey(key: localizedKey)]
    }

    public init(_ localizedKey: String, with context: some Encodable) {
        self.content = [LocalizedStringKey(key: localizedKey, context: context)]
    }
}

/// The element represents a set of form controls grouped together.
///
/// ```html
/// <fieldset></fieldset>
/// ```
public struct Fieldset: ContentNode, FormElement {
    
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
    
    public func modify(if condition: Bool, element: (Fieldset) -> Fieldset) -> Fieldset {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (Fieldset, T) -> Fieldset) -> Fieldset {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension Fieldset: GlobalAriaAttributes, DisabledAttribute, FormAttribute, NameAttribute {

    public func disabled() -> Fieldset {
        return mutate(disabled: "disabled")
    }
    
    public func form(_ value: String) -> Fieldset {
        return mutate(form: value)
    }
    
    public func name(_ value: String) -> Fieldset {
        return mutate(name: value)
    }
    
    public func aria(atomic value: Bool) -> Fieldset {
        return mutate(ariaatomic: value)
    }
    
    public func aria(busy value: Bool) -> Fieldset {
        return mutate(ariabusy: value)
    }
    
    public func aria(controls value: String) -> Fieldset {
        return mutate(ariacontrols: value)
    }
    
    public func aria(current value: Values.Accessibility.Current) -> Fieldset {
        return mutate(ariacurrent: value.rawValue)
    }
    
    public func aria(describedBy value: String) -> Fieldset {
        return mutate(ariadescribedby: value)
    }
    
    public func aria(details value: String) -> Fieldset {
        return mutate(ariadetails: value)
    }
    
    public func aria(disabled value: Bool) -> Fieldset {
        return mutate(ariadisabled: value)
    }
    
    public func aria(errorMessage value: String) -> Fieldset {
        return mutate(ariaerrormessage: value)
    }
    
    public func aria(flowTo value: String) -> Fieldset {
        return mutate(ariaflowto: value)
    }
    
    public func aria(hasPopup value: Values.Accessibility.Popup) -> Fieldset {
        return mutate(ariahaspopup: value.rawValue)
    }
    
    public func aria(hidden value: Bool) -> Fieldset {
        return mutate(ariahidden: value)
    }
    
    public func aria(invalid value: Values.Accessibility.Invalid) -> Fieldset {
        return mutate(ariainvalid: value.rawValue)
    }
    
    public func aria(keyShortcuts value: String) -> Fieldset {
        return mutate(ariakeyshortcuts: value)
    }
    
    public func aria(label value: String) -> Fieldset {
        return mutate(arialabel: value)
    }
    
    public func aria(labeledBy value: String) -> Fieldset {
        return mutate(arialabeledby: value)
    }
    
    public func aria(live value: Values.Accessibility.Live) -> Fieldset {
        return mutate(arialive: value.rawValue)
    }
    
    public func aria(owns value: String) -> Fieldset {
        return mutate(ariaowns: value)
    }
    
    public func aria(relevant value: Values.Accessibility.Relevant) -> Fieldset {
        return mutate(ariarelevant: value.rawValue)
    }
    
    public func aria(roleDescription value: String) -> Fieldset {
        return mutate(ariaroledescription: value)
    }
}
