/// ## Description
/// The file contains the figure elements. The html element Head only allows these elements to be its
/// descendants.
///
/// ## Note
/// If you about to add something to the file, stick to the official documentation to keep the code consistent.
///
/// ## Authors
/// Mats Moll: https://github.com/matsmoll
/// Mattes Mohr: https://github.com/mattesmohr

import OrderedCollections

/// ## Description
/// The element represents the document's title.
///
/// There must be no more than one title element per document.
///
/// ## References
/// https://html.spec.whatwg.org/#the-title-element
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
    
    public func itemType(_ value: String) -> Title {
        return mutate(itemtype: value)
    }
    
    public func id(_ value: String) -> Title {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Title {
        return mutate(id: value.rawValue)
    }
    
    public func language(_ type: Language) -> Title {
        return mutate(lang: type.rawValue)
    }
    
    public func nonce(_ value: String) -> Title {
        return mutate(nonce: value)
    }
    
    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Title {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> Title {
        return mutate(role: value.rawValue)
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
    
    public func custom(key: String, value: Any) -> Title {
        return mutate(key: key, value: value)
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

extension Title: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}


/// ## Description
/// The element specifies the document base url.
///
/// There must be no more than one base element per document.
///
/// ## References
/// https://html.spec.whatwg.org/#the-base-element
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
    
    public func itemType(_ value: String) -> Base {
        return mutate(itemtype: value)
    }
    
    public func id(_ value: String) -> Base {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Base {
        return mutate(id: value.rawValue)
    }
    
    public func language(_ type: Language) -> Base {
        return mutate(lang: type.rawValue)
    }
    
    public func nonce(_ value: String) -> Base {
        return mutate(nonce: value)
    }
    
    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Base {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> Base {
        return mutate(role: value.rawValue)
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
    
    public func reference(_ value: TemplateValue<String>) -> Base {
        return mutate(href: value.rawValue)
    }
    
    public func target(_ type: Target) -> Base {
        return mutate(target: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Base {
        return mutate(key: key, value: value)
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

extension Base: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// ## Description
/// The element provides meta information about the document.
///
///
/// ## References
/// https://html.spec.whatwg.org/#the-meta-element
///
public struct Meta: EmptyNode, HeadElement {

    internal var name: String { "meta" }

    internal var attributes: OrderedDictionary<String, Any>?

    public init() {}
    
    internal init(attributes: OrderedDictionary<String, Any>?) {
        self.attributes = attributes
    }
}

extension Meta: GlobalAttributes, ContentAttribute, NameAttribute, PropertyAttribute, CharsetAttribute, EquivalentAttribute {
    
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
    
    public func itemType(_ value: String) -> Meta {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Meta {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Meta {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> Meta {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Meta {
        return mutate(nonce: value)
    }
    
    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Meta {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> Meta {
        return mutate(role: value.rawValue)
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
    
    public func content(_ value: TemplateValue<String>) -> Meta {
        return mutate(content: value.rawValue)
    }
    
    public func name(_ value: Names) -> Meta {
        return mutate(name: value.rawValue)
    }
    
    public func name(_ value: TemplateValue<Names>) -> Meta {
        return mutate(name: value.rawValue)
    }
    
    public func property(_ type: Graphs) -> Meta {
        return mutate(property: type.rawValue)
    }
    
    public func charset(_ value: Charset) -> Meta {
        return mutate(charset: value.rawValue)
    }
    
    public func equivalent(_ value: Equivalent) -> Meta {
        return mutate(httpequiv: value.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Meta {
        return mutate(key: key, value: value)
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

extension Meta: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// ## Description
/// The element contains style information for the document.
///
///
/// ## References
/// https://html.spec.whatwg.org/#the-style-element
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
    
    public func itemType(_ value: String) -> Style {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Style {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Style {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> Style {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Style {
        return mutate(nonce: value)
    }
    
    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Style {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> Style {
        return mutate(role: value.rawValue)
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

    public func type(_ value: Medias) -> Style {
        return mutate(type: value.rawValue)
    }
    
    public func media(_ value: String) -> Style {
        return mutate(media: value)
    }
    
    public func custom(key: String, value: Any) -> Style {
        return mutate(key: key, value: value)
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

extension Style: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

/// ## Description
/// The element represents a comment output.
///
/// ## References
/// https://html.spec.whatwg.org/#the-link-element
///
public struct Link: EmptyNode, HeadElement {

    internal var name: String { "link" }

    internal var attributes: OrderedDictionary<String, Any>?

    public init() {}
    
    internal init(attributes: OrderedDictionary<String, Any>?) {
        self.attributes = attributes
    }
}

extension Link: GlobalAttributes, ReferenceAttribute, ReferenceLanguageAttribute, MediaAttribute, ReferrerPolicyAttribute, RelationshipAttribute, SizesAttribute, TypeAttribute, ErrorEventAttribute, LoadEventAttribute {
    
    public func onError(_ value: String) -> Link {
        return mutate(onerror: value)
    }
    
    public func onLoad(_ value: String) -> Link {
        return mutate(onload: value)
    }
    
    public func accessKey(_ value: String) -> Link {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Link {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Link {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Link {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Link {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Link {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Link {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Link {
        return mutate(enterkeyhint: type.rawValue)
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

    public func language(_ type: Language) -> Link {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Link {
        return mutate(nonce: value)
    }
    
    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Link {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> Link {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> Link {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Link {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Link {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Link {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Link {
        return mutate(translate: value)
    }
    
    public func reference(_ value: String) -> Link {
        return mutate(href: value)
    }
    
    public func reference(_ value: TemplateValue<String>) -> Link {
        return mutate(href: value.rawValue)
    }
    
    public func referenceLanguage(_ type: Language) -> Link {
        return mutate(hreflang: type.rawValue)
    }
    
    public func media(_ value: String) -> Link {
        return mutate(media: value)
    }
    
    public func referrerPolicy(_ type: Policy) -> Link {
        return mutate(referrerpolicy: type.rawValue)
    }
    
    public func relationship(_ type: Relation) -> Link {
        return mutate(rel: type.rawValue)
    }
    
    public func sizes(_ size: Int) -> Link {
        return mutate(sizes: size)
    }
    
    public func type(_ value: Medias) -> Link {
        return mutate(type: value.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Link {
        return mutate(key: key, value: value)
    }
}

extension Link: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Link: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}
