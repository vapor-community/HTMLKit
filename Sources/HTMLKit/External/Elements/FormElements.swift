import OrderedCollections

/// The element
///
///
public struct Input: EmptyNode {

    internal var name: String { "input" }

    internal var attributes: OrderedDictionary<String, Any>?

    public init() {}
    
    internal init(attributes: OrderedDictionary<String, Any>?) {
        self.attributes = attributes
    }
}

extension Input: GlobalAttributes, AcceptAttribute, AlternateAttribute, AutocompleteAttribute, CheckedAttribute, DisabledAttribute, FormAttribute, FormActionAttribute, HeightAttribute, ListAttribute, MaximumValueAttribute, MaximumLengthAttribute, MinimumValueAttribute, MinimumLengthAttribute, MultipleAttribute, NameAttribute, PatternAttribute, PlaceholderAttribute, ReadyOnlyAttribute, RequiredAttribute, SizeAttribute, SourceAttribute, StepAttribute, TypeAttribute, ValueAttribute, WidthAttribute, InvalidEventAttribute {
    
    public func onInvalid(_ value: String) -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(oninvalid: value))
        }
        
        return .init(attributes: update(oninvalid: value, on: &attributes))
    }
    
    public func accessKey(_ value: String) -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(accesskey: value))
        }
        
        return .init(attributes: update(accesskey: value, on: &attributes))
    }

    public func autocapitalize(_ type: Capitalization) -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(autocapitalize: type.rawValue))
        }
        
        return .init(attributes: update(autocapitalize: type.rawValue, on: &attributes))
    }

    public func autofocus() -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(autofocus: "autofocus"))
        }
        
        return .init(attributes: update(autofocus: "autofocus", on: &attributes))
    }

    public func `class`(_ value: String) -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(class: value))
        }
        
        return .init(attributes: update(class: value, on: &attributes))
    }

    public func isEditable(_ value: Bool) -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(contenteditable: true))
        }
        
        return .init(attributes: update(contenteditable: true, on: &attributes))
    }

    public func direction(_ type: Direction) -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(direction: type.rawValue))
        }
        
        return .init(attributes: update(direction: type.rawValue, on: &attributes))
    }

    public func isDraggable(_ value: Bool) -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(draggable: true))
        }
        
        return .init(attributes: update(draggable: true, on: &attributes))
    }

    public func enterKeyHint(_ type: Hint) -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(hint: type.rawValue))
        }
        
        return .init(attributes: update(hint: type.rawValue, on: &attributes))
    }

    public func hidden() -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(hidden: "hidden"))
        }
        
        return .init(attributes: update(hidden: "hidden", on: &attributes))
    }

    public func inputMode(_ value: String) -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(inputmode: value))
        }
        
        return .init(attributes: update(inputmode: value, on: &attributes))
    }

    public func `is`(_ value: String) -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(is: value))
        }
        
        return .init(attributes: update(is: value, on: &attributes))
    }

    public func itemId(_ value: String) -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemid: value))
        }
        
        return .init(attributes: update(itemid: value, on: &attributes))
    }

    public func itemProperty(_ value: String) -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemprop: value))
        }
        
        return .init(attributes: update(itemprop: value, on: &attributes))
    }

    public func itemReference(_ value: String) -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemref: value))
        }
        
        return .init(attributes: update(itemref: value, on: &attributes))
    }

    public func itemScope(_ value: String) -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemscope: value))
        }
        
        return .init(attributes: update(itemscope: value, on: &attributes))
    }

    public func id(_ value: String) -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(id: value))
        }
        
        return .init(attributes: update(id: value, on: &attributes))
    }

    public func language(_ type: Language) -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(lang: type.rawValue))
        }
        
        return .init(attributes: update(lang: type.rawValue, on: &attributes))
    }

    public func nonce(_ value: String) -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(nonce: value))
        }
        
        return .init(attributes: update(nonce: value, on: &attributes))
    }
    
    public func role(_ value: String) -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(role: value))
        }
        
        return .init(attributes: update(role: value, on: &attributes))
    }

    public func hasSpellCheck(_ value: Bool) -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(spellcheck: true))
        }
        
        return .init(attributes: update(spellcheck: true, on: &attributes))
    }

    public func style(_ value: String) -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(style: value))
        }
        
        return .init(attributes: update(style: value, on: &attributes))
    }

    public func tabIndex(_ value: String) -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(index: value))
        }
        
        return .init(attributes: update(index: value, on: &attributes))
    }

    public func title(_ value: String) -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(title: value))
        }
        
        return .init(attributes: update(title: value, on: &attributes))
    }

    public func translate(_ value: String) -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(translate: value))
        }
        
        return .init(attributes: update(translate: value, on: &attributes))
    }

    public func accept(_ value: String) -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(accept: value))
        }
        
        return .init(attributes: update(accept: value, on: &attributes))
    }
    
    public func alternate(_ value: String) -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(alt: value))
        }
        
        return .init(attributes: update(alt: value, on: &attributes))
    }
    
    public func hasCompletion(_ condition: Bool) -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(autocomplete: condition))
        }
        
        return .init(attributes: update(autocomplete: condition, on: &attributes))
    }
    
    public func checked() -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(checked: "checked"))
        }
        
        return .init(attributes: update(checked: "checked", on: &attributes))
    }
    
    public func disabled() -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(disabled: "disabled"))
        }
        
        return .init(attributes: update(disabled: "disabled", on: &attributes))
    }
    
    public func form(_ value: String) -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(form: value))
        }
        
        return .init(attributes: update(form: value, on: &attributes))
    }
    
    public func formAction(_ value: String) -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(formaction: value))
        }
        
        return .init(attributes: update(formaction: value, on: &attributes))
    }
    
    public func height(_ size: Int) -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(height: size))
        }
        
        return .init(attributes: update(height: size, on: &attributes))
    }
    
    public func list(_ value: Content) -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(list: value))
        }
        
        return .init(attributes: update(list: value, on: &attributes))
    }
    
    public func maximum(_ value: Content) -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(max: value))
        }
        
        return .init(attributes: update(max: value, on: &attributes))
    }
    
    public func maximum(length value: Content) -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(maxlength: value))
        }
        
        return .init(attributes: update(maxlength: value, on: &attributes))
    }
    
    public func minimum(_ value: Content) -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(min: value))
        }
        
        return .init(attributes: update(min: value, on: &attributes))
    }
    
    public func minimum(length value: Content) -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(minlength: value))
        }
        
        return .init(attributes: update(minlength: value, on: &attributes))
    }
    
    public func multiple() -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(multiple: "multiple"))
        }
        
        return .init(attributes: update(multiple: "multiple", on: &attributes))
    }
    
    public func name(_ type: NameType) -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(name: type.rawValue))
        }
        
        return .init(attributes: update(name: type.rawValue, on: &attributes))
    }
    
    public func pattern(_ regex: String) -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(pattern: regex))
        }
        
        return .init(attributes: update(pattern: regex, on: &attributes))
    }
    
    public func placeholder(_ value: String) -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(placeholder: value))
        }
        
        return .init(attributes: update(placeholer: value, on: &attributes))
    }
    
    public func readonly() -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(readonly: "readonly"))
        }
        
        return .init(attributes: update(readonly: "readonly", on: &attributes))
    }
    
    public func required() -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(required: "required"))
        }
        
        return .init(attributes: update(required: "required", on: &attributes))
    }
    
    public func size(_ size: Int) -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(size: size))
        }
        
        return .init(attributes: update(size: size, on: &attributes))
    }
    
    public func source(_ value: String) -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(source: value))
        }
        
        return .init(attributes: update(source: value, on: &attributes))
    }
    
    public func step(_ size: Int) -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(step: size))
        }
        
        return .init(attributes: update(step: size, on: &attributes))
    }
    
    public func type(_ value: String) -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(type: value))
        }
        
        return .init(attributes: update(type: value, on: &attributes))
    }
    
    public func value(_ value: String) -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(value: value))
        }
        
        return .init(attributes: update(value: value, on: &attributes))
    }
    
    public func width(_ size: Int) -> Input {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(width: size))
        }
        
        return .init(attributes: update(width: size, on: &attributes))
    }
}

