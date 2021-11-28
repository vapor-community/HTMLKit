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
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Source {
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

    public func direction(_ type: Direction) -> Source {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Source {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Source {
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

    public func id(_ value: String) -> Source {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> Source {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Source {
        return mutate(nonce: value)
    }
    
    public func role(_ value: String) -> Source {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Source {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Source {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Source {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Source {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Source {
        return mutate(translate: value)
    }

    public func type(_ value: String) -> Source {
        return mutate(type: value)
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
}

extension Source: AnyContent {
    
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
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Track {
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

    public func direction(_ type: Direction) -> Track {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Track {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Track {
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

    public func itemScope(_ value: String) -> Track {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> Track {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> Track {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Track {
        return mutate(nonce: value)
    }
    
    public func role(_ value: String) -> Track {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Track {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Track {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Track {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Track {
        return  mutate(title: value)
    }

    public func translate(_ value: String) -> Track {
        return mutate(translate: value)
    }

    public func kind(_ value: String) -> Track {
        return mutate(kind: value)
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
}

extension Track: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}
