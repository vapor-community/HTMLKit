import OrderedCollections

/// The element
///
///
public struct Title: ContentNode {

    internal var name: String { "title" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: String
    
    public init(@StringBuilder content: () -> String) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: String) {
        self.attributes = attributes
        self.content = content
    }
}

extension Title: GlobalAttributes {
    
    public func accessKey(_ value: String) -> Title {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(accesskey: value), content: content)
        }
        
        return .init(attributes: update(accesskey: value, on: &attributes), content: content)
    }
    
    public func autocapitalize(_ type: Capitalization) -> Title {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(autocapitalize: type.rawValue), content: content)
        }
        
        return .init(attributes: update(autocapitalize: type.rawValue, on: &attributes), content: content)
    }
    
    public func autofocus() -> Title {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(autofocus: "autofocus"), content: content)
        }
        
        return .init(attributes: update(autofocus: "autofocus", on: &attributes), content: content)
    }
    
    public func `class`(_ value: String) -> Title {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(class: value), content: content)
        }
        
        return .init(attributes: update(class: value, on: &attributes), content: content)
    }
    
    public func isEditable(_ value: Bool) -> Title {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(contenteditable: true), content: content)
        }
        
        return .init(attributes: update(contenteditable: true, on: &attributes), content: content)
    }
    
    public func direction(_ type: Direction) -> Title {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(direction: type.rawValue), content: content)
        }
        
        return .init(attributes: update(direction: type.rawValue, on: &attributes), content: content)
    }
    
    public func isDraggable(_ value: Bool) -> Title {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(draggable: true), content: content)
        }
        
        return .init(attributes: update(draggable: true, on: &attributes), content: content)
    }
    
    public func enterKeyHint(_ type: Hint) -> Title {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(hint: type.rawValue), content: content)
        }
        
        return .init(attributes: update(hint: type.rawValue, on: &attributes), content: content)
    }
    
    public func hidden() -> Title {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(hidden: "hidden"), content: content)
        }
        
        return .init(attributes: update(hidden: "hidden", on: &attributes), content: content)
    }
    
    public func inputMode(_ value: String) -> Title {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(inputmode: value), content: content)
        }
        
        return .init(attributes: update(inputmode: value, on: &attributes), content: content)
    }
    
    public func `is`(_ value: String) -> Title {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(is: value), content: content)
        }
        
        return .init(attributes: update(is: value, on: &attributes), content: content)
    }
    
    public func itemId(_ value: String) -> Title {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemid: value), content: content)
        }
        
        return .init(attributes: update(itemid: value, on: &attributes), content: content)
    }
    
    public func itemProperty(_ value: String) -> Title {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemprop: value), content: content)
        }
        
        return .init(attributes: update(itemprop: value, on: &attributes), content: content)
    }
    
    public func itemReference(_ value: String) -> Title {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemref: value), content: content)
        }
        
        return .init(attributes: update(itemref: value, on: &attributes), content: content)
    }
    
    public func itemScope(_ value: String) -> Title {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemscope: value), content: content)
        }
        
        return .init(attributes: update(itemscope: value, on: &attributes), content: content)
    }
    
    public func id(_ value: String) -> Title {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(id: value), content: content)
        }
        
        return .init(attributes: update(id: value, on: &attributes), content: content)
    }
    
    public func language(_ type: Language) -> Title {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(lang: type.rawValue), content: content)
        }
        
        return .init(attributes: update(lang: type.rawValue, on: &attributes), content: content)
    }
    
    public func nonce(_ value: String) -> Title {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(nonce: value), content: content)
        }
        
        return .init(attributes: update(nonce: value, on: &attributes), content: content)
    }
    
    public func role(_ value: String) -> Title {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(role: value), content: content)
        }
        
        return .init(attributes: update(role: value, on: &attributes), content: content)
    }
    
    public func hasSpellCheck(_ value: Bool) -> Title {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(spellcheck: true), content: content)
        }
        
        return .init(attributes: update(spellcheck: true, on: &attributes), content: content)
    }
    
    public func style(_ value: String) -> Title {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(style: value), content: content)
        }
        
        return .init(attributes: update(style: value, on: &attributes), content: content)
    }
    
    public func tabIndex(_ value: String) -> Title {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(index: value), content: content)
        }
        
        return .init(attributes: update(index: value, on: &attributes), content: content)
    }
    
    public func title(_ value: String) -> Title {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(title: value), content: content)
        }
        
        return .init(attributes: update(title: value, on: &attributes), content: content)
    }
    
    public func translate(_ value: String) -> Title {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(translate: value), content: content)
        }
        
        return .init(attributes: update(translate: value, on: &attributes), content: content)
    }
}

extension Title: Content {
    
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
public struct Base: EmptyNode {

