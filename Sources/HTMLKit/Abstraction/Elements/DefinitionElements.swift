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
public typealias Dt = TermName

/// The alias for the element TermDefinition.
///
/// Dd is the official tag and can be used instead of TermDefinition.
///
/// ```html
/// <dd></dd>
/// ```
public typealias Dd = TermDefinition

/// The element specifies a term name.
///
/// ```html
/// <dt>
/// ```
public struct TermName: ContentNode, DescriptionElement {

    internal var name: String { "dt" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
    
    public func modify(if condition: Bool, element: (TermName) -> TermName) -> TermName {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (TermName, TemplateValue<T>) -> TermName) -> TermName {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return self.modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMasqueradingOptional {
                return self.modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                return self.modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
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

    public func inputMode(_ value: String) -> TermName {
        return mutate(inputmode: value)
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
    
    public func id(_ value: TemplateValue<String>) -> TermName {
        return mutate(id: value.rawValue)
    }

    public func language(_ value: Values.Language) -> TermName {
        return mutate(lang: value.rawValue)
    }

    public func nonce(_ value: String) -> TermName {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Values.Roles) instead")
    public func role(_ value: String) -> TermName {
        return mutate(role: value)
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

    public func title(_ value: String) -> TermName {
        return mutate(title: value)
    }
    
    @available(*, deprecated, message: "use translate(_ value: Values.Decision) instead")
    public func translate(_ value: String) -> TermName {
        return mutate(translate: value)
    }

    public func translate(_ value: Values.Decision) -> TermName {
        return mutate(translate: value.rawValue)
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

extension TermName: AnyContent {
    
    public func prerender(_ formula: Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: ContextManager<T>) throws -> String {
        try self.build(with: manager)
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

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
    
    public func modify(if condition: Bool, element: (TermDefinition) -> TermDefinition) -> TermDefinition {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (TermDefinition, TemplateValue<T>) -> TermDefinition) -> TermDefinition {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return self.modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMasqueradingOptional {
                return self.modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                return self.modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
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

    public func inputMode(_ value: String) -> TermDefinition {
        return mutate(inputmode: value)
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
    
    public func id(_ value: TemplateValue<String>) -> TermDefinition {
        return mutate(id: value.rawValue)
    }

    public func language(_ value: Values.Language) -> TermDefinition {
        return mutate(lang: value.rawValue)
    }

    public func nonce(_ value: String) -> TermDefinition {
        return mutate(nonce: value)
    }
    
    @available(*, deprecated, message: "use role(_ value: Values.Roles) instead")
    public func role(_ value: String) -> TermDefinition {
        return mutate(role: value)
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

    public func title(_ value: String) -> TermDefinition {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ value: Values.Decision) instead")
    public func translate(_ value: String) -> TermDefinition {
        return mutate(translate: value)
    }
    
    public func translate(_ value: Values.Decision) -> TermDefinition {
        return mutate(translate: value.rawValue)
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

extension TermDefinition: AnyContent {
    
    public func prerender(_ formula: Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}
