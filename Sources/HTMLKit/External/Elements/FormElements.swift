/// # Description:
/// The file contains the form elements. The html element Form only allows these elements to be its
/// descendants. There are some exceptions too.
///
/// # Note:
/// If you about to add something to the file, stick to the official documentation to keep the code consistent.
///
/// # Authors:
/// Mats Moll: https://github.com/matsmoll
/// Mattes Mohr: https://github.com/mattesmohr

import OrderedCollections

/// # Description:
/// The element represents a typed data field to allow the user to edit the data.
///
/// # References:
/// https://html.spec.whatwg.org/#the-input-element
///
public struct Input: EmptyNode, FormElement {

    internal var name: String { "input" }

    internal var attributes: OrderedDictionary<String, Any>?

    public init() {}
    
    internal init(attributes: OrderedDictionary<String, Any>?) {
        self.attributes = attributes
    }
}

extension Input: GlobalAttributes, AcceptAttribute, AlternateAttribute, AutocompleteAttribute, CheckedAttribute, DisabledAttribute, FormAttribute, FormActionAttribute, HeightAttribute, ListAttribute, MaximumValueAttribute, MaximumLengthAttribute, MinimumValueAttribute, MinimumLengthAttribute, MultipleAttribute, NameAttribute, PatternAttribute, PlaceholderAttribute, ReadyOnlyAttribute, RequiredAttribute, SizeAttribute, SourceAttribute, StepAttribute, TypeAttribute, ValueAttribute, WidthAttribute, InvalidEventAttribute {
    
    public func onInvalid(_ value: String) -> Input {
        return mutate(oninvalid: value)
    }
    
