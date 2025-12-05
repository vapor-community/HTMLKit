import Foundation
import OrderedCollections

/// An element that represents a map area.
///
/// Use `Area` to define a region within an ``Map``.
///
/// ```swift
/// Image()
///     .source("...png")
///     .useMap("lorem")
/// Map {
///     Area()
///         .shape(.circle)
///         .coordinates("10, 10, 10 ,10")
///         .alternate("Lorem ipsum...")
///         .reference("https://...")
/// }
/// .name("lorem")
/// ```
public struct Area: EmptyNode, MapElement {

    internal var name: String { "area" }

    internal var attributes: OrderedDictionary<String, Any>?

    /// Creates a area.
    public init() {}
    
    @available(*, deprecated, message: "The area element is actually an empty element. Use Area() instead.")
    public init(@ContentBuilder<Content> content: () -> [Content]) {}
    
    internal init(attributes: OrderedDictionary<String, Any>?) {
        self.attributes = attributes
    }
    
    public func modify(if condition: Bool, element: (Area) -> Area) -> Area {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (Area, T) -> Area) -> Area {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension Area: GlobalAttributes, GlobalEventAttributes, GlobalAriaAttributes, AlternateAttribute, CoordinatesAttribute, ShapeAttribute, ReferenceAttribute, TargetAttribute, DownloadAttribute, PingAttribute, RelationshipAttribute, ReferrerPolicyAttribute {
        
    public func accessKey(_ value: Character) -> Area {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ value: Values.Capitalization) -> Area {
        return mutate(autocapitalize: value.rawValue)
    }

    public func autofocus() -> Area {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Area {
        return mutate(class: value)
    }

    @available(*, deprecated, message: "Use the editable(_:) modifier instead.")
    public func isEditable(_ value: Bool) -> Area {
        return mutate(contenteditable: value)
    }
    
    public func editable(_ value: Bool = true) -> Area {
        return mutate(contenteditable: value)
    }

    public func direction(_ value: Values.Direction) -> Area {
        return mutate(dir: value.rawValue)
    }

    @available(*, deprecated, message: "Use the draggable(_:) modifier instead.")
    public func isDraggable(_ value: Bool) -> Area {
        return mutate(draggable: value)
    }
    
    public func draggable(_ value: Bool = true) -> Area {
        return mutate(draggable: value)
    }

    @available(*, deprecated, message: "Use the enterKey(_:) modifier instead.")
    public func enterKeyHint(_ value: Values.Hint) -> Area {
        return mutate(enterkeyhint: value.rawValue)
    }
    
    public func enterKey(_ value: Values.Hint) -> Area {
        return mutate(enterkeyhint: value.rawValue)
    }

    public func hidden(_ condition: Bool = true) -> Area {
        
        if condition {
            return mutate(hidden: "hidden")
        }
        
        return self
    }
    
    @available(*, unavailable, message: "Use the inputMode(_:) modifier instead.")
    public func inputMode(_ value: String) -> Area {
        return mutate(inputmode: value)
    }

    public func inputMode(_ value: Values.Mode) -> Area {
        return mutate(inputmode: value.rawValue)
    }
    
    public func `is`(_ value: String) -> Area {
        return mutate(is: value)
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: [String]? = nil) -> Area {
        return self.mutate(itemscope: "itemscope").mutate(itemid: id).mutate(itemtype: schema?.absoluteString).mutate(itemref: elements?.joined(separator: " "))
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: String...) -> Area {
        return self.mutate(itemscope: "itemscope").mutate(itemid: id).mutate(itemtype: schema?.absoluteString).mutate(itemref: elements.joined(separator: " "))
    }

    @available(*, deprecated, message: "Use the item(id:as:for:) modifier instead.")
    public func itemId(_ value: String) -> Area {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Area {
        return mutate(itemprop: value)
    }

    @available(*, deprecated, message: "Use the item(id:as:for:) modifier instead.")
    public func itemReference(_ value: String) -> Area {
        return mutate(itemref: value)
    }

    @available(*, deprecated, message: "Use the item(id:as:for:) modifier instead.")
    public func itemScope(_ value: String) -> Area {
        return mutate(itemscope: value)
    }
    
    @available(*, deprecated, message: "Use the item(id:as:for:) modifier instead.")
    public func itemType(_ value: String) -> Area {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Area {
        return mutate(id: value)
    }

    public func language(_ value: Values.Language) -> Area {
        return mutate(lang: value.rawValue)
    }

    public func nonce(_ value: String) -> Area {
        return mutate(nonce: value)
    }
    
    public func role(_ value: Values.Role) -> Area {
        return mutate(role: value.rawValue)
    }

    @available(*, deprecated, message: "Use the spellcheck(_:) modifier instead.")
    public func hasSpellCheck(_ value: Bool) -> Area {
        return mutate(spellcheck: value)
    }
    
    public func spellcheck(_ value: Bool = true) -> Area {
        return mutate(spellcheck: value)
    }

    public func style(_ value: String) -> Area {
        return mutate(style: TaintedString(value, as: .css(.attribute)))
    }

    public func tabIndex(_ value: Int) -> Area {
        return mutate(tabindex: value)
    }

    @_disfavoredOverload
    public func title(_ value: String) -> Area {
        return mutate(title: value)
    }
    
    public func title(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> Area {
        return mutate(title: LocalizedString(key: localizedKey, table: tableName))
    }
    
    public func title(verbatim value: String) -> Area {
        return mutate(title: value)
    }
    
    @available(*, deprecated, message: "Use the translate(_:) modifier instead.")
    public func translate(_ value: Values.Decision) -> Area {
        return mutate(translate: value.rawValue)
    }
    
    public func translate(_ value: Bool = true) -> Area {
        
        if value {
            return mutate(translate: "yes")
        }
        
        return mutate(translate: "no")
    }
    
    public func inert(_ condition: Bool = true) -> Area {

        if condition {
            return mutate(inert: "inert")
        }
        
        return self
    }
    
    @_disfavoredOverload
    public func alternate(_ value: String) -> Area {
        return mutate(alternate: value)
    }
    
    public func alternate(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> Area {
        return mutate(alternate: LocalizedString(key: localizedKey, table: tableName))
    }
    
    public func alternate(verbatim value: String) -> Area {
        return mutate(alternate: value)
    }
    
    public func coordinates(_ value: String) -> Area {
        return mutate(coords: value)
    }
    
    public func shape(_ value: Values.Shape) -> Area {
        return mutate(shape: value.rawValue)
    }
    
    public func reference(_ value: String) -> Area {
        return mutate(href: value)
    }
    
    public func target(_ value: Values.Target) -> Area {
        return mutate(target: value.rawValue)
    }
    
    public func download() -> Area {
        return mutate(download: "download")
    }
    
    public func ping(_ value: String) -> Area {
        return mutate(ping: value)
    }
    
    public func relationship(_ value: Values.Relation) -> Area {
        return mutate(rel: value.rawValue)
    }
    
    public func referrerPolicy(_ value: Values.Policy) -> Area {
        return mutate(referrerpolicy: value.rawValue)
    }
    
    public func popover(_ value: Values.Popover.State) -> Area {
        return mutate(popover: value.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Area {
        return mutate(key: key, value: value)
    }
    
    public func on(event: Events.Drag, _ value: String) -> Area {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> Area {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Wheel, _ value: String) -> Area {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> Area {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Mouse, _ value: String) -> Area {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func aria(atomic value: Bool) -> Area {
        return mutate(ariaatomic: value)
    }
    
    public func aria(busy value: Bool) -> Area {
        return mutate(ariabusy: value)
    }
    
    public func aria(controls value: String) -> Area {
        return mutate(ariacontrols: value)
    }
    
    public func aria(current value: Values.Accessibility.Current) -> Area {
        return mutate(ariacurrent: value.rawValue)
    }
    
    public func aria(describedBy value: String) -> Area {
        return mutate(ariadescribedby: value)
    }
    
    public func aria(details value: String) -> Area {
        return mutate(ariadetails: value)
    }
    
    public func aria(disabled value: Bool) -> Area {
        return mutate(ariadisabled: value)
    }
    
    public func aria(errorMessage value: String) -> Area {
        return mutate(ariaerrormessage: value)
    }
    
    public func aria(flowTo value: String) -> Area {
        return mutate(ariaflowto: value)
    }
    
    public func aria(hasPopup value: Values.Accessibility.Popup) -> Area {
        return mutate(ariahaspopup: value.rawValue)
    }
    
    public func aria(hidden value: Bool) -> Area {
        return mutate(ariahidden: value)
    }
    
    public func aria(invalid value: Values.Accessibility.Invalid) -> Area {
        return mutate(ariainvalid: value.rawValue)
    }
    
    public func aria(keyShortcuts value: String) -> Area {
        return mutate(ariakeyshortcuts: value)
    }
    
    public func aria(label value: String) -> Area {
        return mutate(arialabel: value)
    }
    
    public func aria(labeledBy value: String) -> Area {
        return mutate(arialabeledby: value)
    }
    
    public func aria(live value: Values.Accessibility.Live) -> Area {
        return mutate(arialive: value.rawValue)
    }
    
    public func aria(owns value: String) -> Area {
        return mutate(ariaowns: value)
    }
    
    public func aria(relevant value: Values.Accessibility.Relevant) -> Area {
        return mutate(ariarelevant: value.rawValue)
    }
    
    public func aria(roleDescription value: String) -> Area {
        return mutate(ariaroledescription: value)
    }
}
