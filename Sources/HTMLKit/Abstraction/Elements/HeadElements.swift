/*
 Abstract:
 The file contains the head elements. The html-element 'head' only allows these elements to be its descendants.
 
 Authors:
 - Mats Moll (https://github.com/matsmoll)
 
 Contributors:
 - Mattes Mohr (https://github.com/mattesmohr)
 
 Note:
 If you about to add something to the file, stick to the official documentation to keep the code consistent.
 */

import OrderedCollections

/// The element represents the document's title.
///
/// ```html
/// <title></title>
/// ```
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
    
    public func modify(if condition: Bool, element: (Title) -> Title) -> Title {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Title, TemplateValue<T>) -> Title) -> Title {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return self.modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMasqueradingOptional {
                return self.modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                return self.modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

extension Title: GlobalAttributes, GlobalEventAttributes {
    
    public func accessKey(_ value: Character) -> Title {
        return mutate(accesskey: value)
    }
    
    public func autocapitalize(_ value: Values.Capitalization) -> Title {
        return mutate(autocapitalize: value.rawValue)
    }
    
    public func autofocus() -> Title {
        return mutate(autofocus: "autofocus")
    }
    
    public func `class`(_ value: String) -> Title {
        return mutate(class: value)
    }
    
    public func isEditable(_ value: Bool) -> Title {
        return mutate(contenteditable: value)
    }
    
    public func direction(_ value: Values.Direction) -> Title {
        return mutate(dir: value.rawValue)
    }
    
    public func isDraggable(_ value: Bool) -> Title {
        return mutate(draggable: value)
    }
    
    public func enterKeyHint(_ value: Values.Hint) -> Title {
        return mutate(enterkeyhint: value.rawValue)
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
    
    public func itemType(_ value: String) -> Title {
        return mutate(itemtype: value)
    }
    
    public func id(_ value: String) -> Title {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Title {
        return mutate(id: value.rawValue)
    }
    
    public func language(_ value: Values.Language) -> Title {
        return mutate(lang: value.rawValue)
    }
    
    public func nonce(_ value: String) -> Title {
        return mutate(nonce: value)
    }
    
    @available(*, deprecated, message: "use role(_ value: Values.Roles) instead")
    public func role(_ value: String) -> Title {
        return mutate(role: value)
    }
    
    public func role(_ value: Values.Role) -> Title {
        return mutate(role: value.rawValue)
    }
    
    public func hasSpellCheck(_ value: Bool) -> Title {
        return mutate(spellcheck: value)
    }
    
    public func style(_ value: String) -> Title {
        return mutate(style: value)
    }
    
    public func tabIndex(_ value: Int) -> Title {
        return mutate(tabindex: value)
    }
    
    public func title(_ value: String) -> Title {
        return mutate(title: value)
    }
    
    @available(*, deprecated, message: "use translate(_ value: Values.Decision) instead")
    public func translate(_ value: String) -> Title {
        return mutate(translate: value)
    }
    
    public func translate(_ value: Values.Decision) -> Title {
        return mutate(translate: value.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Title {
        return mutate(key: key, value: value)
    }
    
    public func on(event: Events.Drag, _ value: String) -> Title {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> Title {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Wheel, _ value: String) -> Title {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> Title {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Mouse, _ value: String) -> Title {
        return mutate(key: event.rawValue, value: value)
    }
}

extension Title: AnyContent {
    
    public func prerender(_ formula: Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

/// The element specifies the document base url.#
///
/// ```html
/// <base>
/// ```
public struct Base: EmptyNode, HeadElement {

    internal var name: String { "base" }

    internal var attributes: OrderedDictionary<String, Any>?

    public init() {}
    
    internal init(attributes: OrderedDictionary<String, Any>?) {
        self.attributes = attributes
    }
    
    public func modify(if condition: Bool, element: (Base) -> Base) -> Base {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Base, TemplateValue<T>) -> Base) -> Base {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return self.modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMasqueradingOptional {
                return self.modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                return self.modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

extension Base: GlobalAttributes, GlobalEventAttributes, ReferenceAttribute, TargetAttribute {
    
    public func accessKey(_ value: Character) -> Base {
        return mutate(accesskey: value)
    }
    
    public func autocapitalize(_ value: Values.Capitalization) -> Base {
        return mutate(autocapitalize: value.rawValue)
    }
    
    public func autofocus() -> Base {
        return mutate(autofocus: "autofocus")
    }
    
    public func `class`(_ value: String) -> Base {
        return mutate(class: value)
    }
    
    public func isEditable(_ value: Bool) -> Base {
        return mutate(contenteditable: value)
    }
    
    public func direction(_ value: Values.Direction) -> Base {
        return mutate(dir: value.rawValue)
    }
    
    public func isDraggable(_ value: Bool) -> Base {
        return mutate(draggable: value)
    }
    
    public func enterKeyHint(_ value: Values.Hint) -> Base {
        return mutate(enterkeyhint: value.rawValue)
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
    
    public func itemType(_ value: String) -> Base {
        return mutate(itemtype: value)
    }
    
    public func id(_ value: String) -> Base {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Base {
        return mutate(id: value.rawValue)
    }
    
    public func language(_ value: Values.Language) -> Base {
        return mutate(lang: value.rawValue)
    }
    
    public func nonce(_ value: String) -> Base {
        return mutate(nonce: value)
    }
    
    @available(*, deprecated, message: "use role(_ value: Values.Roles) instead")
    public func role(_ value: String) -> Base {
        return mutate(role: value)
    }
    
    public func role(_ value: Values.Role) -> Base {
        return mutate(role: value.rawValue)
    }
    
    public func hasSpellCheck(_ value: Bool) -> Base {
        return mutate(spellcheck: value)
    }
    
    public func style(_ value: String) -> Base {
        return mutate(style: value)
    }
    
    public func tabIndex(_ value: Int) -> Base {
        return mutate(tabindex: value)
    }
    
    public func title(_ value: String) -> Base {
        return mutate(title: value)
    }
    
    @available(*, deprecated, message: "use translate(_ value: Values.Decision) instead")
    public func translate(_ value: String) -> Base {
        return mutate(translate: value)
    }
    
    public func translate(_ value: Values.Decision) -> Base {
        return mutate(translate: value.rawValue)
    }
    
    public func reference(_ value: String) -> Base {
        return mutate(href: value)
    }
    
    public func reference(_ value: TemplateValue<String>) -> Base {
        return mutate(href: value.rawValue)
    }
    
    public func target(_ value: Values.Target) -> Base {
        return mutate(target: value.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Base {
        return mutate(key: key, value: value)
    }
    
    public func on(event: Events.Drag, _ value: String) -> Base {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> Base {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Wheel, _ value: String) -> Base {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> Base {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Mouse, _ value: String) -> Base {
        return mutate(key: event.rawValue, value: value)
    }
}

extension Base: AnyContent {
    
    public func prerender(_ formula: Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

/// The element provides meta information about the document.
///
/// ```html
/// <meta></meta>
/// ```
public struct Meta: EmptyNode, HeadElement {

    internal var name: String { "meta" }

    internal var attributes: OrderedDictionary<String, Any>?

    public init() {}
    
    internal init(attributes: OrderedDictionary<String, Any>?) {
        self.attributes = attributes
    }
    
    public func modify(if condition: Bool, element: (Meta) -> Meta) -> Meta {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Meta, TemplateValue<T>) -> Meta) -> Meta {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return self.modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMasqueradingOptional {
                return self.modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                return self.modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

extension Meta: GlobalAttributes, GlobalEventAttributes, ContentAttribute, NameAttribute, PropertyAttribute, CharsetAttribute, EquivalentAttribute {
    
    public func accessKey(_ value: Character) -> Meta {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ value: Values.Capitalization) -> Meta {
        return mutate(autocapitalize: value.rawValue)
    }

    public func autofocus() -> Meta {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Meta {
        return mutate(class: value)
    }

    public func isEditable(_ value: Bool) -> Meta {
        return mutate(contenteditable: value)
    }

    public func direction(_ value: Values.Direction) -> Meta {
        return mutate(dir: value.rawValue)
    }

    public func isDraggable(_ value: Bool) -> Meta {
        return mutate(draggable: value)
    }

    public func enterKeyHint(_ value: Values.Hint) -> Meta {
        return mutate(enterkeyhint: value.rawValue)
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
    
    public func itemType(_ value: String) -> Meta {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Meta {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Meta {
        return mutate(id: value.rawValue)
    }

    public func language(_ value: Values.Language) -> Meta {
        return mutate(lang: value.rawValue)
    }

    public func nonce(_ value: String) -> Meta {
        return mutate(nonce: value)
    }
    
    @available(*, deprecated, message: "use role(_ value: Values.Roles) instead")
    public func role(_ value: String) -> Meta {
        return mutate(role: value)
    }
    
    public func role(_ value: Values.Role) -> Meta {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ value: Bool) -> Meta {
        return mutate(spellcheck: value)
    }

    public func style(_ value: String) -> Meta {
        return mutate(style: value)
    }

    public func tabIndex(_ value: Int) -> Meta {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Meta {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ value: Values.Decision) instead")
    public func translate(_ value: String) -> Meta {
        return mutate(translate: value)
    }
    
    public func translate(_ value: Values.Decision) -> Meta {
        return mutate(translate: value.rawValue)
    }

    public func content(_ value: String) -> Meta {
        return mutate(content: value)
    }
    
    public func content(_ value: TemplateValue<String>) -> Meta {
        return mutate(content: value.rawValue)
    }
    
    public func name(_ value: Values.Name) -> Meta {
        return mutate(name: value.rawValue)
    }
    
    public func name(_ value: TemplateValue<Values.Name>) -> Meta {
        return mutate(name: value.rawValue)
    }
    
    public func property(_ value: Values.Graph) -> Meta {
        return mutate(property: value.rawValue)
    }
    
    public func charset(_ value: Values.Charset) -> Meta {
        return mutate(charset: value.rawValue)
    }
    
    public func equivalent(_ value: Values.Equivalent) -> Meta {
        return mutate(httpequiv: value.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Meta {
        return mutate(key: key, value: value)
    }
    
    public func on(event: Events.Drag, _ value: String) -> Meta {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> Meta {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Wheel, _ value: String) -> Meta {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> Meta {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Mouse, _ value: String) -> Meta {
        return mutate(key: event.rawValue, value: value)
    }
}

extension Meta: AnyContent {
    
    public func prerender(_ formula: Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

/// The element contains style information for the document.
///
/// ```html
/// <style></style>
/// ```
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
    
    public func modify(if condition: Bool, element: (Style) -> Style) -> Style {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Style, TemplateValue<T>) -> Style) -> Style {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return self.modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMasqueradingOptional {
                return self.modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                return self.modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

extension Style: GlobalAttributes, GlobalEventAttributes, TypeAttribute, MediaAttribute {

    public func accessKey(_ value: Character) -> Style {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ value: Values.Capitalization) -> Style {
        return mutate(autocapitalize: value.rawValue)
    }

    public func autofocus() -> Style {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Style {
        return mutate(class: value)
    }

    public func isEditable(_ value: Bool) -> Style {
        return mutate(contenteditable: value)
    }

    public func direction(_ value: Values.Direction) -> Style {
        return mutate(dir: value.rawValue)
    }

    public func isDraggable(_ value: Bool) -> Style {
        return mutate(draggable: value)
    }

    public func enterKeyHint(_ value: Values.Hint) -> Style {
        return mutate(enterkeyhint: value.rawValue)
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
    
    public func itemType(_ value: String) -> Style {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Style {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Style {
        return mutate(id: value.rawValue)
    }

    public func language(_ value: Values.Language) -> Style {
        return mutate(lang: value.rawValue)
    }

    public func nonce(_ value: String) -> Style {
        return mutate(nonce: value)
    }
    
    @available(*, deprecated, message: "use role(_ value: Values.Roles) instead")
    public func role(_ value: String) -> Style {
        return mutate(role: value)
    }
    
    public func role(_ value: Values.Role) -> Style {
        return mutate(role: value.rawValue)
    }
    
    public func hasSpellCheck(_ value: Bool) -> Style {
        return mutate(spellcheck: value)
    }

    public func style(_ value: String) -> Style {
        return mutate(style: value)
    }

    public func tabIndex(_ value: Int) -> Style {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Style {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ value: Values.Decision) instead")
    public func translate(_ value: String) -> Style {
        return mutate(translate: value)
    }
    
    public func translate(_ value: Values.Decision) -> Style {
        return mutate(translate: value.rawValue)
    }

    public func type(_ value: Values.Media) -> Style {
        return mutate(type: value.rawValue)
    }
    
    public func media(_ value: String) -> Style {
        return mutate(media: value)
    }
    
    public func custom(key: String, value: Any) -> Style {
        return mutate(key: key, value: value)
    }
    
    public func on(event: Events.Drag, _ value: String) -> Style {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> Style {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> Style {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Mouse, _ value: String) -> Style {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Wheel, _ value: String) -> Style {
        return mutate(key: event.rawValue, value: value)
    }
}

extension Style: AnyContent {
    
    public func prerender(_ formula: Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

/// The element represents a comment output.
///
/// ```html
/// <link>
/// ```
public struct Link: EmptyNode, HeadElement {

    internal var name: String { "link" }

    internal var attributes: OrderedDictionary<String, Any>?

    public init() {}
    
    internal init(attributes: OrderedDictionary<String, Any>?) {
        self.attributes = attributes
    }
    
    public func modify(if condition: Bool, element: (Link) -> Link) -> Link {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Link, TemplateValue<T>) -> Link) -> Link {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return self.modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMasqueradingOptional {
                return self.modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                return self.modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

extension Link: GlobalAttributes, GlobalEventAttributes, ReferenceAttribute, ReferenceLanguageAttribute, MediaAttribute, ReferrerPolicyAttribute, RelationshipAttribute, SizesAttribute, TypeAttribute, FormEventAttribute {
    
    public func accessKey(_ value: Character) -> Link {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ value: Values.Capitalization) -> Link {
        return mutate(autocapitalize: value.rawValue)
    }

    public func autofocus() -> Link {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Link {
        return mutate(class: value)
    }

    public func isEditable(_ value: Bool) -> Link {
        return mutate(contenteditable: value)
    }

    public func direction(_ value: Values.Direction) -> Link {
        return mutate(dir: value.rawValue)
    }

    public func isDraggable(_ value: Bool) -> Link {
        return mutate(draggable: value)
    }

    public func enterKeyHint(_ value: Values.Hint) -> Link {
        return mutate(enterkeyhint: value.rawValue)
    }

    public func hidden() -> Link {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Link {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Link {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Link {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Link {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Link {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Link {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Link {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Link {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Link {
        return mutate(id: value.rawValue)
    }

    public func language(_ value: Values.Language) -> Link {
        return mutate(lang: value.rawValue)
    }

    public func nonce(_ value: String) -> Link {
        return mutate(nonce: value)
    }
    
    @available(*, deprecated, message: "use role(_ value: Values.Roles) instead")
    public func role(_ value: String) -> Link {
        return mutate(role: value)
    }
    
    public func role(_ value: Values.Role) -> Link {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ value: Bool) -> Link {
        return mutate(spellcheck: value)
    }

    public func style(_ value: String) -> Link {
        return mutate(style: value)
    }

    public func tabIndex(_ value: Int) -> Link {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Link {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ value: Values.Decision) instead")
    public func translate(_ value: String) -> Link {
        return mutate(translate: value)
    }
    
    public func translate(_ value: Values.Decision) -> Link {
        return mutate(translate: value.rawValue)
    }
    
    public func reference(_ value: String) -> Link {
        return mutate(href: value)
    }
    
    public func reference(_ value: TemplateValue<String>) -> Link {
        return mutate(href: value.rawValue)
    }
    
    public func referenceLanguage(_ value: Values.Language) -> Link {
        return mutate(hreflang: value.rawValue)
    }
    
    public func media(_ value: String) -> Link {
        return mutate(media: value)
    }
    
    public func referrerPolicy(_ value: Values.Policy) -> Link {
        return mutate(referrerpolicy: value.rawValue)
    }
    
    public func relationship(_ value: Values.Relation) -> Link {
        return mutate(rel: value.rawValue)
    }
    
    public func sizes(_ size: Int) -> Link {
        return mutate(sizes: size)
    }
    
    public func type(_ value: Values.Media) -> Link {
        return mutate(type: value.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Link {
        return mutate(key: key, value: value)
    }
    
    public func on(event: Events.Form, _ value: String) -> Link {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Drag, _ value: String) -> Link {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> Link {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> Link {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Mouse, _ value: String) -> Link {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Wheel, _ value: String) -> Link {
        return mutate(key: event.rawValue, value: value)
    }
}

extension Link: AnyContent {
    
    public func prerender(_ formula: Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}
