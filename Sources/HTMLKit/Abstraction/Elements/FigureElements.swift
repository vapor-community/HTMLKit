import Foundation
import OrderedCollections

/// The alias for the element ``FigureCaption``.
@_documentation(visibility: internal)
public typealias Figcaption = FigureCaption

/// An element that represents a figure caption.
///
/// Use `FigureCaption` to annotate ``Image``, ``Video``, ``Code``  or ``Vector``.
///
/// ```swift
/// Figure {
///     Image()
///         .source("...png")
///         .alternate("Lorem ipsum...")
///     FigureCaption {
///         "Lorem ipsum..."
///     }
/// }
/// ```
public struct FigureCaption: ContentNode, FigureElement {

    internal var name: String { "figcaption" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [Content]
    
    /// Create a figure caption.
    ///
    /// - Parameter content: The caption's content.
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [Content]) {
        self.attributes = attributes
        self.content = content
    }
    
    public func modify(if condition: Bool, element: (FigureCaption) -> FigureCaption) -> FigureCaption {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (FigureCaption, T) -> FigureCaption) -> FigureCaption {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension FigureCaption: GlobalAttributes, GlobalEventAttributes, GlobalAriaAttributes {
    
    public func accessKey(_ value: Character) -> FigureCaption {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ value: Values.Capitalization) -> FigureCaption {
        return mutate(autocapitalize: value.rawValue)
    }

    public func autofocus() -> FigureCaption {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> FigureCaption {
        return mutate(class: value)
    }

    @available(*, deprecated, message: "Use the editable(_:) modifier instead.")
    public func isEditable(_ value: Bool) -> FigureCaption {
        return mutate(contenteditable: value)
    }
    
    public func editable(_ value: Bool = true) -> FigureCaption {
        return mutate(contenteditable: value)
    }

    public func direction(_ value: Values.Direction) -> FigureCaption {
        return mutate(dir: value.rawValue)
    }

    @available(*, deprecated, message: "Use the draggable(_:) modifier instead.")
    public func isDraggable(_ value: Bool) -> FigureCaption {
        return mutate(draggable: value)
    }
    
    public func draggable(_ value: Bool = true) -> FigureCaption {
        return mutate(draggable: value)
    }

    @available(*, deprecated, message: "Use the enterKey(_:) modifier instead.")
    public func enterKeyHint(_ value: Values.Hint) -> FigureCaption {
        return mutate(enterkeyhint: value.rawValue)
    }
    
    public func enterKey(_ value: Values.Hint) -> FigureCaption {
        return mutate(enterkeyhint: value.rawValue)
    }
    
    public func hidden(_ condition: Bool = true) -> FigureCaption {
        
        if condition {
            return mutate(hidden: "hidden")
        }
        
        return self
    }

    @available(*, unavailable, message: "Use the inputMode(_:) modifier instead.")
    public func inputMode(_ value: String) -> FigureCaption {
        return mutate(inputmode: value)
    }
    
    public func inputMode(_ value: Values.Mode) -> FigureCaption {
        return mutate(inputmode: value.rawValue)
    }

    public func `is`(_ value: String) -> FigureCaption {
        return mutate(is: value)
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: [String]? = nil) -> FigureCaption {
        return self.mutate(itemscope: "itemscope").mutate(itemid: id).mutate(itemtype: schema?.absoluteString).mutate(itemref: elements?.joined(separator: " "))
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: String...) -> FigureCaption {
        return self.mutate(itemscope: "itemscope").mutate(itemid: id).mutate(itemtype: schema?.absoluteString).mutate(itemref: elements.joined(separator: " "))
    }

    @available(*, deprecated, message: "Use the item(id:as:for:) modifier instead.")
    public func itemId(_ value: String) -> FigureCaption {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> FigureCaption {
        return mutate(itemprop: value)
    }

    @available(*, deprecated, message: "Use the item(id:as:for:) modifier instead.")
    public func itemReference(_ value: String) -> FigureCaption {
        return mutate(itemref: value)
    }

    @available(*, deprecated, message: "Use the item(id:as:for:) modifier instead.")
    public func itemScope(_ value: String) -> FigureCaption {
        return mutate(itemscope: value)
    }
    
    @available(*, deprecated, message: "Use the item(id:as:for:) modifier instead.")
    public func itemType(_ value: String) -> FigureCaption {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> FigureCaption {
        return mutate(id: value)
    }

    public func language(_ value: Values.Language) -> FigureCaption {
        return mutate(lang: value.rawValue)
    }

    public func nonce(_ value: String) -> FigureCaption {
        return mutate(nonce: value)
    }
    
    public func role(_ value: Values.Role) -> FigureCaption {
        return mutate(role: value.rawValue)
    }

    @available(*, deprecated, message: "Use the spellcheck(_:) modifier instead.")
    public func hasSpellCheck(_ value: Bool) -> FigureCaption {
        return mutate(spellcheck: value)
    }
    
    public func spellcheck(_ value: Bool = true) -> FigureCaption {
        return mutate(spellcheck: value)
    }

    public func style(_ value: String) -> FigureCaption {
        return mutate(style: TaintedString(value, as: .css(.attribute)))
    }

    public func tabIndex(_ value: Int) -> FigureCaption {
        return mutate(tabindex: value)
    }

    @_disfavoredOverload
    public func title(_ value: String) -> FigureCaption {
        return mutate(title: value)
    }
    
    public func title(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> FigureCaption {
        return mutate(title: LocalizedString(key: localizedKey, table: tableName))
    }
    
    public func title(verbatim value: String) -> FigureCaption {
        return mutate(title: value)
    }
    
    @available(*, deprecated, message: "Use the translate(_:) modifier instead.")
    public func translate(_ value: Values.Decision) -> FigureCaption {
        return mutate(translate: value.rawValue)
    }
    
    public func translate(_ value: Bool = true) -> FigureCaption {
        
        if value {
            return mutate(translate: "yes")
        }
        
        return mutate(translate: "no")
    }
    
    public func inert(_ condition: Bool = true) -> FigureCaption {

        if condition {
            return mutate(inert: "inert")
        }
        
        return self
    }
    
    public func popover(_ value: Values.Popover.State) -> FigureCaption {
        return mutate(popover: value.rawValue)
    }
    
    public func custom(key: String, value: Any) -> FigureCaption {
        return mutate(key: key, value: value)
    }
    
    public func on(event: Events.Drag, _ value: String) -> FigureCaption {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> FigureCaption {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> FigureCaption {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Mouse, _ value: String) -> FigureCaption {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func on(event: Events.Wheel, _ value: String) -> FigureCaption {
        return mutate(key: event.rawValue, value: TaintedString(value, as: .js(.attribute)))
    }
    
    public func aria(atomic value: Bool) -> FigureCaption {
        return mutate(ariaatomic: value)
    }
    
    public func aria(busy value: Bool) -> FigureCaption {
        return mutate(ariabusy: value)
    }
    
    public func aria(controls value: String) -> FigureCaption {
        return mutate(ariacontrols: value)
    }
    
    public func aria(current value: Values.Accessibility.Current) -> FigureCaption {
        return mutate(ariacurrent: value.rawValue)
    }
    
    public func aria(describedBy value: String) -> FigureCaption {
        return mutate(ariadescribedby: value)
    }
    
    public func aria(details value: String) -> FigureCaption {
        return mutate(ariadetails: value)
    }
    
    public func aria(disabled value: Bool) -> FigureCaption {
        return mutate(ariadisabled: value)
    }
    
    public func aria(errorMessage value: String) -> FigureCaption {
        return mutate(ariaerrormessage: value)
    }
    
    public func aria(flowTo value: String) -> FigureCaption {
        return mutate(ariaflowto: value)
    }
    
    public func aria(hasPopup value: Values.Accessibility.Popup) -> FigureCaption {
        return mutate(ariahaspopup: value.rawValue)
    }
    
    public func aria(hidden value: Bool) -> FigureCaption {
        return mutate(ariahidden: value)
    }
    
    public func aria(invalid value: Values.Accessibility.Invalid) -> FigureCaption {
        return mutate(ariainvalid: value.rawValue)
    }
    
    public func aria(keyShortcuts value: String) -> FigureCaption {
        return mutate(ariakeyshortcuts: value)
    }
    
    public func aria(label value: String) -> FigureCaption {
        return mutate(arialabel: value)
    }
    
    public func aria(labeledBy value: String) -> FigureCaption {
        return mutate(arialabeledby: value)
    }
    
    public func aria(live value: Values.Accessibility.Live) -> FigureCaption {
        return mutate(arialive: value.rawValue)
    }
    
    public func aria(owns value: String) -> FigureCaption {
        return mutate(ariaowns: value)
    }
    
    public func aria(relevant value: Values.Accessibility.Relevant) -> FigureCaption {
        return mutate(ariarelevant: value.rawValue)
    }
    
    public func aria(roleDescription value: String) -> FigureCaption {
        return mutate(ariaroledescription: value)
    }
}
