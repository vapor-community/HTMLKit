import OrderedCollections

/// The alias points
///
///
public typealias Optgroup = OptionGroup

/// The element
///
///
public struct OptionGroup: ContentNode {

    internal var name: String { "optgroup" }

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

extension OptionGroup: GlobalAttributes, DisabledAttribute, LabelAttribute {

    public func accessKey(_ value: String) -> OptionGroup {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(accesskey: value), content: content)
        }
        
        return .init(attributes: update(accesskey: value, on: &attributes), content: content)
    }

    public func autocapitalize(_ type: Capitalization) -> OptionGroup {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(autocapitalize: type.rawValue), content: content)
        }
        
        return .init(attributes: update(autocapitalize: type.rawValue, on: &attributes), content: content)
    }

    public func autofocus() -> OptionGroup {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(autofocus: "autofocus"), content: content)
        }
        
        return .init(attributes: update(autofocus: "autofocus", on: &attributes), content: content)
    }

    public func `class`(_ value: String) -> OptionGroup {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(class: value), content: content)
        }
        
        return .init(attributes: update(class: value, on: &attributes), content: content)
    }

    public func isEditable(_ value: Bool) -> OptionGroup {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(contenteditable: true), content: content)
        }
        
        return .init(attributes: update(contenteditable: true, on: &attributes), content: content)
    }

    public func direction(_ type: Direction) -> OptionGroup {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(direction: type.rawValue), content: content)
        }
        
        return .init(attributes: update(direction: type.rawValue, on: &attributes), content: content)
    }

    public func isDraggable(_ value: Bool) -> OptionGroup {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(draggable: true), content: content)
        }
        
        return .init(attributes: update(draggable: true, on: &attributes), content: content)
    }

    public func enterKeyHint(_ type: Hint) -> OptionGroup {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(hint: type.rawValue), content: content)
        }
        
        return .init(attributes: update(hint: type.rawValue, on: &attributes), content: content)
    }

    public func hidden() -> OptionGroup {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(hidden: "hidden"), content: content)
        }
        
        return .init(attributes: update(hidden: "hidden", on: &attributes), content: content)
    }

    public func inputMode(_ value: String) -> OptionGroup {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(inputmode: value), content: content)
        }
        
        return .init(attributes: update(inputmode: value, on: &attributes), content: content)
    }

    public func `is`(_ value: String) -> OptionGroup {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(is: value), content: content)
        }
        
        return .init(attributes: update(is: value, on: &attributes), content: content)
    }

    public func itemId(_ value: String) -> OptionGroup {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemid: value), content: content)
        }
        
        return .init(attributes: update(itemid: value, on: &attributes), content: content)
    }

    public func itemProperty(_ value: String) -> OptionGroup {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemprop: value), content: content)
        }
        
        return .init(attributes: update(itemprop: value, on: &attributes), content: content)
    }

    public func itemReference(_ value: String) -> OptionGroup {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemref: value), content: content)
        }
        
        return .init(attributes: update(itemref: value, on: &attributes), content: content)
    }

    public func itemScope(_ value: String) -> OptionGroup {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemscope: value), content: content)
        }
        
        return .init(attributes: update(itemscope: value, on: &attributes), content: content)
    }

    public func id(_ value: String) -> OptionGroup {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(id: value), content: content)
        }
        
        return .init(attributes: update(id: value, on: &attributes), content: content)
    }

    public func language(_ type: Language) -> OptionGroup {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(lang: type.rawValue), content: content)
        }
        
        return .init(attributes: update(lang: type.rawValue, on: &attributes), content: content)
    }

    public func nonce(_ value: String) -> OptionGroup {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(nonce: value), content: content)
        }
        
        return .init(attributes: update(nonce: value, on: &attributes), content: content)
    }

    public func role(_ value: String) -> OptionGroup {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(role: value), content: content)
        }
        
        return .init(attributes: update(role: value, on: &attributes), content: content)
    }

    public func hasSpellCheck(_ value: Bool) -> OptionGroup {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(spellcheck: true), content: content)
        }
        
        return .init(attributes: update(spellcheck: true, on: &attributes), content: content)
    }

    public func style(_ value: String) -> OptionGroup {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(style: value), content: content)
        }
        
        return .init(attributes: update(style: value, on: &attributes), content: content)
    }

    public func tabIndex(_ value: String) -> OptionGroup {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(index: value), content: content)
        }
        
        return .init(attributes: update(index: value, on: &attributes), content: content)
    }

    public func title(_ value: String) -> OptionGroup {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(title: value), content: content)
        }
        
        return .init(attributes: update(title: value, on: &attributes), content: content)
    }

    public func translate(_ value: String) -> OptionGroup {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(translate: value), content: content)
        }
        
        return .init(attributes: update(translate: value, on: &attributes), content: content)
    }

    public func disabled() -> OptionGroup {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(disabled: "disabled"), content: content)
        }
        
        return .init(attributes: update(disabled: "disabled", on: &attributes), content: content)
    }
    
    public func label(_ value: Content) -> OptionGroup {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(label: value), content: content)
        }
        
        return .init(attributes: update(label: value, on: &attributes), content: content)
    }
}

