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
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(accesskey: value))
        }
        
        return .init(attributes: update(accesskey: value, on: &attributes))
    }

    public func autocapitalize(_ type: Capitalization) -> Parameter {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(autocapitalize: type.rawValue))
        }
        
        return .init(attributes: update(autocapitalize: type.rawValue, on: &attributes))
    }

    public func autofocus() -> Parameter {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(autofocus: "autofocus"))
        }
        
        return .init(attributes: update(autofocus: "autofocus", on: &attributes))
    }

    public func `class`(_ value: String) -> Parameter {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(class: value))
        }
        
        return .init(attributes: update(class: value, on: &attributes))
    }

    public func isEditable(_ value: Bool) -> Parameter {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(contenteditable: true))
        }
        
        return .init(attributes: update(contenteditable: true, on: &attributes))
    }

    public func direction(_ type: Direction) -> Parameter {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(direction: type.rawValue))
        }
        
        return .init(attributes: update(direction: type.rawValue, on: &attributes))
    }

    public func isDraggable(_ value: Bool) -> Parameter {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(draggable: true))
        }
        
        return .init(attributes: update(draggable: true, on: &attributes))
    }

    public func enterKeyHint(_ type: Hint) -> Parameter {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(hint: type.rawValue))
        }
        
        return .init(attributes: update(hint: type.rawValue, on: &attributes))
    }

    public func hidden() -> Parameter {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(hidden: "hidden"))
        }
        
        return .init(attributes: update(hidden: "hidden", on: &attributes))
    }

    public func inputMode(_ value: String) -> Parameter {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(inputmode: value))
        }
        
        return .init(attributes: update(inputmode: value, on: &attributes))
    }

    public func `is`(_ value: String) -> Parameter {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(is: value))
        }
        
        return .init(attributes: update(is: value, on: &attributes))
    }

    public func itemId(_ value: String) -> Parameter {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemid: value))
        }
        
        return .init(attributes: update(itemid: value, on: &attributes))
    }

    public func itemProperty(_ value: String) -> Parameter {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemprop: value))
        }
        
        return .init(attributes: update(itemprop: value, on: &attributes))
    }

    public func itemReference(_ value: String) -> Parameter {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemref: value))
        }
        
        return .init(attributes: update(itemref: value, on: &attributes))
    }

    public func itemScope(_ value: String) -> Parameter {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemscope: value))
        }
        
        return .init(attributes: update(itemscope: value, on: &attributes))
    }

    public func id(_ value: String) -> Parameter {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(id: value))
        }
        
        return .init(attributes: update(id: value, on: &attributes))
    }

    public func language(_ type: Language) -> Parameter {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(lang: type.rawValue))
        }
        
        return .init(attributes: update(lang: type.rawValue, on: &attributes))
    }

    public func nonce(_ value: String) -> Parameter {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(nonce: value))
        }
        
        return .init(attributes: update(nonce: value, on: &attributes))
    }
    
    public func role(_ value: String) -> Parameter {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(role: value))
        }
        
        return .init(attributes: update(role: value, on: &attributes))
    }

    public func hasSpellCheck(_ value: Bool) -> Parameter {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(spellcheck: true))
        }
        
        return .init(attributes: update(spellcheck: true, on: &attributes))
    }

    public func style(_ value: String) -> Parameter {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(style: value))
        }
        
        return .init(attributes: update(style: value, on: &attributes))
    }

    public func tabIndex(_ value: String) -> Parameter {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(index: value))
        }
        
        return .init(attributes: update(index: value, on: &attributes))
    }

    public func title(_ value: String) -> Parameter {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(title: value))
        }
        
        return .init(attributes: update(title: value, on: &attributes))
    }

    public func translate(_ value: String) -> Parameter {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(translate: value))
        }
        
        return .init(attributes: update(translate: value, on: &attributes))
    }

    public func name(_ type: NameType) -> Parameter {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(name: type.rawValue))
        }
        
        return .init(attributes: update(name: type.rawValue, on: &attributes))
    }
    
    public func value(_ value: String) -> Parameter {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(value: value))
        }
        
        return .init(attributes: update(value: value, on: &attributes))
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
