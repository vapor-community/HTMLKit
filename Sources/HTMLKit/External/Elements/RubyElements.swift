import OrderedCollections

/// The alias points
///
///
public typealias Rt = RubyText

/// The alias points
///
///
public typealias Rp = RubyPronunciation

/// The element
///
///
public struct RubyText: ContentNode, RubyElement {

    internal var name: String { "rt" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension RubyText: GlobalAttributes {
    
    public func accessKey(_ value: String) -> RubyText {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> RubyText {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> RubyText {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> RubyText {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> RubyText {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> RubyText {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> RubyText {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> RubyText {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> RubyText {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> RubyText {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> RubyText {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> RubyText {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> RubyText {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> RubyText {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> RubyText {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> RubyText {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> RubyText {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> RubyText {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> RubyText {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> RubyText {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> RubyText {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> RubyText {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> RubyText {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> RubyText {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> RubyText {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> RubyText {
        return mutate(translate: value)
    }
}

extension RubyText: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension RubyText: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
}

/// The element
///
///
public struct RubyPronunciation: ContentNode, RubyElement {

    internal var name: String { "rp" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension RubyPronunciation: GlobalAttributes {
    
    public func accessKey(_ value: String) -> RubyPronunciation {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> RubyPronunciation {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> RubyPronunciation {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> RubyPronunciation {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> RubyPronunciation {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> RubyPronunciation {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> RubyPronunciation {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> RubyPronunciation {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> RubyPronunciation {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> RubyPronunciation {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> RubyPronunciation {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> RubyPronunciation {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> RubyPronunciation {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> RubyPronunciation {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> RubyPronunciation {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> RubyPronunciation {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> RubyPronunciation {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> RubyPronunciation {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> RubyPronunciation {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> RubyPronunciation {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> RubyPronunciation {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> RubyPronunciation {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> RubyPronunciation {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> RubyPronunciation {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> RubyPronunciation {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> RubyPronunciation {
        return mutate(translate: value)
    }
}

extension RubyPronunciation: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension RubyPronunciation: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
}
