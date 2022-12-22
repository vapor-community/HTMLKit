/*
 Abstract:
 The file contains the media elements. The html-element 'audio' or 'video' only allows these elements to be its descendants.

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
    
    public func modify<T>(unwrap value: T?, element: (Source, T) -> Source) -> Source {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension Source: GlobalAttributes, GlobalEventAttributes, TypeAttribute, SourceAttribute, SizesAttribute, MediaAttribute, WidthAttribute, HeightAttribute {
    
    public func accessKey(_ value: Character) -> Source {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ value: Values.Capitalization) -> Source {
        return mutate(autocapitalize: value.rawValue)
    }

    public func autofocus() -> Source {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Source {
        return mutate(class: value)
    }

    public func isEditable(_ value: Bool) -> Source {
        return mutate(contenteditable: value)
    }

    public func direction(_ value: Values.Direction) -> Source {
        return mutate(dir: value.rawValue)
    }

    public func isDraggable(_ value: Bool) -> Source {
        return mutate(draggable: value)
    }

    public func enterKeyHint(_ value: Values.Hint) -> Source {
        return mutate(enterkeyhint: value.rawValue)
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

    public func language(_ value: Values.Language) -> Source {
        return mutate(lang: value.rawValue)
    }

    public func nonce(_ value: String) -> Source {
        return mutate(nonce: value)
    }
    
    public func role(_ value: Values.Role) -> Source {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ value: Bool) -> Source {
        return mutate(spellcheck: value)
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
    
    public func translate(_ value: Values.Decision) -> Source {
        return mutate(translate: value.rawValue)
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
    
    public func modify<T>(unwrap value: T?, element: (Track, T) -> Track) -> Track {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension Track: GlobalAttributes, GlobalEventAttributes, KindAttribute, SourceAttribute, LabelAttribute, DefaultAttribute {
    
    public func accessKey(_ value: Character) -> Track {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ value: Values.Capitalization) -> Track {
        return mutate(autocapitalize: value.rawValue)
    }

    public func autofocus() -> Track {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Track {
        return mutate(class: value)
    }

    public func isEditable(_ value: Bool) -> Track {
        return mutate(contenteditable: value)
    }

    public func direction(_ value: Values.Direction) -> Track {
        return mutate(dir: value.rawValue)
    }

    public func isDraggable(_ value: Bool) -> Track {
        return mutate(draggable: value)
    }

    public func enterKeyHint(_ value: Values.Hint) -> Track {
        return mutate(enterkeyhint: value.rawValue)
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
    
    public func language(_ value: Values.Language) -> Track {
        return mutate(lang: value.rawValue)
    }

    public func nonce(_ value: String) -> Track {
        return mutate(nonce: value)
    }
    
    public func role(_ value: Values.Role) -> Track {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ value: Bool) -> Track {
        return mutate(spellcheck: value)
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
    
    public func translate(_ value: Values.Decision) -> Track {
        return mutate(translate: value.rawValue)
    }
    
    public func kind(_ value: Values.Kind) -> Track {
        return mutate(kind: value.rawValue)
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
