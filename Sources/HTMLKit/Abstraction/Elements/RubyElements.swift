/*
 Abstract:
 The file contains the ruby elements. The html-element 'ruby' only allows these elements to be its descendants.
 
 Note:
 If you about to add something to the file, stick to the official documentation to keep the code consistent.
 */

import OrderedCollections

/// The alias for the element RubyText.
///
/// Rt is the official tag and can be used instead of RubyText.
///
/// ```html
/// <rt></rt>
/// ```
public typealias Rt = RubyText

/// The alias for the element RubyPronunciation.
///
/// Rp is the official tag and can be used instead of RubyPronunciation.
///
/// ```html
/// <rp></rp>
/// ```
public typealias Rp = RubyPronunciation

/// The element marks the ruby text component of a ruby annotation.
///
/// ```html
/// <rt></rt>
/// ```
public struct RubyText: ContentNode, RubyElement {

    internal var name: String { "rt" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [Content]

    public init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [Content]) {
        self.attributes = attributes
        self.content = content
    }
    
    public func modify(if condition: Bool, element: (RubyText) -> RubyText) -> RubyText {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (RubyText, T) -> RubyText) -> RubyText {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension RubyText: GlobalAttributes, GlobalEventAttributes, GlobalAriaAttributes {
    
    public func accessKey(_ value: Character) -> RubyText {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ value: Values.Capitalization) -> RubyText {
        return mutate(autocapitalize: value.rawValue)
    }

    public func autofocus() -> RubyText {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> RubyText {
        return mutate(class: value)
    }

    public func isEditable(_ value: Bool) -> RubyText {
        return mutate(contenteditable: value)
    }

    public func direction(_ value: Values.Direction) -> RubyText {
        return mutate(dir: value.rawValue)
    }

    public func isDraggable(_ value: Bool) -> RubyText {
        return mutate(draggable: value)
    }

    public func enterKeyHint(_ value: Values.Hint) -> RubyText {
        return mutate(enterkeyhint: value.rawValue)
    }

    public func hidden() -> RubyText {
        return mutate(hidden: "hidden")
    }
    
    public func hidden(_ condition: Bool) -> RubyText {
        
        if condition {
            return mutate(hidden: "hidden")
        }
        
        return self
    }

    public func inputMode(_ value: String) -> RubyText {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> RubyText {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> RubyText {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> RubyText {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> RubyText {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> RubyText {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> RubyText {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> RubyText {
        return mutate(id: value)
    }

    public func language(_ value: Values.Language) -> RubyText {
        return mutate(lang: value.rawValue)
    }

    public func nonce(_ value: String) -> RubyText {
        return mutate(nonce: value)
    }
    
    public func role(_ value: Values.Role) -> RubyText {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ value: Bool) -> RubyText {
        return mutate(spellcheck: value)
    }

    public func style(_ value: String) -> RubyText {
        return mutate(style: value)
    }

    public func tabIndex(_ value: Int) -> RubyText {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> RubyText {
        return mutate(title: value)
    }
    
    public func translate(_ value: Values.Decision) -> RubyText {
        return mutate(translate: value.rawValue)
    }
    
    public func custom(key: String, value: Any) -> RubyText {
        return mutate(key: key, value: value)
    }
    
    public func on(event: Events.Drag, _ value: String) -> RubyText {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> RubyText {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Wheel, _ value: String) -> RubyText {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> RubyText {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Mouse, _ value: String) -> RubyText {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func aria(atomic value: Bool) -> RubyText {
        return mutate(ariaatomic: value)
    }
    
    public func aria(busy value: Bool) -> RubyText {
        return mutate(ariabusy: value)
    }
    
    public func aria(controls value: String) -> RubyText {
        return mutate(ariacontrols: value)
    }
    
    public func aria(current value: Values.Accessibility.Current) -> RubyText {
        return mutate(ariacurrent: value.rawValue)
    }
    
    public func aria(describedBy value: String) -> RubyText {
        return mutate(ariadescribedby: value)
    }
    
    public func aria(details value: String) -> RubyText {
        return mutate(ariadetails: value)
    }
    
    public func aria(disabled value: Bool) -> RubyText {
        return mutate(ariadisabled: value)
    }
    
    public func aria(errorMessage value: String) -> RubyText {
        return mutate(ariaerrormessage: value)
    }
    
    public func aria(flowTo value: String) -> RubyText {
        return mutate(ariaflowto: value)
    }
    
    public func aria(hasPopup value: Values.Accessibility.Popup) -> RubyText {
        return mutate(ariahaspopup: value.rawValue)
    }
    
    public func aria(hidden value: Bool) -> RubyText {
        return mutate(ariahidden: value)
    }
    
    public func aria(invalid value: Values.Accessibility.Invalid) -> RubyText {
        return mutate(ariainvalid: value.rawValue)
    }
    
    public func aria(keyShortcuts value: String) -> RubyText {
        return mutate(ariakeyshortcuts: value)
    }
    
    public func aria(label value: String) -> RubyText {
        return mutate(arialabel: value)
    }
    
    public func aria(labeledBy value: String) -> RubyText {
        return mutate(arialabeledby: value)
    }
    
    public func aria(live value: Values.Accessibility.Live) -> RubyText {
        return mutate(arialive: value.rawValue)
    }
    
    public func aria(owns value: String) -> RubyText {
        return mutate(ariaowns: value)
    }
    
    public func aria(relevant value: Values.Accessibility.Relevant) -> RubyText {
        return mutate(ariarelevant: value.rawValue)
    }
    
    public func aria(roleDescription value: String) -> RubyText {
        return mutate(ariaroledescription: value)
    }
}

/// The element represents nothing.
///
/// ```html
/// <rp></rp>
/// ```
public struct RubyPronunciation: ContentNode, RubyElement {

    internal var name: String { "rp" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [Content]

    public init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [Content]) {
        self.attributes = attributes
        self.content = content
    }
    
    public func modify(if condition: Bool, element: (RubyPronunciation) -> RubyPronunciation) -> RubyPronunciation {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (RubyPronunciation, T) -> RubyPronunciation) -> RubyPronunciation {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension RubyPronunciation: GlobalAttributes, GlobalEventAttributes, GlobalAriaAttributes {
    
    public func accessKey(_ value: Character) -> RubyPronunciation {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ value: Values.Capitalization) -> RubyPronunciation {
        return mutate(autocapitalize: value.rawValue)
    }

    public func autofocus() -> RubyPronunciation {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> RubyPronunciation {
        return mutate(class: value)
    }

    public func isEditable(_ value: Bool) -> RubyPronunciation {
        return mutate(contenteditable: value)
    }

    public func direction(_ value: Values.Direction) -> RubyPronunciation {
        return mutate(dir: value.rawValue)
    }

    public func isDraggable(_ value: Bool) -> RubyPronunciation {
        return mutate(draggable: value)
    }

    public func enterKeyHint(_ value: Values.Hint) -> RubyPronunciation {
        return mutate(enterkeyhint: value.rawValue)
    }

    public func hidden() -> RubyPronunciation {
        return mutate(hidden: "hidden")
    }
    
    public func hidden(_ condition: Bool) -> RubyPronunciation {
        
        if condition {
            return mutate(hidden: "hidden")
        }
        
        return self
    }

    public func inputMode(_ value: String) -> RubyPronunciation {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> RubyPronunciation {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> RubyPronunciation {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> RubyPronunciation {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> RubyPronunciation {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> RubyPronunciation {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> RubyPronunciation {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> RubyPronunciation {
        return mutate(id: value)
    }

    public func language(_ value: Values.Language) -> RubyPronunciation {
        return mutate(lang: value.rawValue)
    }

    public func nonce(_ value: String) -> RubyPronunciation {
        return mutate(nonce: value)
    }
    
    public func role(_ value: Values.Role) -> RubyPronunciation {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ value: Bool) -> RubyPronunciation {
        return mutate(spellcheck: value)
    }

    public func style(_ value: String) -> RubyPronunciation {
        return mutate(style: value)
    }

    public func tabIndex(_ value: Int) -> RubyPronunciation {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> RubyPronunciation {
        return mutate(title: value)
    }
    
    public func translate(_ value: Values.Decision) -> RubyPronunciation {
        return mutate(translate: value.rawValue)
    }
    
    public func custom(key: String, value: Any) -> RubyPronunciation {
        return mutate(key: key, value: value)
    }
    
    public func on(event: Events.Drag, _ value: String) -> RubyPronunciation {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> RubyPronunciation {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Wheel, _ value: String) -> RubyPronunciation {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> RubyPronunciation {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Mouse, _ value: String) -> RubyPronunciation {
        return mutate(key: event.rawValue, value: value)
    }

    public func aria(atomic value: Bool) -> RubyPronunciation {
        return mutate(ariaatomic: value)
    }
    
    public func aria(busy value: Bool) -> RubyPronunciation {
        return mutate(ariabusy: value)
    }
    
    public func aria(controls value: String) -> RubyPronunciation {
        return mutate(ariacontrols: value)
    }
    
    public func aria(current value: Values.Accessibility.Current) -> RubyPronunciation {
        return mutate(ariacurrent: value.rawValue)
    }
    
    public func aria(describedBy value: String) -> RubyPronunciation {
        return mutate(ariadescribedby: value)
    }
    
    public func aria(details value: String) -> RubyPronunciation {
        return mutate(ariadetails: value)
    }
    
    public func aria(disabled value: Bool) -> RubyPronunciation {
        return mutate(ariadisabled: value)
    }
    
    public func aria(errorMessage value: String) -> RubyPronunciation {
        return mutate(ariaerrormessage: value)
    }
    
    public func aria(flowTo value: String) -> RubyPronunciation {
        return mutate(ariaflowto: value)
    }
    
    public func aria(hasPopup value: Values.Accessibility.Popup) -> RubyPronunciation {
        return mutate(ariahaspopup: value.rawValue)
    }
    
    public func aria(hidden value: Bool) -> RubyPronunciation {
        return mutate(ariahidden: value)
    }
    
    public func aria(invalid value: Values.Accessibility.Invalid) -> RubyPronunciation {
        return mutate(ariainvalid: value.rawValue)
    }
    
    public func aria(keyShortcuts value: String) -> RubyPronunciation {
        return mutate(ariakeyshortcuts: value)
    }
    
    public func aria(label value: String) -> RubyPronunciation {
        return mutate(arialabel: value)
    }
    
    public func aria(labeledBy value: String) -> RubyPronunciation {
        return mutate(arialabeledby: value)
    }
    
    public func aria(live value: Values.Accessibility.Live) -> RubyPronunciation {
        return mutate(arialive: value.rawValue)
    }
    
    public func aria(owns value: String) -> RubyPronunciation {
        return mutate(ariaowns: value)
    }
    
    public func aria(relevant value: Values.Accessibility.Relevant) -> RubyPronunciation {
        return mutate(ariarelevant: value.rawValue)
    }
    
    public func aria(roleDescription value: String) -> RubyPronunciation {
        return mutate(ariaroledescription: value)
    }
}
