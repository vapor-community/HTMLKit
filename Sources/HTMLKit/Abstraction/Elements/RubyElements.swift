import Foundation
import OrderedCollections

/// The alias for the element ``RubyText``.
@_documentation(visibility: internal)
public typealias Rt = RubyText

/// The alias for the element ``RubyPronunciation``.
@_documentation(visibility: internal)
public typealias Rp = RubyPronunciation

/// An element that represents a ruby annotation.
///
/// Use `RubyText` to help with the pronunciation or meaning of the base character.
///
/// ```swift
/// Ruby {
///     "改"
///     RubyText {
///         "かい"
///     }
/// }
/// ```
public struct RubyText: ContentNode, RubyElement {

    internal var name: String { "rt" }

    internal var attributes: OrderedDictionary<String, AttributeData>?

    internal var content: [Content]
    
    internal var context: EscapeContext

    /// Create a ruby text.
    ///
    /// - Parameter content: The text's content.
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        
        self.context = .tainted(.html)
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, AttributeData>?, context: EscapeContext, content: [Content]) {
        
        self.attributes = attributes
        self.context = context
        self.content = content
    }
    
    public func modify(if condition: Bool, element: (RubyText) -> RubyText) -> RubyText {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (RubyText, T) -> RubyText) -> RubyText {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension RubyText: GlobalAttributes, GlobalEventAttributes, GlobalAriaAttributes {
    
    public func accessKey(_ value: Character) -> RubyText {
        return mutate(accesskey: .init("\(value)", context: .trusted))
    }

    public func autocapitalize(_ value: Values.Capitalization) -> RubyText {
        return mutate(autocapitalize: .init(value.rawValue, context: .trusted))
    }

    public func autofocus() -> RubyText {
        return mutate(autofocus: .init("autofocus", context: .trusted))
    }

    public func `class`(_ value: String) -> RubyText {
        return mutate(class: .init(value, context: .tainted(.html)))
    }

    @available(*, deprecated, message: "Use the editable(_:) modifier instead.")
    public func isEditable(_ value: Bool) -> RubyText {
        return mutate(contenteditable: .init(value, context: .trusted))
    }
    
    public func editable(_ value: Bool = true) -> RubyText {
        return mutate(contenteditable: .init(value, context: .trusted))
    }

    public func direction(_ value: Values.Direction) -> RubyText {
        return mutate(dir: .init(value.rawValue, context: .trusted))
    }

    @available(*, deprecated, message: "Use the draggable(_:) modifier instead.")
    public func isDraggable(_ value: Bool) -> RubyText {
        return mutate(draggable: .init(value, context: .trusted))
    }
    
    public func draggable(_ value: Bool = true) -> RubyText {
        return mutate(draggable: .init(value, context: .trusted))
    }

    @available(*, deprecated, message: "Use the enterKey(_:) modifier instead.")
    public func enterKeyHint(_ value: Values.Hint) -> RubyText {
        return mutate(enterkeyhint: .init(value.rawValue, context: .trusted))
    }
    
    public func enterKey(_ value: Values.Hint) -> RubyText {
        return mutate(enterkeyhint: .init(value.rawValue, context: .trusted))
    }
    
    public func hidden(_ condition: Bool = true) -> RubyText {
        
        if condition {
            return mutate(hidden: .init("hidden", context: .trusted))
        }
        
        return self
    }
    
    public func inputMode(_ value: Values.Mode) -> RubyText {
        return mutate(inputmode: .init(value.rawValue, context: .trusted))
    }

    public func `is`(_ value: String) -> RubyText {
        return mutate(is: .init(value, context: .tainted(.html)))
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: [String]? = nil) -> RubyText {

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
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: String...) -> RubyText {

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
    public func itemId(_ value: String) -> RubyText {
        return mutate(itemid: .init(value, context: .tainted(.html)))
    }

    public func itemProperty(_ value: String) -> RubyText {
        return mutate(itemprop: .init(value, context: .tainted(.html)))
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemReference(_ value: String) -> RubyText {
        return mutate(itemref: .init(value, context: .tainted(.html)))
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemScope(_ value: String) -> RubyText {
        return mutate(itemscope: .init(value, context: .tainted(.html)))
    }
    
    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemType(_ value: String) -> RubyText {
        return mutate(itemtype: .init(value, context: .tainted(.html)))
    }

    public func id(_ value: String) -> RubyText {
        return mutate(id: .init(value, context: .tainted(.html)))
    }

    public func language(_ value: Values.Language) -> RubyText {
        return mutate(lang: .init(value.rawValue, context: .trusted))
    }

    public func nonce(_ value: String) -> RubyText {
        return mutate(nonce: .init(value, context: .tainted(.html)))
    }
    
    public func role(_ value: Values.Role) -> RubyText {
        return mutate(role: .init(value.rawValue, context: .trusted))
    }

    @available(*, deprecated, message: "Use the spellcheck(_:) modifier instead.")
    public func hasSpellCheck(_ value: Bool) -> RubyText {
        return mutate(spellcheck: .init(value, context: .trusted))
    }
    
    public func spellcheck(_ value: Bool = true) -> RubyText {
        return mutate(spellcheck: .init(value, context: .trusted))
    }

    public func style(_ value: String) -> RubyText {
        return mutate(style: .init(value, context: .tainted(.css)))
    }

    public func tabIndex(_ value: Int) -> RubyText {
        return mutate(tabindex: .init(value, context: .trusted))
    }

    @_disfavoredOverload
    public func title(_ value: String) -> RubyText {
        return mutate(title: .init(value, context: .tainted(.html)))
    }
    
    public func title(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> RubyText {
        return mutate(title: .init(LocalizedString(key: localizedKey, table: tableName), context: .tainted(.html)))
    }
    
    public func title(verbatim value: String) -> RubyText {
        return mutate(title: .init(value, context: .tainted(.html)))
    }
    
    @available(*, deprecated, message: "Use the translate(_:) modifier instead.")
    public func translate(_ value: Values.Decision) -> RubyText {
        return mutate(translate: .init(value.rawValue, context: .trusted))
    }
    
    public func translate(_ value: Bool = true) -> RubyText {
        
        if value {
            return mutate(translate: .init("yes", context: .trusted))
        }
        
        return mutate(translate: .init("no", context: .trusted))
    }
    
    public func inert(_ condition: Bool = true) -> RubyText {

        if condition {
            return mutate(inert: .init("inert", context: .trusted))
        }
        
        return self
    }
    
    public func popover(_ value: Values.Popover.State) -> RubyText {
        return mutate(popover: .init(value.rawValue, context: .trusted))
    }
    
    public func custom(key: String, value: String, context: EscapeContext = .tainted(.html)) -> RubyText {
        return mutate(key: key, value: .init(value, context: context))
    }
    
    public func custom(key: String, value: Int) -> RubyText {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Double) -> RubyText {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Bool) -> RubyText {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Float) -> RubyText {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: EnvironmentValue, context: EscapeContext = .tainted(.html)) -> RubyText {
        return mutate(key: key, value: .init(value, context: context))
    }
    
    public func on(event: Events.Drag, _ value: String) -> RubyText {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> RubyText {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func on(event: Events.Wheel, _ value: String) -> RubyText {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> RubyText {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func on(event: Events.Mouse, _ value: String) -> RubyText {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func aria(atomic value: Bool) -> RubyText {
        return mutate(ariaatomic: .init(value, context: .trusted))
    }
    
    public func aria(busy value: Bool) -> RubyText {
        return mutate(ariabusy: .init(value, context: .trusted))
    }
    
    public func aria(controls value: String) -> RubyText {
        return mutate(ariacontrols: .init(value, context: .tainted(.html)))
    }
    
    public func aria(current value: Values.Accessibility.Current) -> RubyText {
        return mutate(ariacurrent: .init(value.rawValue, context: .trusted))
    }
    
    public func aria(describedBy value: String) -> RubyText {
        return mutate(ariadescribedby: .init(value, context: .tainted(.html)))
    }
    
    public func aria(details value: String) -> RubyText {
        return mutate(ariadetails: .init(value, context: .tainted(.html)))
    }
    
    public func aria(disabled value: Bool) -> RubyText {
        return mutate(ariadisabled: .init(value, context: .trusted))
    }
    
    public func aria(errorMessage value: String) -> RubyText {
        return mutate(ariaerrormessage: .init(value, context: .tainted(.html)))
    }
    
    public func aria(flowTo value: String) -> RubyText {
        return mutate(ariaflowto: .init(value, context: .tainted(.html)))
    }
    
    public func aria(hasPopup value: Values.Accessibility.Popup) -> RubyText {
        return mutate(ariahaspopup: .init(value.rawValue, context: .trusted))
    }
    
    public func aria(hidden value: Bool) -> RubyText {
        return mutate(ariahidden: .init(value, context: .trusted))
    }
    
    public func aria(invalid value: Values.Accessibility.Invalid) -> RubyText {
        return mutate(ariainvalid: .init(value.rawValue, context: .trusted))
    }
    
    public func aria(keyShortcuts value: String) -> RubyText {
        return mutate(ariakeyshortcuts: .init(value, context: .tainted(.html)))
    }
    
    public func aria(label value: String) -> RubyText {
        return mutate(arialabel: .init(value, context: .tainted(.html)))
    }
    
    public func aria(labeledBy value: String) -> RubyText {
        return mutate(arialabeledby: .init(value, context: .tainted(.html)))
    }
    
    public func aria(live value: Values.Accessibility.Live) -> RubyText {
        return mutate(arialive: .init(value.rawValue, context: .trusted))
    }
    
    public func aria(owns value: String) -> RubyText {
        return mutate(ariaowns: .init(value, context: .tainted(.html)))
    }
    
    public func aria(relevant value: Values.Accessibility.Relevant) -> RubyText {
        return mutate(ariarelevant: .init(value.rawValue, context: .trusted))
    }
    
    public func aria(roleDescription value: String) -> RubyText {
        return mutate(ariaroledescription: .init(value, context: .tainted(.html)))
    }
}

/// An element that represents the ruby fallback.
///
/// Use `RubyPronunciation` to provide an alternative text for browsers that don't support ``Ruby``.
///
/// ```swift
/// Ruby {
///     "改"
///     RubyPronuncation {
///         "("
///     }
///     RubyText {
///         "かい"
///     }
///     RubyPronuncation {
///         ")"
///     }
/// }
/// ```
public struct RubyPronunciation: ContentNode, RubyElement {

    internal var name: String { "rp" }

    internal var attributes: OrderedDictionary<String, AttributeData>?

    internal var content: [Content]
    
    internal var context: EscapeContext
    
    /// Create a ruby pronunciation.
    ///
    /// - Parameter content: The pronunciation's content.
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        
        self.context = .tainted(.html)
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, AttributeData>?, context: EscapeContext, content: [Content]) {
        
        self.attributes = attributes
        self.context = context
        self.content = content
    }
    
    public func modify(if condition: Bool, element: (RubyPronunciation) -> RubyPronunciation) -> RubyPronunciation {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (RubyPronunciation, T) -> RubyPronunciation) -> RubyPronunciation {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension RubyPronunciation: GlobalAttributes, GlobalEventAttributes, GlobalAriaAttributes {
    
    public func accessKey(_ value: Character) -> RubyPronunciation {
        return mutate(accesskey: .init("\(value)", context: .trusted))
    }

    public func autocapitalize(_ value: Values.Capitalization) -> RubyPronunciation {
        return mutate(autocapitalize: .init(value.rawValue, context: .trusted))
    }

    public func autofocus() -> RubyPronunciation {
        return mutate(autofocus: .init("autofocus", context: .trusted))
    }

    public func `class`(_ value: String) -> RubyPronunciation {
        return mutate(class: .init(value, context: .tainted(.html)))
    }

    @available(*, deprecated, message: "Use the editable(_:) modifier instead.")
    public func isEditable(_ value: Bool) -> RubyPronunciation {
        return mutate(contenteditable: .init(value, context: .trusted))
    }
    
    public func editable(_ value: Bool = true) -> RubyPronunciation {
        return mutate(contenteditable: .init(value, context: .trusted))
    }

    public func direction(_ value: Values.Direction) -> RubyPronunciation {
        return mutate(dir: .init(value.rawValue, context: .trusted))
    }

    @available(*, deprecated, message: "Use the draggable(_:) modifier instead.")
    public func isDraggable(_ value: Bool) -> RubyPronunciation {
        return mutate(draggable: .init(value, context: .trusted))
    }
    
    public func draggable(_ value: Bool = true) -> RubyPronunciation {
        return mutate(draggable: .init(value, context: .trusted))
    }

    @available(*, deprecated, message: "Use the enterKey(_:) modifier instead.")
    public func enterKeyHint(_ value: Values.Hint) -> RubyPronunciation {
        return mutate(enterkeyhint: .init(value.rawValue, context: .trusted))
    }
    
    public func enterKey(_ value: Values.Hint) -> RubyPronunciation {
        return mutate(enterkeyhint: .init(value.rawValue, context: .trusted))
    }
    
    public func hidden(_ condition: Bool = true) -> RubyPronunciation {
        
        if condition {
            return mutate(hidden: .init("hidden", context: .trusted))
        }
        
        return self
    }

    public func inputMode(_ value: Values.Mode) -> RubyPronunciation {
        return mutate(inputmode: .init(value.rawValue, context: .trusted))
    }
    
    public func `is`(_ value: String) -> RubyPronunciation {
        return mutate(is: .init(value, context: .tainted(.html)))
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: [String]? = nil) -> RubyPronunciation {

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
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: String...) -> RubyPronunciation {

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
    public func itemId(_ value: String) -> RubyPronunciation {
        return mutate(itemid: .init(value, context: .tainted(.html)))
    }

    public func itemProperty(_ value: String) -> RubyPronunciation {
        return mutate(itemprop: .init(value, context: .tainted(.html)))
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemReference(_ value: String) -> RubyPronunciation {
        return mutate(itemref: .init(value, context: .tainted(.html)))
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemScope(_ value: String) -> RubyPronunciation {
        return mutate(itemscope: .init(value, context: .tainted(.html)))
    }
    
    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemType(_ value: String) -> RubyPronunciation {
        return mutate(itemtype: .init(value, context: .tainted(.html)))
    }

    public func id(_ value: String) -> RubyPronunciation {
        return mutate(id: .init(value, context: .tainted(.html)))
    }

    public func language(_ value: Values.Language) -> RubyPronunciation {
        return mutate(lang: .init(value.rawValue, context: .trusted))
    }

    public func nonce(_ value: String) -> RubyPronunciation {
        return mutate(nonce: .init(value, context: .tainted(.html)))
    }
    
    public func role(_ value: Values.Role) -> RubyPronunciation {
        return mutate(role: .init(value.rawValue, context: .trusted))
    }

    @available(*, deprecated, message: "Use the spellcheck(_:) modifier instead.")
    public func hasSpellCheck(_ value: Bool) -> RubyPronunciation {
        return mutate(spellcheck: .init(value, context: .trusted))
    }
    
    @available(*, deprecated, message: "Use the spellcheck(_:) modifier instead.")
    public func spellcheck(_ value: Bool = true) -> RubyPronunciation {
        return mutate(spellcheck: .init(value, context: .trusted))
    }

    public func style(_ value: String) -> RubyPronunciation {
        return mutate(style: .init(value, context: .tainted(.css)))
    }

    public func tabIndex(_ value: Int) -> RubyPronunciation {
        return mutate(tabindex: .init(value, context: .trusted))
    }

    @_disfavoredOverload
    public func title(_ value: String) -> RubyPronunciation {
        return mutate(title: .init(value, context: .tainted(.html)))
    }
    
    public func title(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> RubyPronunciation {
        return mutate(title: .init(LocalizedString(key: localizedKey, table: tableName), context: .tainted(.html)))
    }
    
    public func title(verbatim value: String) -> RubyPronunciation {
        return mutate(title: .init(value, context: .tainted(.html)))
    }
    
    @available(*, deprecated, message: "Use the translate(_:) modifier instead.")
    public func translate(_ value: Values.Decision) -> RubyPronunciation {
        return mutate(translate: .init(value.rawValue, context: .trusted))
    }
    
    public func translate(_ value: Bool = true) -> RubyPronunciation {
        
        if value {
            return mutate(translate: .init("yes", context: .trusted))
        }
        
        return mutate(translate: .init("no", context: .trusted))
    }
    
    public func inert(_ condition: Bool = true) -> RubyPronunciation {

        if condition {
            return mutate(inert: .init("inert", context: .trusted))
        }
        
        return self
    }
    
    public func popover(_ value: Values.Popover.State) -> RubyPronunciation {
        return mutate(popover: .init(value.rawValue, context: .trusted))
    }
    
    public func custom(key: String, value: String, context: EscapeContext = .tainted(.html)) -> RubyPronunciation {
        return mutate(key: key, value: .init(value, context: context))
    }
    
    public func custom(key: String, value: Int) -> RubyPronunciation {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Double) -> RubyPronunciation {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Bool) -> RubyPronunciation {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Float) -> RubyPronunciation {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: EnvironmentValue, context: EscapeContext = .tainted(.html)) -> RubyPronunciation {
        return mutate(key: key, value: .init(value, context: context))
    }
    
    public func on(event: Events.Drag, _ value: String) -> RubyPronunciation {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> RubyPronunciation {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func on(event: Events.Wheel, _ value: String) -> RubyPronunciation {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> RubyPronunciation {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func on(event: Events.Mouse, _ value: String) -> RubyPronunciation {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }

    public func aria(atomic value: Bool) -> RubyPronunciation {
        return mutate(ariaatomic: .init(value, context: .trusted))
    }
    
    public func aria(busy value: Bool) -> RubyPronunciation {
        return mutate(ariabusy: .init(value, context: .trusted))
    }
    
    public func aria(controls value: String) -> RubyPronunciation {
        return mutate(ariacontrols: .init(value, context: .tainted(.html)))
    }
    
    public func aria(current value: Values.Accessibility.Current) -> RubyPronunciation {
        return mutate(ariacurrent: .init(value.rawValue, context: .trusted))
    }
    
    public func aria(describedBy value: String) -> RubyPronunciation {
        return mutate(ariadescribedby: .init(value, context: .tainted(.html)))
    }
    
    public func aria(details value: String) -> RubyPronunciation {
        return mutate(ariadetails: .init(value, context: .tainted(.html)))
    }
    
    public func aria(disabled value: Bool) -> RubyPronunciation {
        return mutate(ariadisabled: .init(value, context: .trusted))
    }
    
    public func aria(errorMessage value: String) -> RubyPronunciation {
        return mutate(ariaerrormessage: .init(value, context: .tainted(.html)))
    }
    
    public func aria(flowTo value: String) -> RubyPronunciation {
        return mutate(ariaflowto: .init(value, context: .tainted(.html)))
    }
    
    public func aria(hasPopup value: Values.Accessibility.Popup) -> RubyPronunciation {
        return mutate(ariahaspopup: .init(value.rawValue, context: .trusted))
    }
    
    public func aria(hidden value: Bool) -> RubyPronunciation {
        return mutate(ariahidden: .init(value, context: .trusted))
    }
    
    public func aria(invalid value: Values.Accessibility.Invalid) -> RubyPronunciation {
        return mutate(ariainvalid: .init(value.rawValue, context: .trusted))
    }
    
    public func aria(keyShortcuts value: String) -> RubyPronunciation {
        return mutate(ariakeyshortcuts: .init(value, context: .tainted(.html)))
    }
    
    public func aria(label value: String) -> RubyPronunciation {
        return mutate(arialabel: .init(value, context: .tainted(.html)))
    }
    
    public func aria(labeledBy value: String) -> RubyPronunciation {
        return mutate(arialabeledby: .init(value, context: .tainted(.html)))
    }
    
    public func aria(live value: Values.Accessibility.Live) -> RubyPronunciation {
        return mutate(arialive: .init(value.rawValue, context: .trusted))
    }
    
    public func aria(owns value: String) -> RubyPronunciation {
        return mutate(ariaowns: .init(value, context: .tainted(.html)))
    }
    
    public func aria(relevant value: Values.Accessibility.Relevant) -> RubyPronunciation {
        return mutate(ariarelevant: .init(value.rawValue, context: .trusted))
    }
    
    public func aria(roleDescription value: String) -> RubyPronunciation {
        return mutate(ariaroledescription: .init(value, context: .tainted(.html)))
    }
}