extension Input: Content {
    
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
public struct Label: ContentNode {

    internal var name: String { "label" }

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

extension Label: GlobalAttributes, ForAttribute {
    
    public func accessKey(_ value: String) -> Label {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(accesskey: value), content: content)
        }
        
        return .init(attributes: update(accesskey: value, on: &attributes), content: content)
    }

    public func autocapitalize(_ type: Capitalization) -> Label {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(autocapitalize: type.rawValue), content: content)
        }
        
        return .init(attributes: update(autocapitalize: type.rawValue, on: &attributes), content: content)
    }

    public func autofocus() -> Label {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(autofocus: "autofocus"), content: content)
        }
        
        return .init(attributes: update(autofocus: "autofocus", on: &attributes), content: content)
    }

    public func `class`(_ value: String) -> Label {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(class: value), content: content)
        }
        
        return .init(attributes: update(class: value, on: &attributes), content: content)
    }

    public func isEditable(_ value: Bool) -> Label {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(contenteditable: true), content: content)
        }
        
        return .init(attributes: update(contenteditable: true, on: &attributes), content: content)
    }

    public func direction(_ type: Direction) -> Label {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(direction: type.rawValue), content: content)
        }
        
        return .init(attributes: update(direction: type.rawValue, on: &attributes), content: content)
    }

    public func isDraggable(_ value: Bool) -> Label {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(draggable: true), content: content)
        }
        
        return .init(attributes: update(draggable: true, on: &attributes), content: content)
    }

    public func enterKeyHint(_ type: Hint) -> Label {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(hint: type.rawValue), content: content)
        }
        
        return .init(attributes: update(hint: type.rawValue, on: &attributes), content: content)
    }

    public func hidden() -> Label {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(hidden: "hidden"), content: content)
        }
        
        return .init(attributes: update(hidden: "hidden", on: &attributes), content: content)
    }

    public func inputMode(_ value: String) -> Label {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(inputmode: value), content: content)
        }
        
        return .init(attributes: update(inputmode: value, on: &attributes), content: content)
    }

    public func `is`(_ value: String) -> Label {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(is: value), content: content)
        }
        
        return .init(attributes: update(is: value, on: &attributes), content: content)
    }

    public func itemId(_ value: String) -> Label {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemid: value), content: content)
        }
        
        return .init(attributes: update(itemid: value, on: &attributes), content: content)
    }

    public func itemProperty(_ value: String) -> Label {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemprop: value), content: content)
        }
        
        return .init(attributes: update(itemprop: value, on: &attributes), content: content)
    }

    public func itemReference(_ value: String) -> Label {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemref: value), content: content)
        }
        
        return .init(attributes: update(itemref: value, on: &attributes), content: content)
    }

    public func itemScope(_ value: String) -> Label {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemscope: value), content: content)
        }
        
        return .init(attributes: update(itemscope: value, on: &attributes), content: content)
    }

    public func id(_ value: String) -> Label {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(id: value), content: content)
        }
        
        return .init(attributes: update(id: value, on: &attributes), content: content)
    }

    public func language(_ type: Language) -> Label {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(lang: type.rawValue), content: content)
        }
        
        return .init(attributes: update(lang: type.rawValue, on: &attributes), content: content)
    }

    public func nonce(_ value: String) -> Label {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(nonce: value), content: content)
        }
        
        return .init(attributes: update(nonce: value, on: &attributes), content: content)
    }

    public func role(_ value: String) -> Label {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(role: value), content: content)
        }
        
        return .init(attributes: update(role: value, on: &attributes), content: content)
    }

    public func hasSpellCheck(_ value: Bool) -> Label {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(spellcheck: true), content: content)
        }
        
        return .init(attributes: update(spellcheck: true, on: &attributes), content: content)
    }

    public func style(_ value: String) -> Label {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(style: value), content: content)
        }
        
        return .init(attributes: update(style: value, on: &attributes), content: content)
    }

    public func tabIndex(_ value: String) -> Label {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(index: value), content: content)
        }
        
        return .init(attributes: update(index: value, on: &attributes), content: content)
    }

    public func title(_ value: String) -> Label {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(title: value), content: content)
        }
        
        return .init(attributes: update(title: value, on: &attributes), content: content)
    }

    public func translate(_ value: String) -> Label {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(translate: value), content: content)
        }
        
        return .init(attributes: update(translate: value, on: &attributes), content: content)
    }
    
    public func `for`(_ value: String) -> Label {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(for: value), content: content)
        }
        
        return .init(attributes: update(for: value, on: &attributes), content: content)
    }
}

