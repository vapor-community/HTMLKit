import OrderedCollections

/// The element
///
///
public struct Title: ContentNode, HeadElement {

    internal var name: String { "title" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [String]
    
    public init(@ContentBuilder<String> content: () -> [String]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [String]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Title: GlobalAttributes {
    
    public func accessKey(_ value: String) -> Title {
        return mutate(accesskey: value)
    }
    
    public func autocapitalize(_ type: Capitalization) -> Title {
        return mutate(autocapitalize: type.rawValue)
    }
    
    public func autofocus() -> Title {
        return mutate(autofocus: "autofocus")
    }
    
    public func `class`(_ value: String) -> Title {
        return mutate(class: value)
    }
    
    public func isEditable(_ condition: Bool) -> Title {
        return mutate(contenteditable: condition)
    }
    
    public func direction(_ type: Direction) -> Title {
        return mutate(dir: type.rawValue)
    }
    
    public func isDraggable(_ condition: Bool) -> Title {
        return mutate(draggable: condition)
    }
    
    public func enterKeyHint(_ type: Hint) -> Title {
        return mutate(enterkeyhint: type.rawValue)
    }
    
    public func hidden() -> Title {
        return mutate(hidden: "hidden")
    }
    
    public func inputMode(_ value: String) -> Title {
        return mutate(inputmode: value)
    }
    
    public func `is`(_ value: String) -> Title {
        return mutate(is: value)
    }
    
    public func itemId(_ value: String) -> Title {
        return mutate(itemid: value)
    }
    
    public func itemProperty(_ value: String) -> Title {
        return mutate(itemprop: value)
    }
    
    public func itemReference(_ value: String) -> Title {
        return mutate(itemref: value)
    }
    
    public func itemScope(_ value: String) -> Title {
        return mutate(itemscope: value)
    }
    
    public func id(_ value: String) -> Title {
        return mutate(id: value)
    }
    
    public func language(_ type: Language) -> Title {
        return mutate(lang: type.rawValue)
    }
    
    public func nonce(_ value: String) -> Title {
        return mutate(nonce: value)
    }
    
    public func role(_ value: String) -> Title {
        return mutate(role: value)
    }
    
    public func hasSpellCheck(_ condition: Bool) -> Title {
        return mutate(spellcheck: condition)
    }
    
    public func style(_ value: String) -> Title {
        return mutate(style: value)
    }
    
    public func tabIndex(_ value: String) -> Title {
        return mutate(tabindex: value)
    }
    
    public func title(_ value: String) -> Title {
        return mutate(title: value)
    }
    
    public func translate(_ value: String) -> Title {
        return mutate(translate: value)
    }
}

extension Title: AnyContent {
    
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
public struct Base: EmptyNode, HeadElement {

    internal var name: String { "base" }

    internal var attributes: OrderedDictionary<String, Any>?

    public init() {}
    
    internal init(attributes: OrderedDictionary<String, Any>?) {
        self.attributes = attributes
    }
}

extension Base: GlobalAttributes, ReferenceAttribute, TargetAttribute {
    
    public func accessKey(_ value: String) -> Base {
        return mutate(accesskey: value)
    }
    
    public func autocapitalize(_ type: Capitalization) -> Base {
        return mutate(autocapitalize: type.rawValue)
    }
    
    public func autofocus() -> Base {
        return mutate(autofocus: "autofocus")
    }
    
    public func `class`(_ value: String) -> Base {
        return mutate(class: value)
    }
    
    public func isEditable(_ condition: Bool) -> Base {
        return mutate(contenteditable: condition)
    }
    
    public func direction(_ type: Direction) -> Base {
        return mutate(dir: type.rawValue)
    }
    
    public func isDraggable(_ condition: Bool) -> Base {
        return mutate(draggable: condition)
    }
    
    public func enterKeyHint(_ type: Hint) -> Base {
        return mutate(enterkeyhint: type.rawValue)
    }
    
    public func hidden() -> Base {
        return mutate(hidden: "hidden")
    }
    
    public func inputMode(_ value: String) -> Base {
        return mutate(inputmode: value)
    }
    
    public func `is`(_ value: String) -> Base {
        return mutate(is: value)
    }
    
    public func itemId(_ value: String) -> Base {
        return mutate(itemid: value)
    }
    
    public func itemProperty(_ value: String) -> Base {
        return mutate(itemprop: value)
    }
    
    public func itemReference(_ value: String) -> Base {
        return mutate(itemref: value)
    }
    
    public func itemScope(_ value: String) -> Base {
        return mutate(itemscope: value)
    }
    
    public func id(_ value: String) -> Base {
        return mutate(id: value)
    }
    
    public func language(_ type: Language) -> Base {
        return mutate(lang: type.rawValue)
    }
    
    public func nonce(_ value: String) -> Base {
        return mutate(nonce: value)
    }
    
    public func role(_ value: String) -> Base {
        return mutate(role: value)
    }
    
    public func hasSpellCheck(_ condition: Bool) -> Base {
        return mutate(spellcheck: condition)
    }
    
    public func style(_ value: String) -> Base {
        return mutate(style: value)
    }
    
    public func tabIndex(_ value: String) -> Base {
        return mutate(tabindex: value)
    }
    
    public func title(_ value: String) -> Base {
        return mutate(title: value)
    }
    
    public func translate(_ value: String) -> Base {
        return mutate(translate: value)
    }
    
    public func reference(_ value: String) -> Base {
        return mutate(href: value)
    }
    
    public func target(_ type: Target) -> Base {
        return mutate(target: type.rawValue)
    }
}

extension Base: AnyContent {
    
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
public struct Meta: EmptyNode, HeadElement {

    internal var name: String { "meta" }

    internal var attributes: OrderedDictionary<String, Any>?

    public init() {}
    
    internal init(attributes: OrderedDictionary<String, Any>?) {
        self.attributes = attributes
    }
}

extension Meta: GlobalAttributes, ContentAttribute, NameAttribute, PropertyAttribute {
    
    public func accessKey(_ value: String) -> Meta {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Meta {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Meta {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Meta {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Meta {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Meta {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Meta {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Meta {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Meta {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Meta {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Meta {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Meta {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Meta {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Meta {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Meta {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> Meta {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> Meta {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Meta {
        return mutate(nonce: value)
    }
    
    public func role(_ value: String) -> Meta {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Meta {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Meta {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Meta {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Meta {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Meta {
        return mutate(translate: value)
    }

    public func content(_ value: String) -> Meta {
        return mutate(content: value)
    }
    
    public func name(_ type: NameType) -> Meta {
        return mutate(name: type.rawValue)
    }
    
    public func property(_ type: Graphs) -> Meta {
        return mutate(property: type.rawValue)
    }
}

extension Meta: AnyContent {
    
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
public struct Style: ContentNode, HeadElement {

    internal var name: String { "style" }
    
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

extension Style: GlobalAttributes, TypeAttribute, MediaAttribute, LoadEventAttribute {
    
    public func onLoad(_ value: String) -> Style {
        return mutate(onload: value)
    }

    public func accessKey(_ value: String) -> Style {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Style {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Style {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Style {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Style {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Style {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Style {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Style {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Style {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Style {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Style {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Style {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Style {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Style {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Style {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> Style {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> Style {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Style {
        return mutate(nonce: value)
    }
    
    public func role(_ value: String) -> Style {
        return mutate(role: value)
    }
    
    public func hasSpellCheck(_ condition: Bool) -> Style {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Style {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Style {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Style {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Style {
        return mutate(translate: value)
    }

    public func type(_ value: String) -> Style {
        return mutate(type: value)
    }
    
    public func media(_ value: String) -> Style {
        return mutate(media: value)
    }
}

extension Style: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}
