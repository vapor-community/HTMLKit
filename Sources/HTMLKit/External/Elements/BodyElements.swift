import OrderedCollections

/// The element
///
///
public struct Link: EmptyNode {

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

    public func id(_ value: String) -> Link {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> Link {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Link {
        return mutate(nonce: value)
    }
    
    public func role(_ value: String) -> Link {
        return mutate(role: value)
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
    
    public func type(_ value: String) -> Link {
        return mutate(type: value)
    }
}

extension Link: Content {
    
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
public struct Article: ContentNode {

    internal var name: String { "article" }

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

extension Article: GlobalAttributes {
    
    public func accessKey(_ value: String) -> Article {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Article {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Article {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Article {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Article {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Article {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Article {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Article {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Article {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Article {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Article {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Article {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Article {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Article {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Article {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> Article {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> Article {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Article {
        return mutate(nonce: value)
    }
    
    public func role(_ value: String) -> Article {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Article {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Article {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Article {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Article {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Article {
        return mutate(translate: value)
    }
}

extension Article: Content {
    
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
public struct Section: ContentNode {

    internal var name: String { "section" }

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

extension Section: GlobalAttributes {
    
    public func accessKey(_ value: String) -> Section {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Section {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Section {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Section {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Section {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Section {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Section {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Section {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Section {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Section {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Section {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Section {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Section {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Section {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Section {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> Section {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> Section {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Section {
        return mutate(nonce: value)
    }
    
    public func role(_ value: String) -> Section {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Section {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Section {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Section {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Section {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Section {
        return mutate(translate: value)
    }
}

extension Section: Content {
    
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
public struct Navigation: ContentNode {

    internal var name: String { "nav" }

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

extension Navigation: GlobalAttributes {
    
    public func accessKey(_ value: String) -> Navigation {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Navigation {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Navigation {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Navigation {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Navigation {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Navigation {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Navigation {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Navigation {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Navigation {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Navigation {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Navigation {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Navigation {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Navigation {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Navigation {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Navigation {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> Navigation {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> Navigation {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Navigation {
        return mutate(nonce: value)
    }
    
    public func role(_ value: String) -> Navigation {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Navigation {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Navigation {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Navigation {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Navigation {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Navigation {
        return mutate(translate: value)
    }
}

extension Navigation: Content {
    
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
public struct Aside: ContentNode {

    internal var name: String { "aside" }

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

extension Aside: GlobalAttributes {
    
    public func accessKey(_ value: String) -> Aside {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Aside {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Aside {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Aside {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Aside {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Aside {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Aside {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Aside {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Aside {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Aside {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Aside {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Aside {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Aside {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Aside {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Aside {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> Aside {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> Aside {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Aside {
        return mutate(nonce: value)
    }
    
    public func role(_ value: String) -> Aside {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Aside {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Aside {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Aside {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Aside {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Aside {
        return mutate(translate: value)
    }
}

extension Aside: Content {
    
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
public struct Heading1: ContentNode {

    internal var name: String { "h1" }

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

extension Heading1: GlobalAttributes {
    
    public func accessKey(_ value: String) -> Heading1 {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Heading1 {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Heading1 {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Heading1 {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Heading1 {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Heading1 {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Heading1 {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Heading1 {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Heading1 {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Heading1 {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Heading1 {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Heading1 {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Heading1 {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Heading1 {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Heading1 {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> Heading1 {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> Heading1 {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Heading1 {
        return mutate(nonce: value)
    }
    
    public func role(_ value: String) -> Heading1 {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Heading1 {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Heading1 {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Heading1 {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Heading1 {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Heading1 {
        return mutate(translate: value)
    }
}

extension Heading1: Localizable {
    
    public init(_ localizedKey: String) {
        self.content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        self.content = Localized(key: localizedKey, context: context)
    }
}

extension Heading1: Content {
    
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
public struct Heading2: ContentNode {

    internal var name: String { "h2" }

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

extension Heading2: GlobalAttributes {
    
    public func accessKey(_ value: String) -> Heading2 {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Heading2 {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Heading2 {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Heading2 {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Heading2 {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Heading2 {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Heading2 {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Heading2 {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Heading2 {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Heading2 {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Heading2 {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Heading2 {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Heading2 {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Heading2 {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Heading2 {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> Heading2 {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> Heading2 {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Heading2 {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> Heading2 {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Heading2 {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Heading2 {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Heading2 {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Heading2 {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Heading2 {
        return mutate(translate: value)
    }
}

extension Heading2: Localizable {
    
    public init(_ localizedKey: String) {
        self.content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        self.content = Localized(key: localizedKey, context: context)
    }
}

extension Heading2: Content {
    
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
public struct Heading3: ContentNode {

    internal var name: String { "h3" }

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

extension Heading3: GlobalAttributes {
    
    public func accessKey(_ value: String) -> Heading3 {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Heading3 {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Heading3 {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Heading3 {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Heading3 {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Heading3 {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Heading3 {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Heading3 {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Heading3 {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Heading3 {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Heading3 {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Heading3 {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Heading3 {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Heading3 {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Heading3 {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> Heading3 {
        
return mutate(id: value)
    }

    public func language(_ type: Language) -> Heading3 {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Heading3 {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> Heading3 {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Heading3 {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Heading3 {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Heading3 {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Heading3 {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Heading3 {
        return mutate(translate: value)
    }
}

extension Heading3: Localizable {
    
    public init(_ localizedKey: String) {
        self.content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        self.content = Localized(key: localizedKey, context: context)
    }
}

extension Heading3: Content {
    
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
public struct Heading4: ContentNode {

    internal var name: String { "h4" }

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

extension Heading4: GlobalAttributes {
    
    public func accessKey(_ value: String) -> Heading4 {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Heading4 {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Heading4 {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Heading4 {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Heading4 {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Heading4 {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Heading4 {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Heading4 {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Heading4 {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Heading4 {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Heading4 {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Heading4 {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Heading4 {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Heading4 {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Heading4 {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> Heading4 {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> Heading4 {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Heading4 {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> Heading4 {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Heading4 {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Heading4 {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Heading4 {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Heading4 {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Heading4 {
        return mutate(translate: value)
    }

}

extension Heading4: Localizable {
    
    public init(_ localizedKey: String) {
        self.content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        self.content = Localized(key: localizedKey, context: context)
    }
}

extension Heading4: Content {
    
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
public struct Heading5: ContentNode {

    internal var name: String { "h5" }

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

extension Heading5: GlobalAttributes {
    
    public func accessKey(_ value: String) -> Heading5 {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Heading5 {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Heading5 {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Heading5 {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Heading5 {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Heading5 {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Heading5 {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Heading5 {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Heading5 {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Heading5 {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Heading5 {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Heading5 {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Heading5 {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Heading5 {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Heading5 {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> Heading5 {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> Heading5 {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Heading5 {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> Heading5 {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Heading5 {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Heading5 {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Heading5 {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Heading5 {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Heading5 {
        return mutate(translate: value)
    }

}

extension Heading5: Localizable {
    
    public init(_ localizedKey: String) {
        self.content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        self.content = Localized(key: localizedKey, context: context)
    }
}

extension Heading5: Content {
    
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
public struct Heading6: ContentNode {

    internal var name: String { "h6" }

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

extension Heading6: GlobalAttributes {
    
    public func accessKey(_ value: String) -> Heading6 {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Heading6 {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Heading6 {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Heading6 {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Heading6 {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Heading6 {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Heading6 {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Heading6 {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Heading6 {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Heading6 {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Heading6 {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Heading6 {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Heading6 {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Heading6 {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Heading6 {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> Heading6 {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> Heading6 {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Heading6 {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> Heading6 {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Heading6 {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Heading6 {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Heading6 {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Heading6 {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Heading6 {
        return mutate(translate: value)
    }
}

extension Heading6: Localizable {
    
    public init(_ localizedKey: String) {
        self.content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        self.content = Localized(key: localizedKey, context: context)
    }
}

extension Heading6: Content {
    
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
public struct HeadingGroup: ContentNode {

    internal var name: String { "hgroup" }

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

extension HeadingGroup: GlobalAttributes {
    
    public func accessKey(_ value: String) -> HeadingGroup {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> HeadingGroup {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> HeadingGroup {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> HeadingGroup {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> HeadingGroup {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> HeadingGroup {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> HeadingGroup {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> HeadingGroup {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> HeadingGroup {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> HeadingGroup {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> HeadingGroup {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> HeadingGroup {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> HeadingGroup {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> HeadingGroup {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> HeadingGroup {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> HeadingGroup {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> HeadingGroup {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> HeadingGroup {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> HeadingGroup {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> HeadingGroup {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> HeadingGroup {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> HeadingGroup {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> HeadingGroup {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> HeadingGroup {
        return mutate(translate: value)
    }
}

extension HeadingGroup: Content {
    
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
public struct Header: ContentNode {

    internal var name: String { "header" }

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

extension Header: GlobalAttributes {
    
    public func accessKey(_ value: String) -> Header {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Header {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Header {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Header {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Header {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Header {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Header {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Header {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Header {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Header {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Header {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Header {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Header {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Header {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Header {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> Header {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> Header {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Header {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> Header {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Header {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Header {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Header {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Header {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Header {
        return mutate(translate: value)
    }
}

extension Header: Content {
    
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
public struct Footer: ContentNode {

    internal var name: String { "footer" }

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

extension Footer: GlobalAttributes {
    
    public func accessKey(_ value: String) -> Footer {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Footer {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Footer {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Footer {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Footer {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Footer {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Footer {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Footer {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Footer {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Footer {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Footer {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Footer {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Footer {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Footer {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Footer {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> Footer {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> Footer {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Footer {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> Footer {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Footer {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Footer {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Footer {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Footer {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Footer {
        return mutate(translate: value)
    }
}

extension Footer: Content {
    
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
public struct Address: ContentNode {

    internal var name: String { "address" }

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

extension Address: GlobalAttributes {
    
    public func accessKey(_ value: String) -> Address {
        
return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Address {
        
return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Address {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Address {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Address {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Address {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Address {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Address {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Address {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Address {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Address {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Address {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Address {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Address {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Address {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> Address {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> Address {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Address {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> Address {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Address {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Address {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Address {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Address {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Address {
        return mutate(translate: value)
    }
}

extension Address: Content {
    
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
public struct Paragraph: ContentNode {

    internal var name: String { "p" }

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

extension Paragraph: GlobalAttributes {
    
    public func accessKey(_ value: String) -> Paragraph {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Paragraph {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Paragraph {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Paragraph {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Paragraph {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Paragraph {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Paragraph {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Paragraph {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Paragraph {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Paragraph {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Paragraph {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Paragraph {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Paragraph {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Paragraph {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Paragraph {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> Paragraph {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> Paragraph {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Paragraph {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> Paragraph {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Paragraph {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Paragraph {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Paragraph {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Paragraph {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Paragraph {
        return mutate(translate: value)
    }
}

extension Paragraph: Localizable {
    
    public init(_ localizedKey: String) {
        self.content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        self.content = Localized(key: localizedKey, context: context)
    }
}

extension Paragraph: Content {
    
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
public struct HorizontalRule: EmptyNode {

    internal var name: String { "hr" }
    
    internal var attributes: OrderedDictionary<String, Any>?

    public init() {}
    
    internal init(attributes: OrderedDictionary<String, Any>?) {
        self.attributes = attributes
    }
}

extension HorizontalRule: GlobalAttributes {
    
    public func accessKey(_ value: String) -> HorizontalRule {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> HorizontalRule {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> HorizontalRule {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> HorizontalRule {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> HorizontalRule {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> HorizontalRule {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> HorizontalRule {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> HorizontalRule {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> HorizontalRule {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> HorizontalRule {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> HorizontalRule {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> HorizontalRule {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> HorizontalRule {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> HorizontalRule {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> HorizontalRule {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> HorizontalRule {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> HorizontalRule {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> HorizontalRule {
        return mutate(nonce: value)
    }
    
    public func role(_ value: String) -> HorizontalRule {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> HorizontalRule {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> HorizontalRule {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> HorizontalRule {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> HorizontalRule {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> HorizontalRule {
        return mutate(translate: value)
    }
}

extension HorizontalRule: Content {
    
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
public struct PreformattedText: ContentNode {

    internal var name: String { "pre" }

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

extension PreformattedText: GlobalAttributes {
    
    public func accessKey(_ value: String) -> PreformattedText {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> PreformattedText {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> PreformattedText {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> PreformattedText {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> PreformattedText {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> PreformattedText {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> PreformattedText {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> PreformattedText {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> PreformattedText {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> PreformattedText {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> PreformattedText {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> PreformattedText {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> PreformattedText {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> PreformattedText {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> PreformattedText {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> PreformattedText {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> PreformattedText {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> PreformattedText {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> PreformattedText {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> PreformattedText {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> PreformattedText {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> PreformattedText {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> PreformattedText {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> PreformattedText {
        return mutate(translate: value)
    }
}

extension PreformattedText: Content {
    
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
public struct Blockquote: ContentNode {

    internal var name: String { "blockquote" }

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

extension Blockquote: GlobalAttributes, CiteAttribute {
    
    public func accessKey(_ value: String) -> Blockquote {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Blockquote {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Blockquote {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Blockquote {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Blockquote {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Blockquote {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Blockquote {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Blockquote {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Blockquote {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Blockquote {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Blockquote {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Blockquote {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Blockquote {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Blockquote {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Blockquote {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> Blockquote {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> Blockquote {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Blockquote {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> Blockquote {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Blockquote {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Blockquote {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Blockquote {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Blockquote {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Blockquote {
        return mutate(translate: value)
    }
    
    public func cite(_ value: String) -> Blockquote {
        return mutate(cite: value)
    }
}

extension Blockquote: Localizable {
    
    public init(_ localizedKey: String) {
        self.content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        self.content = Localized(key: localizedKey, context: context)
    }
}

extension Blockquote: Content {
    
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
public struct OrderedList: ContentNode {

    internal var name: String { "ol" }

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

extension OrderedList: GlobalAttributes, ReversedAttribute, StartAttribute, TypeAttribute {
    
    public func accessKey(_ value: String) -> OrderedList {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> OrderedList {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> OrderedList {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> OrderedList {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> OrderedList {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> OrderedList {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> OrderedList {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> OrderedList {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> OrderedList {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> OrderedList {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> OrderedList {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> OrderedList {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> OrderedList {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> OrderedList {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> OrderedList {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> OrderedList {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> OrderedList {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> OrderedList {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> OrderedList {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> OrderedList {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> OrderedList {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> OrderedList {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> OrderedList {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> OrderedList {
        return mutate(translate: value)
    }

    public func reversed() -> OrderedList {
        return mutate(reversed: "reversed")
    }
    
    public func start(_ size: Int) -> OrderedList {
        return mutate(start: size)
    }
    
    public func type(_ value: String) -> OrderedList {
        return mutate(type: value)
    }
}

extension OrderedList: Content {
    
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
public struct UnorderedList: ContentNode {

    internal var name: String { "ul" }

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

extension UnorderedList: GlobalAttributes {
    
    public func accessKey(_ value: String) -> UnorderedList {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> UnorderedList {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> UnorderedList {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> UnorderedList {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> UnorderedList {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> UnorderedList {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> UnorderedList {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> UnorderedList {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> UnorderedList {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> UnorderedList {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> UnorderedList {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> UnorderedList {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> UnorderedList {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> UnorderedList {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> UnorderedList {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> UnorderedList {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> UnorderedList {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> UnorderedList {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> UnorderedList {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> UnorderedList {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> UnorderedList {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> UnorderedList {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> UnorderedList {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> UnorderedList {
        return mutate(translate: value)
    }
}

extension UnorderedList: Content {
    
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
public struct DescriptionList: ContentNode {

    internal var name: String { "dl" }

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

extension DescriptionList: GlobalAttributes {
    
    public func accessKey(_ value: String) -> DescriptionList {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> DescriptionList {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> DescriptionList {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> DescriptionList {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> DescriptionList {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> DescriptionList {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> DescriptionList {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> DescriptionList {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> DescriptionList {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> DescriptionList {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> DescriptionList {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> DescriptionList {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> DescriptionList {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> DescriptionList {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> DescriptionList {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> DescriptionList {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> DescriptionList {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> DescriptionList {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> DescriptionList {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> DescriptionList {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> DescriptionList {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> DescriptionList {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> DescriptionList {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> DescriptionList {
        return mutate(translate: value)
    }
}

extension DescriptionList: Content {
    
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
public struct Figure: ContentNode {

    internal var name: String { "figure" }

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

extension Figure: GlobalAttributes {
    
    public func accessKey(_ value: String) -> Figure {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Figure {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Figure {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Figure {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Figure {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Figure {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Figure {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Figure {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Figure {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Figure {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Figure {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Figure {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Figure {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Figure {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Figure {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> Figure {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> Figure {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Figure {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> Figure {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Figure {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Figure {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Figure {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Figure {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Figure {
        return mutate(translate: value)
    }
}

extension Figure: Content {
    
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
public struct Anchor: ContentNode {

    internal var name: String { "a" }

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

extension Anchor: GlobalAttributes, DownloadAttribute, ReferenceAttribute, ReferenceLanguageAttribute, MediaAttribute, PingAttribute, ReferrerPolicyAttribute, RelationshipAttribute, TargetAttribute, TypeAttribute {
    
    public func accessKey(_ value: String) -> Anchor {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Anchor {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Anchor {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Anchor {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Anchor {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Anchor {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Anchor {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Anchor {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Anchor {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Anchor {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Anchor {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Anchor {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Anchor {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Anchor {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Anchor {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> Anchor {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> Anchor {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Anchor {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> Anchor {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Anchor {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Anchor {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Anchor {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Anchor {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Anchor {
        return mutate(translate: value)
    }
    
    public func download() -> Anchor {
        return mutate(download: "download")
    }
    
    public func reference(_ value: String) -> Anchor {
        return mutate(href: value)
    }
    
    public func referenceLanguage(_ type: Language) -> Anchor {
        return mutate(hreflang: type.rawValue)
    }
    
    public func media(_ value: String) -> Anchor {
        return  mutate(media: value)
    }
    
    public func ping(_ value: String) -> Anchor {
        return mutate(ping: value)
    }
    
    public func referrerPolicy(_ type: Policy) -> Anchor {
        return mutate(type: type.rawValue)
    }
    
    public func relationship(_ type: Relation) -> Anchor {
        return mutate(type: type.rawValue)
    }
    
    public func target(_ type: Target) -> Anchor {
        return mutate(type: type.rawValue)
    }
    
    public func type(_ value: String) -> Anchor {
        return mutate(type: value)
    }
}

extension Anchor: Localizable {
    
    public init(_ localizedKey: String) {
        self.content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        self.content = Localized(key: localizedKey, context: context)
    }
}

extension Anchor: Content {
    
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
public struct Emphasize: ContentNode {

    internal var name: String { "em" }

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

extension Emphasize: GlobalAttributes {
    
    public func accessKey(_ value: String) -> Emphasize {
        
return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Emphasize {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Emphasize {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Emphasize {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Emphasize {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Emphasize {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Emphasize {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Emphasize {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Emphasize {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Emphasize {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Emphasize {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Emphasize {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Emphasize {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Emphasize {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Emphasize {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> Emphasize {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> Emphasize {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Emphasize {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> Emphasize {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Emphasize {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Emphasize {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Emphasize {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Emphasize {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Emphasize {
        return mutate(translate: value)
    }
}

extension Emphasize: Content {
    
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
public struct Strong: ContentNode {

    internal var name: String { "strong" }

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

extension Strong: GlobalAttributes {
    
    public func accessKey(_ value: String) -> Strong {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Strong {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Strong {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Strong {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Strong {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Strong {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Strong {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Strong {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Strong {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Strong {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Strong {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Strong {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Strong {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Strong {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Strong {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> Strong {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> Strong {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Strong {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> Strong {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Strong {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Strong {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Strong {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Strong {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Strong {
        return mutate(translate: value)
    }
}

extension Strong: Content {
    
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
public struct Small: ContentNode {

    internal var name: String { "small" }

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

extension Small: GlobalAttributes {
    
    public func accessKey(_ value: String) -> Small {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Small {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Small {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Small {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Small {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Small {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Small {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Small {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Small {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Small {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Small {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Small {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Small {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Small {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Small {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> Small {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> Small {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Small {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> Small {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Small {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Small {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Small {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Small {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Small {
        return mutate(translate: value)
    }
}

extension Small: Localizable {
    
    public init(_ localizedKey: String) {
        self.content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        self.content = Localized(key: localizedKey, context: context)
    }
}

extension Small: Content {
    
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
public struct StrikeThrough: ContentNode {

    internal var name: String { "s" }

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

extension StrikeThrough: GlobalAttributes {
    
    public func accessKey(_ value: String) -> StrikeThrough {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> StrikeThrough {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> StrikeThrough {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> StrikeThrough {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> StrikeThrough {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> StrikeThrough {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> StrikeThrough {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> StrikeThrough {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> StrikeThrough {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> StrikeThrough {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> StrikeThrough {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> StrikeThrough {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> StrikeThrough {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> StrikeThrough {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> StrikeThrough {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> StrikeThrough {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> StrikeThrough {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> StrikeThrough {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> StrikeThrough {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> StrikeThrough {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> StrikeThrough {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> StrikeThrough {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> StrikeThrough {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> StrikeThrough {
        return mutate(translate: value)
    }
}

extension StrikeThrough: Localizable {
    
    public init(_ localizedKey: String) {
        self.content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        self.content = Localized(key: localizedKey, context: context)
    }
}

extension StrikeThrough: Content {
    
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
public struct Main: ContentNode {

    internal var name: String { "main" }

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

extension Main: GlobalAttributes {
    
    public func accessKey(_ value: String) -> Main {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Main {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Main {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Main {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Main {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Main {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Main {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Main {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Main {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Main {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Main {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Main {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Main {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Main {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Main {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> Main {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> Main {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Main {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> Main {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Main {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Main {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Main {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Main {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Main {
        return mutate(translate: value)
    }
}

extension Main: Content {
    
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
public struct Division: ContentNode {

    internal var name: String { "div" }

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

extension Division: GlobalAttributes {
    
    public func accessKey(_ value: String) -> Division {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Division {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Division {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Division {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Division {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Division {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Division {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Division {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Division {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Division {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Division {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Division {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Division {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Division {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Division {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> Division {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> Division {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Division {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> Division {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Division {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Division {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Division {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Division {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Division {
        return mutate(translate: value)
    }
}

extension Division: Content {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Division: Modifiable {
    
    public func modify(if condition: Bool, modifyer: (Self) -> Self) -> Self {
        
        let element = modifyer(.init(attributes: [:], content: ""))
        
        guard var attributes = self.attributes else {

            return .init(attributes: element.attributes!, content: self.content)
        }
        
        return .init(attributes: merge(element.attributes!, with: &attributes), content: self.content)
    }
    
    public func modify<Value>(unwrap value: TemplateValue<Value?>, modifyer: (TemplateValue<Value>, Self) -> Self) -> Self {
        
        switch value {
            
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            let element = modifyer(.constant(value), .init(attributes: [:], content: ""))

            guard var attributes = self.attributes else {

                return .init(attributes: element.attributes!, content: self.content)
            }
            
            return .init(attributes: merge(element.attributes!, with: &attributes), content: self.content)
            
        case .dynamic(let context):
            
            var element: Self!
            
            if context.isMascadingOptional {
                
                element = modifyer(.dynamic(context.unsafeCast(to: Value.self)), .init(attributes: [:], content: ""))
                
            } else {
                
                element = modifyer(.dynamic(context.unsafelyUnwrapped), .init(attributes: [:], content: ""))
            }

            guard var attributes = self.attributes else {

                return .init(attributes: element.attributes!, content: self.content)
            }
            
            return .init(attributes: merge(element.attributes!, with: &attributes), content: self.content)
        }
    }
}

/// The element
///
///
public struct Definition: ContentNode {

    internal var name: String { "dfn" }

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

extension Definition: GlobalAttributes {
    
    public func accessKey(_ value: String) -> Definition {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Definition {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Definition {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Definition {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Definition {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Definition {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Definition {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Definition {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Definition {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Definition {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Definition {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Definition {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Definition {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Definition {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Definition {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> Definition {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> Definition {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Definition {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> Definition {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Definition {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Definition {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Definition {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Definition {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Definition {
        return mutate(translate: value)
    }
}

extension Definition: Content {
    
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
public struct Cite: ContentNode {

    internal var name: String { "cite" }

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

extension Cite: GlobalAttributes {
    
    public func accessKey(_ value: String) -> Cite {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Cite {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Cite {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Cite {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Cite {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Cite {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Cite {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Cite {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Cite {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Cite {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Cite {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Cite {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Cite {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Cite {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Cite {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> Cite {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> Cite {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Cite {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> Cite {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Cite {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Cite {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Cite {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Cite {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Cite {
        return mutate(translate: value)
    }
}

extension Cite: Content {
    
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
public struct ShortQuote: ContentNode {

    internal var name: String { "q" }

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

extension ShortQuote: GlobalAttributes, CiteAttribute {
    
    public func accessKey(_ value: String) -> ShortQuote {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> ShortQuote {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> ShortQuote {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> ShortQuote {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> ShortQuote {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> ShortQuote {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> ShortQuote {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> ShortQuote {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> ShortQuote {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> ShortQuote {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> ShortQuote {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> ShortQuote {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> ShortQuote {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> ShortQuote {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> ShortQuote {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> ShortQuote {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> ShortQuote {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> ShortQuote {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> ShortQuote {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> ShortQuote {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> ShortQuote {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> ShortQuote {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> ShortQuote {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> ShortQuote {
        return mutate(translate: value)
    }
    
    public func cite(_ value: String) -> ShortQuote {
        return mutate(cite: value)
    }
}

extension ShortQuote: Content {
    
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
public struct Abbreviation: ContentNode {

    internal var name: String { "abbr" }

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

extension Abbreviation: GlobalAttributes {
    
    public func accessKey(_ value: String) -> Abbreviation {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Abbreviation {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Abbreviation {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Abbreviation {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Abbreviation {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Abbreviation {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Abbreviation {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Abbreviation {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Abbreviation {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Abbreviation {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Abbreviation {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Abbreviation {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Abbreviation {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Abbreviation {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Abbreviation {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> Abbreviation {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> Abbreviation {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Abbreviation {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> Abbreviation {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Abbreviation {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Abbreviation {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Abbreviation {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Abbreviation {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Abbreviation {
        return mutate(translate: value)
    }
}

extension Abbreviation: Content {
    
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
public struct Ruby: ContentNode {

    internal var name: String { "ruby" }

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

extension Ruby: GlobalAttributes {
    
    public func accessKey(_ value: String) -> Ruby {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Ruby {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Ruby {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Ruby {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Ruby {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Ruby {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Ruby {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Ruby {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Ruby {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Ruby {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Ruby {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Ruby {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Ruby {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Ruby {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Ruby {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> Ruby {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> Ruby {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Ruby {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> Ruby {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Ruby {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Ruby {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Ruby {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Ruby {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Ruby {
        return mutate(translate: value)
    }
}

extension Ruby: Content {
    
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
public struct Data: ContentNode {

    internal var name: String { "data" }

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

extension Data: GlobalAttributes, ValueAttribute {
    
    public func accessKey(_ value: String) -> Data {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Data {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Data {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Data {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Data {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Data {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Data {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Data {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Data {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Data {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Data {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Data {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Data {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Data {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Data {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> Data {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> Data {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Data {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> Data {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Data {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Data {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Data {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Data {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Data {
        return mutate(translate: value)
    }
    
    public func value(_ value: String) -> Data {
        return mutate(value: value)
    }
}

extension Data: Content {
    
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
public struct Time: ContentNode {

    internal var name: String { "time" }

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

extension Time: GlobalAttributes, DateTimeAttribute {

    public func accessKey(_ value: String) -> Time {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Time {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Time {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Time {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Time {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Time {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Time {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Time {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Time {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Time {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Time {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Time {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Time {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Time {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Time {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> Time {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> Time {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Time {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> Time {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Time {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Time {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Time {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Time {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Time {
        return mutate(translate: value)
    }

    public func dateTime(_ value: String) -> Time {
        return mutate(datetime: value)
    }
}

extension Time: Content {
    
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
public struct Code: ContentNode {

    internal var name: String { "code" }

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

extension Code: GlobalAttributes {
    
    public func accessKey(_ value: String) -> Code {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Code {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Code {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Code {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Code {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Code {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Code {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Code {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Code {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Code {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Code {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Code {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Code {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Code {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Code {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> Code {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> Code {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Code {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> Code {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Code {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Code {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Code {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Code {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Code {
        return mutate(translate: value)
    }
}

extension Code: Content {
    
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
public struct Variable: ContentNode {

    internal var name: String { "v" }

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

extension Variable: GlobalAttributes {
    
    public func accessKey(_ value: String) -> Variable {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Variable {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Variable {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Variable {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Variable {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Variable {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Variable {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Variable {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Variable {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Variable {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Variable {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Variable {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Variable {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Variable {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Variable {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> Variable {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> Variable {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Variable {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> Variable {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Variable {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Variable {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Variable {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Variable {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Variable {
        return mutate(translate: value)
    }
}

extension Variable: Content {
    
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
public struct SampleOutput: ContentNode {

    internal var name: String { "samp" }

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

extension SampleOutput: GlobalAttributes {
    
    public func accessKey(_ value: String) -> SampleOutput {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> SampleOutput {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> SampleOutput {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> SampleOutput {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> SampleOutput {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> SampleOutput {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> SampleOutput {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> SampleOutput {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> SampleOutput {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> SampleOutput {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> SampleOutput {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> SampleOutput {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> SampleOutput {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> SampleOutput {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> SampleOutput {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> SampleOutput {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> SampleOutput {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> SampleOutput {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> SampleOutput {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> SampleOutput {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> SampleOutput {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> SampleOutput {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> SampleOutput {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> SampleOutput {
        return mutate(translate: value)
    }
}

extension SampleOutput: Content {
    
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
public struct KeyboardInput: ContentNode {

    internal var name: String { "kbd" }

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

extension KeyboardInput: GlobalAttributes {
    
    public func accessKey(_ value: String) -> KeyboardInput {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> KeyboardInput {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> KeyboardInput {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> KeyboardInput {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> KeyboardInput {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> KeyboardInput {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> KeyboardInput {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> KeyboardInput {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> KeyboardInput {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> KeyboardInput {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> KeyboardInput {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> KeyboardInput {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> KeyboardInput {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> KeyboardInput {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> KeyboardInput {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> KeyboardInput {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> KeyboardInput {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> KeyboardInput {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> KeyboardInput {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> KeyboardInput {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> KeyboardInput {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> KeyboardInput {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> KeyboardInput {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> KeyboardInput {
        return mutate(translate: value)
    }
}

extension KeyboardInput: Content {
    
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
public struct Subscript: ContentNode {

    internal var name: String { "sub" }

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

extension Subscript: GlobalAttributes {
    
    public func accessKey(_ value: String) -> Subscript {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Subscript {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Subscript {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Subscript {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Subscript {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Subscript {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Subscript {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Subscript {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Subscript {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Subscript {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Subscript {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Subscript {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Subscript {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Subscript {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Subscript {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> Subscript {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> Subscript {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Subscript {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> Subscript {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Subscript {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Subscript {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Subscript {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Subscript {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Subscript {
        return mutate(translate: value)
    }
}

extension Subscript: Content {
    
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
public struct Superscript: ContentNode {

    internal var name: String { "sup" }

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

extension Superscript: GlobalAttributes {
    
    public func accessKey(_ value: String) -> Superscript {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Superscript {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Superscript {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Superscript {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Superscript {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Superscript {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Superscript {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Superscript {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Superscript {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Superscript {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Superscript {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Superscript {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Superscript {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Superscript {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Superscript {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> Superscript {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> Superscript {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Superscript {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> Superscript {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Superscript {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Superscript {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Superscript {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Superscript {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Superscript {
        return mutate(translate: value)
    }
}

extension Superscript: Content {
    
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
public struct Italic: ContentNode {

    internal var name: String { "i" }

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

extension Italic: GlobalAttributes {
    
    public func accessKey(_ value: String) -> Italic {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Italic {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Italic {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Italic {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Italic {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Italic {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Italic {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Italic {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Italic {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Italic {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Italic {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Italic {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Italic {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Italic {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Italic {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> Italic {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> Italic {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Italic {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> Italic {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Italic {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Italic {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Italic {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Italic {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Italic {
        return mutate(translate: value)
    }
}

extension Italic: Localizable {
    
    public init(_ localizedKey: String) {
        self.content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        self.content = Localized(key: localizedKey, context: context)
    }
}

extension Italic: Content {
    
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
public struct Bold: ContentNode {

    internal var name: String { "b" }

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

extension Bold: GlobalAttributes {
    
    public func accessKey(_ value: String) -> Bold {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Bold {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Bold {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Bold {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Bold {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Bold {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Bold {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Bold {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Bold {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Bold {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Bold {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Bold {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Bold {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Bold {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Bold {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> Bold {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> Bold {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Bold {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> Bold {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Bold {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Bold {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Bold {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Bold {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Bold {
        return mutate(translate: value)
    }
}

extension Bold: Localizable {
    
    public init(_ localizedKey: String) {
        self.content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        self.content = Localized(key: localizedKey, context: context)
    }
}

extension Bold: Content {
    
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
public struct Underline: ContentNode {

    internal var name: String { "u" }
    
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

extension Underline: GlobalAttributes {
    
    public func accessKey(_ value: String) -> Underline {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Underline {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Underline {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Underline {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Underline {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Underline {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Underline {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Underline {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Underline {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Underline {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Underline {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Underline {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Underline {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Underline {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Underline {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> Underline {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> Underline {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Underline {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> Underline {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Underline {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Underline {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Underline {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Underline {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Underline {
        return mutate(translate: value)
    }
}

extension Underline: Localizable {
    
    public init(_ localizedKey: String) {
        self.content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        self.content = Localized(key: localizedKey, context: context)
    }
}

extension Underline: Content {
    
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
public struct Mark: ContentNode {

    internal var name: String { "mark" }

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

extension Mark: GlobalAttributes {
    
    public func accessKey(_ value: String) -> Mark {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Mark {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Mark {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Mark {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Mark {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Mark {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Mark {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Mark {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Mark {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Mark {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Mark {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Mark {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Mark {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Mark {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Mark {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> Mark {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> Mark {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Mark {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> Mark {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Mark {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Mark {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Mark {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Mark {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Mark {
        return mutate(translate: value)
    }
}

extension Mark: Content {
    
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
public struct Bdi: ContentNode {

    internal var name: String { "bdi" }

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

extension Bdi: GlobalAttributes {
    
    public func accessKey(_ value: String) -> Bdi {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Bdi {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Bdi {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Bdi {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Bdi {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Bdi {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Bdi {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Bdi {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Bdi {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Bdi {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Bdi {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Bdi {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Bdi {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Bdi {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Bdi {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> Bdi {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> Bdi {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Bdi {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> Bdi {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Bdi {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Bdi {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Bdi {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Bdi {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Bdi {
        return mutate(translate: value)
    }
}

extension Bdi: Content {
    
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
public struct Bdo: EmptyNode {

    internal var name: String { "bdo" }

    internal var attributes: OrderedDictionary<String, Any>?

    public init() {}
    
    internal init(attributes: OrderedDictionary<String, Any>?) {
        self.attributes = attributes
    }
}

extension Bdo: GlobalAttributes {
    
    public func accessKey(_ value: String) -> Bdo {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Bdo {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Bdo {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Bdo {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Bdo {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Bdo {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Bdo {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Bdo {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Bdo {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Bdo {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Bdo {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Bdo {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Bdo {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Bdo {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Bdo {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> Bdo {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> Bdo {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Bdo {
        return mutate(nonce: value)
    }
    
    public func role(_ value: String) -> Bdo {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Bdo {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Bdo {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Bdo {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Bdo {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Bdo {
        return mutate(translate: value)
    }
}

extension Bdo: Content {
    
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
public struct Span: ContentNode {

    internal var name: String { "span" }

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

extension Span: GlobalAttributes {
    
    public func accessKey(_ value: String) -> Span {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Span {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Span {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Span {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Span {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Span {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Span {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Span {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Span {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Span {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Span {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Span {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Span {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Span {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Span {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> Span {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> Span {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Span {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> Span {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Span {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Span {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Span {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Span {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Span {
        return mutate(translate: value)
    }
}

extension Span: Content {
    
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
public struct LineBreak: EmptyNode {

    internal var name: String { "br" }

    internal var attributes: OrderedDictionary<String, Any>?

    public init() {}
    
    internal init(attributes: OrderedDictionary<String, Any>?) {
        self.attributes = attributes
    }
}

extension LineBreak: GlobalAttributes {
    
    public func accessKey(_ value: String) -> LineBreak {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> LineBreak {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> LineBreak {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> LineBreak {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> LineBreak {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> LineBreak {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> LineBreak {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> LineBreak {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> LineBreak {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> LineBreak {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> LineBreak {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> LineBreak {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> LineBreak {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> LineBreak {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> LineBreak {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> LineBreak {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> LineBreak {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> LineBreak {
        return mutate(nonce: value)
    }
    
    public func role(_ value: String) -> LineBreak {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> LineBreak {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> LineBreak {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> LineBreak {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> LineBreak {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> LineBreak {
        return mutate(translate: value)
    }
}

extension LineBreak: Content {
    
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
public struct WordBreak: EmptyNode {

    internal var name: String { "wbr" }
    
    internal var attributes: OrderedDictionary<String, Any>?

    public init() {}
    
    internal init(attributes: OrderedDictionary<String, Any>?) {
        self.attributes = attributes
    }
}

extension WordBreak: GlobalAttributes {
    
    public func accessKey(_ value: String) -> WordBreak {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> WordBreak {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> WordBreak {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> WordBreak {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> WordBreak {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> WordBreak {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> WordBreak {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> WordBreak {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> WordBreak {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> WordBreak {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> WordBreak {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> WordBreak {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> WordBreak {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> WordBreak {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> WordBreak {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> WordBreak {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> WordBreak {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> WordBreak {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> WordBreak {
        return mutate(role: value)
    }
    
    public func hasSpellCheck(_ condition: Bool) -> WordBreak {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> WordBreak {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> WordBreak {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> WordBreak {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> WordBreak {
        return mutate(translate: value)
    }
}

extension WordBreak: Content {
    
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
public struct InsertedText: ContentNode {

    internal var name: String { "ins" }

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

extension InsertedText: GlobalAttributes, CiteAttribute, DateTimeAttribute {
    
    public func accessKey(_ value: String) -> InsertedText {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> InsertedText {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> InsertedText {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> InsertedText {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> InsertedText {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> InsertedText {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> InsertedText {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> InsertedText {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> InsertedText {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> InsertedText {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> InsertedText {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> InsertedText {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> InsertedText {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> InsertedText {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> InsertedText {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> InsertedText {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> InsertedText {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> InsertedText {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> InsertedText {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> InsertedText {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> InsertedText {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> InsertedText {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> InsertedText {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> InsertedText {
        return mutate(translate: value)
    }
    
    public func cite(_ value: String) -> InsertedText {
        return mutate(cite: value)
    }
    
    public func dateTime(_ value: String) -> InsertedText {
        return mutate(datetime: value)
    }
}

extension InsertedText: Content {
    
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
public struct DeletedText: ContentNode {

    internal var name: String { "del" }

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

extension DeletedText: GlobalAttributes, CiteAttribute, DateTimeAttribute {
    
    public func accessKey(_ value: String) -> DeletedText {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> DeletedText {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> DeletedText {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> DeletedText {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> DeletedText {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> DeletedText {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> DeletedText {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> DeletedText {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> DeletedText {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> DeletedText {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> DeletedText {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> DeletedText {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> DeletedText {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> DeletedText {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> DeletedText {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> DeletedText {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> DeletedText {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> DeletedText {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> DeletedText {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> DeletedText {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> DeletedText {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> DeletedText {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> DeletedText {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> DeletedText {
        return mutate(translate: value)
    }

    public func cite(_ value: String) -> DeletedText {
        return mutate(cite: value)
    }
    
    public func dateTime(_ value: String) -> DeletedText {
        return mutate(datetime: value)
    }
}

extension DeletedText: Content {
    
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
public struct Picture: ContentNode {

    internal var name: String { "picture" }

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

extension Picture: GlobalAttributes {
    
    public func accessKey(_ value: String) -> Picture {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Picture {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Picture {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Picture {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Picture {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Picture {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Picture {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Picture {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Picture {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Picture {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Picture {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Picture {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Picture {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Picture {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Picture {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> Picture {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> Picture {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Picture {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> Picture {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Picture {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Picture {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Picture {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Picture {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Picture {
        return mutate(translate: value)
    }
}

extension Picture: Content {
    
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
public struct Image: EmptyNode {

    internal var name: String { "img" }

    internal var attributes: OrderedDictionary<String, Any>?

    public init() {}
    
    internal init(attributes: OrderedDictionary<String, Any>?) {
        self.attributes = attributes
    }
}

extension Image: GlobalAttributes, AlternateAttribute, SourceAttribute, SizesAttribute, WidthAttribute, HeightAttribute, ReferrerPolicyAttribute, ErrorEventAttribute, LoadEventAttribute {
    
    public func onError(_ value: String) -> Image {
        return mutate(onerror: value)
    }
    
    public func onLoad(_ value: String) -> Image {
        return mutate(onload: value)
    }
    
    public func accessKey(_ value: String) -> Image {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Image {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Image {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Image {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Image {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Image {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Image {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Image {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Image {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Image {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Image {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Image {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Image {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Image {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Image {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> Image {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> Image {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Image {
        return mutate(nonce: value)
    }
    
    public func role(_ value: String) -> Image {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Image {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Image {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Image {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Image {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Image {
        return mutate(translate: value)
    }

    public func alternate(_ value: String) -> Image {
        return mutate(alternate: value)
    }
    
    public func source(_ value: String) -> Image {
        return mutate(source: value)
    }
    
    public func sizes(_ size: Int) -> Image {
        return mutate(sizes: size)
    }
    
    public func width(_ size: Int) -> Image {
        return mutate(width: size)
    }
    
    public func height(_ size: Int) -> Image {
        return mutate(height: size)
    }
    
    public func referrerPolicy(_ type: Policy) -> Image {
        return mutate(referrerpolicy: type.rawValue)
    }
}

extension Image: Content {
    
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
public struct InlineFrame: ContentNode {
    
    internal var name: String { "iframe" }

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

extension InlineFrame: GlobalAttributes, SourceAttribute, NameAttribute, WidthAttribute, HeightAttribute, ReferrerPolicyAttribute {
    
    public func accessKey(_ value: String) -> InlineFrame {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> InlineFrame {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> InlineFrame {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> InlineFrame {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> InlineFrame {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> InlineFrame {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> InlineFrame {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> InlineFrame {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> InlineFrame {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> InlineFrame {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> InlineFrame {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> InlineFrame {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> InlineFrame {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> InlineFrame {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> InlineFrame {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> InlineFrame {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> InlineFrame {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> InlineFrame {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> InlineFrame {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> InlineFrame {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> InlineFrame {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> InlineFrame {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> InlineFrame {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> InlineFrame {
        return mutate(translate: value)
    }

    public func source(_ value: String) -> InlineFrame {
        return mutate(source: value)
    }
    
    public func name(_ type: NameType) -> InlineFrame {
        return mutate(name: type.rawValue)
    }
    
    public func width(_ size: Int) -> InlineFrame {
        return mutate(width: size)
    }
    
    public func height(_ size: Int) -> InlineFrame {
        return mutate(height: size)
    }
    
    public func referrerPolicy(_ type: Policy) -> InlineFrame {
        return mutate(referrerpolicy: type.rawValue)
    }
}

extension InlineFrame: Content {
    
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
public struct Embed: EmptyNode {

    internal var name: String { "embed" }

    internal var attributes: OrderedDictionary<String, Any>?

    public init() {}
    
    internal init(attributes: OrderedDictionary<String, Any>?) {
        self.attributes = attributes
    }
}

extension Embed: GlobalAttributes, SourceAttribute, TypeAttribute, WidthAttribute, HeightAttribute {
    
    public func accessKey(_ value: String) -> Embed {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Embed {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Embed {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Embed {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Embed {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Embed {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Embed {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Embed {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Embed {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Embed {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Embed {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Embed {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Embed {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Embed {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Embed {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> Embed {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> Embed {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Embed {
        return mutate(nonce: value)
    }
    
    public func role(_ value: String) -> Embed {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Embed {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Embed {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Embed {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Embed {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Embed {
        return mutate(translate: value)
    }

    public func source(_ value: String) -> Embed {
        return mutate(source: value)
    }
    
    public func type(_ value: String) -> Embed {
        return mutate(type: value)
    }
    
    public func width(_ size: Int) -> Embed {
        return mutate(width: size)
    }
    
    public func height(_ size: Int) -> Embed {
        return mutate(height: size)
    }
}

extension Embed: Content {
    
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
public struct Object: ContentNode {
    
    internal var name: String { "object" }

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

extension Object: GlobalAttributes, DataAttribute, TypeAttribute, NameAttribute, FormAttribute, WidthAttribute, HeightAttribute, ErrorEventAttribute {
    
    public func onError(_ value: String) -> Object {
        return mutate(onerror: value)
    }
    
    public func accessKey(_ value: String) -> Object {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Object {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Object {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Object {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Object {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Object {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Object {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Object {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Object {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Object {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Object {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Object {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Object {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Object {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Object {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> Object {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> Object {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Object {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> Object {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Object {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Object {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Object {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Object {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Object {
        return mutate(translate: value)
    }
    
    public func data(_ value: String) -> Object {
        return mutate(data: value)
    }
    
    public func type(_ value: String) -> Object {
        return mutate(type: value)
    }
    
    public func name(_ type: NameType) -> Object {
        return mutate(name: type.rawValue)
    }
    
    public func form(_ value: String) -> Object {
        return mutate(form: value)
    }
    
    public func width(_ size: Int) -> Object {
        return mutate(width: size)
    }
    
    public func height(_ size: Int) -> Object {
        return mutate(height: size)
    }
}

extension Object: Content {
    
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
public struct Video: ContentNode {

    internal var name: String { "video" }

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

extension Video: GlobalAttributes, SourceAttribute, AutoplayAttribute, LoopAttribute, MutedAttribute, ControlsAttribute, WidthAttribute, HeightAttribute {
    
    public func accessKey(_ value: String) -> Video {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Video {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Video {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Video {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Video {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Video {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Video {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Video {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Video {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Video {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Video {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Video {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Video {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Video {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Video {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> Video {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> Video {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Video {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> Video {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Video {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Video {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Video {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Video {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Video {
        return mutate(translate: value)
    }

    public func source(_ value: String) -> Video {
        return mutate(source: value)
    }
    
    public func autoplay() -> Video {
        return mutate(autoplay: "autoplay")
    }
    
    public func loop() -> Video {
        return mutate(loop: "loop")
    }
    
    public func muted() -> Video {
        return mutate(muted: "muted")
    }
    
    public func controls() -> Video {
        return mutate(controls: "controls")
    }
    
    public func width(_ size: Int) -> Video {
        return mutate(width: size)
    }
    
    public func height(_ size: Int) -> Video {
        return mutate(height: size)
    }
}

extension Video: Content {
    
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
public struct Audio: ContentNode {

    internal var name: String { "audio" }

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

extension Audio: GlobalAttributes, SourceAttribute, AutoplayAttribute, LoopAttribute, MutedAttribute, ControlsAttribute {
    
    public func accessKey(_ value: String) -> Audio {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Audio {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Audio {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Audio {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Audio {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Audio {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Audio {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Audio {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Audio {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Audio {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Audio {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Audio {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Audio {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Audio {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Audio {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> Audio {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> Audio {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Audio {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> Audio {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Audio {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Audio {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Audio {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Audio {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Audio {
        return mutate(translate: value)
    }

    public func source(_ value: String) -> Audio {
        return mutate(source: value)
    }
    
    public func autoplay() -> Audio {
        return mutate(autoplay: "autoplay")
    }
    
    public func loop() -> Audio {
        return mutate(loop: "loop")
    }
    
    public func muted() -> Audio {
        return mutate(muted: "muted")
    }
    
    public func controls() -> Audio {
        return mutate(controls: "controls")
    }
}

extension Audio: Content {
    
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
public struct Map: ContentNode {
    
    internal var name: String { "map" }

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

extension Map: GlobalAttributes, NameAttribute {
    
    public func accessKey(_ value: String) -> Map {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Map {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Map {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Map {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Map {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Map {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Map {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Map {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Map {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Map {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Map {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Map {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Map {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Map {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Map {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> Map {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> Map {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Map {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> Map {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Map {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Map {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Map {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Map {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Map {
        return mutate(translate: value)
    }

    public func name(_ type: NameType) -> Map {
        return mutate(name: type.rawValue)
    }
}

extension Map: Content {
    
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
public struct Form: ContentNode {

    internal var name: String { "form" }

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

extension Form: GlobalAttributes, ActionAttribute, AutocompleteAttribute, EncodingAttribute, MethodAttribute, NameAttribute, TargetAttribute, RelationshipAttribute, ResetEventAttribute, SubmitEventAttribute {
    
    public func onReset(_ value: String) -> Form {
        return mutate(onreset: value)
    }
    
    public func onSubmit(_ value: String) -> Form {
        return mutate(onsubmit: value)
    }
    
    public func accessKey(_ value: String) -> Form {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Form {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Form {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Form {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Form {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Form {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Form {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Form {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Form {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Form {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Form {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Form {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Form {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Form {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Form {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> Form {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> Form {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Form {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> Form {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Form {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Form {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Form {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Form {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Form {
        return mutate(translate: value)
    }

    public func action(_ value: String) -> Form {
        return mutate(action: value)
    }
    
    public func hasCompletion(_ condition: Bool) -> Form {
        return mutate(autocomplete: condition)
    }
    
    public func encoding(_ type: Encoding) -> Form {
        return mutate(enctype: type.rawValue)
    }
    
    public func method(_ type: Method) -> Form {
        return mutate(method: type.rawValue)
    }
    
    public func name(_ type: NameType) -> Form {
        return mutate(name: type.rawValue)
    }
    
    public func target(_ type: Target) -> Form {
        return mutate(target: type.rawValue)
    }
    
    public func relationship(_ type: Relation) -> Form {
        return mutate(rel: type.rawValue)
    }
}

extension Form: Content {
    
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
public struct DataList: ContentNode {

    internal var name: String { "datalist" }

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

extension DataList: GlobalAttributes {
    
    public func accessKey(_ value: String) -> DataList {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> DataList {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> DataList {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> DataList {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> DataList {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> DataList {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> DataList {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> DataList {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> DataList {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> DataList {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> DataList {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> DataList {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> DataList {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> DataList {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> DataList {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> DataList {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> DataList {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> DataList {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> DataList {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> DataList {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> DataList {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> DataList {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> DataList {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> DataList {
        return mutate(translate: value)
    }
}

extension DataList: Content {
    
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
public struct Output: ContentNode {
    
    internal var name: String { "output" }

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

extension Output: GlobalAttributes, ForAttribute, FormAttribute, NameAttribute {
    
    public func accessKey(_ value: String) -> Output {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Output {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Output {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Output {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Output {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Output {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Output {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Output {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Output {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Output {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Output {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Output {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Output {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Output {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Output {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> Output {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> Output {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Output {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> Output {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Output {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Output {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Output {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Output {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Output {
        return mutate(translate: value)
    }
    
    public func `for`(_ value: String) -> Output {
        return mutate(for: value)
    }
    
    public func form(_ value: String) -> Output {
        return mutate(form: value)
    }
    
    public func name(_ type: NameType) -> Output {
        return mutate(name: type.rawValue)
    }
}

extension Output: Content {
    
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
public struct Progress: ContentNode {

    internal var name: String { "progress" }

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

extension Progress: GlobalAttributes, ValueAttribute, MaximumValueAttribute {
    
    public func accessKey(_ value: String) -> Progress {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Progress {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Progress {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Progress {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Progress {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Progress {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Progress {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Progress {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Progress {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Progress {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Progress {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Progress {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Progress {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Progress {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Progress {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> Progress {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> Progress {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Progress {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> Progress {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Progress {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Progress {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Progress {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Progress {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Progress {
        return mutate(translate: value)
    }

    public func maximum(_ value: String) -> Progress {
        return mutate(max: value)
    }

    public func value(_ value: String) -> Progress {
        return mutate(value: value)
    }
}

extension Progress: Content {
    
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
public struct Meter: ContentNode {

    internal var name: String { "meter" }

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

extension Meter: GlobalAttributes, ValueAttribute, MinimumValueAttribute, MaximumValueAttribute, HighAttribute, OptimumAttribute {
    
    public func accessKey(_ value: String) -> Meter {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Meter {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Meter {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Meter {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Meter {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Meter {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Meter {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Meter {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Meter {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Meter {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Meter {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Meter {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Meter {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Meter {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Meter {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> Meter {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> Meter {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Meter {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> Meter {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Meter {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Meter {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Meter {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Meter {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Meter {
        return mutate(translate: value)
    }
    
    public func minimum(_ value: String) -> Meter {
        return mutate(min: value)
    }
    
    public func maximum(_ value: String) -> Meter {
        return mutate(max: value)
    }
    
    public func high(_ size: Int) -> Meter {
        return mutate(high: size)
    }
    
    public func optimum(_ value: Float) -> Meter {
        return mutate(optimum: value)
    }
    
    public func value(_ value: String) -> Meter {
        return mutate(value: value)
    }
}

extension Meter: Content {
    
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
public struct Details: ContentNode {

    internal var name: String { "details" }

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

extension Details: GlobalAttributes, OpenAttribute, ToggleEventAttribute {
    
    public func onToggle(_ value: String) -> Details {
        return mutate(ontoggle: value)
    }
    
    public func accessKey(_ value: String) -> Details {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Details {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Details {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Details {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Details {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Details {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Details {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Details {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Details {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Details {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Details {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Details {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Details {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Details {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Details {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> Details {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> Details {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Details {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> Details {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Details {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Details {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Details {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Details {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Details {
        return mutate(translate: value)
    }

    public func isOpen(_ condition: Bool) -> Details {
        return mutate(open: condition)
    }
}

extension Details: Content {
    
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
public struct Dialog: ContentNode {

    internal var name: String { "dialog" }

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

extension Dialog: GlobalAttributes, OpenAttribute {
    
    public func accessKey(_ value: String) -> Dialog {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Dialog {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Dialog {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Dialog {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Dialog {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Dialog {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Dialog {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Dialog {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Dialog {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Dialog {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Dialog {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Dialog {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Dialog {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Dialog {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Dialog {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> Dialog {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> Dialog {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Dialog {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> Dialog {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Dialog {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Dialog {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Dialog {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Dialog {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Dialog {
        return mutate(translate: value)
    }

    public func isOpen(_ condition: Bool) -> Dialog {
        return mutate(open: condition)
    }
}

extension Dialog: Content {
    
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
public struct Script: ContentNode {

    internal var name: String { "script" }

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

extension Script: GlobalAttributes, AsynchronouslyAttribute, ReferrerPolicyAttribute, SourceAttribute, TypeAttribute, ErrorEventAttribute, LoadEventAttribute {
    
    public func onError(_ value: String) -> Script {
        return mutate(onerror: value)
    }
    
    public func onLoad(_ value: String) -> Script {
        return mutate(onload: value)
    }

    public func accessKey(_ value: String) -> Script {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Script {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Script {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Script {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Script {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Script {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Script {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Script {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Script {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Script {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Script {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Script {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Script {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Script {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Script {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> Script {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> Script {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Script {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> Script {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Script {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Script {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Script {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Script {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Script {
        return mutate(translate: value)
    }

    public func asynchronously() -> Script {
        return mutate(async: "async")
    }
    
    public func referrerPolicy(_ type: Policy) -> Script {
        return mutate(referrerpolicy: type.rawValue)
    }
    
    public func source(_ value: String) -> Script {
        return mutate(source: value)
    }
    
    public func type(_ value: String) -> Script {
        return mutate(type: value)
    }
}

extension Script: Content {
    
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
public struct NoScript: ContentNode {

    internal var name: String { "noscript" }

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

extension NoScript: GlobalAttributes {
    
    public func accessKey(_ value: String) -> NoScript {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> NoScript {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> NoScript {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> NoScript {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> NoScript {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> NoScript {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> NoScript {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> NoScript {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> NoScript {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> NoScript {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> NoScript {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> NoScript {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> NoScript {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> NoScript {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> NoScript {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> NoScript {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> NoScript {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> NoScript {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> NoScript {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> NoScript {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> NoScript {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> NoScript {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> NoScript {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> NoScript {
        return mutate(translate: value)
    }
}

extension NoScript: Content {
    
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
public struct Template: ContentNode {

    internal var name: String { "template" }

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

extension Template: GlobalAttributes {
    
    public func accessKey(_ value: String) -> Template {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Template {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Template {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Template {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Template {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Template {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Template {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Template {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Template {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Template {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Template {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Template {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Template {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Template {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Template {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> Template {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> Template {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Template {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> Template {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Template {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Template {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Template {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Template {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Template {
        return mutate(translate: value)
    }
}

extension Template: Content {
    
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
public struct Canvas: ContentNode {

    internal var name: String { "canvas" }

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

extension Canvas: GlobalAttributes, WidthAttribute, HeightAttribute {
    
    public func accessKey(_ value: String) -> Canvas {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Canvas {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Canvas {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Canvas {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Canvas {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Canvas {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Canvas {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Canvas {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Canvas {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Canvas {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Canvas {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Canvas {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Canvas {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Canvas {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Canvas {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> Canvas {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> Canvas {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Canvas {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> Canvas {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Canvas {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Canvas {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Canvas {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Canvas {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Canvas {
        return mutate(translate: value)
    }
    
    public func width(_ size: Int) -> Canvas {
        return mutate(width: size)
    }
    
    public func height(_ size: Int) -> Canvas {
        return mutate(height: size)
    }
}

extension Canvas: Content {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}
