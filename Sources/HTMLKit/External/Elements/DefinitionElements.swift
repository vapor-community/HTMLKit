import OrderedCollections

/// The alias points
///
///
public typealias Dt = TermName

/// The alias points
///
///
public typealias Dd = TermDefinition

/// The element
///
///
public struct TermName: ContentNode, DefinitionElement {

    internal var name: String { "dt" }

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

extension TermName: GlobalAttributes {
    
    public func accessKey(_ value: String) -> TermName {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> TermName {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> TermName {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> TermName {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> TermName {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> TermName {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> TermName {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> TermName {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> TermName {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> TermName {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> TermName {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> TermName {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> TermName {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> TermName {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> TermName {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> TermName {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> TermName {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> TermName {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> TermName {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> TermName {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> TermName {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> TermName {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> TermName {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> TermName {
        return mutate(translate: value)
    }
}

extension TermName: AnyContent {
    
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
public struct TermDefinition: ContentNode, DefinitionElement {

    internal var name: String { "dd" }

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

extension TermDefinition: GlobalAttributes {
    
    public func accessKey(_ value: String) -> TermDefinition {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> TermDefinition {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> TermDefinition {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> TermDefinition {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> TermDefinition {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> TermDefinition {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> TermDefinition {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> TermDefinition {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> TermDefinition {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> TermDefinition {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> TermDefinition {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> TermDefinition {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> TermDefinition {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> TermDefinition {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> TermDefinition {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> TermDefinition {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> TermDefinition {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> TermDefinition {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> TermDefinition {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> TermDefinition {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> TermDefinition {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> TermDefinition {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> TermDefinition {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> TermDefinition {
        return mutate(translate: value)
    }
}

extension TermDefinition: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}
