/*
 Abstract:
 The file contains the basic html-elements. These elements should be used at first in a html-document.
 
 Authors:
 - Mats Moll (https://github.com/matsmoll)
 
 Contributors:
 - Mattes Mohr (https://github.com/mattesmohr)
 
 Note:
 If you about to add something to the file, stick to the official documentation to keep the code consistent.
 */

import OrderedCollections

/// The element represents a comment output.
///
/// ```html
/// <!-- -->
/// ```
public struct Comment: CommentNode, GlobalElement {
    
    public var content: String
    
    public init(_ content: String) {
        self.content = content
    }
}

extension Comment: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

/// The element represents the document type.
///
/// ```html
/// <!DOCTYPE html>
/// ```
public struct Document: DocumentNode, BasicElement {
    
    public var content: String
    
    public init(type: Doctypes) {
        self.content = type.rawValue
    }
}

extension Document: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

/// The element represents the document's root element.
///
/// ```html
/// <html></html>
/// ```
public struct Html: ContentNode, BasicElement {

    internal var name: String { "html" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [HtmlElement]

    public init(@ContentBuilder<HtmlElement> content: () -> [HtmlElement]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [HtmlElement]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Html: GlobalAttributes, GlobalEventAttributes {
    
    public func accessKey(_ value: Character) -> Html {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Html {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Html {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Html {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Html {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Html {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Html {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Html {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Html {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Html {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Html {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Html {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Html {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Html {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Html {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Html {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Html {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Html {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> Html {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Html {
        return mutate(nonce: value)
    }
    
    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Html {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> Html {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> Html {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Html {
        return mutate(style: value)
    }

    public func tabIndex(_ value: Int) -> Html {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Html {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> Html {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> Html {
        return mutate(translate: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Html {
        return mutate(key: key, value: value)
    }
    
    public func on(event: Events.Drag, _ value: String) -> Html {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> Html {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> Html {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Mouse, _ value: String) -> Html {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Wheel, _ value: String) -> Html {
        return mutate(key: event.rawValue, value: value)
    }
}

extension Html: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Html: Modifiable {
    
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
