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

    internal var attributes: OrderedDictionary<String, AttributeData>?

    internal var content: [HeadElement]
    
    internal var context: EscapeContext
    
    /// Create a head.
    ///
    /// - Parameter content: The head's content.
    public init(@ContentBuilder<HeadElement> content: () -> [HeadElement]) {
        
        self.context = .trusted
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, AttributeData>?, context: EscapeContext, content: [HeadElement]) {
        
        self.attributes = attributes
        self.context = context
        self.content = content
    }
    
    public func modify(if condition: Bool, use strategy: MergeStrategy = .replacing, element: (Head) -> Head) -> Head {
        
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
    
    public func modify<T>(unwrap value: T?, use strategy: MergeStrategy = .replacing, element: (Head, T) -> Head) -> Head {
        
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

extension Head: GlobalAttributes, GlobalEventAttributes {
    
    public func accessKey(_ value: Character) -> Head {
        return mutate(accesskey: .init("\(value)", context: .trusted))
    }
    
    public func autocapitalize(_ value: Values.Capitalization) -> Head {
        return mutate(autocapitalize: .init(value.rawValue, context: .trusted))
    }
    
    public func autofocus() -> Head {
        return mutate(autofocus: .init("autofocus", context: .trusted))
    }
    
    public func `class`(_ names: [String]) -> Head {
        return mutate(class: .init(EnumeratedList(values: names, separator: " "), context: .tainted(.html)))
    }
    
    public func `class`(_ names: String...) -> Head {
        return mutate(class: .init(EnumeratedList(values: names, separator: " "), context: .tainted(.html)))
    }
    
    @available(*, deprecated, message: "Use the editable(_:) modifier instead.")
    public func isEditable(_ value: Bool) -> Head {
        return mutate(contenteditable: .init(value, context: .trusted))
    }
    
    public func editable(_ value: Bool = true) -> Head {
        return mutate(contenteditable: .init(value, context: .trusted))
    }
    
    public func direction(_ value: Values.Direction) -> Head {
        return mutate(dir: .init(value.rawValue, context: .trusted))
    }
    
    @available(*, deprecated, message: "Use the draggable(_:) modifier instead.")
    public func isDraggable(_ value: Bool) -> Head {
        return mutate(draggable: .init(value, context: .trusted))
    }
    
    public func draggable(_ value: Bool = true) -> Head {
        return mutate(draggable: .init(value, context: .trusted))
    }
    
    @available(*, deprecated, message: "Use the enterKey(_:) modifier instead.")
    public func enterKeyHint(_ value: Values.Hint) -> Head {
        return mutate(enterkeyhint: .init(value.rawValue, context: .trusted))
    }
    
    public func enterKey(_ value: Values.Hint) -> Head {
        return mutate(enterkeyhint: .init(value.rawValue, context: .trusted))
    }
    
    public func hidden(_ condition: Bool = true) -> Head {
        
        if condition {
            return mutate(hidden: .init("hidden", context: .trusted))
        }
        
        return self
    }
    
    public func inputMode(_ value: Values.Mode) -> Head {
        return mutate(inputmode: .init(value.rawValue, context: .trusted))
    }
    
    public func `is`(_ value: String) -> Head {
        return mutate(is: .init(value, context: .tainted(.html)))
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: [String]? = nil) -> Head {

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
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: String...) -> Head {
        
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
    public func itemId(_ value: String) -> Head {
        return mutate(itemid: .init(value, context: .tainted(.html)))
    }
    
    public func itemProperty(_ value: String) -> Head {
        return mutate(itemprop: .init(value, context: .tainted(.html)))
    }
    
    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemReference(_ value: String) -> Head {
        return mutate(itemref: .init(value, context: .tainted(.html)))
    }
    
    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemScope(_ value: String) -> Head {
        return mutate(itemscope: .init(value, context: .tainted(.html)))
    }
    
    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemType(_ value: String) -> Head {
        return mutate(itemtype: .init(value, context: .tainted(.html)))
    }
    
    public func id(_ value: String) -> Head {
        return mutate(id: .init(value, context: .tainted(.html)))
    }
    
    public func language(_ value: Values.Language) -> Head {
        return mutate(lang: .init(value.rawValue, context: .trusted))
    }
    
    public func nonce(_ value: String) -> Head {
        return mutate(nonce: .init(value, context: .tainted(.html)))
    }
    
    public func role(_ value: Values.Role) -> Head {
        return mutate(role: .init(value.rawValue, context: .trusted))
    }
    
    @available(*, deprecated, message: "Use the spellcheck(_:) modifier instead.")
    public func hasSpellCheck(_ value: Bool) -> Head {
        return mutate(spellcheck: .init(value, context: .trusted))
    }
    
    public func spellcheck(_ value: Bool = true) -> Head {
        return mutate(spellcheck: .init(value, context: .trusted))
    }
    
    public func style(_ value: String) -> Head {
        return mutate(style: .init(value, context: .tainted(.css)))
    }
    
    public func tabIndex(_ value: Int) -> Head {
        return mutate(tabindex: .init(value, context: .trusted))
    }
    
    @_disfavoredOverload
    public func title(_ value: String) -> Head {
        return mutate(title: .init(value, context: .tainted(.html)))
    }
    
    public func title(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> Head {
        return mutate(title: .init(LocalizedString(key: localizedKey, table: tableName), context: .tainted(.html)))
    }
    
    public func title(verbatim value: String) -> Head {
        return mutate(title: .init(value, context: .tainted(.html)))
    }
    
    @available(*, deprecated, message: "Use the translate(_:) modifier instead.")
    public func translate(_ value: Values.Decision) -> Head {
        return mutate(translate: .init(value.rawValue, context: .trusted))
    }
    
    public func translate(_ value: Bool = true) -> Head {
        
        if value {
            return mutate(translate: .init("yes", context: .trusted))
        }
        
        return mutate(translate: .init("no", context: .trusted))
    }
    
    public func inert(_ condition: Bool = true) -> Head {

        if condition {
            return mutate(inert: .init("inert", context: .trusted))
        }
        
        return self
    }
    
    public func popover(_ value: Values.Popover.State) -> Head {
        return mutate(popover: .init(value.rawValue, context: .trusted))
    }
    
    public func custom(key: String, value: String, context: EscapeContext = .tainted(.html)) -> Head {
        return mutate(key: key, value: .init(value, context: context))
    }
    
    public func custom(key: String, value: Int) -> Head {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Double) -> Head {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Bool) -> Head {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Float) -> Head {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: EnvironmentValue, context: EscapeContext = .tainted(.html)) -> Head {
        return mutate(key: key, value: .init(value, context: context))
    }
    
    public func on(event: Events.Drag, _ value: String) -> Head {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> Head {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func on(event: Events.Wheel, _ value: String) -> Head {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> Head {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func on(event: Events.Mouse, _ value: String) -> Head {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
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

    internal var attributes: OrderedDictionary<String, AttributeData>?

    internal var content: [BodyElement]
    
    internal var context: EscapeContext

    /// Create a body.
    ///
    /// - Parameter content: The body's content.
    public init(@ContentBuilder<BodyElement> content: () -> [BodyElement]) {
        
        self.context = .trusted
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, AttributeData>?, context: EscapeContext, content: [BodyElement]) {
        
        self.attributes = attributes
        self.context = context
        self.content = content
    }
    
    public func modify(if condition: Bool, use strategy: MergeStrategy = .replacing, element: (Body) -> Body) -> Body {
        
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
    
    public func modify<T>(unwrap value: T?, use strategy: MergeStrategy = .replacing, element: (Body, T) -> Body) -> Body {
        
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

extension Body: GlobalAttributes, GlobalEventAttributes, GlobalAriaAttributes, WindowEventAttribute {

    public func accessKey(_ value: Character) -> Body {
        return mutate(accesskey: .init("\(value)", context: .trusted))
    }

    public func autocapitalize(_ value: Values.Capitalization) -> Body {
        return mutate(autocapitalize: .init(value.rawValue, context: .trusted))
    }

    public func autofocus() -> Body {
        return mutate(autofocus: .init("autofocus", context: .trusted))
    }

    public func `class`(_ names: [String]) -> Body {
        return mutate(class: .init(EnumeratedList(values: names, separator: " "), context: .tainted(.html)))
    }
    
    public func `class`(_ names: String...) -> Body {
        return mutate(class: .init(EnumeratedList(values: names, separator: " "), context: .tainted(.html)))
    }

    @available(*, deprecated, message: "Use the editable(_:) modifier instead.")
    public func isEditable(_ value: Bool) -> Body {
        return mutate(contenteditable: .init(value, context: .trusted))
    }
    
    public func editable(_ value: Bool = true) -> Body {
        return mutate(contenteditable: .init(value, context: .trusted))
    }

    public func direction(_ value: Values.Direction) -> Body {
        return mutate(dir: .init(value.rawValue, context: .trusted))
    }

    @available(*, deprecated, message: "Use the draggable(_:) modifier instead.")
    public func isDraggable(_ value: Bool) -> Body {
        return mutate(draggable: .init(value, context: .trusted))
    }
    
    public func draggable(_ value: Bool = true) -> Body {
        return mutate(draggable: .init(value, context: .trusted))
    }

    @available(*, deprecated, message: "Use the enterKey(_:) modifier instead.")
    public func enterKeyHint(_ value: Values.Hint) -> Body {
        return mutate(enterkeyhint: .init(value.rawValue, context: .trusted))
    }
    
    public func enterKey(_ value: Values.Hint) -> Body {
        return mutate(enterkeyhint: .init(value.rawValue, context: .trusted))
    }
    
    public func hidden(_ condition: Bool = true) -> Body {
        
        if condition {
            return mutate(hidden: .init("hidden", context: .trusted))
        }
        
        return self
    }
    
    public func inputMode(_ value: Values.Mode) -> Body {
        return mutate(inputmode: .init(value.rawValue, context: .trusted))
    }

    public func `is`(_ value: String) -> Body {
        return mutate(is: .init(value, context: .tainted(.html)))
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: [String]? = nil) -> Body {

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
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: String...) -> Body {
        
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
    public func itemId(_ value: String) -> Body {
        return mutate(itemid: .init(value, context: .tainted(.html)))
    }

    public func itemProperty(_ value: String) -> Body {
        return mutate(itemprop: .init(value, context: .tainted(.html)))
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemReference(_ value: String) -> Body {
        return mutate(itemref: .init(value, context: .tainted(.html)))
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemScope(_ value: String) -> Body {
        return mutate(itemscope: .init(value, context: .tainted(.html)))
    }
    
    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemType(_ value: String) -> Body {
        return mutate(itemtype: .init(value, context: .tainted(.html)))
    }

    public func id(_ value: String) -> Body {
        return mutate(id: .init(value, context: .tainted(.html)))
    }

    public func language(_ value: Values.Language) -> Body {
        return mutate(lang: .init(value.rawValue, context: .trusted))
    }

    public func nonce(_ value: String) -> Body {
        return mutate(nonce: .init(value, context: .tainted(.html)))
    }
    
    public func role(_ value: Values.Role) -> Body {
        return mutate(role: .init(value.rawValue, context: .trusted))
    }

    @available(*, deprecated, message: "Use the spellcheck(_:) modifier instead.")
    public func hasSpellCheck(_ value: Bool) -> Body {
        return mutate(spellcheck: .init(value, context: .trusted))
    }
    
    public func spellcheck(_ value: Bool = true) -> Body {
        return mutate(spellcheck: .init(value, context: .trusted))
    }

    public func style(_ value: String) -> Body {
        return mutate(style: .init(value, context: .tainted(.css)))
    }

    public func tabIndex(_ value: Int) -> Body {
        return mutate(tabindex: .init(value, context: .trusted))
    }

    @_disfavoredOverload
    public func title(_ value: String) -> Body {
        return mutate(title: .init(value, context: .tainted(.html)))
    }
    
    public func title(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> Body {
        return mutate(title: .init(LocalizedString(key: localizedKey, table: tableName), context: .tainted(.html)))
    }
    
    public func title(verbatim value: String) -> Body {
        return mutate(title: .init(value, context: .tainted(.html)))
    }
    
    @available(*, deprecated, message: "Use the translate(_:) modifier instead.")
    public func translate(_ value: Values.Decision) -> Body {
        return mutate(translate: .init(value.rawValue, context: .trusted))
    }
    
    public func translate(_ value: Bool = true) -> Body {
        
        if value {
            return mutate(translate: .init("yes", context: .trusted))
        }
        
        return mutate(translate: .init("no", context: .trusted))
    }

    public func inert(_ condition: Bool = true) -> Body {

        if condition {
            return mutate(inert: .init("inert", context: .trusted))
        }
        
        return self
    }
    
    public func popover(_ value: Values.Popover.State) -> Body {
        return mutate(popover: .init(value.rawValue, context: .trusted))
    }
    
    public func custom(key: String, value: String, context: EscapeContext = .tainted(.html)) -> Body {
        return mutate(key: key, value: .init(value, context: context))
    }
    
    public func custom(key: String, value: Int) -> Body {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Double) -> Body {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Bool) -> Body {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Float) -> Body {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: EnvironmentValue, context: EscapeContext = .tainted(.html)) -> Body {
        return mutate(key: key, value: .init(value, context: context))
    }
    
    public func on(event: Events.Drag, _ value: String) -> Body {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> Body {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func on(event: Events.Window, _ value: String) -> Body {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> Body {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func on(event: Events.Mouse, _ value: String) -> Body {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }

    public func on(event: Events.Wheel, _ value: String) -> Body {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func aria(atomic value: Bool) -> Body {
        return mutate(ariaatomic: .init(value, context: .trusted))
    }
    
    public func aria(busy value: Bool) -> Body {
        return mutate(ariabusy: .init(value, context: .trusted))
    }
    
    public func aria(controls value: String) -> Body {
        return mutate(ariacontrols: .init(value, context: .tainted(.html)))
    }
    
    public func aria(current value: Values.Accessibility.Current) -> Body {
        return mutate(ariacurrent: .init(value.rawValue, context: .trusted))
    }
    
    public func aria(describedBy value: String) -> Body {
        return mutate(ariadescribedby: .init(value, context: .tainted(.html)))
    }
    
    public func aria(details value: String) -> Body {
        return mutate(ariadetails: .init(value, context: .tainted(.html)))
    }
    
    public func aria(disabled value: Bool) -> Body {
        return mutate(ariadisabled: .init(value, context: .trusted))
    }
    
    public func aria(errorMessage value: String) -> Body {
        return mutate(ariaerrormessage: .init(value, context: .tainted(.html)))
    }
    
    @available(*, deprecated, message: "Use the accessibilityFlowTo(_:) modifier instead.")
    public func aria(flowTo value: String) -> Body {
        return mutate(ariaflowto: .init(value, context: .tainted(.html)))
    }
    
    public func accessibilityFlowTo(_ ids: [String]) -> Body {
        return mutate(ariaflowto: .init(EnumeratedList(values: ids, separator: " "), context: .tainted(.html)))
    }
    
    public func accessibilityFlowTo(_ ids: String...) -> Body {
        return mutate(ariaflowto: .init(EnumeratedList(values: ids, separator: " "), context: .tainted(.html)))
    }
    
    public func aria(hasPopup value: Values.Accessibility.Popup) -> Body {
        return mutate(ariahaspopup: .init(value.rawValue, context: .trusted))
    }
    
    @available(*, deprecated, message: "Use the accessibilityHidden(_:) modifier instead.")
    public func aria(hidden value: Bool) -> Body {
        return mutate(ariahidden: .init(value, context: .trusted))
    }
    
    public func accessibilityHidden(_ value: Bool = true) -> Body {
        return mutate(ariahidden: .init(value, context: .trusted))
    }
    
    public func aria(invalid value: Values.Accessibility.Invalid) -> Body {
        return mutate(ariainvalid: .init(value.rawValue, context: .trusted))
    }
    
    public func aria(keyShortcuts value: String) -> Body {
        return mutate(ariakeyshortcuts: .init(value, context: .tainted(.html)))
    }
    
    @available(*, deprecated, message: "Use the accessibilityLabel(_:) modifier instead.")
    public func aria(label value: String) -> Body {
        return mutate(arialabel: .init(value, context: .tainted(.html)))
    }
    
    public func accessibilityLabel(_ value: String) -> Body {
        return mutate(arialabel: .init(value, context: .tainted(.html)))
    }
    
    public func accessibilityLabel(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> Body {
        return mutate(arialabel: .init(LocalizedString(key: localizedKey, table: tableName), context: .tainted(.html)))
    }
    
    public func accessibilityLabel(verbatim value: String) -> Body {
        return mutate(arialabel: .init(value, context: .tainted(.html)))
    }
    
    public func aria(labeledBy value: String) -> Body {
        return mutate(arialabeledby: .init(value, context: .tainted(.html)))
    }
    
    @available(*, deprecated, message: "Use the accessibilityLive(_:) modifier instead.")
    public func aria(live value: Values.Accessibility.Live) -> Body {
        return mutate(arialive: .init(value.rawValue, context: .trusted))
    }
    
    public func accessibilityLive(_ value: Values.Accessibility.Live) -> Body {
        return mutate(arialive: .init(value.rawValue, context: .trusted))
    }
    
    public func aria(owns value: String) -> Body {
        return mutate(ariaowns: .init(value, context: .tainted(.html)))
    }
    
    public func aria(relevant value: Values.Accessibility.Relevant) -> Body {
        return mutate(ariarelevant: .init(value.rawValue, context: .trusted))
    }
    
    public func aria(roleDescription value: String) -> Body {
        return mutate(ariaroledescription: .init(value, context: .tainted(.html)))
    }
}