extension Label: Localizable {
    
    public init(_ localizedKey: String) {
        self.content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        self.content = Localized(key: localizedKey, context: context)
    }
}

extension Label: Content {
    
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
public struct Select: ContentNode {

    internal var name: String { "select" }

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

extension Select: GlobalAttributes, AutocompleteAttribute, DisabledAttribute, FormAttribute, MultipleAttribute, NameAttribute, RequiredAttribute, SizeAttribute {
    
    public func accessKey(_ value: String) -> Select {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(accesskey: value), content: content)
        }
        
        return .init(attributes: update(accesskey: value, on: &attributes), content: content)
    }

    public func autocapitalize(_ type: Capitalization) -> Select {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(autocapitalize: type.rawValue), content: content)
        }
        
        return .init(attributes: update(autocapitalize: type.rawValue, on: &attributes), content: content)
    }

    public func autofocus() -> Select {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(autofocus: "autofocus"), content: content)
        }
        
        return .init(attributes: update(autofocus: "autofocus", on: &attributes), content: content)
    }

    public func `class`(_ value: String) -> Select {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(class: value), content: content)
        }
        
        return .init(attributes: update(class: value, on: &attributes), content: content)
    }

    public func isEditable(_ value: Bool) -> Select {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(contenteditable: true), content: content)
        }
        
        return .init(attributes: update(contenteditable: true, on: &attributes), content: content)
    }

    public func direction(_ type: Direction) -> Select {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(direction: type.rawValue), content: content)
        }
        
        return .init(attributes: update(direction: type.rawValue, on: &attributes), content: content)
    }

    public func isDraggable(_ value: Bool) -> Select {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(draggable: true), content: content)
        }
        
        return .init(attributes: update(draggable: true, on: &attributes), content: content)
    }

    public func enterKeyHint(_ type: Hint) -> Select {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(hint: type.rawValue), content: content)
        }
        
        return .init(attributes: update(hint: type.rawValue, on: &attributes), content: content)
    }

    public func hidden() -> Select {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(hidden: "hidden"), content: content)
        }
        
        return .init(attributes: update(hidden: "hidden", on: &attributes), content: content)
    }

    public func inputMode(_ value: String) -> Select {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(inputmode: value), content: content)
        }
        
        return .init(attributes: update(inputmode: value, on: &attributes), content: content)
    }

    public func `is`(_ value: String) -> Select {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(is: value), content: content)
        }
        
        return .init(attributes: update(is: value, on: &attributes), content: content)
    }

    public func itemId(_ value: String) -> Select {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemid: value), content: content)
        }
        
        return .init(attributes: update(itemid: value, on: &attributes), content: content)
    }

    public func itemProperty(_ value: String) -> Select {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemprop: value), content: content)
        }
        
        return .init(attributes: update(itemprop: value, on: &attributes), content: content)
    }

    public func itemReference(_ value: String) -> Select {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemref: value), content: content)
        }
        
        return .init(attributes: update(itemref: value, on: &attributes), content: content)
    }

    public func itemScope(_ value: String) -> Select {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemscope: value), content: content)
        }
        
        return .init(attributes: update(itemscope: value, on: &attributes), content: content)
    }

    public func id(_ value: String) -> Select {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(id: value), content: content)
        }
        
        return .init(attributes: update(id: value, on: &attributes), content: content)
    }

    public func language(_ type: Language) -> Select {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(lang: type.rawValue), content: content)
        }
        
        return .init(attributes: update(lang: type.rawValue, on: &attributes), content: content)
    }

    public func nonce(_ value: String) -> Select {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(nonce: value), content: content)
        }
        
        return .init(attributes: update(nonce: value, on: &attributes), content: content)
    }

    public func role(_ value: String) -> Select {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(role: value), content: content)
        }
        
        return .init(attributes: update(role: value, on: &attributes), content: content)
    }

    public func hasSpellCheck(_ value: Bool) -> Select {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(spellcheck: true), content: content)
        }
        
        return .init(attributes: update(spellcheck: true, on: &attributes), content: content)
    }

    public func style(_ value: String) -> Select {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(style: value), content: content)
        }
        
        return .init(attributes: update(style: value, on: &attributes), content: content)
    }

    public func tabIndex(_ value: String) -> Select {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(index: value), content: content)
        }
        
        return .init(attributes: update(index: value, on: &attributes), content: content)
    }

    public func title(_ value: String) -> Select {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(title: value), content: content)
        }
        
        return .init(attributes: update(title: value, on: &attributes), content: content)
    }

    public func translate(_ value: String) -> Select {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(translate: value), content: content)
        }
        
        return .init(attributes: update(translate: value, on: &attributes), content: content)
    }

    public func hasCompletion(_ condition: Bool) -> Select {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(autocomplete: true), content: content)
        }
        
        return .init(attributes: update(autocomplete: true, on: &attributes), content: content)
    }
    
    public func disabled() -> Select {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(disabled: "disabled"), content: content)
        }
        
        return .init(attributes: update(disabled: "disabled", on: &attributes), content: content)
    }
    
    public func form(_ value: String) -> Select {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(form: value), content: content)
        }
        
        return .init(attributes: update(form: value, on: &attributes), content: content)
    }
    
    public func multiple() -> Select {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(multiple: "multiple"), content: content)
        }
        
        return .init(attributes: update(multiple: "multiple", on: &attributes), content: content)
    }
    
    public func name(_ type: NameType) -> Select {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(name: type.rawValue), content: content)
        }
        
        return .init(attributes: update(name: type.rawValue, on: &attributes), content: content)
    }
    
    public func required() -> Select {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(required: "required"), content: content)
        }
        
        return .init(attributes: update(required: "required", on: &attributes), content: content)
    }
    
    public func size(_ size: Int) -> Select {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(size: size), content: content)
        }
        
        return .init(attributes: update(size: size, on: &attributes), content: content)
    }
}

