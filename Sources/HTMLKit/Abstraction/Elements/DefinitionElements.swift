/*
 Abstract:
 The file contains the definition elements. The html-element 'description' only allows these elements to be its descendants.
 
 Note:
 If you about to add something to the file, stick to the official documentation to keep the code consistent.
 */

import OrderedCollections

/// The alias for the element TermName.
///
/// Dt is the official tag and can be used instead of TermName.
///
/// ```html
/// <dt>
/// ```
@_documentation(visibility: internal)
public typealias Dt = TermName

/// The alias for the element TermDefinition.
///
/// Dd is the official tag and can be used instead of TermDefinition.
///
/// ```html
/// <dd></dd>
/// ```
@_documentation(visibility: internal)
public typealias Dd = TermDefinition

/// The element specifies a term name.
///
/// ```html
/// <dt>
/// ```
public struct TermName: ContentNode, DescriptionElement {

    internal var name: String { "dt" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [Content]

    public init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [Content]) {
        self.attributes = attributes
        self.content = content
    }
    
    public func modify(if condition: Bool, element: (TermName) -> TermName) -> TermName {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (TermName, T) -> TermName) -> TermName {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension TermName: GlobalAttributes, GlobalEventAttributes, GlobalAriaAttributes {
    
    public func accessKey(_ value: Character) -> TermName {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ value: Values.Capitalization) -> TermName {
        return mutate(autocapitalize: value.rawValue)
    }

    public func autofocus() -> TermName {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> TermName {
        return mutate(class: value)
    }

    public func isEditable(_ value: Bool) -> TermName {
        return mutate(contenteditable: value)
    }

    public func direction(_ value: Values.Direction) -> TermName {
        return mutate(dir: value.rawValue)
    }

    public func isDraggable(_ value: Bool) -> TermName {
        return mutate(draggable: value)
    }

    public func enterKeyHint(_ value: Values.Hint) -> TermName {
        return mutate(enterkeyhint: value.rawValue)
    }

    public func hidden() -> TermName {
        return mutate(hidden: "hidden")
    }
    
    public func hidden(_ condition: Bool) -> TermName{
        
        if condition {
            return mutate(hidden: "hidden")
        }
        
        return self
    }

    @available(*, deprecated, message: "The inputmode attribute is actually an enumerated attribute. Use the inputMode(_: Mode) modifier instead.")
    public func inputMode(_ value: String) -> TermName {
        return mutate(inputmode: value)
    }
    
    public func inputMode(_ value: Values.Mode) -> TermName {
        return mutate(inputmode: value.rawValue)
    }

    public func `is`(_ value: String) -> TermName {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> TermName {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> TermName {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> TermName {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> TermName {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> TermName {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> TermName {
        return mutate(id: value)
    }

    public func language(_ value: Values.Language) -> TermName {
        return mutate(lang: value.rawValue)
    }

    public func nonce(_ value: String) -> TermName {
        return mutate(nonce: value)
    }

    public func role(_ value: Values.Role) -> TermName {
        return mutate(role: value.rawValue)
    }
    
    public func hasSpellCheck(_ value: Bool) -> TermName {
        return mutate(spellcheck: value)
    }

    public func style(_ value: String) -> TermName {
        return mutate(style: value)
    }

    public func tabIndex(_ value: Int) -> TermName {
        return mutate(tabindex: value)
    }

    @_disfavoredOverload
    public func title(_ value: String) -> TermName {
        return mutate(title: value)
    }
    
    public func title(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> TermName {
        return mutate(title: LocalizedString(key: localizedKey, table: tableName))
    }
    
    public func title(verbatim value: String) -> TermName {
        return mutate(title: value)
    }

    public func translate(_ value: Values.Decision) -> TermName {
        return mutate(translate: value.rawValue)
    }
    
    public func inert() -> TermName {
        return mutate(inert: "inert")
    }
    
    public func inert(_ condition: Bool) -> TermName {

        if condition {
            return mutate(inert: "inert")
        }
        
        return self
    }
    
    public func popover(_ value: Values.Popover.State) -> TermName {
        return mutate(popover: value.rawValue)
    }
    
    public func custom(key: String, value: Any) -> TermName {
        return mutate(key: key, value: value)
    }
    
    public func on(event: Events.Drag, _ value: String) -> TermName {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> TermName {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> TermName {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Mouse, _ value: String) -> TermName {
        return mutate(key: event.rawValue, value: value)
    }

    public func on(event: Events.Wheel, _ value: String) -> TermName {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func aria(atomic value: Bool) -> TermName {
        return mutate(ariaatomic: value)
    }
    
    public func aria(busy value: Bool) -> TermName {
        return mutate(ariabusy: value)
    }
    
    public func aria(controls value: String) -> TermName {
        return mutate(ariacontrols: value)
    }
    
    public func aria(current value: Values.Accessibility.Current) -> TermName {
        return mutate(ariacurrent: value.rawValue)
    }
    
    public func aria(describedBy value: String) -> TermName {
        return mutate(ariadescribedby: value)
    }
    
    public func aria(details value: String) -> TermName {
        return mutate(ariadetails: value)
    }
    
    public func aria(disabled value: Bool) -> TermName {
        return mutate(ariadisabled: value)
    }
    
    public func aria(errorMessage value: String) -> TermName {
        return mutate(ariaerrormessage: value)
    }
    
    public func aria(flowTo value: String) -> TermName {
        return mutate(ariaflowto: value)
    }
    
    public func aria(hasPopup value: Values.Accessibility.Popup) -> TermName {
        return mutate(ariahaspopup: value.rawValue)
    }
    
    public func aria(hidden value: Bool) -> TermName {
        return mutate(ariahidden: value)
    }
    
    public func aria(invalid value: Values.Accessibility.Invalid) -> TermName {
        return mutate(ariainvalid: value.rawValue)
    }
    
    public func aria(keyShortcuts value: String) -> TermName {
        return mutate(ariakeyshortcuts: value)
    }
    
    public func aria(label value: String) -> TermName {
        return mutate(arialabel: value)
    }
    
    public func aria(labeledBy value: String) -> TermName {
        return mutate(arialabeledby: value)
    }
    
    public func aria(live value: Values.Accessibility.Live) -> TermName {
        return mutate(arialive: value.rawValue)
    }
    
    public func aria(owns value: String) -> TermName {
        return mutate(ariaowns: value)
    }
    
    public func aria(relevant value: Values.Accessibility.Relevant) -> TermName {
        return mutate(ariarelevant: value.rawValue)
    }
    
    public func aria(roleDescription value: String) -> TermName {
        return mutate(ariaroledescription: value)
    }
}

/// The element specifies a term definition.
///
/// ```html
/// <dd></dd>
/// ```
public struct TermDefinition: ContentNode, DescriptionElement {

    internal var name: String { "dd" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [Content]

    public init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [Content]) {
        self.attributes = attributes
        self.content = content
    }
    
    public func modify(if condition: Bool, element: (TermDefinition) -> TermDefinition) -> TermDefinition {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (TermDefinition, T) -> TermDefinition) -> TermDefinition {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension TermDefinition: GlobalAttributes, GlobalEventAttributes, GlobalAriaAttributes {
    
    public func accessKey(_ value: Character) -> TermDefinition {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ value: Values.Capitalization) -> TermDefinition {
        return mutate(autocapitalize: value.rawValue)
    }

    public func autofocus() -> TermDefinition {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> TermDefinition {
        return mutate(class: value)
    }

    public func isEditable(_ value: Bool) -> TermDefinition {
        return mutate(contenteditable: value)
    }

    public func direction(_ value: Values.Direction) -> TermDefinition {
        return mutate(dir: value.rawValue)
    }

    public func isDraggable(_ value: Bool) -> TermDefinition {
        return mutate(draggable: value)
    }

    public func enterKeyHint(_ value: Values.Hint) -> TermDefinition {
        return mutate(enterkeyhint: value.rawValue)
    }

    public func hidden() -> TermDefinition {
        return mutate(hidden: "hidden")
    }
    
    public func hidden(_ condition: Bool) -> TermDefinition {
        
        if condition {
            return mutate(hidden: "hidden")
        }
        
        return self
    }

    @available(*, deprecated, message: "The inputmode attribute is actually an enumerated attribute. Use the inputMode(_: Mode) modifier instead.")
    public func inputMode(_ value: String) -> TermDefinition {
        return mutate(inputmode: value)
    }
    
    public func inputMode(_ value: Values.Mode) -> TermDefinition {
        return mutate(inputmode: value.rawValue)
    }

    public func `is`(_ value: String) -> TermDefinition {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> TermDefinition {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> TermDefinition {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> TermDefinition {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> TermDefinition {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> TermDefinition {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> TermDefinition {
        return mutate(id: value)
    }

    public func language(_ value: Values.Language) -> TermDefinition {
        return mutate(lang: value.rawValue)
    }

    public func nonce(_ value: String) -> TermDefinition {
        return mutate(nonce: value)
    }

    public func role(_ value: Values.Role) -> TermDefinition {
        return mutate(role: value.rawValue)
    }
    
    public func hasSpellCheck(_ value: Bool) -> TermDefinition {
        return mutate(spellcheck: value)
    }

    public func style(_ value: String) -> TermDefinition {
        return mutate(style: value)
    }

    public func tabIndex(_ value: Int) -> TermDefinition {
        return mutate(tabindex: value)
    }

    @_disfavoredOverload
    public func title(_ value: String) -> TermDefinition {
        return mutate(title: value)
    }
    
    public func title(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> TermDefinition {
        return mutate(title: LocalizedString(key: localizedKey, table: tableName))
    }
    
    public func title(verbatim value: String) -> TermDefinition {
        return mutate(title: value)
    }
    
    public func translate(_ value: Values.Decision) -> TermDefinition {
        return mutate(translate: value.rawValue)
    }
    
    public func inert() -> TermDefinition {
        return mutate(inert: "inert")
    }
    
    public func inert(_ condition: Bool) -> TermDefinition {

        if condition {
            return mutate(inert: "inert")
        }
        
        return self
    }
    
    public func popover(_ value: Values.Popover.State) -> TermDefinition {
        return mutate(popover: value.rawValue)
    }
    
    public func custom(key: String, value: Any) -> TermDefinition {
        return mutate(key: key, value: value)
    }
    
    public func on(event: Events.Drag, _ value: String) -> TermDefinition {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> TermDefinition {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> TermDefinition {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Mouse, _ value: String) -> TermDefinition {
        return mutate(key: event.rawValue, value: value)
    }

    public func on(event: Events.Wheel, _ value: String) -> TermDefinition {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func aria(atomic value: Bool) -> TermDefinition {
        return mutate(ariaatomic: value)
    }
    
    public func aria(busy value: Bool) -> TermDefinition {
        return mutate(ariabusy: value)
    }
    
    public func aria(controls value: String) -> TermDefinition {
        return mutate(ariacontrols: value)
    }
    
    public func aria(current value: Values.Accessibility.Current) -> TermDefinition {
        return mutate(ariacurrent: value.rawValue)
    }
    
    public func aria(describedBy value: String) -> TermDefinition {
        return mutate(ariadescribedby: value)
    }
    
    public func aria(details value: String) -> TermDefinition {
        return mutate(ariadetails: value)
    }
    
    public func aria(disabled value: Bool) -> TermDefinition {
        return mutate(ariadisabled: value)
    }
    
    public func aria(errorMessage value: String) -> TermDefinition {
        return mutate(ariaerrormessage: value)
    }
    
    public func aria(flowTo value: String) -> TermDefinition {
        return mutate(ariaflowto: value)
    }
    
    public func aria(hasPopup value: Values.Accessibility.Popup) -> TermDefinition {
        return mutate(ariahaspopup: value.rawValue)
    }
    
    public func aria(hidden value: Bool) -> TermDefinition {
        return mutate(ariahidden: value)
    }
    
    public func aria(invalid value: Values.Accessibility.Invalid) -> TermDefinition {
        return mutate(ariainvalid: value.rawValue)
    }
    
    public func aria(keyShortcuts value: String) -> TermDefinition {
        return mutate(ariakeyshortcuts: value)
    }
    
    public func aria(label value: String) -> TermDefinition {
        return mutate(arialabel: value)
    }
    
    public func aria(labeledBy value: String) -> TermDefinition {
        return mutate(arialabeledby: value)
    }
    
    public func aria(live value: Values.Accessibility.Live) -> TermDefinition {
        return mutate(arialive: value.rawValue)
    }
    
    public func aria(owns value: String) -> TermDefinition {
        return mutate(ariaowns: value)
    }
    
    public func aria(relevant value: Values.Accessibility.Relevant) -> TermDefinition {
        return mutate(ariarelevant: value.rawValue)
    }
    
    public func aria(roleDescription value: String) -> TermDefinition {
        return mutate(ariaroledescription: value)
    }
}
