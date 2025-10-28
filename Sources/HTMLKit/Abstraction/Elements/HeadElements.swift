import Foundation
import OrderedCollections

/// An element that represents the document title.
///
/// Use `Title` to define a page title.
///
/// ```swift
/// Head {
///     Title {
///         "Lorem ipsum"
///     }
/// }
/// ```
public struct Title: ContentNode, HeadElement {

    internal var name: String { "title" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [String]
    
    /// Create a title.
    ///
    /// - Parameter content: The title's content.
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
    
    public func modify<T>(unwrap value: T?, element: (Title, T) -> Title) -> Title {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
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
    
    public func hidden(_ condition: Bool = true) -> Title {
        
        if condition {
            return mutate(hidden: "hidden")
        }
        
        return self
    }
    
    @available(*, deprecated, message: "The inputmode attribute is actually an enumerated attribute. Use the inputMode(_: Mode) modifier instead.")
    public func inputMode(_ value: String) -> Title {
        return mutate(inputmode: value)
    }
    
    public func inputMode(_ value: Values.Mode) -> Title {
        return mutate(inputmode: value.rawValue)
    }
    
    public func `is`(_ value: String) -> Title {
        return mutate(is: value)
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: [String]? = nil) -> Title {
        return self.mutate(itemscope: "itemscope").mutate(itemid: id).mutate(itemtype: schema?.absoluteString).mutate(itemref: elements?.joined(separator: " "))
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: String...) -> Title {
        return self.mutate(itemscope: "itemscope").mutate(itemid: id).mutate(itemtype: schema?.absoluteString).mutate(itemref: elements.joined(separator: " "))
    }
    
    @available(*, deprecated, message: "Use the item(id:as:for:) modifier instead.")
    public func itemId(_ value: String) -> Title {
        return mutate(itemid: value)
    }
    
    public func itemProperty(_ value: String) -> Title {
        return mutate(itemprop: value)
    }
    
    @available(*, deprecated, message: "Use the item(id:as:for:) modifier instead.")
    public func itemReference(_ value: String) -> Title {
        return mutate(itemref: value)
    }
    
    @available(*, deprecated, message: "Use the item(id:as:for:) modifier instead.")
    public func itemScope(_ value: String) -> Title {
        return mutate(itemscope: value)
    }
    
    @available(*, deprecated, message: "Use the item(id:as:for:) modifier instead.")
    public func itemType(_ value: String) -> Title {
        return mutate(itemtype: value)
    }
    
    public func id(_ value: String) -> Title {
        return mutate(id: value)
    }
    
    public func language(_ value: Values.Language) -> Title {
        return mutate(lang: value.rawValue)
    }
    
    public func nonce(_ value: String) -> Title {
        return mutate(nonce: value)
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
    
    @_disfavoredOverload
    public func title(_ value: String) -> Title {
        return mutate(title: value)
    }
    
    public func title(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> Title {
        return mutate(title: LocalizedString(key: localizedKey, table: tableName))
    }
    
    public func title(verbatim value: String) -> Title {
        return mutate(title: value)
    }
    
    public func translate(_ value: Values.Decision) -> Title {
        return mutate(translate: value.rawValue)
    }
    
    public func inert(_ condition: Bool = true) -> Title {

        if condition {
            return mutate(inert: "inert")
        }
        
        return self
    }
    
    public func popover(_ value: Values.Popover.State) -> Title {
        return mutate(popover: value.rawValue)
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

/// An element that represents the base url.
///
/// Use `Base` to specify the base url for the document.
///
/// ```swift
/// Head {
///     Base()
///         .reference("https://...")
///         .target(.blank)
/// }
/// ```
public struct Base: EmptyNode, HeadElement {

    internal var name: String { "base" }

    internal var attributes: OrderedDictionary<String, Any>?

    /// Create a base.
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
    
    public func modify<T>(unwrap value: T?, element: (Base, T) -> Base) -> Base {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
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
    
    public func hidden(_ condition: Bool = true) -> Base {
        
        if condition {
            return mutate(hidden: "hidden")
        }
        
        return self
    }
    
    @available(*, deprecated, message: "The inputmode attribute is actually an enumerated attribute. Use the inputMode(_: Mode) modifier instead.")
    public func inputMode(_ value: String) -> Base {
        return mutate(inputmode: value)
    }
    
    public func inputMode(_ value: Values.Mode) -> Base {
        return mutate(inputmode: value.rawValue)
    }
    
    public func `is`(_ value: String) -> Base {
        return mutate(is: value)
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: [String]? = nil) -> Base {
        return self.mutate(itemscope: "itemscope").mutate(itemid: id).mutate(itemtype: schema?.absoluteString).mutate(itemref: elements?.joined(separator: " "))
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: String...) -> Base {
        return self.mutate(itemscope: "itemscope").mutate(itemid: id).mutate(itemtype: schema?.absoluteString).mutate(itemref: elements.joined(separator: " "))
    }
    
    @available(*, deprecated, message: "Use the item(id:as:for:) modifier instead.")
    public func itemId(_ value: String) -> Base {
        return mutate(itemid: value)
    }
    
    public func itemProperty(_ value: String) -> Base {
        return mutate(itemprop: value)
    }
    
    @available(*, deprecated, message: "Use the item(id:as:for:) modifier instead.")
    public func itemReference(_ value: String) -> Base {
        return mutate(itemref: value)
    }
    
    @available(*, deprecated, message: "Use the item(id:as:for:) modifier instead.")
    public func itemScope(_ value: String) -> Base {
        return mutate(itemscope: value)
    }
    
    @available(*, deprecated, message: "Use the item(id:as:for:) modifier instead.")
    public func itemType(_ value: String) -> Base {
        return mutate(itemtype: value)
    }
    
    public func id(_ value: String) -> Base {
        return mutate(id: value)
    }
    
    public func language(_ value: Values.Language) -> Base {
        return mutate(lang: value.rawValue)
    }
    
    public func nonce(_ value: String) -> Base {
        return mutate(nonce: value)
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
    
    @_disfavoredOverload
    public func title(_ value: String) -> Base {
        return mutate(title: value)
    }
    
    public func title(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> Base {
        return mutate(title: LocalizedString(key: localizedKey, table: tableName))
    }
    
    public func title(verbatim value: String) -> Base {
        return mutate(title: value)
    }
    
    public func translate(_ value: Values.Decision) -> Base {
        return mutate(translate: value.rawValue)
    }
    
    public func inert(_ condition: Bool = true) -> Base {

        if condition {
            return mutate(inert: "inert")
        }
        
        return self
    }
    
    public func reference(_ value: String) -> Base {
        return mutate(href: value)
    }
    
    public func target(_ value: Values.Target) -> Base {
        return mutate(target: value.rawValue)
    }
    
    public func popover(_ value: Values.Popover.State) -> Base {
        return mutate(popover: value.rawValue)
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

/// An element that represents a document property.
///
/// Use `Meta` to add more context to a document.
///
/// ```swift
/// Head {
///     Meta()
///         .charset(.utf8)
/// }
/// ```
public struct Meta: EmptyNode, HeadElement {

    internal var name: String { "meta" }

    internal var attributes: OrderedDictionary<String, Any>?

    /// Create a meta.
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
    
    public func modify<T>(unwrap value: T?, element: (Meta, T) -> Meta) -> Meta {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
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
    
    public func hidden(_ condition: Bool = true) -> Meta {
        
        if condition {
            return mutate(hidden: "hidden")
        }
        
        return self
    }

    @available(*, deprecated, message: "The inputmode attribute is actually an enumerated attribute. Use the inputMode(_: Mode) modifier instead.")
    public func inputMode(_ value: String) -> Meta {
        return mutate(inputmode: value)
    }
    
    public func inputMode(_ value: Values.Mode) -> Meta {
        return mutate(inputmode: value.rawValue)
    }

    public func `is`(_ value: String) -> Meta {
        return mutate(is: value)
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: [String]? = nil) -> Meta {
        return self.mutate(itemscope: "itemscope").mutate(itemid: id).mutate(itemtype: schema?.absoluteString).mutate(itemref: elements?.joined(separator: " "))
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: String...) -> Meta {
        return self.mutate(itemscope: "itemscope").mutate(itemid: id).mutate(itemtype: schema?.absoluteString).mutate(itemref: elements.joined(separator: " "))
    }

    @available(*, deprecated, message: "Use the item(id:as:for:) modifier instead.")
    public func itemId(_ value: String) -> Meta {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Meta {
        return mutate(itemprop: value)
    }

    @available(*, deprecated, message: "Use the item(id:as:for:) modifier instead.")
    public func itemReference(_ value: String) -> Meta {
        return mutate(itemref: value)
    }

    @available(*, deprecated, message: "Use the item(id:as:for:) modifier instead.")
    public func itemScope(_ value: String) -> Meta {
        return mutate(itemscope: value)
    }
    
    @available(*, deprecated, message: "Use the item(id:as:for:) modifier instead.")
    public func itemType(_ value: String) -> Meta {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Meta {
        return mutate(id: value)
    }

    public func language(_ value: Values.Language) -> Meta {
        return mutate(lang: value.rawValue)
    }

    public func nonce(_ value: String) -> Meta {
        return mutate(nonce: value)
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

    @_disfavoredOverload
    public func title(_ value: String) -> Meta {
        return mutate(title: value)
    }
    
    public func title(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> Meta {
        return mutate(title: LocalizedString(key: localizedKey, table: tableName))
    }
    
    public func title(verbatim value: String) -> Meta {
        return mutate(title: value)
    }
    
    public func translate(_ value: Values.Decision) -> Meta {
        return mutate(translate: value.rawValue)
    }
    
    public func inert(_ condition: Bool = true) -> Meta {

        if condition {
            return mutate(inert: "inert")
        }
        
        return self
    }

    @_disfavoredOverload
    public func content(_ value: String) -> Meta {
        return mutate(content: value)
    }
    
    public func content(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> Meta {
        return mutate(content: LocalizedString(key: localizedKey, table: tableName))
    }
    
    public func content(verbatim value: String) -> Meta {
        return mutate(content: value)
    }
    
    public func name(_ value: Values.Name) -> Meta {
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
    
    public func popover(_ value: Values.Popover.State) -> Meta {
        return mutate(popover: value.rawValue)
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

/// An element that represents a style sheet.
///
/// Use `Style` to define and apply style rules.
///
/// ```swift
/// Style {
///     "p { color: black; }"
/// }
/// ```
public struct Style: ContentNode, HeadElement {

    internal var name: String { "style" }
    
    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [Content]

    /// Create a style.
    ///
    /// - Parameter content: The style's content.
    @available(*, deprecated, message: "Use the init(content:) -> [String] initializer instead.")
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }

    /// Create a style.
    ///
    /// - Parameter content: The style's content.
    public init(@ContentBuilder<String> content: () -> [String]) {
        self.content = [TaintedString(content().joined(), as: .css)]
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [Content]) {
        self.attributes = attributes
        self.content = content
    }
    
    public func modify(if condition: Bool, element: (Style) -> Style) -> Style {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (Style, T) -> Style) -> Style {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension Style: GlobalAttributes, GlobalEventAttributes, TypeAttribute, MediaAttribute, BlockingAttribute {

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
    
    public func hidden(_ condition: Bool = true) -> Style {
        
        if condition {
            return mutate(hidden: "hidden")
        }
        
        return self
    }

    @available(*, deprecated, message: "The inputmode attribute is actually an enumerated attribute. Use the inputMode(_: Mode) modifier instead.")
    public func inputMode(_ value: String) -> Style {
        return mutate(inputmode: value)
    }
    
    public func inputMode(_ value: Values.Mode) -> Style {
        return mutate(inputmode: value.rawValue)
    }

    public func `is`(_ value: String) -> Style {
        return mutate(is: value)
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: [String]? = nil) -> Style {
        return self.mutate(itemscope: "itemscope").mutate(itemid: id).mutate(itemtype: schema?.absoluteString).mutate(itemref: elements?.joined(separator: " "))
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: String...) -> Style {
        return self.mutate(itemscope: "itemscope").mutate(itemid: id).mutate(itemtype: schema?.absoluteString).mutate(itemref: elements.joined(separator: " "))
    }

    @available(*, deprecated, message: "Use the item(id:as:for:) modifier instead.")
    public func itemId(_ value: String) -> Style {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Style {
        return mutate(itemprop: value)
    }

    @available(*, deprecated, message: "Use the item(id:as:for:) modifier instead.")
    public func itemReference(_ value: String) -> Style {
        return mutate(itemref: value)
    }

    @available(*, deprecated, message: "Use the item(id:as:for:) modifier instead.")
    public func itemScope(_ value: String) -> Style {
        return mutate(itemscope: value)
    }
    
    @available(*, deprecated, message: "Use the item(id:as:for:) modifier instead.")
    public func itemType(_ value: String) -> Style {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Style {
        return mutate(id: value)
    }

    public func language(_ value: Values.Language) -> Style {
        return mutate(lang: value.rawValue)
    }

    public func nonce(_ value: String) -> Style {
        return mutate(nonce: value)
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

    @_disfavoredOverload
    public func title(_ value: String) -> Style {
        return mutate(title: value)
    }
    
    public func title(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> Style {
        return mutate(title: LocalizedString(key: localizedKey, table: tableName))
    }
    
    public func title(verbatim value: String) -> Style {
        return mutate(title: value)
    }
    
    public func translate(_ value: Values.Decision) -> Style {
        return mutate(translate: value.rawValue)
    }
    
    public func inert(_ condition: Bool = true) -> Style {

        if condition {
            return mutate(inert: "inert")
        }
        
        return self
    }

    public func type(_ value: Values.Media) -> Style {
        return mutate(type: value.rawValue)
    }
    
    public func media(_ value: String) -> Style {
        return mutate(media: value)
    }
    
    public func blocking(_ value: Values.Blocking) -> Style {
        return mutate(blocking: value.rawValue)
    }
    
    public func popover(_ value: Values.Popover.State) -> Style {
        return mutate(popover: value.rawValue)
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

/// An element that represents a resource link.
///
/// Use `Link` to associate an external resource with the document.
///
/// ```swift
/// Link()
///     .relationship(.stylesheet)
///     .reference("https://...")
/// ```
public struct Link: EmptyNode, HeadElement, BodyElement {

    internal var name: String { "link" }

    internal var attributes: OrderedDictionary<String, Any>?

    /// Create a link.
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
    
    public func modify<T>(unwrap value: T?, element: (Link, T) -> Link) -> Link {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension Link: GlobalAttributes, GlobalEventAttributes, ReferenceAttribute, ReferenceLanguageAttribute, MediaAttribute, ReferrerPolicyAttribute, RelationshipAttribute, SizesAttribute, TypeAttribute, FetchPriorityAttribute, BlockingAttribute, FormEventAttribute, IntegrityAttribute, AsAttribute, CrossOriginAttribute {

    public func accessKey(_ value: Character) -> Link {
        return mutate(accesskey: value)
    }
    
    public func `as`(_ value: Values.Resource) -> Link {
        return mutate(as: value.rawValue)
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
    
    public func crossOrigin(_ value: Credential.Mode) -> Link {
        return mutate(crossorigin: value.rawValue)
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
    
    public func hidden(_ condition: Bool = true) -> Link {
        
        if condition {
            return mutate(hidden: "hidden")
        }
        
        return self
    }

    @available(*, deprecated, message: "The inputmode attribute is actually an enumerated attribute. Use the inputMode(_: Mode) modifier instead.")
    public func inputMode(_ value: String) -> Link {
        return mutate(inputmode: value)
    }
    
    public func inputMode(_ value: Values.Mode) -> Link {
        return mutate(inputmode: value.rawValue)
    }
    
    public func integrity(_ hashes: String...) -> Link {
        return mutate(integrity: hashes.joined(separator: " "))
    }
    
    public func integrity(_ hashes: [String]) -> Link {
        return mutate(integrity: hashes.joined(separator: " "))
    }

    public func `is`(_ value: String) -> Link {
        return mutate(is: value)
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: [String]? = nil) -> Link {
        return self.mutate(itemscope: "itemscope").mutate(itemid: id).mutate(itemtype: schema?.absoluteString).mutate(itemref: elements?.joined(separator: " "))
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: String...) -> Link {
        return self.mutate(itemscope: "itemscope").mutate(itemid: id).mutate(itemtype: schema?.absoluteString).mutate(itemref: elements.joined(separator: " "))
    }

    @available(*, deprecated, message: "Use the item(id:as:for:) modifier instead.")
    public func itemId(_ value: String) -> Link {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Link {
        return mutate(itemprop: value)
    }

    @available(*, deprecated, message: "Use the item(id:as:for:) modifier instead.")
    public func itemReference(_ value: String) -> Link {
        return mutate(itemref: value)
    }

    @available(*, deprecated, message: "Use the item(id:as:for:) modifier instead.")
    public func itemScope(_ value: String) -> Link {
        return mutate(itemscope: value)
    }
    
    @available(*, deprecated, message: "Use the item(id:as:for:) modifier instead.")
    public func itemType(_ value: String) -> Link {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Link {
        return mutate(id: value)
    }

    public func language(_ value: Values.Language) -> Link {
        return mutate(lang: value.rawValue)
    }

    public func nonce(_ value: String) -> Link {
        return mutate(nonce: value)
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

    @_disfavoredOverload
    public func title(_ value: String) -> Link {
        return mutate(title: value)
    }
    
    public func title(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> Link {
        return mutate(title: LocalizedString(key: localizedKey, table: tableName))
    }
    
    public func title(verbatim value: String) -> Link {
        return mutate(title: value)
    }
    
    public func translate(_ value: Values.Decision) -> Link {
        return mutate(translate: value.rawValue)
    }
    
    public func inert(_ condition: Bool = true) -> Link {

        if condition {
            return mutate(inert: "inert")
        }
        
        return self
    }
    
    public func reference(_ value: String) -> Link {
        return mutate(href: value)
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
    
    public func fetchPriority(_ value: Values.Priority) -> Link {
        return mutate(fetchpriority: value.rawValue)
    }
    
    public func blocking(_ value: Values.Blocking) -> Link {
        return mutate(blocking: value.rawValue)
    }
    
    public func popover(_ value: Values.Popover.State) -> Link {
        return mutate(popover: value.rawValue)
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
