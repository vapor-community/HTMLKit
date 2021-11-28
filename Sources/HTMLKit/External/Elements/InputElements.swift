import OrderedCollections

/// The alias points
///
///
public typealias Optgroup = OptionGroup

/// The element
///
///
public struct OptionGroup: ContentNode, InputElement {

    internal var name: String { "optgroup" }

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

extension OptionGroup: GlobalAttributes, DisabledAttribute, LabelAttribute {

    public func accessKey(_ value: String) -> OptionGroup {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> OptionGroup {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> OptionGroup {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> OptionGroup {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> OptionGroup {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> OptionGroup {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> OptionGroup {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> OptionGroup {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> OptionGroup {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> OptionGroup {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> OptionGroup {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> OptionGroup {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> OptionGroup {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> OptionGroup {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> OptionGroup {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> OptionGroup {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> OptionGroup {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> OptionGroup {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> OptionGroup {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> OptionGroup {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> OptionGroup {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> OptionGroup {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> OptionGroup {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> OptionGroup {
        return mutate(translate: value)
    }

    public func disabled() -> OptionGroup {
        return mutate(disabled: "disabled")
    }
    
    public func label(_ value: String) -> OptionGroup {
        return mutate(label: value)
    }
}

extension OptionGroup: AnyContent {
    
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
public struct Option: ContentNode, InputElement {

    internal var name: String { "option" }

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

extension Option: GlobalAttributes, DisabledAttribute, LabelAttribute, ValueAttribute {
    
    public func accessKey(_ value: String) -> Option {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Option {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Option {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Option {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Option {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Option {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Option {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Option {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Option {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Option {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Option {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Option {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Option {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Option {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Option {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> Option {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> Option {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Option {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> Option {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Option {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Option {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Option {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Option {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Option {
        return mutate(translate: value)
    }

    public func disabled() -> Option {
        return mutate(disabled: "disabled")
    }
    
    public func label(_ value: String) -> Option {
        return mutate(label: value)
    }
    
    public func value(_ value: String) -> Option {
        return mutate(value: value)
    }
}

extension Option: AnyContent {
    
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
public struct Legend: ContentNode, InputElement {

    internal var name: String { "legend" }

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

extension Legend: GlobalAttributes {
    
    public func accessKey(_ value: String) -> Legend {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Legend {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Legend {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Legend {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Legend {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Legend {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Legend {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Legend {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Legend {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Legend {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Legend {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Legend {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Legend {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Legend {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Legend {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> Legend {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> Legend {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Legend {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> Legend {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Legend {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Legend {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Legend {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Legend {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Legend {
        return mutate(translate: value)
    }
}

extension Legend: AnyContent {
    
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
public struct Summary: ContentNode, InputElement {

    internal var name: String { "summary" }

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

extension Summary: GlobalAttributes {
    
    public func accessKey(_ value: String) -> Summary {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Summary {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Summary {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Summary {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Summary {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Summary {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Summary {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Summary {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Summary {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Summary {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Summary {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Summary {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Summary {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Summary {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Summary {
        return mutate(itemscope: value)
    }

    public func id(_ value: String) -> Summary {
        return mutate(id: value)
    }

    public func language(_ type: Language) -> Summary {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Summary {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> Summary {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Summary {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Summary {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Summary {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Summary {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Summary {
        return mutate(translate: value)
    }
}

extension Summary: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}
