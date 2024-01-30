/*
 Abstract:
 The file contains the input elements. The html-element 'input' only allows these elements to be its descendants.
 
 Note:
 If you about to add something to the file, stick to the official documentation to keep the code consistent.
 */

import OrderedCollections

/// The alias for the element OptionGroup.
///
/// Optgroup is the official tag and can be used instead of OptionGroup.
///
/// ```html
/// <optgroup></optgroup>
/// ```
@_documentation(visibility: internal)
public typealias Optgroup = OptionGroup

/// The element represents a group of options.
///
/// ```html
/// <optgroup></optgroup>
/// ```
public struct OptionGroup: ContentNode, InputElement {

    internal var name: String { "optgroup" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [Content]

    public init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [Content]) {
        self.attributes = attributes
        self.content = content
    }
    
    public func modify(if condition: Bool, element: (OptionGroup) -> OptionGroup) -> OptionGroup {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (OptionGroup, T) -> OptionGroup) -> OptionGroup {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension OptionGroup: GlobalAttributes, GlobalEventAttributes, GlobalAriaAttributes, DisabledAttribute, LabelAttribute {

    public func accessKey(_ value: Character) -> OptionGroup {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ value: Values.Capitalization) -> OptionGroup {
        return mutate(autocapitalize: value.rawValue)
    }

    public func autofocus() -> OptionGroup {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> OptionGroup {
        return mutate(class: value)
    }

    public func isEditable(_ value: Bool) -> OptionGroup {
        return mutate(contenteditable: value)
    }

    public func direction(_ value: Values.Direction) -> OptionGroup {
        return mutate(dir: value.rawValue)
    }

    public func isDraggable(_ value: Bool) -> OptionGroup {
        return mutate(draggable: value)
    }

    public func enterKeyHint(_ value: Values.Hint) -> OptionGroup {
        return mutate(enterkeyhint: value.rawValue)
    }

    public func hidden() -> OptionGroup {
        return mutate(hidden: "hidden")
    }
    
    public func hidden(_ condition: Bool) -> OptionGroup {
        
        if condition {
            return mutate(hidden: "hidden")
        }
        
        return self
    }

    public func inputMode(_ value: String) -> OptionGroup {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> OptionGroup {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> OptionGroup {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> OptionGroup {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> OptionGroup {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> OptionGroup {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> OptionGroup {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> OptionGroup {
        return mutate(id: value)
    }

    public func language(_ value: Values.Language) -> OptionGroup {
        return mutate(lang: value.rawValue)
    }

    public func nonce(_ value: String) -> OptionGroup {
        return mutate(nonce: value)
    }
    
    public func role(_ value: Values.Role) -> OptionGroup {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ value: Bool) -> OptionGroup {
        return mutate(spellcheck: value)
    }

    public func style(_ value: String) -> OptionGroup {
        return mutate(style: value)
    }

    public func tabIndex(_ value: Int) -> OptionGroup {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> OptionGroup {
        return mutate(title: value)
    }
    
    public func translate(_ value: Values.Decision) -> OptionGroup {
        return mutate(translate: value.rawValue)
    }
    
    public func inert() -> OptionGroup {
        return mutate(inert: "inert")
    }
    
    public func inert(_ condition: Bool) -> OptionGroup {

        if condition {
            return mutate(inert: "inert")
        }
        
        return self
    }

    public func disabled() -> OptionGroup {
        return mutate(disabled: "disabled")
    }
    
    public func disabled(_ condition: Bool) -> OptionGroup {
        
        if condition {
            return mutate(disabled: "disabled")
        }
        
        return self
    }
    
    public func label(_ value: String) -> OptionGroup {
        return mutate(label: value)
    }
    
    public func popover(_ value: Values.Popover.State) -> OptionGroup {
        return mutate(popover: value.rawValue)
    }
    
    public func custom(key: String, value: Any) -> OptionGroup {
        return mutate(key: key, value: value)
    }
    
    public func on(event: Events.Drag, _ value: String) -> OptionGroup {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> OptionGroup {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Wheel, _ value: String) -> OptionGroup {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> OptionGroup {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Mouse, _ value: String) -> OptionGroup {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func aria(atomic value: Bool) -> OptionGroup {
        return mutate(ariaatomic: value)
    }
    
    public func aria(busy value: Bool) -> OptionGroup {
        return mutate(ariabusy: value)
    }
    
    public func aria(controls value: String) -> OptionGroup {
        return mutate(ariacontrols: value)
    }
    
    public func aria(current value: Values.Accessibility.Current) -> OptionGroup {
        return mutate(ariacurrent: value.rawValue)
    }
    
    public func aria(describedBy value: String) -> OptionGroup {
        return mutate(ariadescribedby: value)
    }
    
    public func aria(details value: String) -> OptionGroup {
        return mutate(ariadetails: value)
    }
    
    public func aria(disabled value: Bool) -> OptionGroup {
        return mutate(ariadisabled: value)
    }
    
    public func aria(errorMessage value: String) -> OptionGroup {
        return mutate(ariaerrormessage: value)
    }
    
    public func aria(flowTo value: String) -> OptionGroup {
        return mutate(ariaflowto: value)
    }
    
    public func aria(hasPopup value: Values.Accessibility.Popup) -> OptionGroup {
        return mutate(ariahaspopup: value.rawValue)
    }
    
    public func aria(hidden value: Bool) -> OptionGroup {
        return mutate(ariahidden: value)
    }
    
    public func aria(invalid value: Values.Accessibility.Invalid) -> OptionGroup {
        return mutate(ariainvalid: value.rawValue)
    }
    
    public func aria(keyShortcuts value: String) -> OptionGroup {
        return mutate(ariakeyshortcuts: value)
    }
    
    public func aria(label value: String) -> OptionGroup {
        return mutate(arialabel: value)
    }
    
    public func aria(labeledBy value: String) -> OptionGroup {
        return mutate(arialabeledby: value)
    }
    
    public func aria(live value: Values.Accessibility.Live) -> OptionGroup {
        return mutate(arialive: value.rawValue)
    }
    
    public func aria(owns value: String) -> OptionGroup {
        return mutate(ariaowns: value)
    }
    
    public func aria(relevant value: Values.Accessibility.Relevant) -> OptionGroup {
        return mutate(ariarelevant: value.rawValue)
    }
    
    public func aria(roleDescription value: String) -> OptionGroup {
        return mutate(ariaroledescription: value)
    }
}

/// The element represents an option.
///
/// ```html
/// <option></option>
/// ```
public struct Option: ContentNode, InputElement {

    internal var name: String { "option" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [String]

    public init(@ContentBuilder<String> content: () -> [String]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [String]) {
        self.attributes = attributes
        self.content = content
    }
    
    public func modify(if condition: Bool, element: (Option) -> Option) -> Option {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (Option, T) -> Option) -> Option {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension Option: GlobalAttributes, GlobalEventAttributes, GlobalAriaAttributes, DisabledAttribute, LabelAttribute, ValueAttribute, SelectedAttribute {
    
    public func accessKey(_ value: Character) -> Option {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ value: Values.Capitalization) -> Option {
        return mutate(autocapitalize: value.rawValue)
    }

    public func autofocus() -> Option {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Option {
        return mutate(class: value)
    }

    public func isEditable(_ value: Bool) -> Option {
        return mutate(contenteditable: value)
    }

    public func direction(_ value: Values.Direction) -> Option {
        return mutate(dir: value.rawValue)
    }

    public func isDraggable(_ value: Bool) -> Option {
        return mutate(draggable: value)
    }

    public func enterKeyHint(_ value: Values.Hint) -> Option {
        return mutate(enterkeyhint: value.rawValue)
    }

    public func hidden() -> Option {
        return mutate(hidden: "hidden")
    }
    
    public func hidden(_ condition: Bool) -> Option {
        
        if condition {
            return mutate(hidden: "hidden")
        }
        
        return self
    }

    public func inputMode(_ value: String) -> Option {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Option {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Option {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Option {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Option {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Option {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Option {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Option {
        return mutate(id: value)
    }

    public func language(_ value: Values.Language) -> Option {
        return mutate(lang: value.rawValue)
    }

    public func nonce(_ value: String) -> Option {
        return mutate(nonce: value)
    }
    
    public func role(_ value: Values.Role) -> Option {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ value: Bool) -> Option {
        return mutate(spellcheck: value)
    }

    public func style(_ value: String) -> Option {
        return mutate(style: value)
    }

    public func tabIndex(_ value: Int) -> Option {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Option {
        return mutate(title: value)
    }
    
    public func translate(_ value: Values.Decision) -> Option {
        return mutate(translate: value.rawValue)
    }
    
    public func inert() -> Option {
        return mutate(inert: "inert")
    }
    
    public func inert(_ condition: Bool) -> Option {

        if condition {
            return mutate(inert: "inert")
        }
        
        return self
    }

    public func disabled() -> Option {
        return mutate(disabled: "disabled")
    }
    
    public func disabled(_ condition: Bool) -> Option {
        
        if condition {
            return mutate(disabled: "disabled")
        }
        
        return self
    }
    
    public func label(_ value: String) -> Option {
        return mutate(label: value)
    }
    
    public func value(_ value: String) -> Option {
        return mutate(value: value)
    }
    
    public func selected() -> Option {
        return mutate(selected: "selected")
    }
    
    public func popover(_ value: Values.Popover.State) -> Option {
        return mutate(popover: value.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Option {
        return mutate(key: key, value: value)
    }
    
    public func on(event: Events.Drag, _ value: String) -> Option {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> Option {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Wheel, _ value: String) -> Option {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> Option {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Mouse, _ value: String) -> Option {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func aria(atomic value: Bool) -> Option {
        return mutate(ariaatomic: value)
    }
    
    public func aria(busy value: Bool) -> Option {
        return mutate(ariabusy: value)
    }
    
    public func aria(controls value: String) -> Option {
        return mutate(ariacontrols: value)
    }
    
    public func aria(current value: Values.Accessibility.Current) -> Option {
        return mutate(ariacurrent: value.rawValue)
    }
    
    public func aria(describedBy value: String) -> Option {
        return mutate(ariadescribedby: value)
    }
    
    public func aria(details value: String) -> Option {
        return mutate(ariadetails: value)
    }
    
    public func aria(disabled value: Bool) -> Option {
        return mutate(ariadisabled: value)
    }
    
    public func aria(errorMessage value: String) -> Option {
        return mutate(ariaerrormessage: value)
    }
    
    public func aria(flowTo value: String) -> Option {
        return mutate(ariaflowto: value)
    }
    
    public func aria(hasPopup value: Values.Accessibility.Popup) -> Option {
        return mutate(ariahaspopup: value.rawValue)
    }
    
    public func aria(hidden value: Bool) -> Option {
        return mutate(ariahidden: value)
    }
    
    public func aria(invalid value: Values.Accessibility.Invalid) -> Option {
        return mutate(ariainvalid: value.rawValue)
    }
    
    public func aria(keyShortcuts value: String) -> Option {
        return mutate(ariakeyshortcuts: value)
    }
    
    public func aria(label value: String) -> Option {
        return mutate(arialabel: value)
    }
    
    public func aria(labeledBy value: String) -> Option {
        return mutate(arialabeledby: value)
    }
    
    public func aria(live value: Values.Accessibility.Live) -> Option {
        return mutate(arialive: value.rawValue)
    }
    
    public func aria(owns value: String) -> Option {
        return mutate(ariaowns: value)
    }
    
    public func aria(relevant value: Values.Accessibility.Relevant) -> Option {
        return mutate(ariarelevant: value.rawValue)
    }
    
    public func aria(roleDescription value: String) -> Option {
        return mutate(ariaroledescription: value)
    }
}

/// The element represents a caption for the rest of the contents of a fieldset.
///
/// ```html
/// <legend></legend>
/// ```
public struct Legend: ContentNode, InputElement {

    internal var name: String { "legend" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [Content]

    public init(@ContentBuilder<Content> content: () -> [Content]) {
        
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [Content]) {
        
        self.attributes = attributes
        self.content = content
    }
    
    public func modify(if condition: Bool, element: (Legend) -> Legend) -> Legend {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (Legend, T) -> Legend) -> Legend {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension Legend: GlobalAttributes, GlobalEventAttributes, GlobalAriaAttributes {
    
    public func accessKey(_ value: Character) -> Legend {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ value: Values.Capitalization) -> Legend {
        return mutate(autocapitalize: value.rawValue)
    }

    public func autofocus() -> Legend {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Legend {
        return mutate(class: value)
    }

    public func isEditable(_ value: Bool) -> Legend {
        return mutate(contenteditable: value)
    }

    public func direction(_ value: Values.Direction) -> Legend {
        return mutate(dir: value.rawValue)
    }

    public func isDraggable(_ value: Bool) -> Legend {
        return mutate(draggable: value)
    }

    public func enterKeyHint(_ value: Values.Hint) -> Legend {
        return mutate(enterkeyhint: value.rawValue)
    }

    public func hidden() -> Legend {
        return mutate(hidden: "hidden")
    }
    
    public func hidden(_ condition: Bool) -> Legend {
        
        if condition {
            return mutate(hidden: "hidden")
        }
        
        return self
    }

    public func inputMode(_ value: String) -> Legend {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Legend {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Legend {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Legend {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Legend {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Legend {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Legend {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Legend {
        return mutate(id: value)
    }

    public func language(_ value: Values.Language) -> Legend {
        return mutate(lang: value.rawValue)
    }

    public func nonce(_ value: String) -> Legend {
        return mutate(nonce: value)
    }

    public func role(_ value: Values.Role) -> Legend {
        return mutate(role: value.rawValue)
    }
    
    public func hasSpellCheck(_ value: Bool) -> Legend {
        return mutate(spellcheck: value)
    }

    public func style(_ value: String) -> Legend {
        return mutate(style: value)
    }

    public func tabIndex(_ value: Int) -> Legend {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Legend {
        return mutate(title: value)
    }
    
    public func translate(_ value: Values.Decision) -> Legend {
        return mutate(translate: value.rawValue)
    }
    
    public func inert() -> Legend {
        return mutate(inert: "inert")
    }
    
    public func inert(_ condition: Bool) -> Legend {

        if condition {
            return mutate(inert: "inert")
        }
        
        return self
    }
    
    public func popover(_ value: Values.Popover.State) -> Legend {
        return mutate(popover: value.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Legend {
        return mutate(key: key, value: value)
    }
    
    public func on(event: Events.Drag, _ value: String) -> Legend {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> Legend {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Wheel, _ value: String) -> Legend {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> Legend {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Mouse, _ value: String) -> Legend {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func aria(atomic value: Bool) -> Legend {
        return mutate(ariaatomic: value)
    }
    
    public func aria(busy value: Bool) -> Legend {
        return mutate(ariabusy: value)
    }
    
    public func aria(controls value: String) -> Legend {
        return mutate(ariacontrols: value)
    }
    
    public func aria(current value: Values.Accessibility.Current) -> Legend {
        return mutate(ariacurrent: value.rawValue)
    }
    
    public func aria(describedBy value: String) -> Legend {
        return mutate(ariadescribedby: value)
    }
    
    public func aria(details value: String) -> Legend {
        return mutate(ariadetails: value)
    }
    
    public func aria(disabled value: Bool) -> Legend {
        return mutate(ariadisabled: value)
    }
    
    public func aria(errorMessage value: String) -> Legend {
        return mutate(ariaerrormessage: value)
    }
    
    public func aria(flowTo value: String) -> Legend {
        return mutate(ariaflowto: value)
    }
    
    public func aria(hasPopup value: Values.Accessibility.Popup) -> Legend {
        return mutate(ariahaspopup: value.rawValue)
    }
    
    public func aria(hidden value: Bool) -> Legend {
        return mutate(ariahidden: value)
    }
    
    public func aria(invalid value: Values.Accessibility.Invalid) -> Legend {
        return mutate(ariainvalid: value.rawValue)
    }
    
    public func aria(keyShortcuts value: String) -> Legend {
        return mutate(ariakeyshortcuts: value)
    }
    
    public func aria(label value: String) -> Legend {
        return mutate(arialabel: value)
    }
    
    public func aria(labeledBy value: String) -> Legend {
        return mutate(arialabeledby: value)
    }
    
    public func aria(live value: Values.Accessibility.Live) -> Legend {
        return mutate(arialive: value.rawValue)
    }
    
    public func aria(owns value: String) -> Legend {
        return mutate(ariaowns: value)
    }
    
    public func aria(relevant value: Values.Accessibility.Relevant) -> Legend {
        return mutate(ariarelevant: value.rawValue)
    }
    
    public func aria(roleDescription value: String) -> Legend {
        return mutate(ariaroledescription: value)
    }
}

/// The element represents a summary, caption, or legend for the rest of the content.
///
/// ```html
/// <summary></summary>
/// ```
public struct Summary: ContentNode, InputElement {

    internal var name: String { "summary" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [Content]

    public init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [Content]) {
        self.attributes = attributes
        self.content = content
    }
    
    public func modify(if condition: Bool, element: (Summary) -> Summary) -> Summary {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (Summary, T) -> Summary) -> Summary {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension Summary: GlobalAttributes, GlobalEventAttributes, GlobalAriaAttributes {
    
    public func accessKey(_ value: Character) -> Summary {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ value: Values.Capitalization) -> Summary {
        return mutate(autocapitalize: value.rawValue)
    }

    public func autofocus() -> Summary {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Summary {
        return mutate(class: value)
    }

    public func isEditable(_ value: Bool) -> Summary {
        return mutate(contenteditable: value)
    }

    public func direction(_ value: Values.Direction) -> Summary {
        return mutate(dir: value.rawValue)
    }

    public func isDraggable(_ value: Bool) -> Summary {
        return mutate(draggable: value)
    }

    public func enterKeyHint(_ value: Values.Hint) -> Summary {
        return mutate(enterkeyhint: value.rawValue)
    }

    public func hidden() -> Summary {
        return mutate(hidden: "hidden")
    }
    
    public func hidden(_ condition: Bool) -> Summary {
        
        if condition {
            return mutate(hidden: "hidden")
        }
        
        return self
    }

    public func inputMode(_ value: String) -> Summary {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Summary {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Summary {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Summary {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Summary {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Summary {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Summary {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Summary {
        return mutate(id: value)
    }

    public func language(_ value: Values.Language) -> Summary {
        return mutate(lang: value.rawValue)
    }

    public func nonce(_ value: String) -> Summary {
        return mutate(nonce: value)
    }
    
    public func role(_ value: Values.Role) -> Summary {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ value: Bool) -> Summary {
        return mutate(spellcheck: value)
    }

    public func style(_ value: String) -> Summary {
        return mutate(style: value)
    }

    public func tabIndex(_ value: Int) -> Summary {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Summary {
        return mutate(title: value)
    }
    
    public func translate(_ value: Values.Decision) -> Summary {
        return mutate(translate: value.rawValue)
    }
    
    public func inert() -> Summary {
        return mutate(inert: "inert")
    }
    
    public func inert(_ condition: Bool) -> Summary {

        if condition {
            return mutate(inert: "inert")
        }
        
        return self
    }
    
    public func popover(_ value: Values.Popover.State) -> Summary {
        return mutate(popover: value.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Summary {
        return mutate(key: key, value: value)
    }
    
    public func on(event: Events.Drag, _ value: String) -> Summary {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> Summary {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Wheel, _ value: String) -> Summary {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> Summary {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Mouse, _ value: String) -> Summary {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func aria(atomic value: Bool) -> Summary {
        return mutate(ariaatomic: value)
    }
    
    public func aria(busy value: Bool) -> Summary {
        return mutate(ariabusy: value)
    }
    
    public func aria(controls value: String) -> Summary {
        return mutate(ariacontrols: value)
    }
    
    public func aria(current value: Values.Accessibility.Current) -> Summary {
        return mutate(ariacurrent: value.rawValue)
    }
    
    public func aria(describedBy value: String) -> Summary {
        return mutate(ariadescribedby: value)
    }
    
    public func aria(details value: String) -> Summary {
        return mutate(ariadetails: value)
    }
    
    public func aria(disabled value: Bool) -> Summary {
        return mutate(ariadisabled: value)
    }
    
    public func aria(errorMessage value: String) -> Summary {
        return mutate(ariaerrormessage: value)
    }
    
    public func aria(flowTo value: String) -> Summary {
        return mutate(ariaflowto: value)
    }
    
    public func aria(hasPopup value: Values.Accessibility.Popup) -> Summary {
        return mutate(ariahaspopup: value.rawValue)
    }
    
    public func aria(hidden value: Bool) -> Summary {
        return mutate(ariahidden: value)
    }
    
    public func aria(invalid value: Values.Accessibility.Invalid) -> Summary {
        return mutate(ariainvalid: value.rawValue)
    }
    
    public func aria(keyShortcuts value: String) -> Summary {
        return mutate(ariakeyshortcuts: value)
    }
    
    public func aria(label value: String) -> Summary {
        return mutate(arialabel: value)
    }
    
    public func aria(labeledBy value: String) -> Summary {
        return mutate(arialabeledby: value)
    }
    
    public func aria(live value: Values.Accessibility.Live) -> Summary {
        return mutate(arialive: value.rawValue)
    }
    
    public func aria(owns value: String) -> Summary {
        return mutate(ariaowns: value)
    }
    
    public func aria(relevant value: Values.Accessibility.Relevant) -> Summary {
        return mutate(ariarelevant: value.rawValue)
    }
    
    public func aria(roleDescription value: String) -> Summary {
        return mutate(ariaroledescription: value)
    }
}
