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

extension Input: GlobalAttributes, GlobalEventAttributes, AcceptAttribute, AlternateAttribute, AutocompleteAttribute, CheckedAttribute, DisabledAttribute, FormAttribute, FormActionAttribute, HeightAttribute, ListAttribute, MaximumValueAttribute, MaximumLengthAttribute, MinimumValueAttribute, MinimumLengthAttribute, MultipleAttribute, NameAttribute, PatternAttribute, PlaceholderAttribute, ReadyOnlyAttribute, RequiredAttribute, SizeAttribute, SourceAttribute, StepAttribute, TypeAttribute, ValueAttribute, WidthAttribute, PopoverTargetAttribute, PopoverActionAttribute {
    
    public func accessKey(_ value: Character) -> Input {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ value: Values.Capitalization) -> Input {
        return mutate(autocapitalize: value.rawValue)
    }

    public func autofocus() -> Input {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Input {
        return mutate(class: value)
    }

    public func isEditable(_ value: Bool) -> Input {
        return mutate(contenteditable: value)
    }

    public func direction(_ value: Values.Direction) -> Input {
        return mutate(dir: value.rawValue)
    }

    public func isDraggable(_ value: Bool) -> Input {
        return mutate(draggable: value)
    }

    public func enterKeyHint(_ value: Values.Hint) -> Input {
        return mutate(enterkeyhint: value.rawValue)
    }

    public func hidden() -> Input {
        return mutate(hidden: "hidden")
    }
    
    public func hidden(_ condition: Bool) -> Input {
        
        if condition {
            return mutate(hidden: "hidden")
        }
        
        return self
    }

    @available(*, deprecated, message: "The inputmode attribute is actually an enumerated attribute. Use the inputMode(_: Mode) modifier instead.")
    public func inputMode(_ value: String) -> Input {
        return mutate(inputmode: value)
    }
    
    public func inputMode(_ value: Values.Mode) -> Input {
        return mutate(inputmode: value.rawValue)
    }

    public func `is`(_ value: String) -> Input {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Input {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Input {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Input {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Input {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Input {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Input {
        return mutate(id: value)
    }
    
    public func language(_ value: Values.Language) -> Input {
        return mutate(lang: value.rawValue)
    }

    public func nonce(_ value: String) -> Input {
        return mutate(nonce: value)
    }
    
    public func role(_ value: Values.Role) -> Input {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ value: Bool) -> Input {
        return mutate(spellcheck: value)
    }

    public func style(_ value: String) -> Input {
        return mutate(style: value)
    }

    public func tabIndex(_ value: Int) -> Input {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Input {
        return mutate(title: value)
    }
    
    public func translate(_ value: Values.Decision) -> Input {
        return mutate(translate: value.rawValue)
    }
    
    public func inert() -> Input {
        return mutate(inert: "inert")
    }
    
    public func inert(_ condition: Bool) -> Input {

        if condition {
            return mutate(inert: "inert")
        }
        
        return self
    }

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
    
    public func checked(_ condition: Bool) -> Input {
        
        if condition {
            return mutate(checked: "checked")
        }
        
        return self
    }
    
    public func disabled() -> Input {
        return mutate(disabled: "disabled")
    }
    
    public func disabled(_ condition: Bool) -> Input {
        
        if condition {
            return mutate(disabled: "disabled")
        }
        
        return self
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
    
    public func readonly(_ condition: Bool) -> Input {
        
        if condition {
            return mutate(readonly: "readonly")
        }
        
        return self
    }
    
    public func required() -> Input {
        return mutate(required: "required")
    }
    
    public func required(_ condition: Bool) -> Input {
        
        if condition {
            return mutate(required: "required")
        }
        
        return self
    }
    
    public func size(_ size: Int) -> Input {
        return mutate(size: size)
    }
    
    public func source(_ value: String) -> Input {
        return mutate(source: value)
    }
    
    public func source(_ value: EnvironmentValue) -> Input {
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
    
    public func popover(_ value: Values.Popover.State) -> Input {
        return mutate(popover: value.rawValue)
    }
    
    public func popoverTarget(_ value: String) -> Input {
        return mutate(popovertarget: value)
    }
    
    public func popoverAction(_ value: Values.Popover.Action) -> Input {
        return mutate(popoveraction: value.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Input {
        return mutate(key: key, value: value)
    }
    
    public func on(event: Events.Drag, _ value: String) -> Input {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> Input {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> Input {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Mouse, _ value: String) -> Input {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Wheel, _ value: String) -> Input {
        return mutate(key: event.rawValue, value: value)
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

extension Label: GlobalAttributes, GlobalEventAttributes, GlobalAriaAttributes, ForAttribute {
    
    public func accessKey(_ value: Character) -> Label {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ value: Values.Capitalization) -> Label {
        return mutate(autocapitalize: value.rawValue)
    }

    public func autofocus() -> Label {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Label {
        return mutate(class: value)
    }

    public func isEditable(_ value: Bool) -> Label {
        return mutate(contenteditable: value)
    }

    public func direction(_ value: Values.Direction) -> Label {
        return mutate(dir: value.rawValue)
    }

    public func isDraggable(_ value: Bool) -> Label {
        return mutate(draggable: value)
    }

    public func enterKeyHint(_ value: Values.Hint) -> Label {
        return mutate(enterkeyhint: value.rawValue)
    }

    public func hidden() -> Label {
        return mutate(hidden: "hidden")
    }
    
    public func hidden(_ condition: Bool) -> Label {
        
        if condition {
            return mutate(hidden: "hidden")
        }
        
        return self
    }

    @available(*, deprecated, message: "The inputmode attribute is actually an enumerated attribute. Use the inputMode(_: Mode) modifier instead.")
    public func inputMode(_ value: String) -> Label {
        return mutate(inputmode: value)
    }
    
    public func inputMode(_ value: Values.Mode) -> Label {
        return mutate(inputmode: value.rawValue)
    }

    public func `is`(_ value: String) -> Label {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Label {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Label {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Label {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Label {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Label {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Label {
        return mutate(id: value)
    }

    public func language(_ value: Values.Language) -> Label {
        return mutate(lang: value.rawValue)
    }

    public func nonce(_ value: String) -> Label {
        return mutate(nonce: value)
    }
    
    public func role(_ value: Values.Role) -> Label {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ value: Bool) -> Label {
        return mutate(spellcheck: value)
    }

    public func style(_ value: String) -> Label {
        return mutate(style: value)
    }

    public func tabIndex(_ value: Int) -> Label {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Label {
        return mutate(title: value)
    }
    
    public func translate(_ value: Values.Decision) -> Label {
        return mutate(translate: value.rawValue)
    }
    
    public func inert() -> Label {
        return mutate(inert: "inert")
    }
    
    public func inert(_ condition: Bool) -> Label {

        if condition {
            return mutate(inert: "inert")
        }
        
        return self
    }
    
    public func `for`(_ value: String) -> Label {
        return mutate(for: value)
    }
    
    public func popover(_ value: Values.Popover.State) -> Label {
        return mutate(popover: value.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Label {
        return mutate(key: key, value: value)
    }
    
    public func on(event: Events.Drag, _ value: String) -> Label {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> Label {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> Label {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Mouse, _ value: String) -> Label {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Wheel, _ value: String) -> Label {
        return mutate(key: event.rawValue, value: value)
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
    
    public init(_ localizedKey: String, tableName: String? = nil, interpolation: Any...) {
        self.content = [LocalizedStringKey(key: localizedKey, table: tableName, interpolation: interpolation)]
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

extension Select: GlobalAttributes, GlobalEventAttributes, AutocompleteAttribute, DisabledAttribute, FormAttribute, MultipleAttribute, NameAttribute, RequiredAttribute, SizeAttribute {

    public func accessKey(_ value: Character) -> Select {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ value: Values.Capitalization) -> Select {
        return mutate(autocapitalize: value.rawValue)
    }

    public func autofocus() -> Select {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Select {
        return mutate(class: value)
    }

    public func isEditable(_ value: Bool) -> Select {
        return mutate(contenteditable: value)
    }

    public func direction(_ value: Values.Direction) -> Select {
        return mutate(dir: value.rawValue)
    }

    public func isDraggable(_ value: Bool) -> Select {
        return mutate(draggable: value)
    }

    public func enterKeyHint(_ value: Values.Hint) -> Select {
        return mutate(enterkeyhint: value.rawValue)
    }

    public func hidden() -> Select {
        return mutate(hidden: "hidden")
    }
    
    public func hidden(_ condition: Bool) -> Select {
        
        if condition {
            return mutate(hidden: "hidden")
        }
        
        return self
    }

    @available(*, deprecated, message: "The inputmode attribute is actually an enumerated attribute. Use the inputMode(_: Mode) modifier instead.")
    public func inputMode(_ value: String) -> Select {
        return mutate(inputmode: value)
    }
    
    public func inputMode(_ value: Values.Mode) -> Select {
        return mutate(inputmode: value.rawValue)
    }

    public func `is`(_ value: String) -> Select {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Select {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Select {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Select {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Select {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Select {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Select {
        return mutate(id: value)
    }

    public func language(_ value: Values.Language) -> Select {
        return mutate(lang: value.rawValue)
    }

    public func nonce(_ value: String) -> Select {
        return mutate(nonce: value)
    }
    
    public func role(_ value: Values.Role) -> Select {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ value: Bool) -> Select {
        return mutate(spellcheck: value)
    }

    public func style(_ value: String) -> Select {
        return mutate(style: value)
    }

    public func tabIndex(_ value: Int) -> Select {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Select {
        return mutate(title: value)
    }
    
    public func translate(_ value: Values.Decision) -> Select {
        return mutate(translate: value.rawValue)
    }
    
    public func inert() -> Select {
        return mutate(inert: "inert")
    }
    
    public func inert(_ condition: Bool) -> Select {

        if condition {
            return mutate(inert: "inert")
        }
        
        return self
    }

    public func hasCompletion(_ value: Bool) -> Select {
        return mutate(autocomplete: value)
    }
    
    public func disabled() -> Select {
        return mutate(disabled: "disabled")
    }
    
    public func disabled(_ condition: Bool) -> Select {
        
        if condition {
            return mutate(disabled: "disabled")
        }
        
        return self
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
    
    public func required(_ condition: Bool) -> Select {
        
        if condition {
            return mutate(required: "required")
        }
        
        return self
    }
    
    public func size(_ size: Int) -> Select {
        return mutate(size: size)
    }
    
    public func popover(_ value: Values.Popover.State) -> Select {
        return mutate(popover: value.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Select {
        return mutate(key: key, value: value)
    }
    
    public func on(event: Events.Drag, _ value: String) -> Select {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> Select {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> Select {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Mouse, _ value: String) -> Select {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Wheel, _ value: String) -> Select {
        return mutate(key: event.rawValue, value: value)
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

extension TextArea: GlobalAttributes, GlobalEventAttributes, GlobalAriaAttributes, AutocompleteAttribute, ColumnsAttribute, DisabledAttribute, FormAttribute, MaximumLengthAttribute, MinimumLengthAttribute, NameAttribute, PlaceholderAttribute, ReadyOnlyAttribute, RequiredAttribute, RowsAttribute, WrapAttribute {
    
    public func accessKey(_ value: Character) -> TextArea {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ value: Values.Capitalization) -> TextArea {
        return mutate(autocapitalize: value.rawValue)
    }

    public func autofocus() -> TextArea {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> TextArea {
        return mutate(class: value)
    }

    public func isEditable(_ value: Bool) -> TextArea {
        return mutate(contenteditable: value)
    }

    public func direction(_ value: Values.Direction) -> TextArea {
        return mutate(dir: value.rawValue)
    }

    public func isDraggable(_ value: Bool) -> TextArea {
        return mutate(draggable: value)
    }

    public func enterKeyHint(_ value: Values.Hint) -> TextArea {
        return mutate(enterkeyhint: value.rawValue)
    }

    public func hidden() -> TextArea {
        return mutate(hidden: "hidden")
    }
    
    public func hidden(_ condition: Bool) -> TextArea {
        
        if condition {
            return mutate(hidden: "hidden")
        }
        
        return self
    }

    @available(*, deprecated, message: "The inputmode attribute is actually an enumerated attribute. Use the inputMode(_: Mode) modifier instead.")
    public func inputMode(_ value: String) -> TextArea {
        return mutate(inputmode: value)
    }
    
    public func inputMode(_ value: Values.Mode) -> TextArea {
        return mutate(inputmode: value.rawValue)
    }

    public func `is`(_ value: String) -> TextArea {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> TextArea {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> TextArea {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> TextArea {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> TextArea {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> TextArea {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> TextArea {
        return mutate(id: value)
    }

    public func language(_ value: Values.Language) -> TextArea {
        return mutate(lang: value.rawValue)
    }

    public func nonce(_ value: String) -> TextArea {
        return mutate(nonce: value)
    }
    
    public func role(_ value: Values.Role) -> TextArea {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ value: Bool) -> TextArea {
        return mutate(spellcheck: value)
    }

    public func style(_ value: String) -> TextArea {
        return mutate(style: value)
    }

    public func tabIndex(_ value: Int) -> TextArea {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> TextArea {
        return mutate(title: value)
    }
    
    public func translate(_ value: Values.Decision) -> TextArea {
        return mutate(translate: value.rawValue)
    }
    
    public func inert() -> TextArea {
        return mutate(inert: "inert")
    }
    
    public func inert(_ condition: Bool) -> TextArea {

        if condition {
            return mutate(inert: "inert")
        }
        
        return self
    }

    public func hasCompletion(_ value: Bool) -> TextArea {
        return mutate(autocomplete: value)
    }
    
    public func columns(_ size: Int) -> TextArea {
        return mutate(cols: size)
    }
    
    public func disabled() -> TextArea {
        return mutate(disabled: "disabled")
    }
    
    public func disabled(_ condition: Bool) -> TextArea {
        
        if condition {
            return mutate(disabled: "disabled")
        }
        
        return self
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
    
    public func readonly(_ condition: Bool) -> TextArea {
        
        if condition {
            return mutate(readonly: "readonly")
        }
        
        return self
    }
    
    public func required() -> TextArea {
        return mutate(required: "required")
    }
    
    public func required(_ condition: Bool) -> TextArea {
        
        if condition {
            return mutate(required: "required")
        }
        
        return self
    }
    
    public func rows(_ size: Int) -> TextArea {
        return mutate(rows: size)
    }
    
    public func wrap(_ value: Values.Wrapping) -> TextArea {
        return mutate(wrap: value.rawValue)
    }
    
    public func popover(_ value: Values.Popover.State) -> TextArea {
        return mutate(popover: value.rawValue)
    }
    
    public func custom(key: String, value: Any) -> TextArea {
        return mutate(key: key, value: value)
    }
    
    public func on(event: Events.Drag, _ value: String) -> TextArea {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> TextArea {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> TextArea {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Mouse, _ value: String) -> TextArea {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Wheel, _ value: String) -> TextArea {
        return mutate(key: event.rawValue, value: value)
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

extension Button: GlobalAttributes, GlobalEventAttributes, GlobalAriaAttributes, DisabledAttribute, FormAttribute, FormActionAttribute, NameAttribute, TypeAttribute, ValueAttribute, PopoverTargetAttribute, PopoverActionAttribute {
    
    public func accessKey(_ value: Character) -> Button {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ value: Values.Capitalization) -> Button {
        return mutate(autocapitalize: value.rawValue)
    }

    public func autofocus() -> Button {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Button {
        return mutate(class: value)
    }

    public func isEditable(_ value: Bool) -> Button {
        return mutate(contenteditable: value)
    }

    public func direction(_ value: Values.Direction) -> Button {
        return mutate(dir: value.rawValue)
    }

    public func isDraggable(_ value: Bool) -> Button {
        return mutate(draggable: value)
    }

    public func enterKeyHint(_ value: Values.Hint) -> Button {
        return mutate(enterkeyhint: value.rawValue)
    }

    public func hidden() -> Button {
        return mutate(hidden: "hidden")
    }
    
    public func hidden(_ condition: Bool) -> Button {
        
        if condition {
            return mutate(hidden: "hidden")
        }
        
        return self
    }

    @available(*, deprecated, message: "The inputmode attribute is actually an enumerated attribute. Use the inputMode(_: Mode) modifier instead.")
    public func inputMode(_ value: String) -> Button {
        return mutate(inputmode: value)
    }
    
    public func inputMode(_ value: Values.Mode) -> Button {
        return mutate(inputmode: value.rawValue)
    }

    public func `is`(_ value: String) -> Button {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Button {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Button {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Button {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Button {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Button {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Button {
        return mutate(id: value)
    }
    
    public func language(_ value: Values.Language) -> Button {
        return mutate(lang: value.rawValue)
    }

    public func nonce(_ value: String) -> Button {
        return mutate(nonce: value)
    }
    
    public func role(_ value: Values.Role) -> Button {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ value: Bool) -> Button {
        return mutate(spellcheck: value)
    }

    public func style(_ value: String) -> Button {
        return mutate(style: value)
    }

    public func tabIndex(_ value: Int) -> Button {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Button {
        return mutate(title: value)
    }
    
    public func translate(_ value: Values.Decision) -> Button {
        return  mutate(translate: value.rawValue)
    }
    
    public func inert() -> Button {
        return mutate(inert: "inert")
    }
    
    public func inert(_ condition: Bool) -> Button {

        if condition {
            return mutate(inert: "inert")
        }
        
        return self
    }
    
    public func disabled() -> Button {
        return mutate(disabled: "disabled")
    }
    
    public func disabled(_ condition: Bool) -> Button {
        
        if condition {
            return mutate(disabled: "disabled")
        }
        
        return self
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
    
    public func popover(_ value: Values.Popover.State) -> Button {
        return mutate(popover: value.rawValue)
    }
    
    public func popoverTarget(_ value: String) -> Button {
        return mutate(popovertarget: value)
    }
    
    public func popoverAction(_ value: Values.Popover.Action) -> Button {
        return mutate(popoveraction: value.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Button {
        return mutate(key: key, value: value)
    }
    
    public func on(event: Events.Drag, _ value: String) -> Button {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> Button {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> Button {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Mouse, _ value: String) -> Button {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Wheel, _ value: String) -> Button {
        return mutate(key: event.rawValue, value: value)
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
    
    public init(_ localizedKey: String, tableName: String? = nil, interpolation: Any...) {
        self.content = [LocalizedStringKey(key: localizedKey, table: tableName, interpolation: interpolation)]
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

extension Fieldset: GlobalAttributes, GlobalEventAttributes, GlobalAriaAttributes, DisabledAttribute, FormAttribute, NameAttribute {
    
    public func accessKey(_ value: Character) -> Fieldset {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ value: Values.Capitalization) -> Fieldset {
        return mutate(autocapitalize: value.rawValue)
    }

    public func autofocus() -> Fieldset {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Fieldset {
        return mutate(class: value)
    }

    public func isEditable(_ value: Bool) -> Fieldset {
        return mutate(contenteditable: value)
    }

    public func direction(_ value: Values.Direction) -> Fieldset {
        return mutate(dir: value.rawValue)
    }

    public func isDraggable(_ value: Bool) -> Fieldset {
        return mutate(draggable: value)
    }

    public func enterKeyHint(_ value: Values.Hint) -> Fieldset {
        return mutate(enterkeyhint: value.rawValue)
    }

    public func hidden() -> Fieldset {
        return mutate(hidden: "hidden")
    }
    
    public func hidden(_ condition: Bool) -> Fieldset {
        
        if condition {
            return mutate(hidden: "hidden")
        }
        
        return self
    }

    @available(*, deprecated, message: "The inputmode attribute is actually an enumerated attribute. Use the inputMode(_: Mode) modifier instead.")
    public func inputMode(_ value: String) -> Fieldset {
        return mutate(inputmode: value)
    }
    
    public func inputMode(_ value: Values.Mode) -> Fieldset {
        return mutate(inputmode: value.rawValue)
    }

    public func `is`(_ value: String) -> Fieldset {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Fieldset {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Fieldset {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Fieldset {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Fieldset {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Fieldset {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Fieldset {
        return mutate(id: value)
    }

    public func language(_ value: Values.Language) -> Fieldset {
        return mutate(lang: value.rawValue)
    }

    public func nonce(_ value: String) -> Fieldset {
        return mutate(nonce: value)
    }
    
    public func role(_ value: Values.Role) -> Fieldset {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ value: Bool) -> Fieldset {
        return mutate(spellcheck: value)
    }

    public func style(_ value: String) -> Fieldset {
        return mutate(style: value)
    }

    public func tabIndex(_ value: Int) -> Fieldset {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Fieldset {
        return mutate(title: value)
    }
    
    public func translate(_ value: Values.Decision) -> Fieldset {
        return mutate(translate: value.rawValue)
    }
    
    public func inert() -> Fieldset {
        return mutate(inert: "inert")
    }
    
    public func inert(_ condition: Bool) -> Fieldset {

        if condition {
            return mutate(inert: "inert")
        }
        
        return self
    }

    public func disabled() -> Fieldset {
        return mutate(disabled: "disabled")
    }
    
    public func disabled(_ condition: Bool) -> Fieldset {
        
        if condition {
            return mutate(disabled: "disabled")
        }
        
        return self
    }
    
    public func form(_ value: String) -> Fieldset {
        return mutate(form: value)
    }
    
    public func name(_ value: String) -> Fieldset {
        return mutate(name: value)
    }
    
    public func popover(_ value: Values.Popover.State) -> Fieldset {
        return mutate(popover: value.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Fieldset {
        return mutate(key: key, value: value)
    }
    
    public func on(event: Events.Drag, _ value: String) -> Fieldset {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> Fieldset {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> Fieldset {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Mouse, _ value: String) -> Fieldset {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Wheel, _ value: String) -> Fieldset {
        return mutate(key: event.rawValue, value: value)
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