    internal var name: String { "base" }

    internal var attributes: OrderedDictionary<String, Any>?

    public init() {}
    
    internal init(attributes: OrderedDictionary<String, Any>?) {
        self.attributes = attributes
    }
}

extension Base: GlobalAttributes, ReferenceAttribute, TargetAttribute {
    
    public func accessKey(_ value: String) -> Base {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(accesskey: value))
        }
        
        return .init(attributes: update(accesskey: value, on: &attributes))
    }
    
    public func autocapitalize(_ type: Capitalization) -> Base {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(autocapitalize: type.rawValue))
        }
        
        return .init(attributes: update(autocapitalize: type.rawValue, on: &attributes))
    }
    
    public func autofocus() -> Base {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(autofocus: "autofocus"))
        }
        
        return .init(attributes: update(autofocus: "autofocus", on: &attributes))
    }
    
    public func `class`(_ value: String) -> Base {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(class: value))
        }
        
        return .init(attributes: update(class: value, on: &attributes))
    }
    
    public func isEditable(_ value: Bool) -> Base {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(contenteditable: true))
        }
        
        return .init(attributes: update(contenteditable: true, on: &attributes))
    }
    
    public func direction(_ type: Direction) -> Base {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(direction: type.rawValue))
        }
        
        return .init(attributes: update(direction: type.rawValue, on: &attributes))
    }
    
    public func isDraggable(_ value: Bool) -> Base {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(draggable: true))
        }
        
        return .init(attributes: update(draggable: true, on: &attributes))
    }
    
    public func enterKeyHint(_ type: Hint) -> Base {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(hint: type.rawValue))
        }
        
        return .init(attributes: update(hint: type.rawValue, on: &attributes))
    }
    
    public func hidden() -> Base {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(hidden: "hidden"))
        }
        
        return .init(attributes: update(hidden: "hidden", on: &attributes))
    }
    
    public func inputMode(_ value: String) -> Base {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(inputmode: value))
        }
        
        return .init(attributes: update(inputmode: value, on: &attributes))
    }
    
    public func `is`(_ value: String) -> Base {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(is: value))
        }
        
        return .init(attributes: update(is: value, on: &attributes))
    }
    
    public func itemId(_ value: String) -> Base {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemid: value))
        }
        
        return .init(attributes: update(itemid: value, on: &attributes))
    }
    
    public func itemProperty(_ value: String) -> Base {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemprop: value))
        }
        
        return .init(attributes: update(itemprop: value, on: &attributes))
    }
    
    public func itemReference(_ value: String) -> Base {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemref: value))
        }
        
        return .init(attributes: update(itemref: value, on: &attributes))
    }
    
    public func itemScope(_ value: String) -> Base {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemscope: value))
        }
        
        return .init(attributes: update(itemscope: value, on: &attributes))
    }
    
    public func id(_ value: String) -> Base {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(id: value))
        }
        
        return .init(attributes: update(id: value, on: &attributes))
    }
    
    public func language(_ type: Language) -> Base {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(lang: type.rawValue))
        }
        
        return .init(attributes: update(lang: type.rawValue, on: &attributes))
    }
    
    public func nonce(_ value: String) -> Base {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(nonce: value))
        }
        
        return .init(attributes: update(nonce: value, on: &attributes))
    }
    
    public func role(_ value: String) -> Base {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(role: value))
        }
        
        return .init(attributes: update(role: value, on: &attributes))
    }
    
    public func hasSpellCheck(_ value: Bool) -> Base {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(spellcheck: true))
        }
        
        return .init(attributes: update(spellcheck: true, on: &attributes))
    }
    
    public func style(_ value: String) -> Base {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(style: value))
        }
        
        return .init(attributes: update(style: value, on: &attributes))
    }
    
    public func tabIndex(_ value: String) -> Base {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(index: value))
        }
        
        return .init(attributes: update(index: value, on: &attributes))
    }
    
    public func title(_ value: String) -> Base {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(title: value))
        }
        
        return .init(attributes: update(title: value, on: &attributes))
    }
    
    public func translate(_ value: String) -> Base {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(translate: value))
        }
        
        return .init(attributes: update(translate: value, on: &attributes))
    }
    
    public func reference(_ value: String) -> Base {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(ref: value))
        }
        
        return .init(attributes: update(ref: value, on: &attributes))
    }
    
    public func target(_ type: Target) -> Base {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(target: type.rawValue))
        }
        
        return .init(attributes: update(target: type.rawValue, on: &attributes))
    }
}

extension Base: Content {
    
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
public struct Meta: EmptyNode {

    internal var name: String { "meta" }

    internal var attributes: OrderedDictionary<String, Any>?

    public init() {}
    
