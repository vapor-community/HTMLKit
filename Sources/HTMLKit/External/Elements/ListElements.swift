import OrderedCollections

/// The alias points
///
///
public typealias Li = ListItem

/// The element
///
///
public struct ListItem: ContentNode {

    internal var name: String { "li" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: Content

    public init(@ContentBuilder content: () -> Content) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: Content) {
        self.attributes = attributes
        self.content = content
    }
}

extension ListItem: GlobalAttributes, ValueAttribute {
    
    public func accessKey(_ value: String) -> ListItem {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(accesskey: value), content: content)
        }
        
        return .init(attributes: update(accesskey: value, on: &attributes), content: content)
    }

    public func autocapitalize(_ type: Capitalization) -> ListItem {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(autocapitalize: type.rawValue), content: content)
        }
        
        return .init(attributes: update(autocapitalize: type.rawValue, on: &attributes), content: content)
    }

    public func autofocus() -> ListItem {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(autofocus: "autofocus"), content: content)
        }
        
        return .init(attributes: update(autofocus: "autofocus", on: &attributes), content: content)
    }

    public func `class`(_ value: String) -> ListItem {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(class: value), content: content)
        }
        
        return .init(attributes: update(class: value, on: &attributes), content: content)
    }

    public func isEditable(_ value: Bool) -> ListItem {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(contenteditable: true), content: content)
        }
        
        return .init(attributes: update(contenteditable: true, on: &attributes), content: content)
    }

    public func direction(_ type: Direction) -> ListItem {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(direction: type.rawValue), content: content)
        }
        
        return .init(attributes: update(direction: type.rawValue, on: &attributes), content: content)
    }

    public func isDraggable(_ value: Bool) -> ListItem {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(draggable: true), content: content)
        }
        
        return .init(attributes: update(draggable: true, on: &attributes), content: content)
    }

    public func enterKeyHint(_ type: Hint) -> ListItem {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(hint: type.rawValue), content: content)
        }
        
        return .init(attributes: update(hint: type.rawValue, on: &attributes), content: content)
    }

    public func hidden() -> ListItem {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(hidden: "hidden"), content: content)
        }
        
        return .init(attributes: update(hidden: "hidden", on: &attributes), content: content)
    }

    public func inputMode(_ value: String) -> ListItem {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(inputmode: value), content: content)
        }
        
        return .init(attributes: update(inputmode: value, on: &attributes), content: content)
    }

    public func `is`(_ value: String) -> ListItem {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(is: value), content: content)
        }
        
        return .init(attributes: update(is: value, on: &attributes), content: content)
    }

    public func itemId(_ value: String) -> ListItem {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemid: value), content: content)
        }
        
        return .init(attributes: update(itemid: value, on: &attributes), content: content)
    }

    public func itemProperty(_ value: String) -> ListItem {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemprop: value), content: content)
        }
        
        return .init(attributes: update(itemprop: value, on: &attributes), content: content)
    }

    public func itemReference(_ value: String) -> ListItem {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemref: value), content: content)
        }
        
        return .init(attributes: update(itemref: value, on: &attributes), content: content)
    }

    public func itemScope(_ value: String) -> ListItem {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemscope: value), content: content)
        }
        
        return .init(attributes: update(itemscope: value, on: &attributes), content: content)
    }

    public func id(_ value: String) -> ListItem {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(id: value), content: content)
        }
        
        return .init(attributes: update(id: value, on: &attributes), content: content)
    }

    public func language(_ type: Language) -> ListItem {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(lang: type.rawValue), content: content)
        }
        
        return .init(attributes: update(lang: type.rawValue, on: &attributes), content: content)
    }

    public func nonce(_ value: String) -> ListItem {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(nonce: value), content: content)
        }
        
        return .init(attributes: update(nonce: value, on: &attributes), content: content)
    }

    public func role(_ value: String) -> ListItem {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(role: value), content: content)
        }
        
        return .init(attributes: update(role: value, on: &attributes), content: content)
    }

    public func hasSpellCheck(_ value: Bool) -> ListItem {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(spellcheck: true), content: content)
        }
        
        return .init(attributes: update(spellcheck: true, on: &attributes), content: content)
    }

    public func style(_ value: String) -> ListItem {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(style: value), content: content)
        }
        
        return .init(attributes: update(style: value, on: &attributes), content: content)
    }

    public func tabIndex(_ value: String) -> ListItem {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(index: value), content: content)
        }
        
        return .init(attributes: update(index: value, on: &attributes), content: content)
    }

    public func title(_ value: String) -> ListItem {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(title: value), content: content)
        }
        
        return .init(attributes: update(title: value, on: &attributes), content: content)
    }

    public func translate(_ value: String) -> ListItem {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(translate: value), content: content)
        }
        
        return .init(attributes: update(translate: value, on: &attributes), content: content)
    }
    
    public func value(_ value: String) -> ListItem {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(value: value), content: content)
        }
        
        return .init(attributes: update(value: value, on: &attributes), content: content)
    }
}

extension ListItem: Content {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}
