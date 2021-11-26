import OrderedCollections

/// The element
///
///
public struct Parameter: EmptyNode {
    
    internal var name: String { "param" }

    internal var attributes: OrderedDictionary<String, Any>?

    public init() {}
    
    internal init(attributes: OrderedDictionary<String, Any>?) {
        self.attributes = attributes
    }
}

extension Parameter: GlobalAttributes, NameAttribute, ValueAttribute {
    
    public func accessKey(_ value: String) -> Parameter {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Parameter {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Parameter {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Parameter {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Parameter {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Parameter {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Parameter {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Parameter {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Parameter {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Parameter {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Parameter {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Parameter {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Parameter {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Parameter {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Parameter {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> Parameter {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> Parameter {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Parameter {
        return mutate(nonce: value)
    }
    
    public func role(_ value: String) -> Parameter {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Parameter {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Parameter {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Parameter {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Parameter {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Parameter {
        return mutate(translate: value)
    }

    public func name(_ type: NameType) -> Parameter {
        return mutate(name: type.rawValue)
    }
    
    public func value(_ value: String) -> Parameter {
        return mutate(value: value)
    }
}

extension Parameter: Content {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}
