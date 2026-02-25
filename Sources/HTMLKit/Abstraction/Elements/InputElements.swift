import Foundation
import OrderedCollections

/// The alias for the element ``OptionGroup``.
@_documentation(visibility: internal)
public typealias Optgroup = OptionGroup

/// An element that represents a group container.
///
/// Use `OptionGroup` to group a set of ``Option``.
///
/// ```swift
/// Select {
///     OptionGroup {
///         Option {
///             "Lorem"
///         }
///         .value("lorem")
///         Option {
///             "Lorem"
///         }
///         .value("lorem")
///     }
/// }
/// .name("lorem")
/// .id("lorem")
/// ```
public struct OptionGroup: ContentNode, InputElement {

    internal var name: String { "optgroup" }

    internal var attributes: OrderedDictionary<String, AttributeData>?

    internal var content: [Content]
    
    internal var context: EscapeContext

    /// Create a option group.
    ///
    /// - Parameter content: The group's content.
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        
        self.context = .tainted(.html)
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, AttributeData>?, context: EscapeContext, content: [Content]) {
        
        self.attributes = attributes
        self.context = context
        self.content = content
    }
    
    public func modify(if condition: Bool, use strategy: MergeStrategy = .replacing, element: (OptionGroup) -> OptionGroup) -> OptionGroup {
        
        if condition {

            switch strategy {
            case .combining:
                return self.combine(element(self))
                
            case .replacing:
                return self.replace(element(self))
            }
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, use strategy: MergeStrategy = .replacing, element: (OptionGroup, T) -> OptionGroup) -> OptionGroup {
        
        guard let value = value else {
            return self
        }
        
        switch strategy {
        case .combining:
            return self.combine(element(self, value as T))
            
        case .replacing:
            return self.replace(element(self, value as T))
        }
    }
}

extension OptionGroup: GlobalAttributes, GlobalEventAttributes, GlobalAriaAttributes, DisabledAttribute, LabelAttribute {

    public func accessKey(_ value: Character) -> OptionGroup {
        return mutate(accesskey: .init("\(value)", context: .trusted))
    }

    public func autocapitalize(_ value: Values.Capitalization) -> OptionGroup {
        return mutate(autocapitalize: .init(value.rawValue, context: .trusted))
    }

    public func autofocus() -> OptionGroup {
        return mutate(autofocus: .init("autofocus", context: .trusted))
    }

    public func `class`(_ names: [String]) -> OptionGroup {
        return mutate(class: .init(EnumeratedList(values: names, separator: " "), context: .tainted(.html)))
    }
    
    public func `class`(_ names: String...) -> OptionGroup {
        return mutate(class: .init(EnumeratedList(values: names, separator: " "), context: .tainted(.html)))
    }

    @available(*, deprecated, message: "Use the editable(_:) modifier instead.")
    public func isEditable(_ value: Bool) -> OptionGroup {
        return mutate(contenteditable: .init(value, context: .trusted))
    }
    
    public func editable(_ value: Bool = true) -> OptionGroup {
        return mutate(contenteditable: .init(value, context: .trusted))
    }

    public func direction(_ value: Values.Direction) -> OptionGroup {
        return mutate(dir: .init(value.rawValue, context: .trusted))
    }

    @available(*, deprecated, message: "Use the draggable(_:) modifier instead.")
    public func isDraggable(_ value: Bool) -> OptionGroup {
        return mutate(draggable: .init(value, context: .trusted))
    }
    
    public func draggable(_ value: Bool = true) -> OptionGroup {
        return mutate(draggable: .init(value, context: .trusted))
    }

    @available(*, deprecated, message: "Use the enterKey(_:) modifier instead.")
    public func enterKeyHint(_ value: Values.Hint) -> OptionGroup {
        return mutate(enterkeyhint: .init(value.rawValue, context: .trusted))
    }
    
    public func enterKey(_ value: Values.Hint) -> OptionGroup {
        return mutate(enterkeyhint: .init(value.rawValue, context: .trusted))
    }
    
    public func hidden(_ condition: Bool = true) -> OptionGroup {
        
        if condition {
            return mutate(hidden: .init("hidden", context: .trusted))
        }
        
        return self
    }
    
    public func inputMode(_ value: Values.Mode) -> OptionGroup {
        return mutate(inputmode: .init(value.rawValue, context: .trusted))
    }

