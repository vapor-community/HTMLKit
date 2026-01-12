import Foundation
import OrderedCollections

/// An element that represents a text control.
///
/// Use `Input` to collect text input.
///
/// ```swift
/// Form {
///     Input()
///         .type(.text)
///         .name("lorem")
///         .id("lorem")
/// }
/// .method(.post)
/// ```
public struct Input: EmptyNode, FormElement {

    internal var name: String { "input" }

    internal var attributes: OrderedDictionary<String, Any>?

    /// Create an input.
    public init() {}
    
    internal init(attributes: OrderedDictionary<String, Any>?) {
        self.attributes = attributes
    }
    
    public func modify(if condition: Bool, element: (Input) -> Input) -> Input {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (Input, T) -> Input) -> Input {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension Input: GlobalAttributes, GlobalEventAttributes, AcceptAttribute, AlternateAttribute, AutocompleteAttribute, CheckedAttribute, DisabledAttribute, FormAttribute, FormActionAttribute, HeightAttribute, ListAttribute, MaximumValueAttribute, MaximumLengthAttribute, MinimumValueAttribute, MinimumLengthAttribute, MultipleAttribute, NameAttribute, PatternAttribute, PlaceholderAttribute, ReadOnlyAttribute, RequiredAttribute, SizeAttribute, SourceAttribute, StepAttribute, TypeAttribute, ValueAttribute, WidthAttribute, PopoverTargetAttribute, PopoverActionAttribute {
    
    public func accessKey(_ value: Character) -> Input {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ value: Values.Capitalization) -> Input {
        return mutate(autocapitalize: value.rawValue)
    }

    public func autofocus() -> Input {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Input {
        return mutate(class: value)
    }

    @available(*, deprecated, message: "Use the editable(_:) modifier instead.")
    public func isEditable(_ value: Bool) -> Input {
        return mutate(contenteditable: value)
    }
    
    public func editable(_ value: Bool = true) -> Input {
        return mutate(contenteditable: value)
    }

    public func direction(_ value: Values.Direction) -> Input {
        return mutate(dir: value.rawValue)
    }

    @available(*, deprecated, message: "Use the draggable(_:) modifier instead.")
    public func isDraggable(_ value: Bool) -> Input {
        return mutate(draggable: value)
    }
    
    public func draggable(_ value: Bool = true) -> Input {
        return mutate(draggable: value)
    }

    @available(*, deprecated, message: "Use the enterKey(_:) modifier instead.")
    public func enterKeyHint(_ value: Values.Hint) -> Input {
        return mutate(enterkeyhint: value.rawValue)
    }
    
    public func enterKey(_ value: Values.Hint) -> Input {
        return mutate(enterkeyhint: value.rawValue)
    }
    
    public func hidden(_ condition: Bool = true) -> Input {
        
        if condition {
            return mutate(hidden: "hidden")
        }
        
        return self
    }
    
    public func inputMode(_ value: Values.Mode) -> Input {
        return mutate(inputmode: value.rawValue)
    }

    public func `is`(_ value: String) -> Input {
        return mutate(is: value)
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: [String]? = nil) -> Input {
        return self.mutate(itemscope: "itemscope").mutate(itemid: id).mutate(itemtype: schema?.absoluteString).mutate(itemref: elements?.joined(separator: " "))
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: String...) -> Input {
        return self.mutate(itemscope: "itemscope").mutate(itemid: id).mutate(itemtype: schema?.absoluteString).mutate(itemref: elements.joined(separator: " "))
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemId(_ value: String) -> Input {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Input {
        return mutate(itemprop: value)
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemReference(_ value: String) -> Input {
        return mutate(itemref: value)
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemScope(_ value: String) -> Input {
        return mutate(itemscope: value)
    }
    
    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemType(_ value: String) -> Input {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Input {
        return mutate(id: value)
    }
    
    public func language(_ value: Values.Language) -> Input {
        return mutate(lang: value.rawValue)
    }

    public func nonce(_ value: String) -> Input {
        return mutate(nonce: value)
    }
    
    public func role(_ value: Values.Role) -> Input {
        return mutate(role: value.rawValue)
    }

    @available(*, deprecated, message: "Use the spellcheck(_:) modifier instead.")
    public func hasSpellCheck(_ value: Bool) -> Input {
        return mutate(spellcheck: value)
    }
    
    public func spellcheck(_ value: Bool = true) -> Input {
        return mutate(spellcheck: value)
    }

    public func style(_ value: String) -> Input {
        return mutate(style: TaintedString(value, as: .css(.attribute)))
    }

    public func tabIndex(_ value: Int) -> Input {
        return mutate(tabindex: value)
    }

    @_disfavoredOverload
    public func title(_ value: String) -> Input {
        return mutate(title: value)
    }
    
    public func title(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> Input {
        return mutate(title: LocalizedString(key: localizedKey, table: tableName))
    }
    
    public func title(verbatim value: String) -> Input {
        return mutate(title: value)
    }
    
    @available(*, deprecated, message: "Use the translate(_:) modifier instead.")
    public func translate(_ value: Values.Decision) -> Input {
        return mutate(translate: value.rawValue)
    }
    
    public func translate(_ value: Bool = true) -> Input {
        
        if value {
            return mutate(translate: "yes")
        }
        
        return mutate(translate: "no")
    }
    
    public func inert(_ condition: Bool = true) -> Input {

        if condition {
            return mutate(inert: "inert")
        }
        
        return self
    }
    
    public func accept(_ specifiers: [String]) -> Input {
        return mutate(accept: specifiers.joined(separator: ", "))
    }

    public func accept(_ specifiers: String...) -> Input {
        return mutate(accept: specifiers.joined(separator: ", "))
    }
    
    public func accept(_ specifiers: [Values.Media]) -> Input {
        return mutate(accept: specifiers.map { $0.rawValue }.joined(separator: ", "))
    }

    public func accept(_ specifiers: Values.Media...) -> Input {
        return mutate(accept: specifiers.map { $0.rawValue }.joined(separator: ", "))
    }
    
    @_disfavoredOverload
    public func alternate(_ value: String) -> Input {
        return mutate(alternate: value)
    }
    
    public func alternate(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> Input {
        return mutate(alternate: LocalizedString(key: localizedKey, table: tableName))
    }
    
    public func alternate(verbatim value: String) -> Input {
        return mutate(alternate: value)
    }
    
    public func autocomplete(_ value: Values.Completion) -> Input {
        return mutate(autocomplete: value.rawValue)
    }
    
    public func autocomplete(_ values: OrderedSet<Values.Completion>) -> Input {
        return mutate(autocomplete: values.map { $0.rawValue }.joined(separator: " "))
    }
    
    public func checked(_ condition: Bool = true) -> Input {
        
        if condition {
            return mutate(checked: "checked")
        }
        
        return self
    }
    
    public func disabled(_ condition: Bool = true) -> Input {
        
        if condition {
            return mutate(disabled: "disabled")
        }
        
        return self
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
    
    public func maximum(length value: Int) -> Input {
        return mutate(maxlength: value)
    }
    
    public func minimum(_ value: String) -> Input {
        return mutate(min: value)
    }
    
    public func minimum(length value: Int) -> Input {
        return mutate(minlength: value)
    }
    
    public func multiple() -> Input {
        return mutate(multiple: "multiple")
    }
    
    public func name(_ value: String) -> Input {
        return mutate(name: value)
    }
    
    public func pattern(_ regex: String) -> Input {
        return mutate(pattern: regex)
    }
    
    @_disfavoredOverload
    public func placeholder(_ value: String) -> Input {
        return mutate(placeholder: value)
    }
    
    public func placeholder(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> Input {
        return mutate(placeholder: LocalizedString(key: localizedKey, table: tableName))
    }
    
    public func placeholder(verbatim value: String) -> Input {
        return mutate(placeholder: value)
    }
    
    public func readonly() -> Input {
        return mutate(readonly: "readonly")
    }
    
    public func readonly(_ condition: Bool) -> Input {
        
        if condition {
            return mutate(readonly: "readonly")
        }
        
        return self
    }
    
    public func required(_ condition: Bool = true) -> Input {
        
        if condition {
            return mutate(required: "required")
        }
        
        return self
    }
    
    public func size(_ size: Int) -> Input {
        return mutate(size: size)
    }
    
    public func source(_ value: String) -> Input {
        return mutate(source: value)
    }
    
    public func source(_ value: EnvironmentValue) -> Input {
        return mutate(source: value)
    }
    
    public func step(_ size: Int) -> Input {
        return mutate(step: size)
    }
    
    public func type(_ value: Values.Input) -> Input {
        return mutate(type: value.rawValue)
    }
    
    @_disfavoredOverload
    public func value(_ value: String) -> Input {
        return mutate(value: value)
    }
    
    public func value(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> Input {
        return mutate(value: LocalizedString(key: localizedKey, table: tableName))
    }
    
    public func value(verbatim value: String) -> Input {
        return mutate(value: value)
    }
    
    public func width(_ size: Int) -> Input {
        return mutate(width: size)
    }
    
    public func popover(_ value: Values.Popover.State) -> Input {
        return mutate(popover: value.rawValue)
    }
    
    public func popoverTarget(_ value: String, action: Values.Popover.Action? = nil) -> Input {
        return mutate(popovertarget: value).mutate(popovertargetaction: action?.rawValue)
    }
    
    @available(*, deprecated, message: "Use the popoverTarget(_:action:) modifier instead.")
    public func popoverAction(_ value: Values.Popover.Action) -> Input {
        return mutate(popoveraction: value.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Input {
        return mutate(key: key, value: value)
    }
    
    public func on(event: Events.Drag, _ value: String) -> Input {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> Input {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> Input {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Mouse, _ value: String) -> Input {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Wheel, _ value: String) -> Input {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
}

/// An element that represents a control label.
///
/// Use `Label` to improve the accessibility by associating descriptive text with the controls.
///
/// ```swift
/// Label {
///     "Lorem ipsum"
/// }
/// .for("lorem")
/// Input()
///     .id("lorem")
///     .name("lorem")
/// ```
public struct Label: ContentNode, FormElement {

    internal var name: String { "label" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [Content]

    /// Create a label.
    ///
    /// - Parameter content: The label's content.
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [Content]) {
        self.attributes = attributes
        self.content = content
    }
    
    public func modify(if condition: Bool, element: (Label) -> Label) -> Label {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (Label, T) -> Label) -> Label {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension Label: GlobalAttributes, GlobalEventAttributes, GlobalAriaAttributes, ForAttribute {
    
    public func accessKey(_ value: Character) -> Label {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ value: Values.Capitalization) -> Label {
        return mutate(autocapitalize: value.rawValue)
    }

    public func autofocus() -> Label {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Label {
        return mutate(class: value)
    }

    @available(*, deprecated, message: "Use the editable(_:) modifier instead.")
    public func isEditable(_ value: Bool) -> Label {
        return mutate(contenteditable: value)
    }
    
    public func editable(_ value: Bool = true) -> Label {
        return mutate(contenteditable: value)
    }

    public func direction(_ value: Values.Direction) -> Label {
        return mutate(dir: value.rawValue)
    }

    @available(*, deprecated, message: "Use the draggable(_:) modifier instead.")
    public func isDraggable(_ value: Bool) -> Label {
        return mutate(draggable: value)
    }
    
    public func draggable(_ value: Bool = true) -> Label {
        return mutate(draggable: value)
    }

    @available(*, deprecated, message: "Use the enterKey(_:) modifier instead.")
    public func enterKeyHint(_ value: Values.Hint) -> Label {
        return mutate(enterkeyhint: value.rawValue)
    }
    
    public func enterKey(_ value: Values.Hint) -> Label {
        return mutate(enterkeyhint: value.rawValue)
    }
    
    public func hidden(_ condition: Bool = true) -> Label {
        
        if condition {
            return mutate(hidden: "hidden")
        }
        
        return self
    }
    
    public func inputMode(_ value: Values.Mode) -> Label {
        return mutate(inputmode: value.rawValue)
    }

    public func `is`(_ value: String) -> Label {
        return mutate(is: value)
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: [String]? = nil) -> Label {
        return self.mutate(itemscope: "itemscope").mutate(itemid: id).mutate(itemtype: schema?.absoluteString).mutate(itemref: elements?.joined(separator: " "))
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: String...) -> Label {
        return self.mutate(itemscope: "itemscope").mutate(itemid: id).mutate(itemtype: schema?.absoluteString).mutate(itemref: elements.joined(separator: " "))
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemId(_ value: String) -> Label {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Label {
        return mutate(itemprop: value)
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemReference(_ value: String) -> Label {
        return mutate(itemref: value)
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemScope(_ value: String) -> Label {
        return mutate(itemscope: value)
    }
    
    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemType(_ value: String) -> Label {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Label {
        return mutate(id: value)
    }

    public func language(_ value: Values.Language) -> Label {
        return mutate(lang: value.rawValue)
    }

    public func nonce(_ value: String) -> Label {
        return mutate(nonce: value)
    }
    
    public func role(_ value: Values.Role) -> Label {
        return mutate(role: value.rawValue)
    }

    @available(*, deprecated, message: "Use the spellcheck(_:) modifier instead.")
    public func hasSpellCheck(_ value: Bool) -> Label {
        return mutate(spellcheck: value)
    }
    
    public func spellcheck(_ value: Bool = true) -> Label {
        return mutate(spellcheck: value)
    }

    public func style(_ value: String) -> Label {
        return mutate(style: TaintedString(value, as: .css(.attribute)))
    }

    public func tabIndex(_ value: Int) -> Label {
        return mutate(tabindex: value)
    }

    @_disfavoredOverload
    public func title(_ value: String) -> Label {
        return mutate(title: value)
    }
    
    public func title(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> Label {
        return mutate(title: LocalizedString(key: localizedKey, table: tableName))
    }
    
    public func title(verbatim value: String) -> Label {
        return mutate(title: value)
    }
    
    @available(*, deprecated, message: "Use the translate(_:) modifier instead.")
    public func translate(_ value: Values.Decision) -> Label {
        return mutate(translate: value.rawValue)
    }
    
    public func translate(_ value: Bool = true) -> Label {
        
        if value {
            return mutate(translate: "yes")
        }
        
        return mutate(translate: "no")
    }
    
    public func inert(_ condition: Bool = true) -> Label {

        if condition {
            return mutate(inert: "inert")
        }
        
        return self
    }
    
    public func `for`(_ value: String) -> Label {
        return mutate(for: value)
    }
    
    public func popover(_ value: Values.Popover.State) -> Label {
        return mutate(popover: value.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Label {
        return mutate(key: key, value: value)
    }
    
    public func on(event: Events.Drag, _ value: String) -> Label {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> Label {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> Label {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Mouse, _ value: String) -> Label {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Wheel, _ value: String) -> Label {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func aria(atomic value: Bool) -> Label {
        return mutate(ariaatomic: value)
    }
    
    public func aria(busy value: Bool) -> Label {
        return mutate(ariabusy: value)
    }
    
    public func aria(controls value: String) -> Label {
        return mutate(ariacontrols: value)
    }
    
    public func aria(current value: Values.Accessibility.Current) -> Label {
        return mutate(ariacurrent: value.rawValue)
    }
    
    public func aria(describedBy value: String) -> Label {
        return mutate(ariadescribedby: value)
    }
    
    public func aria(details value: String) -> Label {
        return mutate(ariadetails: value)
    }
    
    public func aria(disabled value: Bool) -> Label {
        return mutate(ariadisabled: value)
    }
    
    public func aria(errorMessage value: String) -> Label {
        return mutate(ariaerrormessage: value)
    }
    
    public func aria(flowTo value: String) -> Label {
        return mutate(ariaflowto: value)
    }
    
    public func aria(hasPopup value: Values.Accessibility.Popup) -> Label {
        return mutate(ariahaspopup: value.rawValue)
    }
    
    public func aria(hidden value: Bool) -> Label {
        return mutate(ariahidden: value)
    }
    
    public func aria(invalid value: Values.Accessibility.Invalid) -> Label {
        return mutate(ariainvalid: value.rawValue)
    }
    
    public func aria(keyShortcuts value: String) -> Label {
        return mutate(ariakeyshortcuts: value)
    }
    
    public func aria(label value: String) -> Label {
        return mutate(arialabel: value)
    }
    
    public func aria(labeledBy value: String) -> Label {
        return mutate(arialabeledby: value)
    }
    
    public func aria(live value: Values.Accessibility.Live) -> Label {
        return mutate(arialive: value.rawValue)
    }
    
    public func aria(owns value: String) -> Label {
        return mutate(ariaowns: value)
    }
    
    public func aria(relevant value: Values.Accessibility.Relevant) -> Label {
        return mutate(ariarelevant: value.rawValue)
    }
    
    public func aria(roleDescription value: String) -> Label {
        return mutate(ariaroledescription: value)
    }
}

extension Label: Localizable {
    
    public init(_ localizedKey: LocalizedStringKey, tableName: String? = nil) {
        self.content = [LocalizedString(key: localizedKey, table: tableName)]
    }
}

/// An element that represents an option list.
///
/// Use `Select` to present a set of ``Option``.
///
/// ```swift
/// Select {
///     Option {
///         "Lorem"
///     }
///     .value("lorem")
///     Option {
///         "Lorem"
///     }
///     .value("lorem")
/// }
/// .name("lorem")
/// .id("lorem")
/// ```
public struct Select: ContentNode, FormElement {

    internal var name: String { "select" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [Content]
    
    /// Create a select.
    ///
    /// - Parameter content: The select's content.
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [Content]) {
        self.attributes = attributes
        self.content = content
    }
    
    public func modify(if condition: Bool, element: (Select) -> Select) -> Select {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (Select, T) -> Select) -> Select {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension Select: GlobalAttributes, GlobalEventAttributes, AutocompleteAttribute, DisabledAttribute, FormAttribute, MultipleAttribute, NameAttribute, RequiredAttribute, SizeAttribute {

    public func accessKey(_ value: Character) -> Select {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ value: Values.Capitalization) -> Select {
        return mutate(autocapitalize: value.rawValue)
    }

    public func autofocus() -> Select {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Select {
        return mutate(class: value)
    }

    @available(*, deprecated, message: "Use the editable(_:) modifier instead.")
    public func isEditable(_ value: Bool) -> Select {
        return mutate(contenteditable: value)
    }
    
    public func editable(_ value: Bool = true) -> Select {
        return mutate(contenteditable: value)
    }

    public func direction(_ value: Values.Direction) -> Select {
        return mutate(dir: value.rawValue)
    }

    @available(*, deprecated, message: "Use the draggable(_:) modifier instead.")
    public func isDraggable(_ value: Bool) -> Select {
        return mutate(draggable: value)
    }
    
    public func draggable(_ value: Bool = true) -> Select {
        return mutate(draggable: value)
    }

    @available(*, deprecated, message: "Use the enterKey(_:) modifier instead.")
    public func enterKeyHint(_ value: Values.Hint) -> Select {
        return mutate(enterkeyhint: value.rawValue)
    }
    
    public func enterKey(_ value: Values.Hint) -> Select {
        return mutate(enterkeyhint: value.rawValue)
    }
    
    public func hidden(_ condition: Bool = true) -> Select {
        
        if condition {
            return mutate(hidden: "hidden")
        }
        
        return self
    }
    
    public func inputMode(_ value: Values.Mode) -> Select {
        return mutate(inputmode: value.rawValue)
    }

    public func `is`(_ value: String) -> Select {
        return mutate(is: value)
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: [String]? = nil) -> Select {
        return self.mutate(itemscope: "itemscope").mutate(itemid: id).mutate(itemtype: schema?.absoluteString).mutate(itemref: elements?.joined(separator: " "))
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: String...) -> Select {
        return self.mutate(itemscope: "itemscope").mutate(itemid: id).mutate(itemtype: schema?.absoluteString).mutate(itemref: elements.joined(separator: " "))
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemId(_ value: String) -> Select {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Select {
        return mutate(itemprop: value)
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemReference(_ value: String) -> Select {
        return mutate(itemref: value)
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemScope(_ value: String) -> Select {
        return mutate(itemscope: value)
    }
    
    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemType(_ value: String) -> Select {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Select {
        return mutate(id: value)
    }

    public func language(_ value: Values.Language) -> Select {
        return mutate(lang: value.rawValue)
    }

    public func nonce(_ value: String) -> Select {
        return mutate(nonce: value)
    }
    
    public func role(_ value: Values.Role) -> Select {
        return mutate(role: value.rawValue)
    }

    @available(*, deprecated, message: "Use the spellcheck(_:) modifier instead.")
    public func hasSpellCheck(_ value: Bool) -> Select {
        return mutate(spellcheck: value)
    }
    
    public func spellcheck(_ value: Bool = true) -> Select {
        return mutate(spellcheck: value)
    }

    public func style(_ value: String) -> Select {
        return mutate(style: TaintedString(value, as: .css(.attribute)))
    }

    public func tabIndex(_ value: Int) -> Select {
        return mutate(tabindex: value)
    }

    @_disfavoredOverload
    public func title(_ value: String) -> Select {
        return mutate(title: value)
    }
    
    public func title(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> Select {
        return mutate(title: LocalizedString(key: localizedKey, table: tableName))
    }
    
    public func title(verbatim value: String) -> Select {
        return mutate(title: value)
    }
    
    @available(*, deprecated, message: "Use the translate(_:) modifier instead.")
    public func translate(_ value: Values.Decision) -> Select {
        return mutate(translate: value.rawValue)
    }
    
    public func translate(_ value: Bool = true) -> Select {
        
        if value {
            return mutate(translate: "yes")
        }
        
        return mutate(translate: "no")
    }
    
    public func inert(_ condition: Bool = true) -> Select {

        if condition {
            return mutate(inert: "inert")
        }
        
        return self
    }
    
    public func autocomplete(_ value: Values.Completion) -> Select {
        return mutate(autocomplete: value.rawValue)
    }
    
    public func autocomplete(_ values: OrderedSet<Values.Completion>) -> Select {
        return mutate(autocomplete: values.map { $0.rawValue }.joined(separator: " "))
    }
    
    public func disabled(_ condition: Bool = true) -> Select {
        
        if condition {
            return mutate(disabled: "disabled")
        }
        
        return self
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
    
    public func required(_ condition: Bool = true) -> Select {
        
        if condition {
            return mutate(required: "required")
        }
        
        return self
    }
    
    public func size(_ size: Int) -> Select {
        return mutate(size: size)
    }
    
    public func popover(_ value: Values.Popover.State) -> Select {
        return mutate(popover: value.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Select {
        return mutate(key: key, value: value)
    }
    
    public func on(event: Events.Drag, _ value: String) -> Select {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> Select {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> Select {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Mouse, _ value: String) -> Select {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Wheel, _ value: String) -> Select {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
}

/// An element that represents a text control.
///
/// Use `TextArea` to collect multiline text input.
///
/// ```swift
/// TextArea {
///     "Lorem ipsum..."
/// }
/// .name("lorem")
/// .id("lorem")
/// ```
public struct TextArea: ContentNode, FormElement {
        
    internal var name: String { "textarea" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [String]
    
    /// Create a text area.
    ///
    /// - Parameter content: The area's content.
    public init(@ContentBuilder<String> content: () -> [String]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [String]) {
        self.attributes = attributes
        self.content = content
    }
    
    public func modify(if condition: Bool, element: (TextArea) -> TextArea) -> TextArea {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (TextArea, T) -> TextArea) -> TextArea {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension TextArea: GlobalAttributes, GlobalEventAttributes, GlobalAriaAttributes, AutocompleteAttribute, ColumnsAttribute, DisabledAttribute, FormAttribute, MaximumLengthAttribute, MinimumLengthAttribute, NameAttribute, PlaceholderAttribute, ReadOnlyAttribute, RequiredAttribute, RowsAttribute, WrapAttribute {
    
    public func accessKey(_ value: Character) -> TextArea {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ value: Values.Capitalization) -> TextArea {
        return mutate(autocapitalize: value.rawValue)
    }

    public func autofocus() -> TextArea {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> TextArea {
        return mutate(class: value)
    }

    @available(*, deprecated, message: "Use the editable(_:) modifier instead.")
    public func isEditable(_ value: Bool) -> TextArea {
        return mutate(contenteditable: value)
    }
    
    public func editable(_ value: Bool = true) -> TextArea {
        return mutate(contenteditable: value)
    }

    public func direction(_ value: Values.Direction) -> TextArea {
        return mutate(dir: value.rawValue)
    }

    @available(*, deprecated, message: "Use the draggable(_:) modifier instead.")
    public func isDraggable(_ value: Bool) -> TextArea {
        return mutate(draggable: value)
    }
    
    public func draggable(_ value: Bool = true) -> TextArea {
        return mutate(draggable: value)
    }

    @available(*, deprecated, message: "Use the enterKey(_:) modifier instead.")
    public func enterKeyHint(_ value: Values.Hint) -> TextArea {
        return mutate(enterkeyhint: value.rawValue)
    }
    
    public func enterKey(_ value: Values.Hint) -> TextArea {
        return mutate(enterkeyhint: value.rawValue)
    }
    
    public func hidden(_ condition: Bool = true) -> TextArea {
        
        if condition {
            return mutate(hidden: "hidden")
        }
        
        return self
    }
    
    public func inputMode(_ value: Values.Mode) -> TextArea {
        return mutate(inputmode: value.rawValue)
    }

    public func `is`(_ value: String) -> TextArea {
        return mutate(is: value)
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: [String]? = nil) -> TextArea {
        return self.mutate(itemscope: "itemscope").mutate(itemid: id).mutate(itemtype: schema?.absoluteString).mutate(itemref: elements?.joined(separator: " "))
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: String...) -> TextArea {
        return self.mutate(itemscope: "itemscope").mutate(itemid: id).mutate(itemtype: schema?.absoluteString).mutate(itemref: elements.joined(separator: " "))
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemId(_ value: String) -> TextArea {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> TextArea {
        return mutate(itemprop: value)
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemReference(_ value: String) -> TextArea {
        return mutate(itemref: value)
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemScope(_ value: String) -> TextArea {
        return mutate(itemscope: value)
    }
    
    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemType(_ value: String) -> TextArea {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> TextArea {
        return mutate(id: value)
    }

    public func language(_ value: Values.Language) -> TextArea {
        return mutate(lang: value.rawValue)
    }

    public func nonce(_ value: String) -> TextArea {
        return mutate(nonce: value)
    }
    
    public func role(_ value: Values.Role) -> TextArea {
        return mutate(role: value.rawValue)
    }

    @available(*, deprecated, message: "Use the spellcheck(_:) modifier instead.")
    public func hasSpellCheck(_ value: Bool) -> TextArea {
        return mutate(spellcheck: value)
    }
    
    public func spellcheck(_ value: Bool = true) -> TextArea {
        return mutate(spellcheck: value)
    }

    public func style(_ value: String) -> TextArea {
        return mutate(style: TaintedString(value, as: .css(.attribute)))
    }

    public func tabIndex(_ value: Int) -> TextArea {
        return mutate(tabindex: value)
    }

    @_disfavoredOverload
    public func title(_ value: String) -> TextArea {
        return mutate(title: value)
    }
    
    public func title(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> TextArea {
        return mutate(title: LocalizedString(key: localizedKey, table: tableName))
    }
    
    public func title(verbatim value: String) -> TextArea {
        return mutate(title: value)
    }
    
    @available(*, deprecated, message: "Use the translate(_:) modifier instead.")
    public func translate(_ value: Values.Decision) -> TextArea {
        return mutate(translate: value.rawValue)
    }
    
    public func translate(_ value: Bool = true) -> TextArea {
        
        if value {
            return mutate(translate: "yes")
        }
        
        return mutate(translate: "no")
    }
    
    public func inert(_ condition: Bool = true) -> TextArea {

        if condition {
            return mutate(inert: "inert")
        }
        
        return self
    }
    
    public func autocomplete(_ value: Values.Completion) -> TextArea {
        return mutate(autocomplete: value.rawValue)
    }
    
    public func autocomplete(_ values: OrderedSet<Values.Completion>) -> TextArea {
        return mutate(autocomplete: values.map { $0.rawValue }.joined(separator: " "))
    }
    
    public func columns(_ size: Int) -> TextArea {
        return mutate(cols: size)
    }
    
    public func disabled(_ condition: Bool = true) -> TextArea {
        
        if condition {
            return mutate(disabled: "disabled")
        }
        
        return self
    }
    
    public func form(_ value: String) -> TextArea {
        return mutate(form: value)
    }
    
    public func maximum(length value: Int) -> TextArea {
        return mutate(maxlength: value)
    }
    
    public func minimum(length value: Int) -> TextArea {
        return mutate(minlength: value)
    }
    
    public func name(_ value: String) -> TextArea {
        return mutate(name: value)
    }
    
    @_disfavoredOverload
    public func placeholder(_ value: String) -> TextArea {
        return mutate(placeholder: value)
    }
    
    public func placeholder(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> TextArea {
        return mutate(placeholder: LocalizedString(key: localizedKey, table: tableName))
    }
    
    public func placeholder(verbatim value: String) -> TextArea {
        return mutate(placeholder: value)
    }
    
    public func readonly() -> TextArea {
        return mutate(readonly: "readonly")
    }
    
    public func readonly(_ condition: Bool) -> TextArea {
        
        if condition {
            return mutate(readonly: "readonly")
        }
        
        return self
    }
    
    public func required(_ condition: Bool = true) -> TextArea {
        
        if condition {
            return mutate(required: "required")
        }
        
        return self
    }
    
    public func rows(_ size: Int) -> TextArea {
        return mutate(rows: size)
    }
    
    public func wrap(_ value: Values.Wrapping) -> TextArea {
        return mutate(wrap: value.rawValue)
    }
    
    public func popover(_ value: Values.Popover.State) -> TextArea {
        return mutate(popover: value.rawValue)
    }
    
    public func custom(key: String, value: Any) -> TextArea {
        return mutate(key: key, value: value)
    }
    
    public func on(event: Events.Drag, _ value: String) -> TextArea {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> TextArea {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> TextArea {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Mouse, _ value: String) -> TextArea {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Wheel, _ value: String) -> TextArea {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func aria(atomic value: Bool) -> TextArea {
        return mutate(ariaatomic: value)
    }
    
    public func aria(busy value: Bool) -> TextArea {
        return mutate(ariabusy: value)
    }
    
    public func aria(controls value: String) -> TextArea {
        return mutate(ariacontrols: value)
    }
    
    public func aria(current value: Values.Accessibility.Current) -> TextArea {
        return mutate(ariacurrent: value.rawValue)
    }
    
    public func aria(describedBy value: String) -> TextArea {
        return mutate(ariadescribedby: value)
    }
    
    public func aria(details value: String) -> TextArea {
        return mutate(ariadetails: value)
    }
    
    public func aria(disabled value: Bool) -> TextArea {
        return mutate(ariadisabled: value)
    }
    
    public func aria(errorMessage value: String) -> TextArea {
        return mutate(ariaerrormessage: value)
    }
    
    public func aria(flowTo value: String) -> TextArea {
        return mutate(ariaflowto: value)
    }
    
    public func aria(hasPopup value: Values.Accessibility.Popup) -> TextArea {
        return mutate(ariahaspopup: value.rawValue)
    }
    
    public func aria(hidden value: Bool) -> TextArea {
        return mutate(ariahidden: value)
    }
    
    public func aria(invalid value: Values.Accessibility.Invalid) -> TextArea {
        return mutate(ariainvalid: value.rawValue)
    }
    
    public func aria(keyShortcuts value: String) -> TextArea {
        return mutate(ariakeyshortcuts: value)
    }
    
    public func aria(label value: String) -> TextArea {
        return mutate(arialabel: value)
    }
    
    public func aria(labeledBy value: String) -> TextArea {
        return mutate(arialabeledby: value)
    }
    
    public func aria(live value: Values.Accessibility.Live) -> TextArea {
        return mutate(arialive: value.rawValue)
    }
    
    public func aria(owns value: String) -> TextArea {
        return mutate(ariaowns: value)
    }
    
    public func aria(relevant value: Values.Accessibility.Relevant) -> TextArea {
        return mutate(ariarelevant: value.rawValue)
    }
    
    public func aria(roleDescription value: String) -> TextArea {
        return mutate(ariaroledescription: value)
    }
}

/// An element that represents an action button.
///
/// Use `Button` to trigger an associated action.
///
/// ```swift
/// Button {
///     "Lorem ipsum"
/// }
/// .type(.button)
/// ```
public struct Button: ContentNode, FormElement {

    internal var name: String { "button" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [Content]
    
    /// Create a button.
    ///
    /// - Parameter content: The button's content.
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [Content]) {
        self.attributes = attributes
        self.content = content
    }
    
    public func modify(if condition: Bool, element: (Button) -> Button) -> Button {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (Button, T) -> Button) -> Button {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension Button: GlobalAttributes, GlobalEventAttributes, GlobalAriaAttributes, DisabledAttribute, FormAttribute, FormActionAttribute, NameAttribute, TypeAttribute, ValueAttribute, PopoverTargetAttribute, PopoverActionAttribute {
    
    public func accessKey(_ value: Character) -> Button {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ value: Values.Capitalization) -> Button {
        return mutate(autocapitalize: value.rawValue)
    }

    public func autofocus() -> Button {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Button {
        return mutate(class: value)
    }

    @available(*, deprecated, message: "Use the editable(_:) modifier instead.")
    public func isEditable(_ value: Bool) -> Button {
        return mutate(contenteditable: value)
    }
    
    public func editable(_ value: Bool = true) -> Button {
        return mutate(contenteditable: value)
    }

    public func direction(_ value: Values.Direction) -> Button {
        return mutate(dir: value.rawValue)
    }

    @available(*, deprecated, message: "Use the draggable(_:) modifier instead.")
    public func isDraggable(_ value: Bool) -> Button {
        return mutate(draggable: value)
    }
    
    public func draggable(_ value: Bool = true) -> Button {
        return mutate(draggable: value)
    }

    @available(*, deprecated, message: "Use the enterKey(_:) modifier instead.")
    public func enterKeyHint(_ value: Values.Hint) -> Button {
        return mutate(enterkeyhint: value.rawValue)
    }
    
    public func enterKey(_ value: Values.Hint) -> Button {
        return mutate(enterkeyhint: value.rawValue)
    }
    
    public func hidden(_ condition: Bool = true) -> Button {
        
        if condition {
            return mutate(hidden: "hidden")
        }
        
        return self
    }
    
    public func inputMode(_ value: Values.Mode) -> Button {
        return mutate(inputmode: value.rawValue)
    }

    public func `is`(_ value: String) -> Button {
        return mutate(is: value)
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: [String]? = nil) -> Button {
        return self.mutate(itemscope: "itemscope").mutate(itemid: id).mutate(itemtype: schema?.absoluteString).mutate(itemref: elements?.joined(separator: " "))
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: String...) -> Button {
        return self.mutate(itemscope: "itemscope").mutate(itemid: id).mutate(itemtype: schema?.absoluteString).mutate(itemref: elements.joined(separator: " "))
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemId(_ value: String) -> Button {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Button {
        return mutate(itemprop: value)
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemReference(_ value: String) -> Button {
        return mutate(itemref: value)
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemScope(_ value: String) -> Button {
        return mutate(itemscope: value)
    }
    
    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemType(_ value: String) -> Button {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Button {
        return mutate(id: value)
    }
    
    public func language(_ value: Values.Language) -> Button {
        return mutate(lang: value.rawValue)
    }

    public func nonce(_ value: String) -> Button {
        return mutate(nonce: value)
    }
    
    public func role(_ value: Values.Role) -> Button {
        return mutate(role: value.rawValue)
    }

    @available(*, deprecated, message: "Use the spellcheck(_:) modifier instead.")
    public func hasSpellCheck(_ value: Bool) -> Button {
        return mutate(spellcheck: value)
    }
    
    public func spellcheck(_ value: Bool = true) -> Button {
        return mutate(spellcheck: value)
    }

    public func style(_ value: String) -> Button {
        return mutate(style: TaintedString(value, as: .css(.attribute)))
    }

    public func tabIndex(_ value: Int) -> Button {
        return mutate(tabindex: value)
    }

    @_disfavoredOverload
    public func title(_ value: String) -> Button {
        return mutate(title: value)
    }
    
    public func title(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> Button {
        return mutate(title: LocalizedString(key: localizedKey, table: tableName))
    }
    
    public func title(verbatim value: String) -> Button {
        return mutate(title: value)
    }
    
    @available(*, deprecated, message: "Use the translate(_:) modifier instead.")
    public func translate(_ value: Values.Decision) -> Button {
        return  mutate(translate: value.rawValue)
    }
    
    public func translate(_ value: Bool = true) -> Button {
        
        if value {
            return mutate(translate: "yes")
        }
        
        return mutate(translate: "no")
    }
    
    public func inert(_ condition: Bool = true) -> Button {

        if condition {
            return mutate(inert: "inert")
        }
        
        return self
    }
    
    public func disabled(_ condition: Bool = true) -> Button {
        
        if condition {
            return mutate(disabled: "disabled")
        }
        
        return self
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
    
    public func type(_ value: Values.Button) -> Button {
        return mutate(type: value.rawValue)
    }
    
    @_disfavoredOverload
    public func value(_ value: String) -> Button {
        return mutate(value: value)
    }
    
    public func value(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> Button {
        return mutate(value: LocalizedString(key: localizedKey, table: tableName))
    }
    
    public func value(verbatim value: String) -> Button {
        return mutate(value: value)
    }
    
    public func popover(_ value: Values.Popover.State) -> Button {
        return mutate(popover: value.rawValue)
    }
    
    public func popoverTarget(_ value: String, action: Values.Popover.Action? = nil) -> Button {
        return mutate(popovertarget: value).mutate(popovertargetaction: action?.rawValue)
    }
    
    @available(*, deprecated, message: "Use the popoverTarget(_:action:) modifier instead.")
    public func popoverAction(_ value: Values.Popover.Action) -> Button {
        return mutate(popoveraction: value.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Button {
        return mutate(key: key, value: value)
    }
    
    public func on(event: Events.Drag, _ value: String) -> Button {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> Button {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> Button {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Mouse, _ value: String) -> Button {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Wheel, _ value: String) -> Button {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func aria(atomic value: Bool) -> Button {
        return mutate(ariaatomic: value)
    }
    
    public func aria(busy value: Bool) -> Button {
        return mutate(ariabusy: value)
    }
    
    public func aria(controls value: String) -> Button {
        return mutate(ariacontrols: value)
    }
    
    public func aria(current value: Values.Accessibility.Current) -> Button {
        return mutate(ariacurrent: value.rawValue)
    }
    
    public func aria(describedBy value: String) -> Button {
        return mutate(ariadescribedby: value)
    }
    
    public func aria(details value: String) -> Button {
        return mutate(ariadetails: value)
    }
    
    public func aria(disabled value: Bool) -> Button {
        return mutate(ariadisabled: value)
    }
    
    public func aria(errorMessage value: String) -> Button {
        return mutate(ariaerrormessage: value)
    }
    
    public func aria(flowTo value: String) -> Button {
        return mutate(ariaflowto: value)
    }
    
    public func aria(hasPopup value: Values.Accessibility.Popup) -> Button {
        return mutate(ariahaspopup: value.rawValue)
    }
    
    public func aria(hidden value: Bool) -> Button {
        return mutate(ariahidden: value)
    }
    
    public func aria(invalid value: Values.Accessibility.Invalid) -> Button {
        return mutate(ariainvalid: value.rawValue)
    }
    
    public func aria(keyShortcuts value: String) -> Button {
        return mutate(ariakeyshortcuts: value)
    }
    
    public func aria(label value: String) -> Button {
        return mutate(arialabel: value)
    }
    
    public func aria(labeledBy value: String) -> Button {
        return mutate(arialabeledby: value)
    }
    
    public func aria(live value: Values.Accessibility.Live) -> Button {
        return mutate(arialive: value.rawValue)
    }
    
    public func aria(owns value: String) -> Button {
        return mutate(ariaowns: value)
    }
    
    public func aria(relevant value: Values.Accessibility.Relevant) -> Button {
        return mutate(ariarelevant: value.rawValue)
    }
    
    public func aria(roleDescription value: String) -> Button {
        return mutate(ariaroledescription: value)
    }
}

extension Button: Localizable {
    
    public init(_ localizedKey: LocalizedStringKey, tableName: String? = nil) {
        self.content = [LocalizedString(key: localizedKey, table: tableName)]
    }
}

/// An element that represents a group container.
///
/// Use `Fieldset` to group related controls like ``Input``, ``TextArea`` and ``Legend`` together.
///
/// ```swift
/// Form {
///     Fieldset {
///         Label {
///             "Lorem ipsum"
///         }
///         .for("lorem")
///         Input()
///             .type(.text)
///             .name("lorem")
///             .id("lorem")
///     }
/// }
/// .method(.post)
/// ```
public struct Fieldset: ContentNode, FormElement {
    
    internal var name: String { "fieldset" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [Content]
    
    /// Create a fieldset.
    ///
    /// - Parameter content: The set's content.
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [Content]) {
        self.attributes = attributes
        self.content = content
    }
    
    public func modify(if condition: Bool, element: (Fieldset) -> Fieldset) -> Fieldset {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (Fieldset, T) -> Fieldset) -> Fieldset {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension Fieldset: GlobalAttributes, GlobalEventAttributes, GlobalAriaAttributes, DisabledAttribute, FormAttribute, NameAttribute {
    
    public func accessKey(_ value: Character) -> Fieldset {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ value: Values.Capitalization) -> Fieldset {
        return mutate(autocapitalize: value.rawValue)
    }

    public func autofocus() -> Fieldset {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Fieldset {
        return mutate(class: value)
    }

    @available(*, deprecated, message: "Use the editable(_:) modifier instead.")
    public func isEditable(_ value: Bool) -> Fieldset {
        return mutate(contenteditable: value)
    }
    
    public func editable(_ value: Bool = true) -> Fieldset {
        return mutate(contenteditable: value)
    }

    public func direction(_ value: Values.Direction) -> Fieldset {
        return mutate(dir: value.rawValue)
    }

    @available(*, deprecated, message: "Use the draggable(_:) modifier instead.")
    public func isDraggable(_ value: Bool) -> Fieldset {
        return mutate(draggable: value)
    }
    
    public func draggable(_ value: Bool = true) -> Fieldset {
        return mutate(draggable: value)
    }

    @available(*, deprecated, message: "Use the enterKey(_:) modifier instead.")
    public func enterKeyHint(_ value: Values.Hint) -> Fieldset {
        return mutate(enterkeyhint: value.rawValue)
    }
    
    public func enterKey(_ value: Values.Hint) -> Fieldset {
        return mutate(enterkeyhint: value.rawValue)
    }
    
    public func hidden(_ condition: Bool = true) -> Fieldset {
        
        if condition {
            return mutate(hidden: "hidden")
        }
        
        return self
    }
    
    public func inputMode(_ value: Values.Mode) -> Fieldset {
        return mutate(inputmode: value.rawValue)
    }

    public func `is`(_ value: String) -> Fieldset {
        return mutate(is: value)
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: [String]? = nil) -> Fieldset {
        return self.mutate(itemscope: "itemscope").mutate(itemid: id).mutate(itemtype: schema?.absoluteString).mutate(itemref: elements?.joined(separator: " "))
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: String...) -> Fieldset {
        return self.mutate(itemscope: "itemscope").mutate(itemid: id).mutate(itemtype: schema?.absoluteString).mutate(itemref: elements.joined(separator: " "))
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemId(_ value: String) -> Fieldset {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Fieldset {
        return mutate(itemprop: value)
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemReference(_ value: String) -> Fieldset {
        return mutate(itemref: value)
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemScope(_ value: String) -> Fieldset {
        return mutate(itemscope: value)
    }
    
    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemType(_ value: String) -> Fieldset {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Fieldset {
        return mutate(id: value)
    }

    public func language(_ value: Values.Language) -> Fieldset {
        return mutate(lang: value.rawValue)
    }

    public func nonce(_ value: String) -> Fieldset {
        return mutate(nonce: value)
    }
    
    public func role(_ value: Values.Role) -> Fieldset {
        return mutate(role: value.rawValue)
    }

    @available(*, deprecated, message: "Use the spellcheck(_:) modifier instead.")
    public func hasSpellCheck(_ value: Bool) -> Fieldset {
        return mutate(spellcheck: value)
    }
    
    public func spellcheck(_ value: Bool = true) -> Fieldset {
        return mutate(spellcheck: value)
    }

    public func style(_ value: String) -> Fieldset {
        return mutate(style: TaintedString(value, as: .css(.attribute)))
    }

    public func tabIndex(_ value: Int) -> Fieldset {
        return mutate(tabindex: value)
    }

    @_disfavoredOverload
    public func title(_ value: String) -> Fieldset {
        return mutate(title: value)
    }
    
    public func title(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> Fieldset {
        return mutate(title: LocalizedString(key: localizedKey, table: tableName))
    }
    
    public func title(verbatim value: String) -> Fieldset {
        return mutate(title: value)
    }
    
    @available(*, deprecated, message: "Use the translate(_:) modifier instead.")
    public func translate(_ value: Values.Decision) -> Fieldset {
        return mutate(translate: value.rawValue)
    }
    
    public func translate(_ value: Bool = true) -> Fieldset {
        
        if value {
            return mutate(translate: "yes")
        }
        
        return mutate(translate: "no")
    }
    
    public func inert(_ condition: Bool = true) -> Fieldset {

        if condition {
            return mutate(inert: "inert")
        }
        
        return self
    }
    
    public func disabled(_ condition: Bool = true) -> Fieldset {
        
        if condition {
            return mutate(disabled: "disabled")
        }
        
        return self
    }
    
    public func form(_ value: String) -> Fieldset {
        return mutate(form: value)
    }
    
    public func name(_ value: String) -> Fieldset {
        return mutate(name: value)
    }
    
    public func popover(_ value: Values.Popover.State) -> Fieldset {
        return mutate(popover: value.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Fieldset {
        return mutate(key: key, value: value)
    }
    
    public func on(event: Events.Drag, _ value: String) -> Fieldset {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> Fieldset {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> Fieldset {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Mouse, _ value: String) -> Fieldset {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Wheel, _ value: String) -> Fieldset {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func aria(atomic value: Bool) -> Fieldset {
        return mutate(ariaatomic: value)
    }
    
    public func aria(busy value: Bool) -> Fieldset {
        return mutate(ariabusy: value)
    }
    
    public func aria(controls value: String) -> Fieldset {
        return mutate(ariacontrols: value)
    }
    
    public func aria(current value: Values.Accessibility.Current) -> Fieldset {
        return mutate(ariacurrent: value.rawValue)
    }
    
    public func aria(describedBy value: String) -> Fieldset {
        return mutate(ariadescribedby: value)
    }
    
    public func aria(details value: String) -> Fieldset {
        return mutate(ariadetails: value)
    }
    
    public func aria(disabled value: Bool) -> Fieldset {
        return mutate(ariadisabled: value)
    }
    
    public func aria(errorMessage value: String) -> Fieldset {
        return mutate(ariaerrormessage: value)
    }
    
    public func aria(flowTo value: String) -> Fieldset {
        return mutate(ariaflowto: value)
    }
    
    public func aria(hasPopup value: Values.Accessibility.Popup) -> Fieldset {
        return mutate(ariahaspopup: value.rawValue)
    }
    
    public func aria(hidden value: Bool) -> Fieldset {
        return mutate(ariahidden: value)
    }
    
    public func aria(invalid value: Values.Accessibility.Invalid) -> Fieldset {
        return mutate(ariainvalid: value.rawValue)
    }
    
    public func aria(keyShortcuts value: String) -> Fieldset {
        return mutate(ariakeyshortcuts: value)
    }
    
    public func aria(label value: String) -> Fieldset {
        return mutate(arialabel: value)
    }
    
    public func aria(labeledBy value: String) -> Fieldset {
        return mutate(arialabeledby: value)
    }
    
    public func aria(live value: Values.Accessibility.Live) -> Fieldset {
        return mutate(arialive: value.rawValue)
    }
    
    public func aria(owns value: String) -> Fieldset {
        return mutate(ariaowns: value)
    }
    
    public func aria(relevant value: Values.Accessibility.Relevant) -> Fieldset {
        return mutate(ariarelevant: value.rawValue)
    }
    
    public func aria(roleDescription value: String) -> Fieldset {
        return mutate(ariaroledescription: value)
    }
}
