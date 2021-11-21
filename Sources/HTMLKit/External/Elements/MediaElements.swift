import OrderedCollections

/// The element
///
///
public struct Source: EmptyNode {

    internal var name: String { "source" }

    internal var attributes: OrderedDictionary<String, Any>?

    public init() {}
    
    internal init(attributes: OrderedDictionary<String, Any>?) {
        self.attributes = attributes
    }
}

extension Source: GlobalAttributes, TypeAttribute, SourceAttribute, SizesAttribute, MediaAttribute, WidthAttribute, HeightAttribute {
    
    public func accessKey(_ value: String) -> Source {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(accesskey: value))
        }
        
        return .init(attributes: update(accesskey: value, on: &attributes))
    }

    public func autocapitalize(_ type: Capitalization) -> Source {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(autocapitalize: type.rawValue))
        }
        
        return .init(attributes: update(autocapitalize: type.rawValue, on: &attributes))
    }

    public func autofocus() -> Source {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(autofocus: "autofocus"))
        }
        
        return .init(attributes: update(autofocus: "autofocus", on: &attributes))
    }

    public func `class`(_ value: String) -> Source {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(class: value))
        }
        
        return .init(attributes: update(class: value, on: &attributes))
    }

    public func isEditable(_ value: Bool) -> Source {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(contenteditable: true))
        }
        
        return .init(attributes: update(contenteditable: true, on: &attributes))
    }

    public func direction(_ type: Direction) -> Source {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(direction: type.rawValue))
        }
        
        return .init(attributes: update(direction: type.rawValue, on: &attributes))
    }

    public func isDraggable(_ value: Bool) -> Source {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(draggable: true))
        }
        
        return .init(attributes: update(draggable: true, on: &attributes))
    }

    public func enterKeyHint(_ type: Hint) -> Source {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(hint: type.rawValue))
        }
        
        return .init(attributes: update(hint: type.rawValue, on: &attributes))
    }

    public func hidden() -> Source {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(hidden: "hidden"))
        }
        
        return .init(attributes: update(hidden: "hidden", on: &attributes))
    }

    public func inputMode(_ value: String) -> Source {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(inputmode: value))
        }
        
        return .init(attributes: update(inputmode: value, on: &attributes))
    }

    public func `is`(_ value: String) -> Source {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(is: value))
        }
        
        return .init(attributes: update(is: value, on: &attributes))
    }

    public func itemId(_ value: String) -> Source {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemid: value))
        }
        
        return .init(attributes: update(itemid: value, on: &attributes))
    }

    public func itemProperty(_ value: String) -> Source {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemprop: value))
        }
        
        return .init(attributes: update(itemprop: value, on: &attributes))
    }

    public func itemReference(_ value: String) -> Source {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemref: value))
        }
        
        return .init(attributes: update(itemref: value, on: &attributes))
    }

    public func itemScope(_ value: String) -> Source {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemscope: value))
        }
        
        return .init(attributes: update(itemscope: value, on: &attributes))
    }

    public func id(_ value: String) -> Source {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(id: value))
        }
        
        return .init(attributes: update(id: value, on: &attributes))
    }

    public func language(_ type: Language) -> Source {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(lang: type.rawValue))
        }
        
        return .init(attributes: update(lang: type.rawValue, on: &attributes))
    }

    public func nonce(_ value: String) -> Source {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(nonce: value))
        }
        
        return .init(attributes: update(nonce: value, on: &attributes))
    }
    
    public func role(_ value: String) -> Source {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(role: value))
        }
        
        return .init(attributes: update(role: value, on: &attributes))
    }

    public func hasSpellCheck(_ value: Bool) -> Source {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(spellcheck: true))
        }
        
        return .init(attributes: update(spellcheck: true, on: &attributes))
    }

    public func style(_ value: String) -> Source {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(style: value))
        }
        
        return .init(attributes: update(style: value, on: &attributes))
    }

    public func tabIndex(_ value: String) -> Source {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(index: value))
        }
        
        return .init(attributes: update(index: value, on: &attributes))
    }

    public func title(_ value: String) -> Source {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(title: value))
        }
        
        return .init(attributes: update(title: value, on: &attributes))
    }

    public func translate(_ value: String) -> Source {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(translate: value))
        }
        
        return .init(attributes: update(translate: value, on: &attributes))
    }

    public func type(_ value: String) -> Source {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(type: value))
        }
        
        return .init(attributes: update(type: value, on: &attributes))
    }
    
    public func source(_ value: String) -> Source {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(source: value))
        }
        
        return .init(attributes: update(source: value, on: &attributes))
    }
    
    public func sizes(_ size: Int) -> Source {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(sizes: size))
        }
        
        return .init(attributes: update(sizes: size, on: &attributes))
    }
    
    public func media(_ value: Content) -> Source {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(media: value))
        }
        
        return .init(attributes: update(media: value, on: &attributes))
    }
    
    public func width(_ size: Int) -> Source {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(width: size))
        }
        
        return .init(attributes: update(width: size, on: &attributes))
    }
    
    public func height(_ size: Int) -> Source {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(height: size))
        }
        
        return .init(attributes: update(height: size, on: &attributes))
    }
}

