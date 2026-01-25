import Foundation
import OrderedCollections

/// The alias for the element ``ListItem``.
@_documentation(visibility: internal)
public typealias Li = ListItem

/// An element that represents a list item.
///
/// Use `ListItem` to define an entry within a ``UnorderedList`` or ``OrderedList``.
///
/// ```swift
/// UnorderedList {
///     ListItem {
///         "Lorem ipsum"
///     }
///     ListItem {
///         "Lorem ipsum"
///     }
/// }
/// ```
public struct ListItem: ContentNode, ListElement {

    internal var name: String { "li" }

    internal var attributes: OrderedDictionary<String, AttributeData>?

    internal var content: [Content]
    
    internal var context: EscapeContext
    
    /// Create a list item.
    ///
    /// - Parameter content: The item's content
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        
        self.context = .tainted(.html)
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, AttributeData>?, context: EscapeContext, content: [Content]) {
        
        self.attributes = attributes
        self.context = context
        self.content = content
    }
    
    public func modify(if condition: Bool, element: (ListItem) -> ListItem) -> ListItem {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (ListItem, T) -> ListItem) -> ListItem {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension ListItem: GlobalAttributes, GlobalEventAttributes, GlobalAriaAttributes, ValueAttribute {
    
    public func accessKey(_ value: Character) -> ListItem {
        return mutate(accesskey: .init("\(value)", context: .trusted))
    }

    public func autocapitalize(_ value: Values.Capitalization) -> ListItem {
        return mutate(autocapitalize: .init(value.rawValue, context: .trusted))
    }

    public func autofocus() -> ListItem {
        return mutate(autofocus: .init("autofocus", context: .trusted))
    }

    public func `class`(_ value: String) -> ListItem {
        return mutate(class: .init(value, context: .tainted(.html)))
    }

    @available(*, deprecated, message: "Use the editable(_:) modifier instead.")
    public func isEditable(_ value: Bool) -> ListItem {
        return mutate(contenteditable: .init(value, context: .trusted))
    }
    
    public func editable(_ value: Bool = true) -> ListItem {
        return mutate(contenteditable: .init(value, context: .trusted))
    }

    public func direction(_ value: Values.Direction) -> ListItem {
        return mutate(dir: .init(value.rawValue, context: .trusted))
    }

    @available(*, deprecated, message: "Use the draggable(_:) modifier instead.")
    public func isDraggable(_ value: Bool) -> ListItem {
        return mutate(draggable: .init(value, context: .trusted))
    }
    
    public func draggable(_ value: Bool = true) -> ListItem {
        return mutate(draggable: .init(value, context: .trusted))
    }

    @available(*, deprecated, message: "Use the enterKey(_:) modifier instead.")
    public func enterKeyHint(_ value: Values.Hint) -> ListItem {
        return mutate(enterkeyhint: .init(value.rawValue, context: .trusted))
    }
    
    public func enterKey(_ value: Values.Hint) -> ListItem {
        return mutate(enterkeyhint: .init(value.rawValue, context: .trusted))
    }
    
    public func hidden(_ condition: Bool = true) -> ListItem {
        
        if condition {
            return mutate(hidden: .init("hidden", context: .trusted))
        }
        
        return self
    }

    public func inputMode(_ value: Values.Mode) -> ListItem {
        return mutate(inputmode: .init(value.rawValue, context: .trusted))
    }
    
    public func `is`(_ value: String) -> ListItem {
        return mutate(is: .init(value, context: .tainted(.html)))
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: [String]? = nil) -> ListItem {

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
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: String...) -> ListItem {

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
    public func itemId(_ value: String) -> ListItem {
        return mutate(itemid: .init(value, context: .tainted(.html)))
    }

    public func itemProperty(_ value: String) -> ListItem {
        return mutate(itemprop: .init(value, context: .tainted(.html)))
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemReference(_ value: String) -> ListItem {
        return mutate(itemref: .init(value, context: .tainted(.html)))
    }

    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemScope(_ value: String) -> ListItem {
        return mutate(itemscope: .init(value, context: .tainted(.html)))
    }
    
    @available(*, unavailable, message: "Use the item(id:as:for:) modifier instead.")
    public func itemType(_ value: String) -> ListItem {
        return mutate(itemtype: .init(value, context: .tainted(.html)))
    }

    public func id(_ value: String) -> ListItem {
        return mutate(id: .init(value, context: .tainted(.html)))
    }

    public func language(_ value: Values.Language) -> ListItem {
        return mutate(lang: .init(value.rawValue, context: .trusted))
    }

    public func nonce(_ value: String) -> ListItem {
        return mutate(nonce: .init(value, context: .tainted(.html)))
    }

    public func role(_ value: Values.Role) -> ListItem {
        return mutate(role: .init(value.rawValue, context: .trusted))
    }
    
    @available(*, deprecated, message: "Use the spellcheck(_:) modifier instead.")
    public func hasSpellCheck(_ value: Bool) -> ListItem {
        return mutate(spellcheck: .init(value, context: .trusted))
    }
    
    public func spellcheck(_ value: Bool = true) -> ListItem {
        return mutate(spellcheck: .init(value, context: .trusted))
    }

    public func style(_ value: String) -> ListItem {
        return mutate(style: .init(value, context: .tainted(.css)))
    }

    public func tabIndex(_ value: Int) -> ListItem {
        return mutate(tabindex: .init(value, context: .trusted))
    }

    @_disfavoredOverload
    public func title(_ value: String) -> ListItem {
        return mutate(title: .init(value, context: .tainted(.html)))
    }
    
    public func title(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> ListItem {
        return mutate(title: .init(LocalizedString(key: localizedKey, table: tableName), context: .tainted(.html)))
    }
    
    public func title(verbatim value: String) -> ListItem {
        return mutate(title: .init(value, context: .tainted(.html)))
    }
    
    @available(*, deprecated, message: "Use the translate(_:) modifier instead.")
    public func translate(_ value: Values.Decision) -> ListItem {
        return mutate(translate: .init(value.rawValue, context: .trusted))
    }
    
    public func translate(_ value: Bool = true) -> ListItem {
        
        if value {
            return mutate(translate: .init("yes", context: .trusted))
        }
        
        return mutate(translate: .init("no", context: .trusted))
    }
    
    public func inert(_ condition: Bool = true) -> ListItem {

        if condition {
            return mutate(inert: .init("inert", context: .trusted))
        }
        
        return self
    }
    
    @_disfavoredOverload
    public func value(_ value: String) -> ListItem {
        return mutate(value: .init(value, context: .tainted(.html)))
    }
    
    public func value(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> ListItem {
        return mutate(value: .init(LocalizedString(key: localizedKey, table: tableName), context: .tainted(.html)))
    }
    
    public func value(verbatim value: String) -> ListItem {
        return mutate(value: .init(value, context: .tainted(.html)))
    }
    
    public func popover(_ value: Values.Popover.State) -> ListItem {
        return mutate(popover: .init(value.rawValue, context: .trusted))
    }
    
    public func custom(key: String, value: String, context: EscapeContext = .tainted(.html)) -> ListItem {
        return mutate(key: key, value: .init(value, context: context))
    }
    
    public func custom(key: String, value: Int) -> ListItem {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Double) -> ListItem {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Bool) -> ListItem {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Float) -> ListItem {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: EnvironmentValue, context: EscapeContext = .tainted(.html)) -> ListItem {
        return mutate(key: key, value: .init(value, context: context))
    }
    
    public func on(event: Events.Drag, _ value: String) -> ListItem {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> ListItem {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func on(event: Events.Wheel, _ value: String) -> ListItem {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> ListItem {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func on(event: Events.Mouse, _ value: String) -> ListItem {
        return mutate(key: event.rawValue, value: .init(value, context: .tainted(.js)))
    }
    
    public func aria(atomic value: Bool) -> ListItem {
        return mutate(ariaatomic: .init(value, context: .trusted))
    }
    
    public func aria(busy value: Bool) -> ListItem {
        return mutate(ariabusy: .init(value, context: .trusted))
    }
    
    public func aria(controls value: String) -> ListItem {
        return mutate(ariacontrols: .init(value, context: .tainted(.html)))
    }
    
    public func aria(current value: Values.Accessibility.Current) -> ListItem {
        return mutate(ariacurrent: .init(value.rawValue, context: .trusted))
    }
    
    public func aria(describedBy value: String) -> ListItem {
        return mutate(ariadescribedby: .init(value, context: .tainted(.html)))
    }
    
    public func aria(details value: String) -> ListItem {
        return mutate(ariadetails: .init(value, context: .tainted(.html)))
    }
    
    public func aria(disabled value: Bool) -> ListItem {
        return mutate(ariadisabled: .init(value, context: .trusted))
    }
    
    public func aria(errorMessage value: String) -> ListItem {
        return mutate(ariaerrormessage: .init(value, context: .tainted(.html)))
    }
    
    public func aria(flowTo value: String) -> ListItem {
        return mutate(ariaflowto: .init(value, context: .tainted(.html)))
    }
    
    public func aria(hasPopup value: Values.Accessibility.Popup) -> ListItem {
        return mutate(ariahaspopup: .init(value.rawValue, context: .trusted))
    }
    
    public func aria(hidden value: Bool) -> ListItem {
        return mutate(ariahidden: .init(value, context: .trusted))
    }
    
    public func aria(invalid value: Values.Accessibility.Invalid) -> ListItem {
        return mutate(ariainvalid: .init(value.rawValue, context: .trusted))
    }
    
    public func aria(keyShortcuts value: String) -> ListItem {
        return mutate(ariakeyshortcuts: .init(value, context: .tainted(.html)))
    }
    
    public func aria(label value: String) -> ListItem {
        return mutate(arialabel: .init(value, context: .tainted(.html)))
    }
    
    public func aria(labeledBy value: String) -> ListItem {
        return mutate(arialabeledby: .init(value, context: .tainted(.html)))
    }
    
    public func aria(live value: Values.Accessibility.Live) -> ListItem {
        return mutate(arialive: .init(value.rawValue, context: .trusted))
    }
    
    public func aria(owns value: String) -> ListItem {
        return mutate(ariaowns: .init(value, context: .tainted(.html)))
    }
    
    public func aria(relevant value: Values.Accessibility.Relevant) -> ListItem {
        return mutate(ariarelevant: .init(value.rawValue, context: .trusted))
    }
    
    public func aria(roleDescription value: String) -> ListItem {
        return mutate(ariaroledescription: .init(value, context: .tainted(.html)))
    }
}
