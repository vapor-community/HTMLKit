import Foundation
import OrderedCollections

/// An element that represents the document head.
///
/// ```swift
/// Head {
///     Title {
///         "Lorem ipsum"
///     }
/// }
/// ```
public struct Head: ContentNode, HtmlElement {

    internal var name: String { "head" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [HeadElement]
    
    /// Create a head.
    ///
    /// - Parameter content: The head's content.
    public init(@ContentBuilder<HeadElement> content: () -> [HeadElement]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [HeadElement]) {
        self.attributes = attributes
        self.content = content
    }
    
    public func modify(if condition: Bool, element: (Head) -> Head) -> Head {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (Head, T) -> Head) -> Head {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension Head: GlobalAttributes, GlobalEventAttributes {
    
    public func accessKey(_ value: Character) -> Head {
        return mutate(accesskey: value)
    }
    
    public func autocapitalize(_ value: Values.Capitalization) -> Head {
        return mutate(autocapitalize: value.rawValue)
    }
    
    public func autofocus() -> Head {
        return mutate(autofocus: "autofocus")
    }
    
    public func `class`(_ value: String) -> Head {
        return mutate(class: value)
    }
    
    public func isEditable(_ value: Bool) -> Head {
        return mutate(contenteditable: value)
    }
    
    public func direction(_ value: Values.Direction) -> Head {
        return mutate(dir: value.rawValue)
    }
    
    public func isDraggable(_ value: Bool) -> Head {
        return mutate(draggable: value)
    }
    
    public func enterKeyHint(_ value: Values.Hint) -> Head {
        return mutate(enterkeyhint: value.rawValue)
    }
    
    public func hidden() -> Head {
        return mutate(hidden: "hidden")
    }
    
    public func hidden(_ condition: Bool) -> Head {
        
        if condition {
            return mutate(hidden: "hidden")
        }
        
        return self
    }
    
    @available(*, deprecated, message: "The inputmode attribute is actually an enumerated attribute. Use the inputMode(_: Mode) modifier instead.")
    public func inputMode(_ value: String) -> Head {
        return mutate(inputmode: value)
    }
    
    public func inputMode(_ value: Values.Mode) -> Head {
        return mutate(inputmode: value.rawValue)
    }
    
    public func `is`(_ value: String) -> Head {
        return mutate(is: value)
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: [String]? = nil) -> Head {
        return self.mutate(itemscope: "itemscope").mutate(itemid: id).mutate(itemtype: schema?.absoluteString).mutate(itemref: elements?.joined(separator:  " "))
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: String...) -> Head {
        return self.mutate(itemscope: "itemscope").mutate(itemid: id).mutate(itemtype: schema?.absoluteString).mutate(itemref: elements.joined(separator:  " "))
    }
    
    @available(*, deprecated, message: "Use the item(id:as:for:) modifier instead.")
    public func itemId(_ value: String) -> Head {
        return mutate(itemid: value)
    }
    
    public func itemProperty(_ value: String) -> Head {
        return mutate(itemprop: value)
    }
    
    @available(*, deprecated, message: "Use the item(id:as:for:) modifier instead.")
    public func itemReference(_ value: String) -> Head {
        return mutate(itemref: value)
    }
    
    @available(*, deprecated, message: "Use the item(id:as:for:) modifier instead.")
    public func itemScope(_ value: String) -> Head {
        return mutate(itemscope: value)
    }
    
    @available(*, deprecated, message: "Use the item(id:as:for:) modifier instead.")
    public func itemType(_ value: String) -> Head {
        return mutate(itemtype: value)
    }
    
    public func id(_ value: String) -> Head {
        return mutate(id: value)
    }
    
    public func language(_ value: Values.Language) -> Head {
        return mutate(lang: value.rawValue)
    }
    
    public func nonce(_ value: String) -> Head {
        return mutate(nonce: value)
    }
    
    public func role(_ value: Values.Role) -> Head {
        return mutate(role: value.rawValue)
    }
    
    public func hasSpellCheck(_ value: Bool) -> Head {
        return mutate(spellcheck: value)
    }
    
    public func style(_ value: String) -> Head {
        return mutate(style: value)
    }
    
    public func tabIndex(_ value: Int) -> Head {
        return mutate(tabindex: value)
    }
    
    @_disfavoredOverload
    public func title(_ value: String) -> Head {
        return mutate(title: value)
    }
    
    public func title(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> Head {
        return mutate(title: LocalizedString(key: localizedKey, table: tableName))
    }
    
    public func title(verbatim value: String) -> Head {
        return mutate(title: value)
    }
    
    public func translate(_ value: Values.Decision) -> Head {
        return mutate(translate: value.rawValue)
    }
    
    public func inert() -> Head {
        return mutate(inert: "inert")
    }
    
    public func inert(_ condition: Bool) -> Head {

        if condition {
            return mutate(inert: "inert")
        }
        
        return self
    }
    
    public func popover(_ value: Values.Popover.State) -> Head {
        return mutate(popover: value.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Head {
        return mutate(key: key, value: value)
    }
    
    public func on(event: Events.Drag, _ value: String) -> Head {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> Head {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Wheel, _ value: String) -> Head {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> Head {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Mouse, _ value: String) -> Head {
        return mutate(key: event.rawValue, value: value)
    }
}

/// An element that represents the document body.
///
/// ```swift
/// Html {
///     Head {
///         ...
///     }
///     Body {
///         Heading1 {
///             "Lorem ipsum..."
///         }
///     }
/// }
/// ```
public struct Body: ContentNode, HtmlElement {

    internal var name: String { "body" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [BodyElement]

    /// Create a body.
    ///
    /// - Parameter content: The body's content.
    public init(@ContentBuilder<BodyElement> content: () -> [BodyElement]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [BodyElement]) {
        self.attributes = attributes
        self.content = content
    }
    
    public func modify(if condition: Bool, element: (Body) -> Body) -> Body {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (Body, T) -> Body) -> Body {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension Body: GlobalAttributes, GlobalEventAttributes, GlobalAriaAttributes, WindowEventAttribute {

    public func accessKey(_ value: Character) -> Body {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ value: Values.Capitalization) -> Body {
        return mutate(autocapitalize: value.rawValue)
    }

    public func autofocus() -> Body {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Body {
        return mutate(class: value)
    }

    public func isEditable(_ value: Bool) -> Body {
        return mutate(contenteditable: value)
    }

    public func direction(_ value: Values.Direction) -> Body {
        return mutate(dir: value.rawValue)
    }

    public func isDraggable(_ value: Bool) -> Body {
        return mutate(draggable: value)
    }

    public func enterKeyHint(_ value: Values.Hint) -> Body {
        return mutate(enterkeyhint: value.rawValue)
    }

    public func hidden() -> Body {
        return mutate(hidden: "hidden")
    }
    
    public func hidden(_ condition: Bool) -> Body {
        
        if condition {
            return mutate(hidden: "hidden")
        }
        
        return self
    }

    @available(*, deprecated, message: "The inputmode attribute is actually an enumerated attribute. Use the inputMode(_: Mode) modifier instead.")
    public func inputMode(_ value: String) -> Body {
        return mutate(inputmode: value)
    }
    
    public func inputMode(_ value: Values.Mode) -> Body {
        return mutate(inputmode: value.rawValue)
    }

    public func `is`(_ value: String) -> Body {
        return mutate(is: value)
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: [String]? = nil) -> Body {
        return self.mutate(itemscope: "itemscope").mutate(itemid: id).mutate(itemtype: schema?.absoluteString).mutate(itemref: elements?.joined(separator: " "))
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: String...) -> Body {
        return self.mutate(itemscope: "itemscope").mutate(itemid: id).mutate(itemtype: schema?.absoluteString).mutate(itemref: elements.joined(separator: " "))
    }

    @available(*, deprecated, message: "Use the item(id:as:for:) modifier instead.")
    public func itemId(_ value: String) -> Body {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Body {
        return mutate(itemprop: value)
    }

    @available(*, deprecated, message: "Use the item(id:as:for:) modifier instead.")
    public func itemReference(_ value: String) -> Body {
        return mutate(itemref: value)
    }

    @available(*, deprecated, message: "Use the item(id:as:for:) modifier instead.")
    public func itemScope(_ value: String) -> Body {
        return mutate(itemscope: value)
    }
    
    @available(*, deprecated, message: "Use the item(id:as:for:) modifier instead.")
    public func itemType(_ value: String) -> Body {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Body {
        return mutate(id: value)
    }

    public func language(_ value: Values.Language) -> Body {
        return mutate(lang: value.rawValue)
    }

    public func nonce(_ value: String) -> Body {
        return mutate(nonce: value)
    }
    
    public func role(_ value: Values.Role) -> Body {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ value: Bool) -> Body {
        return mutate(spellcheck: value)
    }

    public func style(_ value: String) -> Body {
        return mutate(style: value)
    }

    public func tabIndex(_ value: Int) -> Body {
        return mutate(tabindex: value)
    }

    @_disfavoredOverload
    public func title(_ value: String) -> Body {
        return mutate(title: value)
    }
    
    public func title(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> Body {
        return mutate(title: LocalizedString(key: localizedKey, table: tableName))
    }
    
    public func title(verbatim value: String) -> Body {
        return mutate(title: value)
    }
    
    public func translate(_ value: Values.Decision) -> Body {
        return mutate(translate: value.rawValue)
    }
    
    public func inert() -> Body {
        return mutate(inert: "inert")
    }
    
    public func inert(_ condition: Bool) -> Body {

        if condition {
            return mutate(inert: "inert")
        }
        
        return self
    }
    
    public func popover(_ value: Values.Popover.State) -> Body {
        return mutate(popover: value.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Body {
        return mutate(key: key, value: value)
    }
    
    public func on(event: Events.Drag, _ value: String) -> Body {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> Body {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Window, _ value: String) -> Body {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> Body {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Mouse, _ value: String) -> Body {
        return mutate(key: event.rawValue, value: value)
    }

    public func on(event: Events.Wheel, _ value: String) -> Body {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func aria(atomic value: Bool) -> Body {
        return mutate(ariaatomic: value)
    }
    
    public func aria(busy value: Bool) -> Body {
        return mutate(ariabusy: value)
    }
    
    public func aria(controls value: String) -> Body {
        return mutate(ariacontrols: value)
    }
    
    public func aria(current value: Values.Accessibility.Current) -> Body {
        return mutate(ariacurrent: value.rawValue)
    }
    
    public func aria(describedBy value: String) -> Body {
        return mutate(ariadescribedby: value)
    }
    
    public func aria(details value: String) -> Body {
        return mutate(ariadetails: value)
    }
    
    public func aria(disabled value: Bool) -> Body {
        return mutate(ariadisabled: value)
    }
    
    public func aria(errorMessage value: String) -> Body {
        return mutate(ariaerrormessage: value)
    }
    
    public func aria(flowTo value: String) -> Body {
        return mutate(ariaflowto: value)
    }
    
    public func aria(hasPopup value: Values.Accessibility.Popup) -> Body {
        return mutate(ariahaspopup: value.rawValue)
    }
    
    public func aria(hidden value: Bool) -> Body {
        return mutate(ariahidden: value)
    }
    
    public func aria(invalid value: Values.Accessibility.Invalid) -> Body {
        return mutate(ariainvalid: value.rawValue)
    }
    
    public func aria(keyShortcuts value: String) -> Body {
        return mutate(ariakeyshortcuts: value)
    }
    
    public func aria(label value: String) -> Body {
        return mutate(arialabel: value)
    }
    
    public func aria(labeledBy value: String) -> Body {
        return mutate(arialabeledby: value)
    }
    
    public func aria(live value: Values.Accessibility.Live) -> Body {
        return mutate(arialive: value.rawValue)
    }
    
    public func aria(owns value: String) -> Body {
        return mutate(ariaowns: value)
    }
    
    public func aria(relevant value: Values.Accessibility.Relevant) -> Body {
        return mutate(ariarelevant: value.rawValue)
    }
    
    public func aria(roleDescription value: String) -> Body {
        return mutate(ariaroledescription: value)
    }
}