    public func `is`(_ value: String) -> OptionGroup {
        return mutate(is: .init(value, context: .tainted(.html)))
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: [String]? = nil) -> OptionGroup {

        var copy = self
        
        copy = copy.mutate(itemscope: .init("itemscope", context: .trusted))
        
        if let id = id {
            copy = copy.mutate(itemid: .init(id, context: .tainted(.html)))
        }
        
        if let schema = schema {
            copy = copy.mutate(itemtype: .init(schema.absoluteString, context: .tainted(.html)))
        }
        
        if let elements = elements {
            copy = copy.mutate(itemref: .init(EnumeratedList(values: elements, separator: " "), context: .tainted(.html)))
        }
        
        return copy
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: String...) -> OptionGroup {

        var copy = self
        
        copy = copy.mutate(itemscope: .init("itemscope", context: .trusted))
        
        if let id = id {
            copy = copy.mutate(itemid: .init(id, context: .tainted(.html)))
        }
        
        if let schema = schema {
            copy = copy.mutate(itemtype: .init(schema.absoluteString, context: .tainted(.html)))
        }
        
        copy = copy.mutate(itemref: .init(EnumeratedList(values: elements, separator: " "), context: .tainted(.html)))
        
        return copy
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemId(_ value: String) -> OptionGroup {
        return mutate(itemid: .init(value, context: .tainted(.html)))
    }

    public func itemProperty(_ value: String) -> OptionGroup {
        return mutate(itemprop: .init(value, context: .tainted(.html)))
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemReference(_ value: String) -> OptionGroup {
        return mutate(itemref: .init(value, context: .tainted(.html)))
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemScope(_ value: String) -> OptionGroup {
        return mutate(itemscope: .init(value, context: .tainted(.html)))
    }
    
    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemType(_ value: String) -> OptionGroup {
        return mutate(itemtype: .init(value, context: .tainted(.html)))
    }

    public func id(_ value: String) -> OptionGroup {
        return mutate(id: .init(value, context: .tainted(.html)))
    }

    public func language(_ value: Values.Language) -> OptionGroup {
        return mutate(lang: .init(value.rawValue, context: .trusted))
    }

    public func nonce(_ value: String) -> OptionGroup {
        return mutate(nonce: .init(value, context: .tainted(.html)))
    }
    
    public func role(_ value: Values.Role) -> OptionGroup {
        return mutate(role: .init(value.rawValue, context: .trusted))
    }

    @available(*, deprecated, message: "Use the spellcheck(_:) modifier instead.")
    public func hasSpellCheck(_ value: Bool) -> OptionGroup {
        return mutate(spellcheck: .init(value, context: .trusted))
    }
    
    public func spellcheck(_ value: Bool = true) -> OptionGroup {
        return mutate(spellcheck: .init(value, context: .trusted))
    }

    public func style(_ value: String) -> OptionGroup {
        return mutate(style: .init(value, context: .tainted(.css)))
    }

    public func tabIndex(_ value: Int) -> OptionGroup {
        return mutate(tabindex: .init(value, context: .trusted))
    }

    @_disfavoredOverload
    public func title(_ value: String) -> OptionGroup {
        return mutate(title: .init(value, context: .tainted(.html)))
    }
    
    public func title(verbatim value: String) -> OptionGroup {
        return mutate(title: .init(value, context: .tainted(.html)))
    }
    
    public func title(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> OptionGroup {
        return mutate(title: .init(LocalizedString(key: localizedKey, table: tableName), context: .tainted(.html)))
    }
    
    @available(*, deprecated, message: "Use the translate(_:) modifier instead.")
    public func translate(_ value: Values.Decision) -> OptionGroup {
        return mutate(translate: .init(value.rawValue, context: .trusted))
    }
    
    public func translate(_ value: Bool = true) -> OptionGroup {
        
        if value {
            return mutate(translate: .init("yes", context: .trusted))
        }
        
        return mutate(translate: .init("no", context: .trusted))
    }
    
    public func inert(_ condition: Bool = true) -> OptionGroup {

        if condition {
            return mutate(inert: .init("inert", context: .trusted))
        }
        
        return self
    }
    
    public func disabled(_ condition: Bool = true) -> OptionGroup {
        
        if condition {
            return mutate(disabled: .init("disabled", context: .trusted))
        }
        
        return self
    }
    
    @_disfavoredOverload
    public func label(_ value: String) -> OptionGroup {
        return mutate(label: .init(value, context: .tainted(.html)))
    }
    
    public func label(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> OptionGroup {
        return mutate(label: .init(LocalizedString(key: localizedKey, table: tableName), context: .tainted(.html)))
    }
    
    public func label(verbatim value: String) -> OptionGroup {
        return mutate(label: .init(value, context: .tainted(.html)))
    }
    
    public func popover(_ value: Values.Popover.State) -> OptionGroup {
        return mutate(popover: .init(value.rawValue, context: .trusted))
    }
    
    public func custom(key: String, value: String, context: EscapeContext = .tainted(.html)) -> OptionGroup {
        return mutate(key: key, value: .init(value, context: context))
    }
    
    public func custom(key: String, value: Int) -> OptionGroup {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Double) -> OptionGroup {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Bool) -> OptionGroup {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Float) -> OptionGroup {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: EnvironmentValue, context: EscapeContext = .tainted(.html)) -> OptionGroup {
        return mutate(key: key, value: .init(value, context: context))
    }
    
    public func on(event: Events.Drag, _ value: String) -> OptionGroup {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> OptionGroup {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func on(event: Events.Wheel, _ value: String) -> OptionGroup {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> OptionGroup {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func on(event: Events.Mouse, _ value: String) -> OptionGroup {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func aria(atomic value: Bool) -> OptionGroup {
        return mutate(ariaatomic: .init(value, context: .trusted))
    }
    
    public func aria(busy value: Bool) -> OptionGroup {
        return mutate(ariabusy: .init(value, context: .trusted))
    }
    
    public func aria(controls value: String) -> OptionGroup {
        return mutate(ariacontrols: .init(value, context: .tainted(.html)))
    }
    
    public func aria(current value: Values.Accessibility.Current) -> OptionGroup {
        return mutate(ariacurrent: .init(value.rawValue, context: .trusted))
    }
    
    public func aria(describedBy value: String) -> OptionGroup {
        return mutate(ariadescribedby: .init(value, context: .tainted(.html)))
    }
    
    public func aria(details value: String) -> OptionGroup {
        return mutate(ariadetails: .init(value, context: .tainted(.html)))
    }
    
    @available(*, deprecated, message: "Use the accessibilityDisabled(_:) modifier instead.")
    public func aria(disabled value: Bool) -> OptionGroup {
        return mutate(ariadisabled: .init(value, context: .trusted))
    }
    
    public func accessibilityDisabled(_ value: Bool = true) -> OptionGroup {
        return mutate(ariadisabled: .init(value, context: .trusted))
    }
    
    public func aria(errorMessage value: String) -> OptionGroup {
        return mutate(ariaerrormessage: .init(value, context: .tainted(.html)))
    }
    
    @available(*, deprecated, message: "Use the accessibilityFlowTo(_:) modifier instead.")
    public func aria(flowTo value: String) -> OptionGroup {
        return mutate(ariaflowto: .init(value, context: .tainted(.html)))
    }
    
    public func accessibilityFlowTo(_ ids: [String]) -> OptionGroup {
        return mutate(ariaflowto: .init(EnumeratedList(values: ids, separator: " "), context: .tainted(.html)))
    }
    
    public func accessibilityFlowTo(_ ids: String...) -> OptionGroup {
        return mutate(ariaflowto: .init(EnumeratedList(values: ids, separator: " "), context: .tainted(.html)))
    }
    
    public func aria(hasPopup value: Values.Accessibility.Popup) -> OptionGroup {
        return mutate(ariahaspopup: .init(value.rawValue, context: .trusted))
    }
    
    @available(*, deprecated, message: "Use the accessibilityHidden(_:) modifier instead.")
    public func aria(hidden value: Bool) -> OptionGroup {
        return mutate(ariahidden: .init(value, context: .trusted))
    }
    
    public func accessibilityHidden(_ value: Bool = true) -> OptionGroup {
        return mutate(ariahidden: .init(value, context: .trusted))
    }
    
    public func aria(invalid value: Values.Accessibility.Invalid) -> OptionGroup {
        return mutate(ariainvalid: .init(value.rawValue, context: .trusted))
    }
    
    public func aria(keyShortcuts value: String) -> OptionGroup {
        return mutate(ariakeyshortcuts: .init(value, context: .tainted(.html)))
    }
    
    @available(*, deprecated, message: "Use the accessibilityLabel(_:) modifier instead.")
    public func aria(label value: String) -> OptionGroup {
        return mutate(arialabel: .init(value, context: .tainted(.html)))
    }
    
    public func accessibilityLabel(_ value: String) -> OptionGroup {
        return mutate(arialabel: .init(value, context: .tainted(.html)))
    }
    
    public func accessibilityLabel(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> OptionGroup {
        return mutate(arialabel: .init(LocalizedString(key: localizedKey, table: tableName), context: .tainted(.html)))
    }
    
    public func accessibilityLabel(verbatim value: String) -> OptionGroup {
        return mutate(arialabel: .init(value, context: .tainted(.html)))
    }
    
    public func aria(labeledBy value: String) -> OptionGroup {
        return mutate(arialabeledby: .init(value, context: .tainted(.html)))
    }
    
    @available(*, deprecated, message: "Use the accessibilityLive(_:) modifier instead.")
    public func aria(live value: Values.Accessibility.Live) -> OptionGroup {
        return mutate(arialive: .init(value.rawValue, context: .trusted))
    }
    
    public func accessibilityLive(_ value: Values.Accessibility.Live) -> OptionGroup {
        return mutate(arialive: .init(value.rawValue, context: .trusted))
    }
    
    public func aria(owns value: String) -> OptionGroup {
        return mutate(ariaowns: .init(value, context: .tainted(.html)))
    }
    
    public func aria(relevant value: Values.Accessibility.Relevant) -> OptionGroup {
        return mutate(ariarelevant: .init(value.rawValue, context: .trusted))
    }
    
    public func aria(roleDescription value: String) -> OptionGroup {
        return mutate(ariaroledescription: .init(value, context: .tainted(.html)))
    }
}

/// An element that represents an select option.
///
/// Use `Option` to add an selectable option to a ``Select`` or ``OptionGroup``.
///
/// ```swift
/// Select {
///     Option {
///         "Lorem"
///     }
///     .value("lorem")
/// }
/// ```
public struct Option: ContentNode, InputElement {

    internal var name: String { "option" }

    internal var attributes: OrderedDictionary<String, AttributeData>?

    internal var content: [String]
    
    internal var context: EscapeContext

    /// Create a option.
    ///
    /// - Parameter content: The option's content.
    public init(@ContentBuilder<String> content: () -> [String]) {
        
        self.context = .tainted(.html)
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, AttributeData>?, context: EscapeContext, content: [String]) {
        
        self.attributes = attributes
        self.context = context
        self.content = content
    }
    
    public func modify(if condition: Bool, use strategy: MergeStrategy = .replacing, element: (Option) -> Option) -> Option {
        
        if condition {

            switch strategy {
            case .combining:
                return self.combine(element(self))
                
            case .replacing:
                return self.replace(element(self))
            }
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, use strategy: MergeStrategy = .replacing, element: (Option, T) -> Option) -> Option {
        
        guard let value = value else {
            return self
        }
        
        switch strategy {
        case .combining:
            return self.combine(element(self, value as T))
            
        case .replacing:
            return self.replace(element(self, value as T))
        }
    }
}

extension Option: GlobalAttributes, GlobalEventAttributes, GlobalAriaAttributes, DisabledAttribute, LabelAttribute, ValueAttribute, SelectedAttribute {
    
    public func accessKey(_ value: Character) -> Option {
        return mutate(accesskey: .init("\(value)", context: .trusted))
    }

    public func autocapitalize(_ value: Values.Capitalization) -> Option {
        return mutate(autocapitalize: .init(value.rawValue, context: .trusted))
    }

    public func autofocus() -> Option {
        return mutate(autofocus: .init("autofocus", context: .trusted))
    }

    public func `class`(_ names: [String]) -> Option {
        return mutate(class: .init(EnumeratedList(values: names, separator: " "), context: .tainted(.html)))
    }
    
    public func `class`(_ names: String...) -> Option {
        return mutate(class: .init(EnumeratedList(values: names, separator: " "), context: .tainted(.html)))
    }

    @available(*, deprecated, message: "Use the editable(_:) modifier instead.")
    public func isEditable(_ value: Bool) -> Option {
        return mutate(contenteditable: .init(value, context: .trusted))
    }
    
    public func editable(_ value: Bool = true) -> Option {
        return mutate(contenteditable: .init(value, context: .trusted))
    }

    public func direction(_ value: Values.Direction) -> Option {
        return mutate(dir: .init(value.rawValue, context: .trusted))
    }

    @available(*, deprecated, message: "Use the draggable(_:) modifier instead.")
    public func isDraggable(_ value: Bool) -> Option {
        return mutate(draggable: .init(value, context: .trusted))
    }
    
    public func draggable(_ value: Bool = true) -> Option {
        return mutate(draggable: .init(value, context: .trusted))
    }

    @available(*, deprecated, message: "Use the enterKey(_:) modifier instead.")
    public func enterKeyHint(_ value: Values.Hint) -> Option {
        return mutate(enterkeyhint: .init(value.rawValue, context: .trusted))
    }
    
    public func enterKey(_ value: Values.Hint) -> Option {
        return mutate(enterkeyhint: .init(value.rawValue, context: .trusted))
    }
    
    public func hidden(_ condition: Bool = true) -> Option {
        
        if condition {
            return mutate(hidden: .init("hidden", context: .trusted))
        }
        
        return self
    }
    
    public func inputMode(_ value: Values.Mode) -> Option {
        return mutate(inputmode: .init(value.rawValue, context: .trusted))
    }

    public func `is`(_ value: String) -> Option {
        return mutate(is: .init(value, context: .tainted(.html)))
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: [String]? = nil) -> Option {

        var copy = self
        
        copy = copy.mutate(itemscope: .init("itemscope", context: .trusted))
        
        if let id = id {
            copy = copy.mutate(itemid: .init(id, context: .tainted(.html)))
        }
        
        if let schema = schema {
            copy = copy.mutate(itemtype: .init(schema.absoluteString, context: .tainted(.html)))
        }
        
        if let elements = elements {
            copy = copy.mutate(itemref: .init(EnumeratedList(values: elements, separator: " "), context: .tainted(.html)))
        }
        
        return copy
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: String...) -> Option {

        var copy = self
        
        copy = copy.mutate(itemscope: .init("itemscope", context: .trusted))
        
        if let id = id {
            copy = copy.mutate(itemid: .init(id, context: .tainted(.html)))
        }
        
        if let schema = schema {
            copy = copy.mutate(itemtype: .init(schema.absoluteString, context: .tainted(.html)))
        }
        
        copy = copy.mutate(itemref: .init(EnumeratedList(values: elements, separator: " "), context: .tainted(.html)))
        
        return copy
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemId(_ value: String) -> Option {
        return mutate(itemid: .init(value, context: .tainted(.html)))
    }

    public func itemProperty(_ value: String) -> Option {
        return mutate(itemprop: .init(value, context: .tainted(.html)))
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemReference(_ value: String) -> Option {
        return mutate(itemref: .init(value, context: .tainted(.html)))
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemScope(_ value: String) -> Option {
        return mutate(itemscope: .init(value, context: .tainted(.html)))
    }
    
    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemType(_ value: String) -> Option {
        return mutate(itemtype: .init(value, context: .tainted(.html)))
    }

    public func id(_ value: String) -> Option {
        return mutate(id: .init(value, context: .tainted(.html)))
    }

    public func language(_ value: Values.Language) -> Option {
        return mutate(lang: .init(value.rawValue, context: .trusted))
    }

    public func nonce(_ value: String) -> Option {
        return mutate(nonce: .init(value, context: .tainted(.html)))
    }
    
    public func role(_ value: Values.Role) -> Option {
        return mutate(role: .init(value.rawValue, context: .trusted))
    }

    @available(*, deprecated, message: "Use the spellcheck(_:) modifier instead.")
    public func hasSpellCheck(_ value: Bool) -> Option {
        return mutate(spellcheck: .init(value, context: .trusted))
    }
    
    public func spellcheck(_ value: Bool = true) -> Option {
        return mutate(spellcheck: .init(value, context: .trusted))
    }

    public func style(_ value: String) -> Option {
        return mutate(style: .init(value, context: .tainted(.css)))
    }

    public func tabIndex(_ value: Int) -> Option {
        return mutate(tabindex: .init(value, context: .trusted))
    }

    @_disfavoredOverload
    public func title(_ value: String) -> Option {
        return mutate(title: .init(value, context: .tainted(.html)))
    }
    
    public func title(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> Option {
        return mutate(title: .init(LocalizedString(key: localizedKey, table: tableName), context: .tainted(.html)))
    }
    
    public func title(verbatim value: String) -> Option {
        return mutate(title: .init(value, context: .tainted(.html)))
    }
    
    @available(*, deprecated, message: "Use the translate(_:) modifier instead.")
    public func translate(_ value: Values.Decision) -> Option {
        return mutate(translate: .init(value.rawValue, context: .trusted))
    }
    
    public func translate(_ value: Bool = true) -> Option {
        
        if value {
            return mutate(translate: .init("yes", context: .trusted))
        }
        
        return mutate(translate: .init("no", context: .trusted))
    }
    
    public func inert(_ condition: Bool = true) -> Option {

        if condition {
            return mutate(inert: .init("inert", context: .trusted))
        }
        
        return self
    }
    
    public func disabled(_ condition: Bool = true) -> Option {
        
        if condition {
            return mutate(disabled: .init("disabled", context: .trusted))
        }
        
        return self
    }
    
    @_disfavoredOverload
    public func label(_ value: String) -> Option {
        return mutate(label: .init(value, context: .tainted(.html)))
    }
    
    public func label(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> Option {
        return mutate(label: .init(LocalizedString(key: localizedKey, table: tableName), context: .tainted(.html)))
    }
    
    public func label(verbatim value: String) -> Option {
        return mutate(label: .init(value, context: .tainted(.html)))
    }
    
    @_disfavoredOverload
    public func value(_ value: String) -> Option {
        return mutate(value: .init(value, context: .tainted(.html)))
    }
    
    public func value(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> Option {
        return mutate(value: .init(LocalizedString(key: localizedKey, table: tableName), context: .tainted(.html)))
    }
    
    public func value(verbatim value: String) -> Option {
        return mutate(value: .init(value, context: .tainted(.html)))
    }
    
    public func selected(_ condition: Bool = true) -> Option {
        
        if condition {
            return mutate(selected: .init("selected", context: .trusted))
        }
        
        return self
    }
    
    public func popover(_ value: Values.Popover.State) -> Option {
        return mutate(popover: .init(value.rawValue, context: .trusted))
    }
    
    public func custom(key: String, value: String, context: EscapeContext = .tainted(.html)) -> Option {
        return mutate(key: key, value: .init(value, context: context))
    }
    
    public func custom(key: String, value: Int) -> Option {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Double) -> Option {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Bool) -> Option {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Float) -> Option {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: EnvironmentValue, context: EscapeContext = .tainted(.html)) -> Option {
        return mutate(key: key, value: .init(value, context: context))
    }
    
    public func on(event: Events.Drag, _ value: String) -> Option {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> Option {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func on(event: Events.Wheel, _ value: String) -> Option {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> Option {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func on(event: Events.Mouse, _ value: String) -> Option {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func aria(atomic value: Bool) -> Option {
        return mutate(ariaatomic: .init(value, context: .trusted))
    }
    
    public func aria(busy value: Bool) -> Option {
        return mutate(ariabusy: .init(value, context: .trusted))
    }
    
    public func aria(controls value: String) -> Option {
        return mutate(ariacontrols: .init(value, context: .tainted(.html)))
    }
    
    public func aria(current value: Values.Accessibility.Current) -> Option {
        return mutate(ariacurrent: .init(value.rawValue, context: .trusted))
    }
    
    public func aria(describedBy value: String) -> Option {
        return mutate(ariadescribedby: .init(value, context: .tainted(.html)))
    }
    
    public func aria(details value: String) -> Option {
        return mutate(ariadetails: .init(value, context: .tainted(.html)))
    }
    
    @available(*, deprecated, message: "Use the accessibilityDisabled(_:) modifier instead.")
    public func aria(disabled value: Bool) -> Option {
        return mutate(ariadisabled: .init(value, context: .trusted))
    }
    
    public func accessibilityDisabled(_ value: Bool = true) -> Option {
        return mutate(ariadisabled: .init(value, context: .trusted))
    }
    
    public func aria(errorMessage value: String) -> Option {
        return mutate(ariaerrormessage: .init(value, context: .tainted(.html)))
    }
    
    @available(*, deprecated, message: "Use the accessibilityFlowTo(_:) modifier instead.")
    public func aria(flowTo value: String) -> Option {
        return mutate(ariaflowto: .init(value, context: .tainted(.html)))
    }
    
    public func accessibilityFlowTo(_ ids: [String]) -> Option {
        return mutate(ariaflowto: .init(EnumeratedList(values: ids, separator: " "), context: .tainted(.html)))
    }
    
    public func accessibilityFlowTo(_ ids: String...) -> Option {
        return mutate(ariaflowto: .init(EnumeratedList(values: ids, separator: " "), context: .tainted(.html)))
    }
    
    public func aria(hasPopup value: Values.Accessibility.Popup) -> Option {
        return mutate(ariahaspopup: .init(value.rawValue, context: .trusted))
    }
    
    @available(*, deprecated, message: "Use the accessibilityHidden(_:) modifier instead.")
    public func aria(hidden value: Bool) -> Option {
        return mutate(ariahidden: .init(value, context: .trusted))
    }
    
    public func accessibilityHidden(_ value: Bool = true) -> Option {
        return mutate(ariahidden: .init(value, context: .trusted))
    }
    
    public func aria(invalid value: Values.Accessibility.Invalid) -> Option {
        return mutate(ariainvalid: .init(value.rawValue, context: .trusted))
    }
    
    public func aria(keyShortcuts value: String) -> Option {
        return mutate(ariakeyshortcuts: .init(value, context: .tainted(.html)))
    }
    
    @available(*, deprecated, message: "Use the accessibilityLabel(_:) modifier instead.")
    public func aria(label value: String) -> Option {
        return mutate(arialabel: .init(value, context: .tainted(.html)))
    }
    
    public func accessibilityLabel(_ value: String) -> Option {
        return mutate(arialabel: .init(value, context: .tainted(.html)))
    }
    
    public func accessibilityLabel(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> Option {
        return mutate(arialabel: .init(LocalizedString(key: localizedKey, table: tableName), context: .tainted(.html)))
    }
    
    public func accessibilityLabel(verbatim value: String) -> Option {
        return mutate(arialabel: .init(value, context: .tainted(.html)))
    }
    
    public func aria(labeledBy value: String) -> Option {
        return mutate(arialabeledby: .init(value, context: .tainted(.html)))
    }
    
    @available(*, deprecated, message: "Use the accessibilityLive(_:) modifier instead.")
    public func aria(live value: Values.Accessibility.Live) -> Option {
        return mutate(arialive: .init(value.rawValue, context: .trusted))
    }
    
    public func accessibilityLive(_ value: Values.Accessibility.Live) -> Option {
        return mutate(arialive: .init(value.rawValue, context: .trusted))
    }
    
    public func aria(owns value: String) -> Option {
        return mutate(ariaowns: .init(value, context: .tainted(.html)))
    }
    
    public func aria(relevant value: Values.Accessibility.Relevant) -> Option {
        return mutate(ariarelevant: .init(value.rawValue, context: .trusted))
    }
    
    public func aria(roleDescription value: String) -> Option {
        return mutate(ariaroledescription: .init(value, context: .tainted(.html)))
    }
}

/// The element represents a fieldset caption.
///
/// Use `Legend` to give the ``Fieldset`` an accessible description.
///
/// ```swift
/// Form {
///     Fieldset {
///         Legend {
///             "Lorem ipsum..."
///         }
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
public struct Legend: ContentNode, InputElement {

    internal var name: String { "legend" }

    internal var attributes: OrderedDictionary<String, AttributeData>?

    internal var content: [Content]
    
    internal var context: EscapeContext

    /// Create a legend.
    ///
    /// - Parameter content: The legend's content.
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        
        self.context = .tainted(.html)
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, AttributeData>?, context: EscapeContext, content: [Content]) {
        
        self.attributes = attributes
        self.context = context
        self.content = content
    }
    
    public func modify(if condition: Bool, use strategy: MergeStrategy = .replacing, element: (Legend) -> Legend) -> Legend {
        
        if condition {

            switch strategy {
            case .combining:
                return self.combine(element(self))
                
            case .replacing:
                return self.replace(element(self))
            }
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, use strategy: MergeStrategy = .replacing, element: (Legend, T) -> Legend) -> Legend {
        
        guard let value = value else {
            return self
        }
        
        switch strategy {
        case .combining:
            return self.combine(element(self, value as T))
            
        case .replacing:
            return self.replace(element(self, value as T))
        }
    }
}

extension Legend: GlobalAttributes, GlobalEventAttributes, GlobalAriaAttributes {
    
    public func accessKey(_ value: Character) -> Legend {
        return mutate(accesskey: .init("\(value)", context: .trusted))
    }

    public func autocapitalize(_ value: Values.Capitalization) -> Legend {
        return mutate(autocapitalize: .init(value.rawValue, context: .trusted))
    }

    public func autofocus() -> Legend {
        return mutate(autofocus: .init("autofocus", context: .trusted))
    }

    public func `class`(_ names: [String]) -> Legend {
        return mutate(class: .init(EnumeratedList(values: names, separator: " "), context: .tainted(.html)))
    }
    
    public func `class`(_ names: String...) -> Legend {
        return mutate(class: .init(EnumeratedList(values: names, separator: " "), context: .tainted(.html)))
    }

    @available(*, deprecated, message: "Use the editable(_:) modifier instead.")
    public func isEditable(_ value: Bool) -> Legend {
        return mutate(contenteditable: .init(value, context: .trusted))
    }
    
    public func editable(_ value: Bool = true) -> Legend {
        return mutate(contenteditable: .init(value, context: .trusted))
    }

    public func direction(_ value: Values.Direction) -> Legend {
        return mutate(dir: .init(value.rawValue, context: .trusted))
    }

    @available(*, deprecated, message: "Use the draggable(_:) modifier instead.")
    public func isDraggable(_ value: Bool) -> Legend {
        return mutate(draggable: .init(value, context: .trusted))
    }
    
    public func draggable(_ value: Bool = true) -> Legend {
        return mutate(draggable: .init(value, context: .trusted))
    }

    @available(*, deprecated, message: "Use the enterKey(_:) modifier instead.")
    public func enterKeyHint(_ value: Values.Hint) -> Legend {
        return mutate(enterkeyhint: .init(value.rawValue, context: .trusted))
    }
    
    public func enterKey(_ value: Values.Hint) -> Legend {
        return mutate(enterkeyhint: .init(value.rawValue, context: .trusted))
    }
    
    public func hidden(_ condition: Bool = true) -> Legend {
        
        if condition {
            return mutate(hidden: .init("hidden", context: .trusted))
        }
        
        return self
    }
    
    public func inputMode(_ value: Values.Mode) -> Legend {
        return mutate(inputmode: .init(value.rawValue, context: .trusted))
    }

    public func `is`(_ value: String) -> Legend {
        return mutate(is: .init(value, context: .tainted(.html)))
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: [String]? = nil) -> Legend {

        var copy = self
        
        copy = copy.mutate(itemscope: .init("itemscope", context: .trusted))
        
        if let id = id {
            copy = copy.mutate(itemid: .init(id, context: .tainted(.html)))
        }
        
        if let schema = schema {
            copy = copy.mutate(itemtype: .init(schema.absoluteString, context: .tainted(.html)))
        }
        
        if let elements = elements {
            copy = copy.mutate(itemref: .init(EnumeratedList(values: elements, separator: " "), context: .tainted(.html)))
        }
        
        return copy
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: String...) -> Legend {

        var copy = self
        
        copy = copy.mutate(itemscope: .init("itemscope", context: .trusted))
        
        if let id = id {
            copy = copy.mutate(itemid: .init(id, context: .tainted(.html)))
        }
        
        if let schema = schema {
            copy = copy.mutate(itemtype: .init(schema.absoluteString, context: .tainted(.html)))
        }
        
        copy = copy.mutate(itemref: .init(EnumeratedList(values: elements, separator: " "), context: .tainted(.html)))
        
        return copy
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemId(_ value: String) -> Legend {
        return mutate(itemid: .init(value, context: .tainted(.html)))
    }
    
    public func itemProperty(_ value: String) -> Legend {
        return mutate(itemprop: .init(value, context: .tainted(.html)))
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemReference(_ value: String) -> Legend {
        return mutate(itemref: .init(value, context: .tainted(.html)))
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemScope(_ value: String) -> Legend {
        return mutate(itemscope: .init(value, context: .tainted(.html)))
    }
    
    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemType(_ value: String) -> Legend {
        return mutate(itemtype: .init(value, context: .tainted(.html)))
    }

    public func id(_ value: String) -> Legend {
        return mutate(id: .init(value, context: .tainted(.html)))
    }

    public func language(_ value: Values.Language) -> Legend {
        return mutate(lang: .init(value.rawValue, context: .trusted))
    }

    public func nonce(_ value: String) -> Legend {
        return mutate(nonce: .init(value, context: .tainted(.html)))
    }

    public func role(_ value: Values.Role) -> Legend {
        return mutate(role: .init(value.rawValue, context: .trusted))
    }
    
    @available(*, deprecated, message: "Use the spellcheck(_:) modifier instead.")
    public func hasSpellCheck(_ value: Bool) -> Legend {
        return mutate(spellcheck: .init(value, context: .trusted))
    }
    
    public func spellcheck(_ value: Bool = true) -> Legend {
        return mutate(spellcheck: .init(value, context: .trusted))
    }

    public func style(_ value: String) -> Legend {
        return mutate(style: .init(value, context: .tainted(.css)))
    }

    public func tabIndex(_ value: Int) -> Legend {
        return mutate(tabindex: .init(value, context: .trusted))
    }

    @_disfavoredOverload
    public func title(_ value: String) -> Legend {
        return mutate(title: .init(value, context: .tainted(.html)))
    }
    
    public func title(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> Legend {
        return mutate(title: .init(LocalizedString(key: localizedKey, table: tableName), context: .tainted(.html)))
    }
    
    public func title(verbatim value: String) -> Legend {
        return mutate(title: .init(value, context: .tainted(.html)))
    }
    
    @available(*, deprecated, message: "Use the translate(_:) modifier instead.")
    public func translate(_ value: Values.Decision) -> Legend {
        return mutate(translate: .init(value.rawValue, context: .trusted))
    }
    
    public func translate(_ value: Bool = true) -> Legend {
        
        if value {
            return mutate(translate: .init("yes", context: .trusted))
        }
        
        return mutate(translate: .init("no", context: .trusted))
    }
    
    public func inert(_ condition: Bool = true) -> Legend {

        if condition {
            return mutate(inert: .init("inert", context: .trusted))
        }
        
        return self
    }
    
    public func popover(_ value: Values.Popover.State) -> Legend {
        return mutate(popover: .init(value.rawValue, context: .trusted))
    }
    
    public func custom(key: String, value: String, context: EscapeContext = .tainted(.html)) -> Legend {
        return mutate(key: key, value: .init(value, context: context))
    }
    
    public func custom(key: String, value: Int) -> Legend {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Double) -> Legend {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Bool) -> Legend {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Float) -> Legend {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: EnvironmentValue, context: EscapeContext = .tainted(.html)) -> Legend {
        return mutate(key: key, value: .init(value, context: context))
    }
    
    public func on(event: Events.Drag, _ value: String) -> Legend {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> Legend {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func on(event: Events.Wheel, _ value: String) -> Legend {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> Legend {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func on(event: Events.Mouse, _ value: String) -> Legend {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func aria(atomic value: Bool) -> Legend {
        return mutate(ariaatomic: .init(value, context: .trusted))
    }
    
    public func aria(busy value: Bool) -> Legend {
        return mutate(ariabusy: .init(value, context: .trusted))
    }
    
    public func aria(controls value: String) -> Legend {
        return mutate(ariacontrols: .init(value, context: .tainted(.html)))
    }
    
    public func aria(current value: Values.Accessibility.Current) -> Legend {
        return mutate(ariacurrent: .init(value.rawValue, context: .trusted))
    }
    
    public func aria(describedBy value: String) -> Legend {
        return mutate(ariadescribedby: .init(value, context: .tainted(.html)))
    }
    
    public func aria(details value: String) -> Legend {
        return mutate(ariadetails: .init(value, context: .tainted(.html)))
    }
    
    @available(*, deprecated, message: "Use the accessibilityDisabled(_:) modifier instead.")
    public func aria(disabled value: Bool) -> Legend {
        return mutate(ariadisabled: .init(value, context: .trusted))
    }
    
    public func accessibilityDisabled(_ value: Bool = true) -> Legend {
        return mutate(ariadisabled: .init(value, context: .trusted))
    }
    
    public func aria(errorMessage value: String) -> Legend {
        return mutate(ariaerrormessage: .init(value, context: .tainted(.html)))
    }
    
    @available(*, deprecated, message: "Use the accessibilityFlowTo(_:) modifier instead.")
    public func aria(flowTo value: String) -> Legend {
        return mutate(ariaflowto: .init(value, context: .tainted(.html)))
    }
    
    public func accessibilityFlowTo(_ ids: [String]) -> Legend {
        return mutate(ariaflowto: .init(EnumeratedList(values: ids, separator: " "), context: .tainted(.html)))
    }
    
    public func accessibilityFlowTo(_ ids: String...) -> Legend {
        return mutate(ariaflowto: .init(EnumeratedList(values: ids, separator: " "), context: .tainted(.html)))
    }
    
    public func aria(hasPopup value: Values.Accessibility.Popup) -> Legend {
        return mutate(ariahaspopup: .init(value.rawValue, context: .trusted))
    }
    
    @available(*, deprecated, message: "Use the accessibilityHidden(_:) modifier instead.")
    public func aria(hidden value: Bool) -> Legend {
        return mutate(ariahidden: .init(value, context: .trusted))
    }
    
    public func accessibilityHidden(_ value: Bool = true) -> Legend {
        return mutate(ariahidden: .init(value, context: .trusted))
    }
    
    public func aria(invalid value: Values.Accessibility.Invalid) -> Legend {
        return mutate(ariainvalid: .init(value.rawValue, context: .trusted))
    }
    
    public func aria(keyShortcuts value: String) -> Legend {
        return mutate(ariakeyshortcuts: .init(value, context: .tainted(.html)))
    }
    
    @available(*, deprecated, message: "Use the accessibilityLabel(_:) modifier instead.")
    public func aria(label value: String) -> Legend {
        return mutate(arialabel: .init(value, context: .tainted(.html)))
    }
    
    public func accessibilityLabel(_ value: String) -> Legend {
        return mutate(arialabel: .init(value, context: .tainted(.html)))
    }
    
    public func accessibilityLabel(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> Legend {
        return mutate(arialabel: .init(LocalizedString(key: localizedKey, table: tableName), context: .tainted(.html)))
    }
    
    public func accessibilityLabel(verbatim value: String) -> Legend {
        return mutate(arialabel: .init(value, context: .tainted(.html)))
    }
    
    public func aria(labeledBy value: String) -> Legend {
        return mutate(arialabeledby: .init(value, context: .tainted(.html)))
    }
    
    @available(*, deprecated, message: "Use the accessibilityLive(_:) modifier instead.")
    public func aria(live value: Values.Accessibility.Live) -> Legend {
        return mutate(arialive: .init(value.rawValue, context: .trusted))
    }
    
    public func accessibilityLive(_ value: Values.Accessibility.Live) -> Legend {
        return mutate(arialive: .init(value.rawValue, context: .trusted))
    }
    
    public func aria(owns value: String) -> Legend {
        return mutate(ariaowns: .init(value, context: .tainted(.html)))
    }
    
    public func aria(relevant value: Values.Accessibility.Relevant) -> Legend {
        return mutate(ariarelevant: .init(value.rawValue, context: .trusted))
    }
    
    public func aria(roleDescription value: String) -> Legend {
        return mutate(ariaroledescription: .init(value, context: .tainted(.html)))
    }
}

/// An element that represents a detail label.
///
/// Use `Summary` to give a brief description of the content it controls.
///
/// ```swift
/// Details {
///     Summary {
///         "Lorem ipsum"
///     }
///     Paragraph {
///         "Lorem ipsum..."
///     }
/// }
/// ```
public struct Summary: ContentNode, InputElement {

    internal var name: String { "summary" }

    internal var attributes: OrderedDictionary<String, AttributeData>?

    internal var content: [Content]
    
    internal var context: EscapeContext

    /// Create a summary.
    ///
    /// - Parameter content: The summary's content.
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        
        self.context = .tainted(.html)
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, AttributeData>?, context: EscapeContext, content: [Content]) {
        
        self.attributes = attributes
        self.context = context
        self.content = content
    }
    
    public func modify(if condition: Bool, use strategy: MergeStrategy = .replacing, element: (Summary) -> Summary) -> Summary {
        
        if condition {

            switch strategy {
            case .combining:
                return self.combine(element(self))
                
            case .replacing:
                return self.replace(element(self))
            }
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, use strategy: MergeStrategy = .replacing, element: (Summary, T) -> Summary) -> Summary {
        
        guard let value = value else {
            return self
        }
        
        switch strategy {
        case .combining:
            return self.combine(element(self, value as T))
            
        case .replacing:
            return self.replace(element(self, value as T))
        }
    }
}

extension Summary: GlobalAttributes, GlobalEventAttributes, GlobalAriaAttributes {
    
    public func accessKey(_ value: Character) -> Summary {
        return mutate(accesskey: .init("\(value)", context: .trusted))
    }

    public func autocapitalize(_ value: Values.Capitalization) -> Summary {
        return mutate(autocapitalize: .init(value.rawValue, context: .trusted))
    }

    public func autofocus() -> Summary {
        return mutate(autofocus: .init("autofocus", context: .trusted))
    }

    public func `class`(_ names: [String]) -> Summary {
        return mutate(class: .init(EnumeratedList(values: names, separator: " "), context: .tainted(.html)))
    }
    
    public func `class`(_ names: String...) -> Summary {
        return mutate(class: .init(EnumeratedList(values: names, separator: " "), context: .tainted(.html)))
    }

    @available(*, deprecated, message: "Use the editable(_:) modifier instead.")
    public func isEditable(_ value: Bool) -> Summary {
        return mutate(contenteditable: .init(value, context: .trusted))
    }
    
    public func editable(_ value: Bool = true) -> Summary {
        return mutate(contenteditable: .init(value, context: .trusted))
    }

    public func direction(_ value: Values.Direction) -> Summary {
        return mutate(dir: .init(value.rawValue, context: .trusted))
    }

    @available(*, deprecated, message: "Use the draggable(_:) modifier instead.")
    public func isDraggable(_ value: Bool) -> Summary {
        return mutate(draggable: .init(value, context: .trusted))
    }
    
    public func draggable(_ value: Bool = true) -> Summary {
        return mutate(draggable: .init(value, context: .trusted))
    }

    @available(*, deprecated, message: "Use the enterKey(_:) modifier instead.")
    public func enterKeyHint(_ value: Values.Hint) -> Summary {
        return mutate(enterkeyhint: .init(value.rawValue, context: .trusted))
    }
    
    public func enterKey(_ value: Values.Hint) -> Summary {
        return mutate(enterkeyhint: .init(value.rawValue, context: .trusted))
    }
    
    public func hidden(_ condition: Bool = true) -> Summary {
        
        if condition {
            return mutate(hidden: .init("hidden", context: .trusted))
        }
        
        return self
    }
    
    public func inputMode(_ value: Values.Mode) -> Summary {
        return mutate(inputmode: .init(value.rawValue, context: .trusted))
    }

    public func `is`(_ value: String) -> Summary {
        return mutate(is: .init(value, context: .tainted(.html)))
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: [String]? = nil) -> Summary {

        var copy = self
        
        copy = copy.mutate(itemscope: .init("itemscope", context: .trusted))
        
        if let id = id {
            copy = copy.mutate(itemid: .init(id, context: .tainted(.html)))
        }
        
        if let schema = schema {
            copy = copy.mutate(itemtype: .init(schema.absoluteString, context: .tainted(.html)))
        }
        
        if let elements = elements {
            copy = copy.mutate(itemref: .init(EnumeratedList(values: elements, separator: " "), context: .tainted(.html)))
        }
        
        return copy
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: String...) -> Summary {

        var copy = self
        
        copy = copy.mutate(itemscope: .init("itemscope", context: .trusted))
        
        if let id = id {
            copy = copy.mutate(itemid: .init(id, context: .tainted(.html)))
        }
        
        if let schema = schema {
            copy = copy.mutate(itemtype: .init(schema.absoluteString, context: .tainted(.html)))
        }
        
        copy = copy.mutate(itemref: .init(EnumeratedList(values: elements, separator: " "), context: .tainted(.html)))
        
        return copy
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemId(_ value: String) -> Summary {
        return mutate(itemid: .init(value, context: .tainted(.html)))
    }

    public func itemProperty(_ value: String) -> Summary {
        return mutate(itemprop: .init(value, context: .tainted(.html)))
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemReference(_ value: String) -> Summary {
        return mutate(itemref: .init(value, context: .tainted(.html)))
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemScope(_ value: String) -> Summary {
        return mutate(itemscope: .init(value, context: .tainted(.html)))
    }
    
    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemType(_ value: String) -> Summary {
        return mutate(itemtype: .init(value, context: .tainted(.html)))
    }

    public func id(_ value: String) -> Summary {
        return mutate(id: .init(value, context: .tainted(.html)))
    }

    public func language(_ value: Values.Language) -> Summary {
        return mutate(lang: .init(value.rawValue, context: .trusted))
    }

    public func nonce(_ value: String) -> Summary {
        return mutate(nonce: .init(value, context: .tainted(.html)))
    }
    
    public func role(_ value: Values.Role) -> Summary {
        return mutate(role: .init(value.rawValue, context: .trusted))
    }

    @available(*, deprecated, message: "Use the spellcheck(_:) modifier instead.")
    public func hasSpellCheck(_ value: Bool) -> Summary {
        return mutate(spellcheck: .init(value, context: .trusted))
    }
    
    public func spellcheck(_ value: Bool = true) -> Summary {
        return mutate(spellcheck: .init(value, context: .trusted))
    }

    public func style(_ value: String) -> Summary {
        return mutate(style: .init(value, context: .tainted(.css)))
    }

    public func tabIndex(_ value: Int) -> Summary {
        return mutate(tabindex: .init(value, context: .trusted))
    }

    @_disfavoredOverload
    public func title(_ value: String) -> Summary {
        return mutate(title: .init(value, context: .tainted(.html)))
    }
    
    public func title(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> Summary {
        return mutate(title: .init(LocalizedString(key: localizedKey, table: tableName), context: .tainted(.html)))
    }
    
    public func title(verbatim value: String) -> Summary {
        return mutate(title: .init(value, context: .tainted(.html)))
    }
    
    @available(*, deprecated, message: "Use the translate(_:) modifier instead.")
    public func translate(_ value: Values.Decision) -> Summary {
        return mutate(translate: .init(value.rawValue, context: .trusted))
    }
    
    public func translate(_ value: Bool = true) -> Summary {
        
        if value {
            return mutate(translate: .init("yes", context: .trusted))
        }
        
        return mutate(translate: .init("no", context: .trusted))
    }
    
    public func inert(_ condition: Bool = true) -> Summary {

        if condition {
            return mutate(inert: .init("inert", context: .trusted))
        }
        
        return self
    }
    
    public func popover(_ value: Values.Popover.State) -> Summary {
        return mutate(popover: .init(value.rawValue, context: .trusted))
    }
    
    public func custom(key: String, value: String, context: EscapeContext = .tainted(.html)) -> Summary {
        return mutate(key: key, value: .init(value, context: context))
    }
    
    public func custom(key: String, value: Int) -> Summary {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Double) -> Summary {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Bool) -> Summary {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Float) -> Summary {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: EnvironmentValue, context: EscapeContext = .tainted(.html)) -> Summary {
        return mutate(key: key, value: .init(value, context: context))
    }
    
    public func on(event: Events.Drag, _ value: String) -> Summary {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> Summary {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func on(event: Events.Wheel, _ value: String) -> Summary {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> Summary {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func on(event: Events.Mouse, _ value: String) -> Summary {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func aria(atomic value: Bool) -> Summary {
        return mutate(ariaatomic: .init(value, context: .trusted))
    }
    
    public func aria(busy value: Bool) -> Summary {
        return mutate(ariabusy: .init(value, context: .trusted))
    }
    
    public func aria(controls value: String) -> Summary {
        return mutate(ariacontrols: .init(value, context: .tainted(.html)))
    }
    
    public func aria(current value: Values.Accessibility.Current) -> Summary {
        return mutate(ariacurrent: .init(value.rawValue, context: .trusted))
    }
    
    public func aria(describedBy value: String) -> Summary {
        return mutate(ariadescribedby: .init(value, context: .tainted(.html)))
    }
    
    public func aria(details value: String) -> Summary {
        return mutate(ariadetails: .init(value, context: .tainted(.html)))
    }
    
    @available(*, deprecated, message: "Use the accessibilityDisabled(_:) modifier instead.")
    public func aria(disabled value: Bool) -> Summary {
        return mutate(ariadisabled: .init(value, context: .trusted))
    }
    
    public func accessibilityDisabled(_ value: Bool = true) -> Summary {
        return mutate(ariadisabled: .init(value, context: .trusted))
    }
    
    public func aria(errorMessage value: String) -> Summary {
        return mutate(ariaerrormessage: .init(value, context: .tainted(.html)))
    }
    
    @available(*, deprecated, message: "Use the accessibilityFlowTo(_:) modifier instead.")
    public func aria(flowTo value: String) -> Summary {
        return mutate(ariaflowto: .init(value, context: .tainted(.html)))
    }
    
    public func accessibilityFlowTo(_ ids: [String]) -> Summary {
        return mutate(ariaflowto: .init(EnumeratedList(values: ids, separator: " "), context: .tainted(.html)))
    }
    
    public func accessibilityFlowTo(_ ids: String...) -> Summary {
        return mutate(ariaflowto: .init(EnumeratedList(values: ids, separator: " "), context: .tainted(.html)))
    }
    
    public func aria(hasPopup value: Values.Accessibility.Popup) -> Summary {
        return mutate(ariahaspopup: .init(value.rawValue, context: .trusted))
    }
    
    @available(*, deprecated, message: "Use the accessibilityHidden(_:) modifier instead.")
    public func aria(hidden value: Bool) -> Summary {
        return mutate(ariahidden: .init(value, context: .trusted))
    }
    
    public func accessibilityHidden(_ value: Bool = true) -> Summary {
        return mutate(ariahidden: .init(value, context: .trusted))
    }
    
    public func aria(invalid value: Values.Accessibility.Invalid) -> Summary {
        return mutate(ariainvalid: .init(value.rawValue, context: .trusted))
    }
    
    public func aria(keyShortcuts value: String) -> Summary {
        return mutate(ariakeyshortcuts: .init(value, context: .tainted(.html)))
    }
    
    @available(*, deprecated, message: "Use the accessibilityLabel(_:) modifier instead.")
    public func aria(label value: String) -> Summary {
        return mutate(arialabel: .init(value, context: .tainted(.html)))
    }
    
    public func accessibilityLabel(_ value: String) -> Summary {
        return mutate(arialabel: .init(value, context: .tainted(.html)))
    }
    
    public func accessibilityLabel(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> Summary {
        return mutate(arialabel: .init(LocalizedString(key: localizedKey, table: tableName), context: .tainted(.html)))
    }
    
    public func accessibilityLabel(verbatim value: String) -> Summary {
        return mutate(arialabel: .init(value, context: .tainted(.html)))
    }
    
    public func aria(labeledBy value: String) -> Summary {
        return mutate(arialabeledby: .init(value, context: .tainted(.html)))
    }
    
    @available(*, deprecated, message: "Use the accessibilityLive(_:) modifier instead.")
    public func aria(live value: Values.Accessibility.Live) -> Summary {
        return mutate(arialive: .init(value.rawValue, context: .trusted))
    }
    
    public func accessibilityLive(_ value: Values.Accessibility.Live) -> Summary {
        return mutate(arialive: .init(value.rawValue, context: .trusted))
    }
    
    public func aria(owns value: String) -> Summary {
        return mutate(ariaowns: .init(value, context: .tainted(.html)))
    }
    
    public func aria(relevant value: Values.Accessibility.Relevant) -> Summary {
        return mutate(ariarelevant: .init(value.rawValue, context: .trusted))
    }
    
    public func aria(roleDescription value: String) -> Summary {
        return mutate(ariaroledescription: .init(value, context: .tainted(.html)))
    }
}
