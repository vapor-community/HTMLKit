/*
 Abstract:
 The file contains the media elements. The html-element 'audio' or 'video' only allows these elements to be its descendants.
 
 Authors:
 - Mats Moll (https://github.com/matsmoll)
 
 Contributors:
 - Mattes Mohr (https://github.com/mattesmohr)
 
 Note:
 If you about to add something to the file, stick to the official documentation to keep the code consistent.
 */

import OrderedCollections

/// The element allows authors to specify multiple alternative source for other elements.
///
/// ```html
/// <source>
/// ```
public struct Source: EmptyNode, MediaElement {

    internal var name: String { "source" }

    internal var attributes: OrderedDictionary<String, Any>?

    public init() {}
    
    internal init(attributes: OrderedDictionary<String, Any>?) {
        self.attributes = attributes
    }
    
    public func modify(if condition: Bool, element: (Source) -> Source) -> Source {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Source, TemplateValue<T>) -> Source) -> Source {
        
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

extension Source: GlobalAttributes, GlobalEventAttributes, TypeAttribute, SourceAttribute, SizesAttribute, MediaAttribute, WidthAttribute, HeightAttribute {
    
    public func accessKey(_ value: Character) -> Source {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Values.Capitalization) -> Source {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Source {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Source {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Source {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Values.Direction) -> Source {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Source {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Values.Hint) -> Source {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Source {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Source {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Source {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Source {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Source {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Source {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Source {
        return mutate(itemscope: value)
    }

    public func itemType(_ value: String) -> Source {
        return mutate(itemtype: value)
    }
    
    public func id(_ value: String) -> Source {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Source {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Values.Language) -> Source {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Source {
        return mutate(nonce: value)
    }
    
    @available(*, deprecated, message: "use role(_ value: Values.Roles) instead")
    public func role(_ value: String) -> Source {
        return mutate(role: value)
    }
    
    public func role(_ value: Values.Role) -> Source {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> Source {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Source {
        return mutate(style: value)
    }

    public func tabIndex(_ value: Int) -> Source {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Source {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Values.Decision) instead")
    public func translate(_ value: String) -> Source {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Values.Decision) -> Source {
        return mutate(translate: type.rawValue)
    }

    public func type(_ value: Values.Media) -> Source {
        return mutate(type: value.rawValue)
    }
    
    public func source(_ value: String) -> Source {
        return mutate(source: value)
    }
    
    public func sizes(_ size: Int) -> Source {
        return mutate(sizes: size)
    }
    
    public func media(_ value: String) -> Source {
        return mutate(media: value)
    }
    
    public func width(_ size: Int) -> Source {
        return mutate(width: size)
    }
    
    public func height(_ size: Int) -> Source {
        return mutate(height: size)
    }
    
    public func custom(key: String, value: Any) -> Source {
        return mutate(key: key, value: value)
    }
    
    public func on(event: Events.Drag, _ value: String) -> Source {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> Source {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Wheel, _ value: String) -> Source {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> Source {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Mouse, _ value: String) -> Source {
        return mutate(key: event.rawValue, value: value)
    }
}

extension Source: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

/// The element allows to specify explicit external timed text tracks for media elements.
///
/// ```html
/// <track>
/// ```
public struct Track: EmptyNode, MediaElement {

    internal var name: String { "track" }

    internal var attributes: OrderedDictionary<String, Any>?

    public init() {}
    
    internal init(attributes: OrderedDictionary<String, Any>?) {
        self.attributes = attributes
    }
    
    public func modify(if condition: Bool, element: (Track) -> Track) -> Track {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Track, TemplateValue<T>) -> Track) -> Track {
        
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

extension Track: GlobalAttributes, GlobalEventAttributes, KindAttribute, SourceAttribute, LabelAttribute, DefaultAttribute {
    
    public func accessKey(_ value: Character) -> Track {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Values.Capitalization) -> Track {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Track {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Track {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Track {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Values.Direction) -> Track {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Track {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Values.Hint) -> Track {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Track {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Track {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Track {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Track {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Track {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Track {
        return mutate(itemref: value)
    }
    
    public func itemType(_ value: String) -> Track {
        return mutate(itemtype: value)
    }

    public func itemScope(_ value: String) -> Track {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> Track {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Track {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Values.Language) -> Track {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Track {
        return mutate(nonce: value)
    }
    
    @available(*, deprecated, message: "use role(_ value: Values.Roles) instead")
    public func role(_ value: String) -> Track {
        return mutate(role: value)
    }
    
    public func role(_ value: Values.Role) -> Track {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> Track {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Track {
        return mutate(style: value)
    }

    public func tabIndex(_ value: Int) -> Track {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Track {
        return  mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Values.Decision) instead")
    public func translate(_ value: String) -> Track {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Values.Decision) -> Track {
        return mutate(translate: type.rawValue)
    }

    @available(*, deprecated, message: "use translate(_ type: Values.Kinds) instead")
    public func kind(_ value: String) -> Track {
        return mutate(kind: value)
    }
    
    public func kind(_ type: Values.Kind) -> Track {
        return mutate(kind: type.rawValue)
    }
    
    public func source(_ value: String) -> Track {
        return mutate(source: value)
    }
    
    public func label(_ value: String) -> Track {
        return mutate(label: value)
    }
    
    public func `default`() -> Track {
        return  mutate(default: "default")
    }
    
    public func custom(key: String, value: Any) -> Track {
        return mutate(key: key, value: value)
    }
    
    public func on(event: Events.Drag, _ value: String) -> Track {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> Track {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Wheel, _ value: String) -> Track {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> Track {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Mouse, _ value: String) -> Track {
        return mutate(key: event.rawValue, value: value)
    }
}

extension Track: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}
