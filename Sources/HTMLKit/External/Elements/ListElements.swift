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
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> ListItem {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> ListItem {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> ListItem {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> ListItem {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> ListItem {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> ListItem {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> ListItem {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> ListItem {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> ListItem {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> ListItem {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> ListItem {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> ListItem {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> ListItem {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> ListItem {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> ListItem {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> ListItem {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> ListItem {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> ListItem {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> ListItem {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> ListItem {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> ListItem {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> ListItem {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> ListItem {
        return mutate(translate: value)
    }
    
    public func value(_ value: String) -> ListItem {
        return mutate(value: value)
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