extension Select: Content {
    
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
public struct TextArea: ContentNode {
        
    internal var name: String { "textarea" }

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

extension TextArea: GlobalAttributes, AutocompleteAttribute, ColumnsAttribute, DisabledAttribute, FormAttribute, MaximumLengthAttribute, MinimumLengthAttribute, NameAttribute, PlaceholderAttribute, ReadyOnlyAttribute, RequiredAttribute, RowsAttribute, WrapAttribute {
    
    public func accessKey(_ value: String) -> TextArea {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(accesskey: value), content: content)
        }
        
        return .init(attributes: update(accesskey: value, on: &attributes), content: content)
    }

    public func autocapitalize(_ type: Capitalization) -> TextArea {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(autocapitalize: type.rawValue), content: content)
        }
        
        return .init(attributes: update(autocapitalize: type.rawValue, on: &attributes), content: content)
    }

    public func autofocus() -> TextArea {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(autofocus: "autofocus"), content: content)
        }
        
        return .init(attributes: update(autofocus: "autofocus", on: &attributes), content: content)
    }

    public func `class`(_ value: String) -> TextArea {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(class: value), content: content)
        }
        
        return .init(attributes: update(class: value, on: &attributes), content: content)
    }

    public func isEditable(_ value: Bool) -> TextArea {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(contenteditable: true), content: content)
        }
        
        return .init(attributes: update(contenteditable: true, on: &attributes), content: content)
    }

    public func direction(_ type: Direction) -> TextArea {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(direction: type.rawValue), content: content)
        }
        
        return .init(attributes: update(direction: type.rawValue, on: &attributes), content: content)
    }

    public func isDraggable(_ value: Bool) -> TextArea {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(draggable: true), content: content)
        }
        
        return .init(attributes: update(draggable: true, on: &attributes), content: content)
    }

    public func enterKeyHint(_ type: Hint) -> TextArea {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(hint: type.rawValue), content: content)
        }
        
        return .init(attributes: update(hint: type.rawValue, on: &attributes), content: content)
    }

    public func hidden() -> TextArea {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(hidden: "hidden"), content: content)
        }
        
        return .init(attributes: update(hidden: "hidden", on: &attributes), content: content)
    }

    public func inputMode(_ value: String) -> TextArea {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(inputmode: value), content: content)
        }
        
        return .init(attributes: update(inputmode: value, on: &attributes), content: content)
    }

    public func `is`(_ value: String) -> TextArea {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(is: value), content: content)
        }
        
        return .init(attributes: update(is: value, on: &attributes), content: content)
    }

    public func itemId(_ value: String) -> TextArea {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemid: value), content: content)
        }
        
        return .init(attributes: update(itemid: value, on: &attributes), content: content)
    }

    public func itemProperty(_ value: String) -> TextArea {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemprop: value), content: content)
        }
        
        return .init(attributes: update(itemprop: value, on: &attributes), content: content)
    }

    public func itemReference(_ value: String) -> TextArea {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemref: value), content: content)
        }
        
        return .init(attributes: update(itemref: value, on: &attributes), content: content)
    }

    public func itemScope(_ value: String) -> TextArea {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemscope: value), content: content)
        }
        
        return .init(attributes: update(itemscope: value, on: &attributes), content: content)
    }

    public func id(_ value: String) -> TextArea {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(id: value), content: content)
        }
        
        return .init(attributes: update(id: value, on: &attributes), content: content)
    }

    public func language(_ type: Language) -> TextArea {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(lang: type.rawValue), content: content)
        }
        
        return .init(attributes: update(lang: type.rawValue, on: &attributes), content: content)
    }

    public func nonce(_ value: String) -> TextArea {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(nonce: value), content: content)
        }
        
        return .init(attributes: update(nonce: value, on: &attributes), content: content)
    }

    public func role(_ value: String) -> TextArea {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(role: value), content: content)
        }
        
        return .init(attributes: update(role: value, on: &attributes), content: content)
    }

    public func hasSpellCheck(_ value: Bool) -> TextArea {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(spellcheck: true), content: content)
        }
        
        return .init(attributes: update(spellcheck: true, on: &attributes), content: content)
    }

    public func style(_ value: String) -> TextArea {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(style: value), content: content)
        }
        
        return .init(attributes: update(style: value, on: &attributes), content: content)
    }

    public func tabIndex(_ value: String) -> TextArea {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(index: value), content: content)
        }
        
        return .init(attributes: update(index: value, on: &attributes), content: content)
    }

    public func title(_ value: String) -> TextArea {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(title: value), content: content)
        }
        
        return .init(attributes: update(title: value, on: &attributes), content: content)
    }

    public func translate(_ value: String) -> TextArea {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(translate: value), content: content)
        }
        
        return .init(attributes: update(translate: value, on: &attributes), content: content)
    }

    public func hasCompletion(_ condition: Bool) -> TextArea {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(autocomplete: true), content: content)
        }
        
        return .init(attributes: update(autocomplete: true, on: &attributes), content: content)
    }
    
    public func columns(_ size: Int) -> TextArea {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(columns: size), content: content)
        }
        
        return .init(attributes: update(columns: size, on: &attributes), content: content)
    }
    
    public func disabled() -> TextArea {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(disabled: "disabled"), content: content)
        }
        
        return .init(attributes: update(disabled: "disabled", on: &attributes), content: content)
    }
    
    public func form(_ value: String) -> TextArea {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(form: value), content: content)
        }
        
        return .init(attributes: update(form: value, on: &attributes), content: content)
    }
    
    public func maximum(length value: Content) -> TextArea {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(maxlength: value), content: content)
        }
        
        return .init(attributes: update(maxlength: value, on: &attributes), content: content)
    }
    
    public func minimum(length value: Content) -> TextArea {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(minlength: value), content: content)
        }
        
        return .init(attributes: update(minlength: value, on: &attributes), content: content)
    }
    
    public func name(_ type: NameType) -> TextArea {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(name: type.rawValue), content: content)
        }
        
        return .init(attributes: update(name: type.rawValue, on: &attributes), content: content)
    }
    
    public func placeholder(_ value: String) -> TextArea {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(placeholder: value), content: content)
        }
        
        return .init(attributes: update(placeholer: value, on: &attributes), content: content)
    }
    
    public func readonly() -> TextArea {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(readonly: "readonly"), content: content)
        }
        
        return .init(attributes: update(readonly: "readonly", on: &attributes), content: content)
    }
    
    public func required() -> TextArea {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(required: "required"), content: content)
        }
        
        return .init(attributes: update(required: "required", on: &attributes), content: content)
    }
    
    public func rows(_ size: Int) -> TextArea {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(rows: size), content: content)
        }
        
        return .init(attributes: update(rows: size, on: &attributes), content: content)
    }
    
    public func wrap(_ type: Wrapping) -> TextArea {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(wrap: type.rawValue), content: content)
        }
        
        return .init(attributes: update(wrap: type.rawValue, on: &attributes), content: content)
    }
}