extension Source: Content {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

/// The element
///
///
public struct Track: EmptyNode {

    internal var name: String { "track" }

    internal var attributes: OrderedDictionary<String, Any>?

    public init() {}
    
    internal init(attributes: OrderedDictionary<String, Any>?) {
        self.attributes = attributes
    }
}

extension Track: GlobalAttributes, KindAttribute, SourceAttribute, LabelAttribute, DefaultAttribute {
    
    public func accessKey(_ value: String) -> Track {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(accesskey: value))
        }
        
        return .init(attributes: update(accesskey: value, on: &attributes))
    }

    public func autocapitalize(_ type: Capitalization) -> Track {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(autocapitalize: type.rawValue))
        }
        
        return .init(attributes: update(autocapitalize: type.rawValue, on: &attributes))
    }

    public func autofocus() -> Track {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(autofocus: "autofocus"))
        }
        
        return .init(attributes: update(autofocus: "autofocus", on: &attributes))
    }

    public func `class`(_ value: String) -> Track {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(class: value))
        }
        
        return .init(attributes: update(class: value, on: &attributes))
    }

    public func isEditable(_ value: Bool) -> Track {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(contenteditable: true))
        }
        
        return .init(attributes: update(contenteditable: true, on: &attributes))
    }

    public func direction(_ type: Direction) -> Track {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(direction: type.rawValue))
        }
        
        return .init(attributes: update(direction: type.rawValue, on: &attributes))
    }

    public func isDraggable(_ value: Bool) -> Track {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(draggable: true))
        }
        
        return .init(attributes: update(draggable: true, on: &attributes))
    }

    public func enterKeyHint(_ type: Hint) -> Track {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(hint: type.rawValue))
        }
        
        return .init(attributes: update(hint: type.rawValue, on: &attributes))
    }

    public func hidden() -> Track {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(hidden: "hidden"))
        }
        
        return .init(attributes: update(hidden: "hidden", on: &attributes))
    }

    public func inputMode(_ value: String) -> Track {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(inputmode: value))
        }
        
        return .init(attributes: update(inputmode: value, on: &attributes))
    }

    public func `is`(_ value: String) -> Track {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(is: value))
        }
        
        return .init(attributes: update(is: value, on: &attributes))
    }

    public func itemId(_ value: String) -> Track {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemid: value))
        }
        
        return .init(attributes: update(itemid: value, on: &attributes))
    }

    public func itemProperty(_ value: String) -> Track {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemprop: value))
        }
        
        return .init(attributes: update(itemprop: value, on: &attributes))
    }

    public func itemReference(_ value: String) -> Track {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemref: value))
        }
        
        return .init(attributes: update(itemref: value, on: &attributes))
    }

    public func itemScope(_ value: String) -> Track {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemscope: value))
        }
        
        return .init(attributes: update(itemscope: value, on: &attributes))
    }

    public func id(_ value: String) -> Track {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(id: value))
        }
        
        return .init(attributes: update(id: value, on: &attributes))
    }

    public func language(_ type: Language) -> Track {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(lang: type.rawValue))
        }
        
        return .init(attributes: update(lang: type.rawValue, on: &attributes))
    }

    public func nonce(_ value: String) -> Track {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(nonce: value))
        }
        
        return .init(attributes: update(nonce: value, on: &attributes))
    }
    
    public func role(_ value: String) -> Track {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(role: value))
        }
        
        return .init(attributes: update(role: value, on: &attributes))
    }

    public func hasSpellCheck(_ value: Bool) -> Track {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(spellcheck: true))
        }
        
        return .init(attributes: update(spellcheck: true, on: &attributes))
    }

    public func style(_ value: String) -> Track {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(style: value))
        }
        
        return .init(attributes: update(style: value, on: &attributes))
    }

    public func tabIndex(_ value: String) -> Track {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(index: value))
        }
        
        return .init(attributes: update(index: value, on: &attributes))
    }

    public func title(_ value: String) -> Track {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(title: value))
        }
        
        return .init(attributes: update(title: value, on: &attributes))
    }

    public func translate(_ value: String) -> Track {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(translate: value))
        }
        
        return .init(attributes: update(translate: value, on: &attributes))
    }

    public func kind(_ value: Content) -> Track {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(kind: value))
        }
        
        return .init(attributes: update(kind: value, on: &attributes))
    }
    
    public func source(_ value: String) -> Track {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(source: value))
        }
        
        return .init(attributes: update(source: value, on: &attributes))
    }
    
    public func label(_ value: Content) -> Track {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(label: value))
        }
        
        return .init(attributes: update(label: value, on: &attributes))
    }
    
    public func `default`() -> Track {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(default: "default"))
        }
        
        return .init(attributes: update(default: "default", on: &attributes))
    }
}

extension Track: Content {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}
