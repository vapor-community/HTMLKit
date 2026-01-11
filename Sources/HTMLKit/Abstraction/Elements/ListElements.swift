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

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [Content]
    
    /// Create a list item.
    ///
    /// - Parameter content: The item's content
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [Content]) {
        self.attributes = attributes
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
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ value: Values.Capitalization) -> ListItem {
        return mutate(autocapitalize: value.rawValue)
    }

    public func autofocus() -> ListItem {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> ListItem {
        return mutate(class: value)
    }

    @available(*, deprecated, message: "Use the editable(_:) modifier instead.")
    public func isEditable(_ value: Bool) -> ListItem {
        return mutate(contenteditable: value)
    }
    
    public func editable(_ value: Bool = true) -> ListItem {
        return mutate(contenteditable: value)
    }

    public func direction(_ value: Values.Direction) -> ListItem {
        return mutate(dir: value.rawValue)
    }

    @available(*, deprecated, message: "Use the draggable(_:) modifier instead.")
    public func isDraggable(_ value: Bool) -> ListItem {
        return mutate(draggable: value)
    }
    
    public func draggable(_ value: Bool = true) -> ListItem {
        return mutate(draggable: value)
    }

    @available(*, deprecated, message: "Use the enterKey(_:) modifier instead.")
    public func enterKeyHint(_ value: Values.Hint) -> ListItem {
        return mutate(enterkeyhint: value.rawValue)
    }
    
    public func enterKey(_ value: Values.Hint) -> ListItem {
        return mutate(enterkeyhint: value.rawValue)
    }
    
    public func hidden(_ condition: Bool = true) -> ListItem {
        
        if condition {
            return mutate(hidden: "hidden")
        }
        
        return self
    }

    public func inputMode(_ value: Values.Mode) -> ListItem {
        return mutate(inputmode: value.rawValue)
    }
    
    public func `is`(_ value: String) -> ListItem {
        return mutate(is: value)
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: [String]? = nil) -> ListItem {
        return self.mutate(itemscope: "itemscope").mutate(itemid: id).mutate(itemtype: schema?.absoluteString).mutate(itemref: elements?.joined(separator: " "))
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: String...) -> ListItem {
        return self.mutate(itemscope: "itemscope").mutate(itemid: id).mutate(itemtype: schema?.absoluteString).mutate(itemref: elements.joined(separator: " "))
    }

    @available(*, deprecated, message: "Use the item(id:as:for:) modifier instead.")
    public func itemId(_ value: String) -> ListItem {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> ListItem {
        return mutate(itemprop: value)
    }

    @available(*, deprecated, message: "Use the item(id:as:for:) modifier instead.")
    public func itemReference(_ value: String) -> ListItem {
        return mutate(itemref: value)
    }

    @available(*, deprecated, message: "Use the item(id:as:for:) modifier instead.")
    public func itemScope(_ value: String) -> ListItem {
        return mutate(itemscope: value)
    }
    
    @available(*, deprecated, message: "Use the item(id:as:for:) modifier instead.")
    public func itemType(_ value: String) -> ListItem {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> ListItem {
        return mutate(id: value)
    }

    public func language(_ value: Values.Language) -> ListItem {
        return mutate(lang: value.rawValue)
    }

    public func nonce(_ value: String) -> ListItem {
        return mutate(nonce: value)
    }

    public func role(_ value: Values.Role) -> ListItem {
        return mutate(role: value.rawValue)
    }
    
    @available(*, deprecated, message: "Use the spellcheck(_:) modifier instead.")
    public func hasSpellCheck(_ value: Bool) -> ListItem {
        return mutate(spellcheck: value)
    }
    
    public func spellcheck(_ value: Bool = true) -> ListItem {
        return mutate(spellcheck: value)
    }

    public func style(_ value: String) -> ListItem {
        return mutate(style: TaintedString(value, as: .css(.attribute)))
    }

    public func tabIndex(_ value: Int) -> ListItem {
        return mutate(tabindex: value)
    }

    @_disfavoredOverload
    public func title(_ value: String) -> ListItem {
        return mutate(title: value)
    }
    
    public func title(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> ListItem {
        return mutate(title: LocalizedString(key: localizedKey, table: tableName))
    }
    
    public func title(verbatim value: String) -> ListItem {
        return mutate(title: value)
    }
    
    @available(*, deprecated, message: "Use the translate(_:) modifier instead.")
    public func translate(_ value: Values.Decision) -> ListItem {
        return mutate(translate: value.rawValue)
    }
    
    public func translate(_ value: Bool = true) -> ListItem {
        
        if value {
            return mutate(translate: "yes")
        }
        
        return mutate(translate: "no")
    }
    
    public func inert(_ condition: Bool = true) -> ListItem {

        if condition {
            return mutate(inert: "inert")
        }
        
        return self
    }
    
    @_disfavoredOverload
    public func value(_ value: String) -> ListItem {
        return mutate(value: value)
    }
    
    public func value(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> ListItem {
        return mutate(value: LocalizedString(key: localizedKey, table: tableName))
    }
    
    public func value(verbatim value: String) -> ListItem {
        return mutate(value: value)
    }
    
    public func popover(_ value: Values.Popover.State) -> ListItem {
        return mutate(popover: value.rawValue)
    }
    
    public func custom(key: String, value: Any) -> ListItem {
        return mutate(key: key, value: value)
    }
    
    public func on(event: Events.Drag, _ value: String) -> ListItem {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> ListItem {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Wheel, _ value: String) -> ListItem {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> ListItem {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Mouse, _ value: String) -> ListItem {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func aria(atomic value: Bool) -> ListItem {
        return mutate(ariaatomic: value)
    }
    
    public func aria(busy value: Bool) -> ListItem {
        return mutate(ariabusy: value)
    }
    
    public func aria(controls value: String) -> ListItem {
        return mutate(ariacontrols: value)
    }
    
    public func aria(current value: Values.Accessibility.Current) -> ListItem {
        return mutate(ariacurrent: value.rawValue)
    }
    
    public func aria(describedBy value: String) -> ListItem {
        return mutate(ariadescribedby: value)
    }
    
    public func aria(details value: String) -> ListItem {
        return mutate(ariadetails: value)
    }
    
    public func aria(disabled value: Bool) -> ListItem {
        return mutate(ariadisabled: value)
    }
    
    public func aria(errorMessage value: String) -> ListItem {
        return mutate(ariaerrormessage: value)
    }
    
    public func aria(flowTo value: String) -> ListItem {
        return mutate(ariaflowto: value)
    }
    
    public func aria(hasPopup value: Values.Accessibility.Popup) -> ListItem {
        return mutate(ariahaspopup: value.rawValue)
    }
    
    public func aria(hidden value: Bool) -> ListItem {
        return mutate(ariahidden: value)
    }
    
    public func aria(invalid value: Values.Accessibility.Invalid) -> ListItem {
        return mutate(ariainvalid: value.rawValue)
    }
    
    public func aria(keyShortcuts value: String) -> ListItem {
        return mutate(ariakeyshortcuts: value)
    }
    
    public func aria(label value: String) -> ListItem {
        return mutate(arialabel: value)
    }
    
    public func aria(labeledBy value: String) -> ListItem {
        return mutate(arialabeledby: value)
    }
    
    public func aria(live value: Values.Accessibility.Live) -> ListItem {
        return mutate(arialive: value.rawValue)
    }
    
    public func aria(owns value: String) -> ListItem {
        return mutate(ariaowns: value)
    }
    
    public func aria(relevant value: Values.Accessibility.Relevant) -> ListItem {
        return mutate(ariarelevant: value.rawValue)
    }
    
    public func aria(roleDescription value: String) -> ListItem {
        return mutate(ariaroledescription: value)
    }
}
