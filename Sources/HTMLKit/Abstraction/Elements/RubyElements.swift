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

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [Content]

    /// Create a ruby text.
    ///
    /// - Parameter content: The text's content.
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [Content]) {
        self.attributes = attributes
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
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ value: Values.Capitalization) -> RubyText {
        return mutate(autocapitalize: value.rawValue)
    }

    public func autofocus() -> RubyText {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> RubyText {
        return mutate(class: value)
    }

    @available(*, deprecated, message: "Use the editable(_:) modifier instead.")
    public func isEditable(_ value: Bool) -> RubyText {
        return mutate(contenteditable: value)
    }
    
    public func editable(_ value: Bool = true) -> RubyText {
        return mutate(contenteditable: value)
    }

    public func direction(_ value: Values.Direction) -> RubyText {
        return mutate(dir: value.rawValue)
    }

    @available(*, deprecated, message: "Use the draggable(_:) modifier instead.")
    public func isDraggable(_ value: Bool) -> RubyText {
        return mutate(draggable: value)
    }
    
    public func draggable(_ value: Bool = true) -> RubyText {
        return mutate(draggable: value)
    }

    @available(*, deprecated, message: "Use the enterKey(_:) modifier instead.")
    public func enterKeyHint(_ value: Values.Hint) -> RubyText {
        return mutate(enterkeyhint: value.rawValue)
    }
    
    public func enterKey(_ value: Values.Hint) -> RubyText {
        return mutate(enterkeyhint: value.rawValue)
    }
    
    public func hidden(_ condition: Bool = true) -> RubyText {
        
        if condition {
            return mutate(hidden: "hidden")
        }
        
        return self
    }
    
    public func inputMode(_ value: Values.Mode) -> RubyText {
        return mutate(inputmode: value.rawValue)
    }

    public func `is`(_ value: String) -> RubyText {
        return mutate(is: value)
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: [String]? = nil) -> RubyText {
        return self.mutate(itemscope: "itemscope").mutate(itemid: id).mutate(itemtype: schema?.absoluteString).mutate(itemref: elements?.joined(separator: " "))
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: String...) -> RubyText {
        return self.mutate(itemscope: "itemscope").mutate(itemid: id).mutate(itemtype: schema?.absoluteString).mutate(itemref: elements.joined(separator: " "))
    }

    @available(*, deprecated, message: "Use the item(id:as:for:) modifier instead.")
    public func itemId(_ value: String) -> RubyText {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> RubyText {
        return mutate(itemprop: value)
    }

    @available(*, deprecated, message: "Use the item(id:as:for:) modifier instead.")
    public func itemReference(_ value: String) -> RubyText {
        return mutate(itemref: value)
    }

    @available(*, deprecated, message: "Use the item(id:as:for:) modifier instead.")
    public func itemScope(_ value: String) -> RubyText {
        return mutate(itemscope: value)
    }
    
    @available(*, deprecated, message: "Use the item(id:as:for:) modifier instead.")
    public func itemType(_ value: String) -> RubyText {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> RubyText {
        return mutate(id: value)
    }

    public func language(_ value: Values.Language) -> RubyText {
        return mutate(lang: value.rawValue)
    }

    public func nonce(_ value: String) -> RubyText {
        return mutate(nonce: value)
    }
    
    public func role(_ value: Values.Role) -> RubyText {
        return mutate(role: value.rawValue)
    }

    @available(*, deprecated, message: "Use the spellcheck(_:) modifier instead.")
    public func hasSpellCheck(_ value: Bool) -> RubyText {
        return mutate(spellcheck: value)
    }
    
    public func spellcheck(_ value: Bool = true) -> RubyText {
        return mutate(spellcheck: value)
    }

    public func style(_ value: String) -> RubyText {
        return mutate(style: TaintedString(value, as: .css(.attribute)))
    }

    public func tabIndex(_ value: Int) -> RubyText {
        return mutate(tabindex: value)
    }

    @_disfavoredOverload
    public func title(_ value: String) -> RubyText {
        return mutate(title: value)
    }
    
    public func title(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> RubyText {
        return mutate(title: LocalizedString(key: localizedKey, table: tableName))
    }
    
    public func title(verbatim value: String) -> RubyText {
        return mutate(title: value)
    }
    
    @available(*, deprecated, message: "Use the translate(_:) modifier instead.")
    public func translate(_ value: Values.Decision) -> RubyText {
        return mutate(translate: value.rawValue)
    }
    
    public func translate(_ value: Bool = true) -> RubyText {
        
        if value {
            return mutate(translate: "yes")
        }
        
        return mutate(translate: "no")
    }
    
    public func inert(_ condition: Bool = true) -> RubyText {

        if condition {
            return mutate(inert: "inert")
        }
        
        return self
    }
    
    public func popover(_ value: Values.Popover.State) -> RubyText {
        return mutate(popover: value.rawValue)
    }
    
    public func custom(key: String, value: Any) -> RubyText {
        return mutate(key: key, value: value)
    }
    
    public func on(event: Events.Drag, _ value: String) -> RubyText {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> RubyText {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Wheel, _ value: String) -> RubyText {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> RubyText {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Mouse, _ value: String) -> RubyText {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func aria(atomic value: Bool) -> RubyText {
        return mutate(ariaatomic: value)
    }
    
    public func aria(busy value: Bool) -> RubyText {
        return mutate(ariabusy: value)
    }
    
    public func aria(controls value: String) -> RubyText {
        return mutate(ariacontrols: value)
    }
    
    public func aria(current value: Values.Accessibility.Current) -> RubyText {
        return mutate(ariacurrent: value.rawValue)
    }
    
    public func aria(describedBy value: String) -> RubyText {
        return mutate(ariadescribedby: value)
    }
    
    public func aria(details value: String) -> RubyText {
        return mutate(ariadetails: value)
    }
    
    public func aria(disabled value: Bool) -> RubyText {
        return mutate(ariadisabled: value)
    }
    
    public func aria(errorMessage value: String) -> RubyText {
        return mutate(ariaerrormessage: value)
    }
    
    public func aria(flowTo value: String) -> RubyText {
        return mutate(ariaflowto: value)
    }
    
    public func aria(hasPopup value: Values.Accessibility.Popup) -> RubyText {
        return mutate(ariahaspopup: value.rawValue)
    }
    
    public func aria(hidden value: Bool) -> RubyText {
        return mutate(ariahidden: value)
    }
    
    public func aria(invalid value: Values.Accessibility.Invalid) -> RubyText {
        return mutate(ariainvalid: value.rawValue)
    }
    
    public func aria(keyShortcuts value: String) -> RubyText {
        return mutate(ariakeyshortcuts: value)
    }
    
    public func aria(label value: String) -> RubyText {
        return mutate(arialabel: value)
    }
    
    public func aria(labeledBy value: String) -> RubyText {
        return mutate(arialabeledby: value)
    }
    
    public func aria(live value: Values.Accessibility.Live) -> RubyText {
        return mutate(arialive: value.rawValue)
    }
    
    public func aria(owns value: String) -> RubyText {
        return mutate(ariaowns: value)
    }
    
    public func aria(relevant value: Values.Accessibility.Relevant) -> RubyText {
        return mutate(ariarelevant: value.rawValue)
    }
    
    public func aria(roleDescription value: String) -> RubyText {
        return mutate(ariaroledescription: value)
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

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [Content]
    
    /// Create a ruby pronunciation.
    ///
    /// - Parameter content: The pronunciation's content.
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [Content]) {
        self.attributes = attributes
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
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ value: Values.Capitalization) -> RubyPronunciation {
        return mutate(autocapitalize: value.rawValue)
    }

    public func autofocus() -> RubyPronunciation {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> RubyPronunciation {
        return mutate(class: value)
    }

    @available(*, deprecated, message: "Use the editable(_:) modifier instead.")
    public func isEditable(_ value: Bool) -> RubyPronunciation {
        return mutate(contenteditable: value)
    }
    
    public func editable(_ value: Bool = true) -> RubyPronunciation {
        return mutate(contenteditable: value)
    }

    public func direction(_ value: Values.Direction) -> RubyPronunciation {
        return mutate(dir: value.rawValue)
    }

    @available(*, deprecated, message: "Use the draggable(_:) modifier instead.")
    public func isDraggable(_ value: Bool) -> RubyPronunciation {
        return mutate(draggable: value)
    }
    
    public func draggable(_ value: Bool = true) -> RubyPronunciation {
        return mutate(draggable: value)
    }

    @available(*, deprecated, message: "Use the enterKey(_:) modifier instead.")
    public func enterKeyHint(_ value: Values.Hint) -> RubyPronunciation {
        return mutate(enterkeyhint: value.rawValue)
    }
    
    public func enterKey(_ value: Values.Hint) -> RubyPronunciation {
        return mutate(enterkeyhint: value.rawValue)
    }
    
    public func hidden(_ condition: Bool = true) -> RubyPronunciation {
        
        if condition {
            return mutate(hidden: "hidden")
        }
        
        return self
    }

    public func inputMode(_ value: Values.Mode) -> RubyPronunciation {
        return mutate(inputmode: value.rawValue)
    }
    
    public func `is`(_ value: String) -> RubyPronunciation {
        return mutate(is: value)
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: [String]? = nil) -> RubyPronunciation {
        return self.mutate(itemscope: "itemscope").mutate(itemid: id).mutate(itemtype: schema?.absoluteString).mutate(itemref: elements?.joined(separator: " "))
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: String...) -> RubyPronunciation {
        return self.mutate(itemscope: "itemscope").mutate(itemid: id).mutate(itemtype: schema?.absoluteString).mutate(itemref: elements.joined(separator: " "))
    }

    @available(*, deprecated, message: "Use the item(id:as:for:) modifier instead.")
    public func itemId(_ value: String) -> RubyPronunciation {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> RubyPronunciation {
        return mutate(itemprop: value)
    }

    @available(*, deprecated, message: "Use the item(id:as:for:) modifier instead.")
    public func itemReference(_ value: String) -> RubyPronunciation {
        return mutate(itemref: value)
    }

    @available(*, deprecated, message: "Use the item(id:as:for:) modifier instead.")
    public func itemScope(_ value: String) -> RubyPronunciation {
        return mutate(itemscope: value)
    }
    
    @available(*, deprecated, message: "Use the item(id:as:for:) modifier instead.")
    public func itemType(_ value: String) -> RubyPronunciation {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> RubyPronunciation {
        return mutate(id: value)
    }

    public func language(_ value: Values.Language) -> RubyPronunciation {
        return mutate(lang: value.rawValue)
    }

    public func nonce(_ value: String) -> RubyPronunciation {
        return mutate(nonce: value)
    }
    
    public func role(_ value: Values.Role) -> RubyPronunciation {
        return mutate(role: value.rawValue)
    }

    @available(*, deprecated, message: "Use the spellcheck(_:) modifier instead.")
    public func hasSpellCheck(_ value: Bool) -> RubyPronunciation {
        return mutate(spellcheck: value)
    }
    
    @available(*, deprecated, message: "Use the spellcheck(_:) modifier instead.")
    public func spellcheck(_ value: Bool = true) -> RubyPronunciation {
        return mutate(spellcheck: value)
    }

    public func style(_ value: String) -> RubyPronunciation {
        return mutate(style: TaintedString(value, as: .css(.attribute)))
    }

    public func tabIndex(_ value: Int) -> RubyPronunciation {
        return mutate(tabindex: value)
    }

    @_disfavoredOverload
    public func title(_ value: String) -> RubyPronunciation {
        return mutate(title: value)
    }
    
    public func title(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> RubyPronunciation {
        return mutate(title: LocalizedString(key: localizedKey, table: tableName))
    }
    
    public func title(verbatim value: String) -> RubyPronunciation {
        return mutate(title: value)
    }
    
    @available(*, deprecated, message: "Use the translate(_:) modifier instead.")
    public func translate(_ value: Values.Decision) -> RubyPronunciation {
        return mutate(translate: value.rawValue)
    }
    
    public func translate(_ value: Bool = true) -> RubyPronunciation {
        
        if value {
            return mutate(translate: "yes")
        }
        
        return mutate(translate: "no")
    }
    
    public func inert(_ condition: Bool = true) -> RubyPronunciation {

        if condition {
            return mutate(inert: "inert")
        }
        
        return self
    }
    
    public func popover(_ value: Values.Popover.State) -> RubyPronunciation {
        return mutate(popover: value.rawValue)
    }
    
    public func custom(key: String, value: Any) -> RubyPronunciation {
        return mutate(key: key, value: value)
    }
    
    public func on(event: Events.Drag, _ value: String) -> RubyPronunciation {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> RubyPronunciation {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Wheel, _ value: String) -> RubyPronunciation {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> RubyPronunciation {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Mouse, _ value: String) -> RubyPronunciation {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }

    public func aria(atomic value: Bool) -> RubyPronunciation {
        return mutate(ariaatomic: value)
    }
    
    public func aria(busy value: Bool) -> RubyPronunciation {
        return mutate(ariabusy: value)
    }
    
    public func aria(controls value: String) -> RubyPronunciation {
        return mutate(ariacontrols: value)
    }
    
    public func aria(current value: Values.Accessibility.Current) -> RubyPronunciation {
        return mutate(ariacurrent: value.rawValue)
    }
    
    public func aria(describedBy value: String) -> RubyPronunciation {
        return mutate(ariadescribedby: value)
    }
    
    public func aria(details value: String) -> RubyPronunciation {
        return mutate(ariadetails: value)
    }
    
    public func aria(disabled value: Bool) -> RubyPronunciation {
        return mutate(ariadisabled: value)
    }
    
    public func aria(errorMessage value: String) -> RubyPronunciation {
        return mutate(ariaerrormessage: value)
    }
    
    public func aria(flowTo value: String) -> RubyPronunciation {
        return mutate(ariaflowto: value)
    }
    
    public func aria(hasPopup value: Values.Accessibility.Popup) -> RubyPronunciation {
        return mutate(ariahaspopup: value.rawValue)
    }
    
    public func aria(hidden value: Bool) -> RubyPronunciation {
        return mutate(ariahidden: value)
    }
    
    public func aria(invalid value: Values.Accessibility.Invalid) -> RubyPronunciation {
        return mutate(ariainvalid: value.rawValue)
    }
    
    public func aria(keyShortcuts value: String) -> RubyPronunciation {
        return mutate(ariakeyshortcuts: value)
    }
    
    public func aria(label value: String) -> RubyPronunciation {
        return mutate(arialabel: value)
    }
    
    public func aria(labeledBy value: String) -> RubyPronunciation {
        return mutate(arialabeledby: value)
    }
    
    public func aria(live value: Values.Accessibility.Live) -> RubyPronunciation {
        return mutate(arialive: value.rawValue)
    }
    
    public func aria(owns value: String) -> RubyPronunciation {
        return mutate(ariaowns: value)
    }
    
    public func aria(relevant value: Values.Accessibility.Relevant) -> RubyPronunciation {
        return mutate(ariarelevant: value.rawValue)
    }
    
    public func aria(roleDescription value: String) -> RubyPronunciation {
        return mutate(ariaroledescription: value)
    }
}