extension OptionGroup: Content {
    
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
public struct Option: ContentNode {

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
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(accesskey: value), content: content)
        }
        
        return .init(attributes: update(accesskey: value, on: &attributes), content: content)
    }

    public func autocapitalize(_ type: Capitalization) -> Option {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(autocapitalize: type.rawValue), content: content)
        }
        
        return .init(attributes: update(autocapitalize: type.rawValue, on: &attributes), content: content)
    }

    public func autofocus() -> Option {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(autofocus: "autofocus"), content: content)
        }
        
        return .init(attributes: update(autofocus: "autofocus", on: &attributes), content: content)
    }

    public func `class`(_ value: String) -> Option {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(class: value), content: content)
        }
        
        return .init(attributes: update(class: value, on: &attributes), content: content)
    }

    public func isEditable(_ value: Bool) -> Option {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(contenteditable: true), content: content)
        }
        
        return .init(attributes: update(contenteditable: true, on: &attributes), content: content)
    }

    public func direction(_ type: Direction) -> Option {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(direction: type.rawValue), content: content)
        }
        
        return .init(attributes: update(direction: type.rawValue, on: &attributes), content: content)
    }

    public func isDraggable(_ value: Bool) -> Option {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(draggable: true), content: content)
        }
        
        return .init(attributes: update(draggable: true, on: &attributes), content: content)
    }

    public func enterKeyHint(_ type: Hint) -> Option {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(hint: type.rawValue), content: content)
        }
        
        return .init(attributes: update(hint: type.rawValue, on: &attributes), content: content)
    }

    public func hidden() -> Option {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(hidden: "hidden"), content: content)
        }
        
        return .init(attributes: update(hidden: "hidden", on: &attributes), content: content)
    }

    public func inputMode(_ value: String) -> Option {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(inputmode: value), content: content)
        }
        
        return .init(attributes: update(inputmode: value, on: &attributes), content: content)
    }

    public func `is`(_ value: String) -> Option {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(is: value), content: content)
        }
        
        return .init(attributes: update(is: value, on: &attributes), content: content)
    }

    public func itemId(_ value: String) -> Option {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemid: value), content: content)
        }
        
        return .init(attributes: update(itemid: value, on: &attributes), content: content)
    }

    public func itemProperty(_ value: String) -> Option {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemprop: value), content: content)
        }
        
        return .init(attributes: update(itemprop: value, on: &attributes), content: content)
    }

    public func itemReference(_ value: String) -> Option {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemref: value), content: content)
        }
        
        return .init(attributes: update(itemref: value, on: &attributes), content: content)
    }

    public func itemScope(_ value: String) -> Option {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemscope: value), content: content)
        }
        
        return .init(attributes: update(itemscope: value, on: &attributes), content: content)
    }

    public func id(_ value: String) -> Option {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(id: value), content: content)
        }
        
        return .init(attributes: update(id: value, on: &attributes), content: content)
    }

    public func language(_ type: Language) -> Option {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(lang: type.rawValue), content: content)
        }
        
        return .init(attributes: update(lang: type.rawValue, on: &attributes), content: content)
    }

    public func nonce(_ value: String) -> Option {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(nonce: value), content: content)
        }
        
        return .init(attributes: update(nonce: value, on: &attributes), content: content)
    }

    public func role(_ value: String) -> Option {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(role: value), content: content)
        }
        
        return .init(attributes: update(role: value, on: &attributes), content: content)
    }

    public func hasSpellCheck(_ value: Bool) -> Option {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(spellcheck: true), content: content)
        }
        
        return .init(attributes: update(spellcheck: true, on: &attributes), content: content)
    }

    public func style(_ value: String) -> Option {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(style: value), content: content)
        }
        
        return .init(attributes: update(style: value, on: &attributes), content: content)
    }

    public func tabIndex(_ value: String) -> Option {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(index: value), content: content)
        }
        
        return .init(attributes: update(index: value, on: &attributes), content: content)
    }

    public func title(_ value: String) -> Option {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(title: value), content: content)
        }
        
        return .init(attributes: update(title: value, on: &attributes), content: content)
    }

    public func translate(_ value: String) -> Option {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(translate: value), content: content)
        }
        
        return .init(attributes: update(translate: value, on: &attributes), content: content)
    }

    public func disabled() -> Option {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(disabled: "disabled"), content: content)
        }
        
        return .init(attributes: update(disabled: "disabled", on: &attributes), content: content)
    }
    
    public func label(_ value: Content) -> Option {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(label: value), content: content)
        }
        
        return .init(attributes: update(label: value, on: &attributes), content: content)
    }
    
    public func value(_ value: String) -> Option {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(value: value), content: content)
        }
        
        return .init(attributes: update(value: value, on: &attributes), content: content)
    }
}