    internal init(attributes: OrderedDictionary<String, Any>?) {
        self.attributes = attributes
    }
}

extension Meta: GlobalAttributes, ContentAttribute, NameAttribute, PropertyAttribute {
    
    public func accessKey(_ value: String) -> Meta {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(accesskey: value))
        }
        
        return .init(attributes: update(accesskey: value, on: &attributes))
    }

    public func autocapitalize(_ type: Capitalization) -> Meta {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(autocapitalize: type.rawValue))
        }
        
        return .init(attributes: update(autocapitalize: type.rawValue, on: &attributes))
    }

    public func autofocus() -> Meta {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(autofocus: "autofocus"))
        }
        
        return .init(attributes: update(autofocus: "autofocus", on: &attributes))
    }

    public func `class`(_ value: String) -> Meta {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(class: value))
        }
        
        return .init(attributes: update(class: value, on: &attributes))
    }

    public func isEditable(_ value: Bool) -> Meta {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(contenteditable: true))
        }
        
        return .init(attributes: update(contenteditable: true, on: &attributes))
    }

    public func direction(_ type: Direction) -> Meta {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(direction: type.rawValue))
        }
        
        return .init(attributes: update(direction: type.rawValue, on: &attributes))
    }

    public func isDraggable(_ value: Bool) -> Meta {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(draggable: true))
        }
        
        return .init(attributes: update(draggable: true, on: &attributes))
    }

    public func enterKeyHint(_ type: Hint) -> Meta {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(hint: type.rawValue))
        }
        
        return .init(attributes: update(hint: type.rawValue, on: &attributes))
    }

    public func hidden() -> Meta {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(hidden: "hidden"))
        }
        
        return .init(attributes: update(hidden: "hidden", on: &attributes))
    }

    public func inputMode(_ value: String) -> Meta {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(inputmode: value))
        }
        
        return .init(attributes: update(inputmode: value, on: &attributes))
    }

    public func `is`(_ value: String) -> Meta {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(is: value))
        }
        
        return .init(attributes: update(is: value, on: &attributes))
    }

    public func itemId(_ value: String) -> Meta {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemid: value))
        }
        
        return .init(attributes: update(itemid: value, on: &attributes))
    }

    public func itemProperty(_ value: String) -> Meta {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemprop: value))
        }
        
        return .init(attributes: update(itemprop: value, on: &attributes))
    }

    public func itemReference(_ value: String) -> Meta {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemref: value))
        }
        
        return .init(attributes: update(itemref: value, on: &attributes))
    }

    public func itemScope(_ value: String) -> Meta {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemscope: value))
        }
        
        return .init(attributes: update(itemscope: value, on: &attributes))
    }

    public func id(_ value: String) -> Meta {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(id: value))
        }
        
        return .init(attributes: update(id: value, on: &attributes))
    }

    public func language(_ type: Language) -> Meta {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(lang: type.rawValue))
        }
        
        return .init(attributes: update(lang: type.rawValue, on: &attributes))
    }

    public func nonce(_ value: String) -> Meta {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(nonce: value))
        }
        
        return .init(attributes: update(nonce: value, on: &attributes))
    }
    
    public func role(_ value: String) -> Meta {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(role: value))
        }
        
        return .init(attributes: update(role: value, on: &attributes))
    }

    public func hasSpellCheck(_ value: Bool) -> Meta {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(spellcheck: true))
        }
        
        return .init(attributes: update(spellcheck: true, on: &attributes))
    }

    public func style(_ value: String) -> Meta {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(style: value))
        }
        
        return .init(attributes: update(style: value, on: &attributes))
    }

    public func tabIndex(_ value: String) -> Meta {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(index: value))
        }
        
        return .init(attributes: update(index: value, on: &attributes))
    }

    public func title(_ value: String) -> Meta {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(title: value))
        }
        
        return .init(attributes: update(title: value, on: &attributes))
    }

    public func translate(_ value: String) -> Meta {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(translate: value))
        }
        
        return .init(attributes: update(translate: value, on: &attributes))
    }

    
    public func content(_ value: String) -> Meta {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(content: value))
        }
        
        return .init(attributes: update(content: value, on: &attributes))
    }
    
    public func name(_ type: NameType) -> Meta {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(name: type.rawValue))
        }
        
        return .init(attributes: update(name: type.rawValue, on: &attributes))
    }
    
    public func property(_ type: Graphs) -> Meta {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(property: type.rawValue))
        }
        
        return .init(attributes: update(property: type.rawValue, on: &attributes))
    }
}

extension Meta: Content {
    
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
public struct Style: ContentNode {

    internal var name: String { "style" }
    
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

extension Style: GlobalAttributes, TypeAttribute, MediaAttribute, LoadEventAttribute {
    
