import OrderedCollections

/// The alias points
///
///
public typealias Figcaption = FigureCaption

/// The element
///
///
public struct FigureCaption: ContentNode {

    internal var name: String { "figcaption" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: AnyContent

    public init(@ContentBuilder content: () -> AnyContent) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: AnyContent) {
        self.attributes = attributes
        self.content = content
    }
}

extension FigureCaption: GlobalAttributes {
    
    public func accessKey(_ value: String) -> FigureCaption {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> FigureCaption {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> FigureCaption {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> FigureCaption {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> FigureCaption {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> FigureCaption {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> FigureCaption {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> FigureCaption {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> FigureCaption {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> FigureCaption {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> FigureCaption {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> FigureCaption {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> FigureCaption {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> FigureCaption {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> FigureCaption {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> FigureCaption {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> FigureCaption {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> FigureCaption {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> FigureCaption {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> FigureCaption {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> FigureCaption {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> FigureCaption {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> FigureCaption {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> FigureCaption {
        return mutate(translate: value)
    }
}

extension FigureCaption: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}