extension Option: Content {
    
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
public struct Legend: ContentNode {

    internal var name: String { "legend" }

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

extension Legend: GlobalAttributes {
    
    public func accessKey(_ value: String) -> Legend {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(accesskey: value), content: content)
        }
        
        return .init(attributes: update(accesskey: value, on: &attributes), content: content)
    }

    public func autocapitalize(_ type: Capitalization) -> Legend {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(autocapitalize: type.rawValue), content: content)
        }
        
        return .init(attributes: update(autocapitalize: type.rawValue, on: &attributes), content: content)
    }

    public func autofocus() -> Legend {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(autofocus: "autofocus"), content: content)
        }
        
        return .init(attributes: update(autofocus: "autofocus", on: &attributes), content: content)
    }

    public func `class`(_ value: String) -> Legend {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(class: value), content: content)
        }
        
        return .init(attributes: update(class: value, on: &attributes), content: content)
    }

    public func isEditable(_ value: Bool) -> Legend {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(contenteditable: true), content: content)
        }
        
        return .init(attributes: update(contenteditable: true, on: &attributes), content: content)
    }

    public func direction(_ type: Direction) -> Legend {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(direction: type.rawValue), content: content)
        }
        
        return .init(attributes: update(direction: type.rawValue, on: &attributes), content: content)
    }

    public func isDraggable(_ value: Bool) -> Legend {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(draggable: true), content: content)
        }
        
        return .init(attributes: update(draggable: true, on: &attributes), content: content)
    }

    public func enterKeyHint(_ type: Hint) -> Legend {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(hint: type.rawValue), content: content)
        }
        
        return .init(attributes: update(hint: type.rawValue, on: &attributes), content: content)
    }

    public func hidden() -> Legend {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(hidden: "hidden"), content: content)
        }
        
        return .init(attributes: update(hidden: "hidden", on: &attributes), content: content)
    }

    public func inputMode(_ value: String) -> Legend {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(inputmode: value), content: content)
        }
        
        return .init(attributes: update(inputmode: value, on: &attributes), content: content)
    }

    public func `is`(_ value: String) -> Legend {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(is: value), content: content)
        }
        
        return .init(attributes: update(is: value, on: &attributes), content: content)
    }

    public func itemId(_ value: String) -> Legend {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemid: value), content: content)
        }
        
        return .init(attributes: update(itemid: value, on: &attributes), content: content)
    }

    public func itemProperty(_ value: String) -> Legend {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemprop: value), content: content)
        }
        
        return .init(attributes: update(itemprop: value, on: &attributes), content: content)
    }

    public func itemReference(_ value: String) -> Legend {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemref: value), content: content)
        }
        
        return .init(attributes: update(itemref: value, on: &attributes), content: content)
    }

    public func itemScope(_ value: String) -> Legend {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemscope: value), content: content)
        }
        
        return .init(attributes: update(itemscope: value, on: &attributes), content: content)
    }

    public func id(_ value: String) -> Legend {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(id: value), content: content)
        }
        
        return .init(attributes: update(id: value, on: &attributes), content: content)
    }

    public func language(_ type: Language) -> Legend {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(lang: type.rawValue), content: content)
        }
        
        return .init(attributes: update(lang: type.rawValue, on: &attributes), content: content)
    }

    public func nonce(_ value: String) -> Legend {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(nonce: value), content: content)
        }
        
        return .init(attributes: update(nonce: value, on: &attributes), content: content)
    }

    public func role(_ value: String) -> Legend {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(role: value), content: content)
        }
        
        return .init(attributes: update(role: value, on: &attributes), content: content)
    }

    public func hasSpellCheck(_ value: Bool) -> Legend {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(spellcheck: true), content: content)
        }
        
        return .init(attributes: update(spellcheck: true, on: &attributes), content: content)
    }

    public func style(_ value: String) -> Legend {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(style: value), content: content)
        }
        
        return .init(attributes: update(style: value, on: &attributes), content: content)
    }

    public func tabIndex(_ value: String) -> Legend {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(index: value), content: content)
        }
        
        return .init(attributes: update(index: value, on: &attributes), content: content)
    }

    public func title(_ value: String) -> Legend {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(title: value), content: content)
        }
        
        return .init(attributes: update(title: value, on: &attributes), content: content)
    }

    public func translate(_ value: String) -> Legend {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(translate: value), content: content)
        }
        
        return .init(attributes: update(translate: value, on: &attributes), content: content)
    }
}