extension TextArea: Content {
    
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
public struct Button: ContentNode {

    internal var name: String { "button" }

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

extension Button: GlobalAttributes, DisabledAttribute, FormAttribute, FormActionAttribute, NameAttribute, TypeAttribute, ValueAttribute {
    
    public func accessKey(_ value: String) -> Button {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(accesskey: value), content: content)
        }
        
        return .init(attributes: update(accesskey: value, on: &attributes), content: content)
    }

    public func autocapitalize(_ type: Capitalization) -> Button {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(autocapitalize: type.rawValue), content: content)
        }
        
        return .init(attributes: update(autocapitalize: type.rawValue, on: &attributes), content: content)
    }

    public func autofocus() -> Button {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(autofocus: "autofocus"), content: content)
        }
        
        return .init(attributes: update(autofocus: "autofocus", on: &attributes), content: content)
    }

    public func `class`(_ value: String) -> Button {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(class: value), content: content)
        }
        
        return .init(attributes: update(class: value, on: &attributes), content: content)
    }

    public func isEditable(_ value: Bool) -> Button {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(contenteditable: true), content: content)
        }
        
        return .init(attributes: update(contenteditable: true, on: &attributes), content: content)
    }

    public func direction(_ type: Direction) -> Button {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(direction: type.rawValue), content: content)
        }
        
        return .init(attributes: update(direction: type.rawValue, on: &attributes), content: content)
    }

    public func isDraggable(_ value: Bool) -> Button {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(draggable: true), content: content)
        }
        
        return .init(attributes: update(draggable: true, on: &attributes), content: content)
    }

    public func enterKeyHint(_ type: Hint) -> Button {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(hint: type.rawValue), content: content)
        }
        
        return .init(attributes: update(hint: type.rawValue, on: &attributes), content: content)
    }

    public func hidden() -> Button {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(hidden: "hidden"), content: content)
        }
        
        return .init(attributes: update(hidden: "hidden", on: &attributes), content: content)
    }

    public func inputMode(_ value: String) -> Button {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(inputmode: value), content: content)
        }
        
        return .init(attributes: update(inputmode: value, on: &attributes), content: content)
    }

    public func `is`(_ value: String) -> Button {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(is: value), content: content)
        }
        
        return .init(attributes: update(is: value, on: &attributes), content: content)
    }

    public func itemId(_ value: String) -> Button {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemid: value), content: content)
        }
        
        return .init(attributes: update(itemid: value, on: &attributes), content: content)
    }

    public func itemProperty(_ value: String) -> Button {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemprop: value), content: content)
        }
        
        return .init(attributes: update(itemprop: value, on: &attributes), content: content)
    }

    public func itemReference(_ value: String) -> Button {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemref: value), content: content)
        }
        
        return .init(attributes: update(itemref: value, on: &attributes), content: content)
    }

    public func itemScope(_ value: String) -> Button {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemscope: value), content: content)
        }
        
        return .init(attributes: update(itemscope: value, on: &attributes), content: content)
    }

    public func id(_ value: String) -> Button {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(id: value), content: content)
        }
        
        return .init(attributes: update(id: value, on: &attributes), content: content)
    }

    public func language(_ type: Language) -> Button {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(lang: type.rawValue), content: content)
        }
        
        return .init(attributes: update(lang: type.rawValue, on: &attributes), content: content)
    }

    public func nonce(_ value: String) -> Button {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(nonce: value), content: content)
        }
        
        return .init(attributes: update(nonce: value, on: &attributes), content: content)
    }

    public func role(_ value: String) -> Button {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(role: value), content: content)
        }
        
        return .init(attributes: update(role: value, on: &attributes), content: content)
    }

    public func hasSpellCheck(_ value: Bool) -> Button {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(spellcheck: true), content: content)
        }
        
        return .init(attributes: update(spellcheck: true, on: &attributes), content: content)
    }

    public func style(_ value: String) -> Button {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(style: value), content: content)
        }
        
        return .init(attributes: update(style: value, on: &attributes), content: content)
    }

    public func tabIndex(_ value: String) -> Button {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(index: value), content: content)
        }
        
        return .init(attributes: update(index: value, on: &attributes), content: content)
    }

    public func title(_ value: String) -> Button {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(title: value), content: content)
        }
        
        return .init(attributes: update(title: value, on: &attributes), content: content)
    }

    public func translate(_ value: String) -> Button {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(translate: value), content: content)
        }
        
        return .init(attributes: update(translate: value, on: &attributes), content: content)
    }
    
    public func disabled() -> Button {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(disabled: "disabled"), content: content)
        }
        
        return .init(attributes: update(disabled: "disabled", on: &attributes), content: content)
    }
    
    public func form(_ value: String) -> Button {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(form: value), content: content)
        }
        
        return .init(attributes: update(form: value, on: &attributes), content: content)
    }
    
    public func formAction(_ value: String) -> Button {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(formaction: value), content: content)
        }
        
        return .init(attributes: update(formaction: value, on: &attributes), content: content)
    }
    
    public func name(_ value: NameType) -> Button {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(name: value.rawValue), content: content)
        }
        
        return .init(attributes: update(name: value.rawValue, on: &attributes), content: content)
    }
    
    public func type(_ value: String) -> Button {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(type: value), content: content)
        }
        
        return .init(attributes: update(type: value, on: &attributes), content: content)
    }
    
    public func value(_ value: String) -> Button {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(value: value), content: content)
        }
        
        return .init(attributes: update(value: value, on: &attributes), content: content)
    }
}

