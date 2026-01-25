import Foundation
import OrderedCollections

/// The alias for the element ``TermName``.
@_documentation(visibility: internal)
public typealias Dt = TermName

/// The alias for the element ``TermDefinition``.
@_documentation(visibility: internal)
public typealias Dd = TermDefinition

/// An element that represents a term name.
///
/// Use `TermName` to label a term and to introduce the corresponding definition.
///
/// ```swift
/// DescriptionList {
///     TermName {
///         "Lorem ipsum"
///     }
///     TermDefinition {
///         "Lorem ipsum..."
///     }
/// }
/// ```
public struct TermName: ContentNode, DescriptionElement {

    internal var name: String { "dt" }

    internal var attributes: OrderedDictionary<String, AttributeData>?

    internal var content: [Content]
    
    internal var context: EscapeContext
    
    /// Create a term name.
    ///
    /// - Parameter content: The name's content.
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        
        self.context = .tainted(.html)
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, AttributeData>?, context: EscapeContext, content: [Content]) {
        
        self.attributes = attributes
        self.context = context
        self.content = content
    }
    
    public func modify(if condition: Bool, element: (TermName) -> TermName) -> TermName {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (TermName, T) -> TermName) -> TermName {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension TermName: GlobalAttributes, GlobalEventAttributes, GlobalAriaAttributes {
    
    public func accessKey(_ value: Character) -> TermName {
        return mutate(accesskey: .init("\(value)", context: .trusted))
    }

    public func autocapitalize(_ value: Values.Capitalization) -> TermName {
        return mutate(autocapitalize: .init(value.rawValue, context: .trusted))
    }

    public func autofocus() -> TermName {
        return mutate(autofocus: .init("autofocus", context: .trusted))
    }

    public func `class`(_ names: [String]) -> TermName {
        return mutate(class: .init(EnumeratedList(values: names, separator: " "), context: .tainted(.html)))
    }
    
    public func `class`(_ names: String...) -> TermName {
        return mutate(class: .init(EnumeratedList(values: names, separator: " "), context: .tainted(.html)))
    }

    @available(*, deprecated, message: "Use the editable(_:) modifier instead.")
    public func isEditable(_ value: Bool) -> TermName {
        return mutate(contenteditable: .init(value, context: .trusted))
    }
    
    public func editable(_ value: Bool = true) -> TermName {
        return mutate(contenteditable: .init(value, context: .trusted))
    }

    public func direction(_ value: Values.Direction) -> TermName {
        return mutate(dir: .init(value.rawValue, context: .trusted))
    }

    @available(*, deprecated, message: "Use the draggable(_:) modifier instead.")
    public func isDraggable(_ value: Bool) -> TermName {
        return mutate(draggable: .init(value, context: .trusted))
    }
    
    public func draggable(_ value: Bool = true) -> TermName {
        return mutate(draggable: .init(value, context: .trusted))
    }

    @available(*, deprecated, message: "Use the enterKey(_:) modifier instead.")
    public func enterKeyHint(_ value: Values.Hint) -> TermName {
        return mutate(enterkeyhint: .init(value.rawValue, context: .trusted))
    }
    
    public func enterKey(_ value: Values.Hint) -> TermName {
        return mutate(enterkeyhint: .init(value.rawValue, context: .trusted))
    }
    
    public func hidden(_ condition: Bool = true) -> TermName{
        
        if condition {
            return mutate(hidden: .init("hidden", context: .trusted))
        }
        
        return self
    }
    
    public func inputMode(_ value: Values.Mode) -> TermName {
        return mutate(inputmode: .init(value.rawValue, context: .trusted))
    }

    public func `is`(_ value: String) -> TermName {
        return mutate(is: .init(value, context: .tainted(.html)))
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: [String]? = nil) -> TermName {

        var copy = self
        
        copy = copy.mutate(itemscope: .init("itemscope", context: .trusted))
        
        if let id = id {
            copy = copy.mutate(itemid: .init(id, context: .tainted(.html)))
        }
        
        if let schema = schema {
            copy = copy.mutate(itemtype: .init(schema.absoluteString, context: .tainted(.html)))
        }
        
        if let elements = elements {
            copy = copy.mutate(itemref: .init(elements.joined(separator: " "), context: .tainted(.html)))
        }
        
        return copy
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: String...) -> TermName {

        var copy = self
        
        copy = copy.mutate(itemscope: .init("itemscope", context: .trusted))
        
        if let id = id {
            copy = copy.mutate(itemid: .init(id, context: .tainted(.html)))
        }
        
        if let schema = schema {
            copy = copy.mutate(itemtype: .init(schema.absoluteString, context: .tainted(.html)))
        }
        
        copy = copy.mutate(itemref: .init(elements.joined(separator: " "), context: .tainted(.html)))
        
        return copy
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemId(_ value: String) -> TermName {
        return mutate(itemid: .init(value, context: .tainted(.html)))
    }

    public func itemProperty(_ value: String) -> TermName {
        return mutate(itemprop: .init(value, context: .tainted(.html)))
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemReference(_ value: String) -> TermName {
        return mutate(itemref: .init(value, context: .tainted(.html)))
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemScope(_ value: String) -> TermName {
        return mutate(itemscope: .init(value, context: .tainted(.html)))
    }
    
    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemType(_ value: String) -> TermName {
        return mutate(itemtype: .init(value, context: .tainted(.html)))
    }

    public func id(_ value: String) -> TermName {
        return mutate(id: .init(value, context: .tainted(.html)))
    }

    public func language(_ value: Values.Language) -> TermName {
        return mutate(lang: .init(value.rawValue, context: .trusted))
    }

    public func nonce(_ value: String) -> TermName {
        return mutate(nonce: .init(value, context: .tainted(.html)))
    }

    public func role(_ value: Values.Role) -> TermName {
        return mutate(role: .init(value.rawValue, context: .trusted))
    }
    
    @available(*, deprecated, message: "Use the spellcheck(_:) modifier instead.")
    public func hasSpellCheck(_ value: Bool) -> TermName {
        return mutate(spellcheck: .init(value, context: .trusted))
    }
    
    public func spellcheck(_ value: Bool = true) -> TermName {
        return mutate(spellcheck: .init(value, context: .trusted))
    }

    public func style(_ value: String) -> TermName {
        return mutate(style: .init(value, context: .tainted(.css)))
    }

    public func tabIndex(_ value: Int) -> TermName {
        return mutate(tabindex: .init(value, context: .trusted))
    }

    @_disfavoredOverload
    public func title(_ value: String) -> TermName {
        return mutate(title: .init(value, context: .tainted(.html)))
    }
    
    public func title(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> TermName {
        return mutate(title: .init(LocalizedString(key: localizedKey, table: tableName), context: .tainted(.html)))
    }
    
    public func title(verbatim value: String) -> TermName {
        return mutate(title: .init(value, context: .tainted(.html)))
    }

    @available(*, deprecated, message: "Use the translate(_:) modifier instead.")
    public func translate(_ value: Values.Decision) -> TermName {
        return mutate(translate: .init(value.rawValue, context: .trusted))
    }
    
    public func translate(_ value: Bool = true) -> TermName {
        
        if value {
            return mutate(translate: .init("yes", context: .trusted))
        }
        
        return mutate(translate: .init("no", context: .trusted))
    }
    
    public func inert(_ condition: Bool = true) -> TermName {

        if condition {
            return mutate(inert: .init("inert", context: .trusted))
        }
        
        return self
    }
    
    public func popover(_ value: Values.Popover.State) -> TermName {
        return mutate(popover: .init(value.rawValue, context: .trusted))
    }
    
    public func custom(key: String, value: String, context: EscapeContext = .tainted(.html)) -> TermName {
        return mutate(key: key, value: .init(value, context: context))
    }
    
    public func custom(key: String, value: Int) -> TermName {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Double) -> TermName {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Bool) -> TermName {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Float) -> TermName {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: EnvironmentValue, context: EscapeContext = .tainted(.html)) -> TermName {
        return mutate(key: key, value: .init(value, context: context))
    }
    
    public func on(event: Events.Drag, _ value: String) -> TermName {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> TermName {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> TermName {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func on(event: Events.Mouse, _ value: String) -> TermName {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }

    public func on(event: Events.Wheel, _ value: String) -> TermName {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func aria(atomic value: Bool) -> TermName {
        return mutate(ariaatomic: .init(value, context: .trusted))
    }
    
    public func aria(busy value: Bool) -> TermName {
        return mutate(ariabusy: .init(value, context: .trusted))
    }
    
    public func aria(controls value: String) -> TermName {
        return mutate(ariacontrols: .init(value, context: .tainted(.html)))
    }
    
    public func aria(current value: Values.Accessibility.Current) -> TermName {
        return mutate(ariacurrent: .init(value.rawValue, context: .trusted))
    }
    
    public func aria(describedBy value: String) -> TermName {
        return mutate(ariadescribedby: .init(value, context: .tainted(.html)))
    }
    
    public func aria(details value: String) -> TermName {
        return mutate(ariadetails: .init(value, context: .tainted(.html)))
    }
    
    public func aria(disabled value: Bool) -> TermName {
        return mutate(ariadisabled: .init(value, context: .trusted))
    }
    
    public func aria(errorMessage value: String) -> TermName {
        return mutate(ariaerrormessage: .init(value, context: .tainted(.html)))
    }
    
    public func aria(flowTo value: String) -> TermName {
        return mutate(ariaflowto: .init(value, context: .tainted(.html)))
    }
    
    public func aria(hasPopup value: Values.Accessibility.Popup) -> TermName {
        return mutate(ariahaspopup: .init(value.rawValue, context: .trusted))
    }
    
    public func aria(hidden value: Bool) -> TermName {
        return mutate(ariahidden: .init(value, context: .trusted))
    }
    
    public func aria(invalid value: Values.Accessibility.Invalid) -> TermName {
        return mutate(ariainvalid: .init(value.rawValue, context: .trusted))
    }
    
    public func aria(keyShortcuts value: String) -> TermName {
        return mutate(ariakeyshortcuts: .init(value, context: .tainted(.html)))
    }
    
    public func aria(label value: String) -> TermName {
        return mutate(arialabel: .init(value, context: .tainted(.html)))
    }
    
    public func aria(labeledBy value: String) -> TermName {
        return mutate(arialabeledby: .init(value, context: .tainted(.html)))
    }
    
    public func aria(live value: Values.Accessibility.Live) -> TermName {
        return mutate(arialive: .init(value.rawValue, context: .trusted))
    }
    
    public func aria(owns value: String) -> TermName {
        return mutate(ariaowns: .init(value, context: .tainted(.html)))
    }
    
    public func aria(relevant value: Values.Accessibility.Relevant) -> TermName {
        return mutate(ariarelevant: .init(value.rawValue, context: .trusted))
    }
    
    public func aria(roleDescription value: String) -> TermName {
        return mutate(ariaroledescription: .init(value, context: .tainted(.html)))
    }
}

/// An element that represents a term definition.
///
/// Use `TermDefinition` to describe the term in more detail.
///
/// ```swift
/// DescriptionList {
///     TermName {
///         "Lorem ipsum"
///     }
///     TermDefinition {
///         "Lorem ipsum..."
///     }
/// }
/// ```
public struct TermDefinition: ContentNode, DescriptionElement {

    internal var name: String { "dd" }

    internal var attributes: OrderedDictionary<String, AttributeData>?

    internal var content: [Content]
    
    internal var context: EscapeContext
    
    /// Creates a term definition.
    ///
    /// - Parameter content: The definition's content.
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        
        self.context = .tainted(.html)
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, AttributeData>?, context: EscapeContext, content: [Content]) {
        
        self.attributes = attributes
        self.context = context
        self.content = content
    }
    
    public func modify(if condition: Bool, element: (TermDefinition) -> TermDefinition) -> TermDefinition {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (TermDefinition, T) -> TermDefinition) -> TermDefinition {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension TermDefinition: GlobalAttributes, GlobalEventAttributes, GlobalAriaAttributes {
    
    public func accessKey(_ value: Character) -> TermDefinition {
        return mutate(accesskey: .init("\(value)", context: .trusted))
    }

    public func autocapitalize(_ value: Values.Capitalization) -> TermDefinition {
        return mutate(autocapitalize: .init(value.rawValue, context: .trusted))
    }

    public func autofocus() -> TermDefinition {
        return mutate(autofocus: .init("autofocus", context: .trusted))
    }

    public func `class`(_ names: [String]) -> TermDefinition {
        return mutate(class: .init(EnumeratedList(values: names, separator: " "), context: .tainted(.html)))
    }
    
    public func `class`(_ names: String...) -> TermDefinition {
        return mutate(class: .init(EnumeratedList(values: names, separator: " "), context: .tainted(.html)))
    }

    @available(*, deprecated, message: "Use the editable(_:) modifier instead.")
    public func isEditable(_ value: Bool) -> TermDefinition {
        return mutate(contenteditable: .init(value, context: .trusted))
    }
    
    public func editable(_ value: Bool = true) -> TermDefinition {
        return mutate(contenteditable: .init(value, context: .trusted))
    }

    public func direction(_ value: Values.Direction) -> TermDefinition {
        return mutate(dir: .init(value.rawValue, context: .trusted))
    }

    @available(*, deprecated, message: "Use the draggable(_:) modifier instead.")
    public func isDraggable(_ value: Bool) -> TermDefinition {
        return mutate(draggable: .init(value, context: .trusted))
    }
    
    public func draggable(_ value: Bool = true) -> TermDefinition {
        return mutate(draggable: .init(value, context: .trusted))
    }

    @available(*, deprecated, message: "Use the enterKey(_:) modifier instead.")
    public func enterKeyHint(_ value: Values.Hint) -> TermDefinition {
        return mutate(enterkeyhint: .init(value.rawValue, context: .trusted))
    }
    
    public func enterKey(_ value: Values.Hint) -> TermDefinition {
        return mutate(enterkeyhint: .init(value.rawValue, context: .trusted))
    }
    
    public func hidden(_ condition: Bool = true) -> TermDefinition {
        
        if condition {
            return mutate(hidden: .init("hidden", context: .trusted))
        }
        
        return self
    }
    
    public func inputMode(_ value: Values.Mode) -> TermDefinition {
        return mutate(inputmode: .init(value.rawValue, context: .trusted))
    }

    public func `is`(_ value: String) -> TermDefinition {
        return mutate(is: .init(value, context: .tainted(.html)))
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: [String]? = nil) -> TermDefinition {

        var copy = self
        
        copy = copy.mutate(itemscope: .init("itemscope", context: .trusted))
        
        if let id = id {
            copy = copy.mutate(itemid: .init(id, context: .tainted(.html)))
        }
        
        if let schema = schema {
            copy = copy.mutate(itemtype: .init(schema.absoluteString, context: .tainted(.html)))
        }
        
        if let elements = elements {
            copy = copy.mutate(itemref: .init(elements.joined(separator: " "), context: .tainted(.html)))
        }
        
        return copy
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: String...) -> TermDefinition {

        var copy = self
        
        copy = copy.mutate(itemscope: .init("itemscope", context: .trusted))
        
        if let id = id {
            copy = copy.mutate(itemid: .init(id, context: .tainted(.html)))
        }
        
        if let schema = schema {
            copy = copy.mutate(itemtype: .init(schema.absoluteString, context: .tainted(.html)))
        }
        
        copy = copy.mutate(itemref: .init(elements.joined(separator: " "), context: .tainted(.html)))
        
        return copy
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemId(_ value: String) -> TermDefinition {
        return mutate(itemid: .init(value, context: .tainted(.html)))
    }

    public func itemProperty(_ value: String) -> TermDefinition {
        return mutate(itemprop: .init(value, context: .tainted(.html)))
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemReference(_ value: String) -> TermDefinition {
        return mutate(itemref: .init(value, context: .tainted(.html)))
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemScope(_ value: String) -> TermDefinition {
        return mutate(itemscope: .init(value, context: .tainted(.html)))
    }
    
    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemType(_ value: String) -> TermDefinition {
        return mutate(itemtype: .init(value, context: .tainted(.html)))
    }

    public func id(_ value: String) -> TermDefinition {
        return mutate(id: .init(value, context: .tainted(.html)))
    }

    public func language(_ value: Values.Language) -> TermDefinition {
        return mutate(lang: .init(value.rawValue, context: .trusted))
    }

    public func nonce(_ value: String) -> TermDefinition {
        return mutate(nonce: .init(value, context: .tainted(.html)))
    }

    public func role(_ value: Values.Role) -> TermDefinition {
        return mutate(role: .init(value.rawValue, context: .trusted))
    }
    
    @available(*, deprecated, message: "Use the spellcheck(_:) modifier instead.")
    public func hasSpellCheck(_ value: Bool) -> TermDefinition {
        return mutate(spellcheck: .init(value, context: .trusted))
    }
    
    public func spellcheck(_ value: Bool = true) -> TermDefinition {
        return mutate(spellcheck: .init(value, context: .trusted))
    }

    public func style(_ value: String) -> TermDefinition {
        return mutate(style: .init(value, context: .tainted(.css)))
    }

    public func tabIndex(_ value: Int) -> TermDefinition {
        return mutate(tabindex: .init(value, context: .trusted))
    }

    @_disfavoredOverload
    public func title(_ value: String) -> TermDefinition {
        return mutate(title: .init(value, context: .tainted(.html)))
    }
    
    public func title(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> TermDefinition {
        return mutate(title: .init(LocalizedString(key: localizedKey, table: tableName), context: .tainted(.html)))
    }
    
    public func title(verbatim value: String) -> TermDefinition {
        return mutate(title: .init(value, context: .tainted(.html)))
    }
    
    @available(*, deprecated, message: "Use the translate(_:) modifier instead.")
    public func translate(_ value: Values.Decision) -> TermDefinition {
        return mutate(translate: .init(value.rawValue, context: .trusted))
    }
    
    public func translate(_ value: Bool = true) -> TermDefinition {
        
        if value {
            return mutate(translate: .init("yes", context: .trusted))
        }
        
        return mutate(translate: .init("no", context: .trusted))
    }
    
    public func inert(_ condition: Bool = true) -> TermDefinition {

        if condition {
            return mutate(inert: .init("inert", context: .trusted))
        }
        
        return self
    }
    
    public func popover(_ value: Values.Popover.State) -> TermDefinition {
        return mutate(popover: .init(value.rawValue, context: .trusted))
    }
    
    public func custom(key: String, value: String, context: EscapeContext = .tainted(.html)) -> TermDefinition {
        return mutate(key: key, value: .init(value, context: context))
    }
    
    public func custom(key: String, value: Int) -> TermDefinition {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Double) -> TermDefinition {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Bool) -> TermDefinition {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Float) -> TermDefinition {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: EnvironmentValue, context: EscapeContext = .tainted(.html)) -> TermDefinition {
        return mutate(key: key, value: .init(value, context: context))
    }
    
    public func on(event: Events.Drag, _ value: String) -> TermDefinition {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> TermDefinition {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> TermDefinition {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func on(event: Events.Mouse, _ value: String) -> TermDefinition {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }

    public func on(event: Events.Wheel, _ value: String) -> TermDefinition {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func aria(atomic value: Bool) -> TermDefinition {
        return mutate(ariaatomic: .init(value, context: .trusted))
    }
    
    public func aria(busy value: Bool) -> TermDefinition {
        return mutate(ariabusy: .init(value, context: .trusted))
    }
    
    public func aria(controls value: String) -> TermDefinition {
        return mutate(ariacontrols: .init(value, context: .tainted(.html)))
    }
    
    public func aria(current value: Values.Accessibility.Current) -> TermDefinition {
        return mutate(ariacurrent: .init(value.rawValue, context: .trusted))
    }
    
    public func aria(describedBy value: String) -> TermDefinition {
        return mutate(ariadescribedby: .init(value, context: .tainted(.html)))
    }
    
    public func aria(details value: String) -> TermDefinition {
        return mutate(ariadetails: .init(value, context: .tainted(.html)))
    }
    
    public func aria(disabled value: Bool) -> TermDefinition {
        return mutate(ariadisabled: .init(value, context: .trusted))
    }
    
    public func aria(errorMessage value: String) -> TermDefinition {
        return mutate(ariaerrormessage: .init(value, context: .tainted(.html)))
    }
    
    public func aria(flowTo value: String) -> TermDefinition {
        return mutate(ariaflowto: .init(value, context: .tainted(.html)))
    }
    
    public func aria(hasPopup value: Values.Accessibility.Popup) -> TermDefinition {
        return mutate(ariahaspopup: .init(value.rawValue, context: .trusted))
    }
    
    public func aria(hidden value: Bool) -> TermDefinition {
        return mutate(ariahidden: .init(value, context: .trusted))
    }
    
    public func aria(invalid value: Values.Accessibility.Invalid) -> TermDefinition {
        return mutate(ariainvalid: .init(value.rawValue, context: .trusted))
    }
    
    public func aria(keyShortcuts value: String) -> TermDefinition {
        return mutate(ariakeyshortcuts: .init(value, context: .tainted(.html)))
    }
    
    public func aria(label value: String) -> TermDefinition {
        return mutate(arialabel: .init(value, context: .tainted(.html)))
    }
    
    public func aria(labeledBy value: String) -> TermDefinition {
        return mutate(arialabeledby: .init(value, context: .tainted(.html)))
    }
    
    public func aria(live value: Values.Accessibility.Live) -> TermDefinition {
        return mutate(arialive: .init(value.rawValue, context: .trusted))
    }
    
    public func aria(owns value: String) -> TermDefinition {
        return mutate(ariaowns: .init(value, context: .tainted(.html)))
    }
    
    public func aria(relevant value: Values.Accessibility.Relevant) -> TermDefinition {
        return mutate(ariarelevant: .init(value.rawValue, context: .trusted))
    }
    
    public func aria(roleDescription value: String) -> TermDefinition {
        return mutate(ariaroledescription: .init(value, context: .tainted(.html)))
    }
}