extension Legend: Content {
    
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
public struct Summary: ContentNode {

    internal var name: String { "summary" }

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

extension Summary: GlobalAttributes {
    
    public func accessKey(_ value: String) -> Summary {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(accesskey: value), content: content)
        }
        
        return .init(attributes: update(accesskey: value, on: &attributes), content: content)
    }

    public func autocapitalize(_ type: Capitalization) -> Summary {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(autocapitalize: type.rawValue), content: content)
        }
        
        return .init(attributes: update(autocapitalize: type.rawValue, on: &attributes), content: content)
    }

    public func autofocus() -> Summary {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(autofocus: "autofocus"), content: content)
        }
        
        return .init(attributes: update(autofocus: "autofocus", on: &attributes), content: content)
    }

    public func `class`(_ value: String) -> Summary {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(class: value), content: content)
        }
        
        return .init(attributes: update(class: value, on: &attributes), content: content)
    }

    public func isEditable(_ value: Bool) -> Summary {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(contenteditable: true), content: content)
        }
        
        return .init(attributes: update(contenteditable: true, on: &attributes), content: content)
    }

    public func direction(_ type: Direction) -> Summary {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(direction: type.rawValue), content: content)
        }
        
        return .init(attributes: update(direction: type.rawValue, on: &attributes), content: content)
    }

    public func isDraggable(_ value: Bool) -> Summary {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(draggable: true), content: content)
        }
        
        return .init(attributes: update(draggable: true, on: &attributes), content: content)
    }

    public func enterKeyHint(_ type: Hint) -> Summary {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(hint: type.rawValue), content: content)
        }
        
        return .init(attributes: update(hint: type.rawValue, on: &attributes), content: content)
    }

    public func hidden() -> Summary {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(hidden: "hidden"), content: content)
        }
        
        return .init(attributes: update(hidden: "hidden", on: &attributes), content: content)
    }

    public func inputMode(_ value: String) -> Summary {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(inputmode: value), content: content)
        }
        
        return .init(attributes: update(inputmode: value, on: &attributes), content: content)
    }

    public func `is`(_ value: String) -> Summary {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(is: value), content: content)
        }
        
        return .init(attributes: update(is: value, on: &attributes), content: content)
    }

    public func itemId(_ value: String) -> Summary {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemid: value), content: content)
        }
        
        return .init(attributes: update(itemid: value, on: &attributes), content: content)
    }

    public func itemProperty(_ value: String) -> Summary {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemprop: value), content: content)
        }
        
        return .init(attributes: update(itemprop: value, on: &attributes), content: content)
    }

    public func itemReference(_ value: String) -> Summary {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemref: value), content: content)
        }
        
        return .init(attributes: update(itemref: value, on: &attributes), content: content)
    }

    public func itemScope(_ value: String) -> Summary {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemscope: value), content: content)
        }
        
        return .init(attributes: update(itemscope: value, on: &attributes), content: content)
    }

    public func id(_ value: String) -> Summary {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(id: value), content: content)
        }
        
        return .init(attributes: update(id: value, on: &attributes), content: content)
    }

    public func language(_ type: Language) -> Summary {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(lang: type.rawValue), content: content)
        }
        
        return .init(attributes: update(lang: type.rawValue, on: &attributes), content: content)
    }

    public func nonce(_ value: String) -> Summary {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(nonce: value), content: content)
        }
        
        return .init(attributes: update(nonce: value, on: &attributes), content: content)
    }

    public func role(_ value: String) -> Summary {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(role: value), content: content)
        }
        
        return .init(attributes: update(role: value, on: &attributes), content: content)
    }

    public func hasSpellCheck(_ value: Bool) -> Summary {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(spellcheck: true), content: content)
        }
        
        return .init(attributes: update(spellcheck: true, on: &attributes), content: content)
    }

    public func style(_ value: String) -> Summary {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(style: value), content: content)
        }
        
        return .init(attributes: update(style: value, on: &attributes), content: content)
    }

    public func tabIndex(_ value: String) -> Summary {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(index: value), content: content)
        }
        
        return .init(attributes: update(index: value, on: &attributes), content: content)
    }

    public func title(_ value: String) -> Summary {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(title: value), content: content)
        }
        
        return .init(attributes: update(title: value, on: &attributes), content: content)
    }

    public func translate(_ value: String) -> Summary {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(translate: value), content: content)
        }
        
        return .init(attributes: update(translate: value, on: &attributes), content: content)
    }
}

extension Summary: Content {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}
