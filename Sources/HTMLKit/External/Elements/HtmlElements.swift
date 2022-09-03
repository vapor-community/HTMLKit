/*
 Abstract:
 The file contains the html elements. The html-element 'html' only allows these elements to be its descendants.
 
 Authors:
 - Mats Moll (https://github.com/matsmoll)
 
 Contributors:
 - Mattes Mohr (https://github.com/mattesmohr)
 
 Note:
 If you about to add something to the file, stick to the official documentation to keep the code consistent.
 */

import OrderedCollections

/// The element contains the information about the document's content.
///
/// ```html
/// <head></head>
/// ```
public struct Head: ContentNode, HtmlElement {

    internal var name: String { "head" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [HeadElement]

    public init(@ContentBuilder<HeadElement> content: () -> [HeadElement]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [HeadElement]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Head: GlobalAttributes, GlobalEventAttributes {
    
    public func accessKey(_ value: Character) -> Head {
        return mutate(accesskey: value)
    }
    
    public func autocapitalize(_ type: Capitalization) -> Head {
        return mutate(autocapitalize: type.rawValue)
    }
    
    public func autofocus() -> Head {
        return mutate(autofocus: "autofocus")
    }
    
    public func `class`(_ value: String) -> Head {
        return mutate(class: value)
    }
    
    public func isEditable(_ condition: Bool) -> Head {
        return mutate(contenteditable: condition)
    }
    
    public func direction(_ type: Direction) -> Head {
        return mutate(dir: type.rawValue)
    }
    
    public func isDraggable(_ condition: Bool) -> Head {
        return mutate(draggable: condition)
    }
    
    public func enterKeyHint(_ type: Hint) -> Head {
        return mutate(enterkeyhint: type.rawValue)
    }
    
    public func hidden() -> Head {
        return mutate(hidden: "hidden")
    }
    
    public func inputMode(_ value: String) -> Head {
        return mutate(inputmode: value)
    }
    
    public func `is`(_ value: String) -> Head {
        return mutate(is: value)
    }
    
    public func itemId(_ value: String) -> Head {
        return mutate(itemid: value)
    }
    
    public func itemProperty(_ value: String) -> Head {
        return mutate(itemprop: value)
    }
    
    public func itemReference(_ value: String) -> Head {
        return mutate(itemref: value)
    }
    
    public func itemScope(_ value: String) -> Head {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Head {
        return mutate(itemtype: value)
    }
    
    public func id(_ value: String) -> Head {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Head {
        return mutate(id: value.rawValue)
    }
    
    public func language(_ type: Language) -> Head {
        return mutate(lang: type.rawValue)
    }
    
    public func nonce(_ value: String) -> Head {
        return mutate(nonce: value)
    }
    
    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Head {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> Head {
        return mutate(role: value.rawValue)
    }
    
    public func hasSpellCheck(_ condition: Bool) -> Head {
        return mutate(spellcheck: condition)
    }
    
    public func style(_ value: String) -> Head {
        return mutate(style: value)
    }
    
    public func tabIndex(_ value: Int) -> Head {
        return mutate(tabindex: value)
    }
    
    public func title(_ value: String) -> Head {
        return mutate(title: value)
    }
    
    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> Head {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> Head {
        return mutate(translate: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Head {
        return mutate(key: key, value: value)
    }
    
    public func on(event: Events.Drag, _ value: String) -> Head {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> Head {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Wheel, _ value: String) -> Head {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> Head {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Mouse, _ value: String) -> Head {
        return mutate(key: event.rawValue, value: value)
    }
}

extension Head: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Head: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// The element contains the document's content.
///
/// ```html
/// <body></body>
/// ```
public struct Body: ContentNode, HtmlElement {

    internal var name: String { "body" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [BodyElement]

    public init(@ContentBuilder<BodyElement> content: () -> [BodyElement]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [BodyElement]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Body: GlobalAttributes, GlobalEventAttributes, GlobalAriaAttributes, WindowEventAttribute {

    public func accessKey(_ value: Character) -> Body {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Body {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Body {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Body {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Body {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Body {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Body {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Body {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Body {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Body {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Body {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Body {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Body {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Body {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Body {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Body {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Body {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Body {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> Body {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Body {
        return mutate(nonce: value)
    }
    
    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Body {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> Body {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> Body {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Body {
        return mutate(style: value)
    }

    public func tabIndex(_ value: Int) -> Body {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Body {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> Body {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> Body {
        return mutate(translate: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Body {
        return mutate(key: key, value: value)
    }
    
    public func on(event: Events.Drag, _ value: String) -> Body {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> Body {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Window, _ value: String) -> Body {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> Body {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Mouse, _ value: String) -> Body {
        return mutate(key: event.rawValue, value: value)
    }

    public func on(event: Events.Wheel, _ value: String) -> Body {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func aria(atomic value: Bool) -> Body {
        return mutate(ariaatomic: value)
    }
    
    public func aria(busy value: Bool) -> Body {
        return mutate(ariabusy: value)
    }
    
    public func aria(controls value: String) -> Body {
        return mutate(ariacontrols: value)
    }
    
    public func aria(current value: Accessibility.Current) -> Body {
        return mutate(ariacurrent: value.rawValue)
    }
    
    public func aria(describedBy value: String) -> Body {
        return mutate(ariadescribedby: value)
    }
    
    public func aria(details value: String) -> Body {
        return mutate(ariadetails: value)
    }
    
    public func aria(disabled value: Bool) -> Body {
        return mutate(ariadisabled: value)
    }
    
    public func aria(errorMessage value: String) -> Body {
        return mutate(ariaerrormessage: value)
    }
    
    public func aria(flowTo value: String) -> Body {
        return mutate(ariaflowto: value)
    }
    
    public func aria(hasPopup value: Accessibility.Popup) -> Body {
        return mutate(ariahaspopup: value.rawValue)
    }
    
    public func aria(hidden value: Bool) -> Body {
        return mutate(ariahidden: value)
    }
    
    public func aria(invalid value: Accessibility.Invalid) -> Body {
        return mutate(ariainvalid: value.rawValue)
    }
    
    public func aria(keyShortcuts value: String) -> Body {
        return mutate(ariakeyshortcuts: value)
    }
    
    public func aria(label value: String) -> Body {
        return mutate(arialabel: value)
    }
    
    public func aria(labeledBy value: String) -> Body {
        return mutate(arialabeledby: value)
    }
    
    public func aria(live value: Accessibility.Live) -> Body {
        return mutate(arialive: value.rawValue)
    }
    
    public func aria(owns value: String) -> Body {
        return mutate(ariaowns: value)
    }
    
    public func aria(relevant value: Accessibility.Relevant) -> Body {
        return mutate(ariarelevant: value.rawValue)
    }
    
    public func aria(roleDescription value: String) -> Body {
        return mutate(ariaroledescription: value)
    }
}

extension Body: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Body: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}