    public func accessKey(_ value: String) -> Input {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Input {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Input {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Input {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Input {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Input {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Input {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Input {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Input {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Input {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Input {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Input {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Input {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Input {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Input {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Input {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Input {
        return mutate(id: value)
    }

    public func id(_ value: TemplateValue<String>) -> Input {
        return mutate(id: value.rawValue)
    }
    
    public func language(_ type: Language) -> Input {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Input {
        return mutate(nonce: value)
    }
    
    public func role(_ value: String) -> Input {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Input {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Input {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Input {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Input {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Input {
        return mutate(translate: value)
    }

    public func accept(_ value: String) -> Input {
        return mutate(accept: value)
    }
    
    public func alternate(_ value: String) -> Input {
        return mutate(alternate: value)
    }
    
    public func hasCompletion(_ condition: Bool) -> Input {
        return mutate(autocomplete: condition)
    }
    
    public func checked() -> Input {
        return mutate(checked: "checked")
    }
    
    public func disabled() -> Input {
        return mutate(disabled: "disabled")
    }
    
    public func form(_ value: String) -> Input {
        return mutate(form: value)
    }
    
    public func formAction(_ value: String) -> Input {
        return mutate(formaction: value)
    }
    
    public func height(_ size: Int) -> Input {
        return mutate(height: size)
    }
    
    public func list(_ value: String) -> Input {
        return mutate(list: value)
    }
    
    public func maximum(_ value: String) -> Input {
        return mutate(max: value)
    }
    
    public func maximum(length value: String) -> Input {
        return mutate(maxlength: value)
    }
    
    public func minimum(_ value: String) -> Input {
        return mutate(min: value)
    }
    
    public func minimum(length value: String) -> Input {
        return mutate(minlength: value)
    }
    
    public func multiple() -> Input {
        return mutate(multiple: "multiple")
    }
    
    public func name(_ value: String) -> Input {
        return mutate(name: value)
    }
    
    public func name(_ value: TemplateValue<String>) -> Input {
        return mutate(name: value.rawValue)
    }
    
    public func pattern(_ regex: String) -> Input {
        return mutate(pattern: regex)
    }
    
    public func placeholder(_ value: String) -> Input {
        return mutate(placeholder: value)
    }
    
    public func placeholder(_ value: TemplateValue<String>) -> Input {
        return mutate(placeholder: value.rawValue)
    }
    
    public func readonly() -> Input {
        return mutate(readonly: "readonly")
    }
    
    public func required() -> Input {
        return mutate(required: "required")
    }
    
    public func size(_ size: Int) -> Input {
        return mutate(size: size)
    }
    
    public func source(_ value: String) -> Input {
        return mutate(source: value)
    }
    
    public func step(_ size: Int) -> Input {
        return mutate(step: size)
    }
    
    public func type(_ value: Inputs) -> Input {
        return mutate(type: value.rawValue)
    }
    
    public func value(_ value: String) -> Input {
        return mutate(value: value)
    }
    
    public func value(_ value: TemplateValue<String>) -> Input {
        return mutate(value: value.rawValue)
    }
    
    public func width(_ size: Int) -> Input {
        return mutate(width: size)
    }
}

extension Input: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Input: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
}

/// # Description:
/// The element represents a caption for a form control.
///
/// # References:
/// https://html.spec.whatwg.org/#the-label-element
///
public struct Label: ContentNode, FormElement {

    internal var name: String { "label" }

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

extension Label: GlobalAttributes, ForAttribute {
    
    public func accessKey(_ value: String) -> Label {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Label {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Label {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Label {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Label {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Label {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Label {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Label {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Label {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Label {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Label {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Label {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Label {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Label {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Label {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Label {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Label {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Label {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> Label {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Label {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> Label {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Label {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Label {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Label {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Label {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Label {
        return mutate(translate: value)
    }
    
    public func `for`(_ value: String) -> Label {
        return mutate(for: value)
    }
}

extension Label: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Label: Localizable {
    
    public init(_ localizedKey: String) {
        self.content = [Localized(key: localizedKey)]
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        self.content = [Localized(key: localizedKey, context: context)]
    }
}

extension Label: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
}

/// # Description:
/// The element represents a control for selecting amongst a set of options.
///
/// # References:
/// https://html.spec.whatwg.org/#the-select-element
///
public struct Select: ContentNode, FormElement {

    internal var name: String { "select" }

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

extension Select: GlobalAttributes, AutocompleteAttribute, DisabledAttribute, FormAttribute, MultipleAttribute, NameAttribute, RequiredAttribute, SizeAttribute {
    
    public func accessKey(_ value: String) -> Select {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Select {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Select {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Select {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Select {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Select {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Select {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Select {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Select {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Select {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Select {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Select {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Select {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Select {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Select {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Select {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Select {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Select {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> Select {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Select {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> Select {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Select {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Select {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Select {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Select {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Select {
        return mutate(translate: value)
    }

    public func hasCompletion(_ condition: Bool) -> Select {
        return mutate(autocomplete: condition)
    }
    
    public func disabled() -> Select {
        return mutate(disabled: "disabled")
    }
    
    public func form(_ value: String) -> Select {
        return mutate(form: value)
    }
    
    public func multiple() -> Select {
        return mutate(multiple: "multiple")
    }
    
    public func name(_ value: String) -> Select {
        return mutate(name: value)
    }
    
    public func name(_ value: TemplateValue<String>) -> Select {
        return mutate(name: value.rawValue)
    }
    
    public func required() -> Select {
        return mutate(required: "required")
    }
    
    public func size(_ size: Int) -> Select {
        return mutate(size: size)
    }
}

extension Select: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Select: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
}

/// # Description:
/// The element represents a multiline plain text edit control.
///
/// # References:
/// https://html.spec.whatwg.org/#the-textarea-element
///
public struct TextArea: ContentNode, FormElement {
        
    internal var name: String { "textarea" }

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

extension TextArea: GlobalAttributes, AutocompleteAttribute, ColumnsAttribute, DisabledAttribute, FormAttribute, MaximumLengthAttribute, MinimumLengthAttribute, NameAttribute, PlaceholderAttribute, ReadyOnlyAttribute, RequiredAttribute, RowsAttribute, WrapAttribute {
    
    public func accessKey(_ value: String) -> TextArea {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> TextArea {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> TextArea {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> TextArea {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> TextArea {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> TextArea {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> TextArea {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> TextArea {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> TextArea {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> TextArea {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> TextArea {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> TextArea {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> TextArea {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> TextArea {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> TextArea {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> TextArea {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> TextArea {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> TextArea {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> TextArea {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> TextArea {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> TextArea {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> TextArea {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> TextArea {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> TextArea {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> TextArea {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> TextArea {
        return mutate(translate: value)
    }

    public func hasCompletion(_ condition: Bool) -> TextArea {
        return mutate(autocomplete: condition)
    }
    
    public func columns(_ size: Int) -> TextArea {
        return mutate(cols: size)
    }
    
    public func disabled() -> TextArea {
        return mutate(disabled: "disabled")
    }
    
    public func form(_ value: String) -> TextArea {
        return mutate(form: value)
    }
    
    public func maximum(length value: String) -> TextArea {
        return mutate(maxlength: value)
    }
    
    public func minimum(length value: String) -> TextArea {
        return mutate(minlength: value)
    }
    
    public func name(_ value: String) -> TextArea {
        return mutate(name: value)
    }
    
    public func name(_ value: TemplateValue<String>) -> TextArea {
        return mutate(name: value.rawValue)
    }
    
    public func placeholder(_ value: String) -> TextArea {
        return mutate(placeholder: value)
    }
    
    public func placeholder(_ value: TemplateValue<String>) -> TextArea {
        return mutate(placeholder: value.rawValue)
    }
    
    public func readonly() -> TextArea {
        return mutate(readonly: "readonly")
    }
    
    public func required() -> TextArea {
        return mutate(required: "required")
    }
    
    public func rows(_ size: Int) -> TextArea {
        return mutate(rows: size)
    }
    
    public func wrap(_ type: Wrapping) -> TextArea {
        return mutate(wrap: type.rawValue)
    }
}

extension TextArea: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension TextArea: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
}

/// # Description:
/// The element represents a comment output.
///
/// # References:
/// https://html.spec.whatwg.org/#the-button-element
///
public struct Button: ContentNode, FormElement {

    internal var name: String { "button" }

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

extension Button: GlobalAttributes, DisabledAttribute, FormAttribute, FormActionAttribute, NameAttribute, TypeAttribute, ValueAttribute {
    
    public func accessKey(_ value: String) -> Button {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Button {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Button {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Button {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Button {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Button {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Button {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Button {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Button {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Button {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Button {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Button {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Button {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Button {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Button {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Button {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Button {
        return mutate(id: value)
    }

    public func id(_ value: TemplateValue<String>) -> Button {
        return mutate(id: value.rawValue)
    }
    
    public func language(_ type: Language) -> Button {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Button {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> Button {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Button {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Button {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Button {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Button {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Button {
        return  mutate(translate: value)
    }
    
    public func disabled() -> Button {
        return mutate(disabled: "disabled")
    }
    
    public func form(_ value: String) -> Button {
        return mutate(form: value)
    }
    
    public func formAction(_ value: String) -> Button {
        return mutate(formaction: value)
    }
    
    public func name(_ value: String) -> Button {
        return mutate(name: value)
    }
    
    public func name(_ value: TemplateValue<String>) -> Button {
        return mutate(name: value.rawValue)
    }
    
    public func type(_ value: Buttons) -> Button {
        return mutate(type: value.rawValue)
    }
    
    public func value(_ value: String) -> Button {
        return mutate(value: value)
    }
    
    public func value(_ value: TemplateValue<String>) -> Button {
        return mutate(value: value.rawValue)
    }
}

extension Button: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Button: Localizable {
    
    public init(_ localizedKey: String) {
        self.content = [Localized(key: localizedKey)]
    }

    public init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B : Encodable {
        self.content = [Localized(key: localizedKey, context: context)]
    }
}

extension Button: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
}

/// # Description:
/// The element represents a set of form controls grouped together.
///
/// # References:
/// https://html.spec.whatwg.org/#the-fieldset-element
///
public struct Fieldset: ContentNode, FormElement {
    
    internal var name: String { "fieldset" }

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

extension Fieldset: GlobalAttributes, DisabledAttribute, FormAttribute, NameAttribute {
    
    public func accessKey(_ value: String) -> Fieldset {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Fieldset {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Fieldset {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Fieldset {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Fieldset {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Fieldset {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Fieldset {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Fieldset {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Fieldset {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Fieldset {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Fieldset {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Fieldset {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Fieldset {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Fieldset {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Fieldset {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Fieldset {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Fieldset {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Fieldset {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> Fieldset {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Fieldset {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> Fieldset {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> Fieldset {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Fieldset {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Fieldset {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Fieldset {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Fieldset {
        return mutate(translate: value)
    }

    public func disabled() -> Fieldset {
        return mutate(disabled: "disabled")
    }
    
    public func form(_ value: String) -> Fieldset {
        return mutate(form: value)
    }
    
    public func name(_ value: String) -> Fieldset {
        return mutate(name: value)
    }
    
    public func name(_ value: TemplateValue<String>) -> Fieldset {
        return mutate(name: value.rawValue)
    }
}

extension Fieldset: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Fieldset: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
}