extension Button: Localizable {
    
    public init(_ localizedKey: String) {
        self.content = Localized(key: localizedKey)
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        self.content = Localized(key: localizedKey, context: context)
    }
}

extension Button: Content {
    
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
public struct Fieldset: ContentNode {
    
    internal var name: String { "fieldset" }

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

extension Fieldset: GlobalAttributes, DisabledAttribute, FormAttribute, NameAttribute {
    
    public func accessKey(_ value: String) -> Fieldset {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(accesskey: value), content: content)
        }
        
        return .init(attributes: update(accesskey: value, on: &attributes), content: content)
    }

    public func autocapitalize(_ type: Capitalization) -> Fieldset {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(autocapitalize: type.rawValue), content: content)
        }
        
        return .init(attributes: update(autocapitalize: type.rawValue, on: &attributes), content: content)
    }

    public func autofocus() -> Fieldset {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(autofocus: "autofocus"), content: content)
        }
        
        return .init(attributes: update(autofocus: "autofocus", on: &attributes), content: content)
    }

    public func `class`(_ value: String) -> Fieldset {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(class: value), content: content)
        }
        
        return .init(attributes: update(class: value, on: &attributes), content: content)
    }

    public func isEditable(_ value: Bool) -> Fieldset {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(contenteditable: true), content: content)
        }
        
        return .init(attributes: update(contenteditable: true, on: &attributes), content: content)
    }

    public func direction(_ type: Direction) -> Fieldset {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(direction: type.rawValue), content: content)
        }
        
        return .init(attributes: update(direction: type.rawValue, on: &attributes), content: content)
    }

    public func isDraggable(_ value: Bool) -> Fieldset {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(draggable: true), content: content)
        }
        
        return .init(attributes: update(draggable: true, on: &attributes), content: content)
    }

    public func enterKeyHint(_ type: Hint) -> Fieldset {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(hint: type.rawValue), content: content)
        }
        
        return .init(attributes: update(hint: type.rawValue, on: &attributes), content: content)
    }

    public func hidden() -> Fieldset {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(hidden: "hidden"), content: content)
        }
        
        return .init(attributes: update(hidden: "hidden", on: &attributes), content: content)
    }

    public func inputMode(_ value: String) -> Fieldset {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(inputmode: value), content: content)
        }
        
        return .init(attributes: update(inputmode: value, on: &attributes), content: content)
    }

    public func `is`(_ value: String) -> Fieldset {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(is: value), content: content)
        }
        
        return .init(attributes: update(is: value, on: &attributes), content: content)
    }

    public func itemId(_ value: String) -> Fieldset {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemid: value), content: content)
        }
        
        return .init(attributes: update(itemid: value, on: &attributes), content: content)
    }

    public func itemProperty(_ value: String) -> Fieldset {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemprop: value), content: content)
        }
        
        return .init(attributes: update(itemprop: value, on: &attributes), content: content)
    }

    public func itemReference(_ value: String) -> Fieldset {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemref: value), content: content)
        }
        
        return .init(attributes: update(itemref: value, on: &attributes), content: content)
    }

    public func itemScope(_ value: String) -> Fieldset {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(itemscope: value), content: content)
        }
        
        return .init(attributes: update(itemscope: value, on: &attributes), content: content)
    }

    public func id(_ value: String) -> Fieldset {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(id: value), content: content)
        }
        
        return .init(attributes: update(id: value, on: &attributes), content: content)
    }

    public func language(_ type: Language) -> Fieldset {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(lang: type.rawValue), content: content)
        }
        
        return .init(attributes: update(lang: type.rawValue, on: &attributes), content: content)
    }

    public func nonce(_ value: String) -> Fieldset {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(nonce: value), content: content)
        }
        
        return .init(attributes: update(nonce: value, on: &attributes), content: content)
    }

    public func role(_ value: String) -> Fieldset {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(role: value), content: content)
        }
        
        return .init(attributes: update(role: value, on: &attributes), content: content)
    }

    public func hasSpellCheck(_ value: Bool) -> Fieldset {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(spellcheck: true), content: content)
        }
        
        return .init(attributes: update(spellcheck: true, on: &attributes), content: content)
    }

    public func style(_ value: String) -> Fieldset {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(style: value), content: content)
        }
        
        return .init(attributes: update(style: value, on: &attributes), content: content)
    }

    public func tabIndex(_ value: String) -> Fieldset {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(index: value), content: content)
        }
        
        return .init(attributes: update(index: value, on: &attributes), content: content)
    }

    public func title(_ value: String) -> Fieldset {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(title: value), content: content)
        }
        
        return .init(attributes: update(title: value, on: &attributes), content: content)
    }

    public func translate(_ value: String) -> Fieldset {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(translate: value), content: content)
        }
        
        return .init(attributes: update(translate: value, on: &attributes), content: content)
    }

    public func disabled() -> Fieldset {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(disabled: "disabled"), content: content)
        }
        
        return .init(attributes: update(disabled: "disabled", on: &attributes), content: content)
    }
    
    public func form(_ value: String) -> Fieldset {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(form: value), content: content)
        }
        
        return .init(attributes: update(form: value, on: &attributes), content: content)
    }
    
    public func name(_ type: NameType) -> Fieldset {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(name: type.rawValue), content: content)
        }
        
        return .init(attributes: update(name: type.rawValue, on: &attributes), content: content)
    }
}

extension Fieldset: Content {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}