    public func onLoad(_ value: String) -> Style {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(onload: value), content: content)
        }
        
        return .init(attributes: update(onload: value, on: &attributes), content: content)
    }

    public func accessKey(_ value: String) -> Style {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(accesskey: value), content: content)
        }
        
        return .init(attributes: update(accesskey: value, on: &attributes), content: content)
    }

    public func autocapitalize(_ type: Capitalization) -> Style {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(autocapitalize: type.rawValue), content: content)
        }
        
        return .init(attributes: update(autocapitalize: type.rawValue, on: &attributes), content: content)
    }

    public func autofocus() -> Style {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(autofocus: "autofocus"), content: content)
        }
        
        return .init(attributes: update(autofocus: "autofocus", on: &attributes), content: content)
    }

    public func `class`(_ value: String) -> Style {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(class: value), content: content)
        }
        
        return .init(attributes: update(class: value, on: &attributes), content: content)
    }

    public func isEditable(_ value: Bool) -> Style {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(contenteditable: true), content: content)
        }
        
        return .init(attributes: update(contenteditable: true, on: &attributes), content: content)
    }

    public func direction(_ type: Direction) -> Style {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(direction: type.rawValue), content: content)
        }
        
        return .init(attributes: update(direction: type.rawValue, on: &attributes), content: content)
    }

    public func isDraggable(_ value: Bool) -> Style {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(draggable: true), content: content)
        }
        
        return .init(attributes: update(draggable: true, on: &attributes), content: content)
    }

    public func enterKeyHint(_ type: Hint) -> Style {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(hint: type.rawValue), content: content)
        }
        
        return .init(attributes: update(hint: type.rawValue, on: &attributes), content: content)
    }

    public func hidden() -> Style {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(hidden: "hidden"), content: content)
        }
        
        return .init(attributes: update(hidden: "hidden", on: &attributes), content: content)
    }

    public func inputMode(_ value: String) -> Style {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(inputmode: value), content: content)
        }
        
        return .init(attributes: update(inputmode: value, on: &attributes), content: content)
    }

    public func `is`(_ value: String) -> Style {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(is: value), content: content)
        }
        
        return .init(attributes: update(is: value, on: &attributes), content: content)
    }

    public func itemId(_ value: String) -> Style {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemid: value), content: content)
        }
        
        return .init(attributes: update(itemid: value, on: &attributes), content: content)
    }

    public func itemProperty(_ value: String) -> Style {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemprop: value), content: content)
        }
        
        return .init(attributes: update(itemprop: value, on: &attributes), content: content)
    }

    public func itemReference(_ value: String) -> Style {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemref: value), content: content)
        }
        
        return .init(attributes: update(itemref: value, on: &attributes), content: content)
    }

    public func itemScope(_ value: String) -> Style {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemscope: value), content: content)
        }
        
        return .init(attributes: update(itemscope: value, on: &attributes), content: content)
    }

    public func id(_ value: String) -> Style {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(id: value), content: content)
        }
        
        return .init(attributes: update(id: value, on: &attributes), content: content)
    }

    public func language(_ type: Language) -> Style {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(lang: type.rawValue), content: content)
        }
        
        return .init(attributes: update(lang: type.rawValue, on: &attributes), content: content)
    }

    public func nonce(_ value: String) -> Style {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(nonce: value), content: content)
        }
        
        return .init(attributes: update(nonce: value, on: &attributes), content: content)
    }
    
    public func role(_ value: String) -> Style {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(role: value), content: content)
        }
        
        return .init(attributes: update(role: value, on: &attributes), content: content)
    }
    
    public func hasSpellCheck(_ value: Bool) -> Style {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(spellcheck: true), content: content)
        }
        
        return .init(attributes: update(spellcheck: true, on: &attributes), content: content)
    }

    public func style(_ value: String) -> Style {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(style: value), content: content)
        }
        
        return .init(attributes: update(style: value, on: &attributes), content: content)
    }

    public func tabIndex(_ value: String) -> Style {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(index: value), content: content)
        }
        
        return .init(attributes: update(index: value, on: &attributes), content: content)
    }

    public func title(_ value: String) -> Style {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(title: value), content: content)
        }
        
        return .init(attributes: update(title: value, on: &attributes), content: content)
    }

    public func translate(_ value: String) -> Style {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(translate: value), content: content)
        }
        
        return .init(attributes: update(translate: value, on: &attributes), content: content)
    }

    
    public func type(_ value: String) -> Style {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(type: value), content: content)
        }
        
        return .init(attributes: update(type: value, on: &attributes), content: content)
    }
    
    public func media(_ value: Content) -> Style {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(media: value), content: content)
        }
        
        return .init(attributes: update(media: value, on: &attributes), content: content)
    }
}

extension Style: Content {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}
