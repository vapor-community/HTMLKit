/*
 Abstract:
 The file contains the list elements. The html-element 'ol' or 'ul' only allows these elements to be its descendants.

 Note:
 If you about to add something to the file, stick to the official documentation to keep the code consistent.
 */

import OrderedCollections

/// The alias for the element ListItem.
///
/// Li is the official tag and can be used instead of ListItem.
///
/// ```html
/// <li></li>
/// ```
public typealias Li = ListItem

/// The element represents a item of a list.
///
/// ```html
/// <li></li>
/// ```
public struct ListItem: ContentNode, ListElement {

    internal var name: String { "li" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
    
    public func modify(if condition: Bool, element: (ListItem) -> ListItem) -> ListItem {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (ListItem, TemplateValue<T>) -> ListItem) -> ListItem {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMasqueradingOptional {
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
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

    public func isEditable(_ value: Bool) -> ListItem {
        return mutate(contenteditable: value)
    }

    public func direction(_ value: Values.Direction) -> ListItem {
        return mutate(dir: value.rawValue)
    }

    public func isDraggable(_ value: Bool) -> ListItem {
        return mutate(draggable: value)
    }

    public func enterKeyHint(_ value: Values.Hint) -> ListItem {
        return mutate(enterkeyhint: value.rawValue)
    }

    public func hidden() -> ListItem {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> ListItem {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> ListItem {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> ListItem {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> ListItem {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> ListItem {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> ListItem {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> ListItem {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> ListItem {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> ListItem {
        return mutate(id: value.rawValue)
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
    
    public func hasSpellCheck(_ value: Bool) -> ListItem {
        return mutate(spellcheck: value)
    }

    public func style(_ value: String) -> ListItem {
        return mutate(style: value)
    }

    public func tabIndex(_ value: Int) -> ListItem {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> ListItem {
        return mutate(title: value)
    }
    
    public func translate(_ value: Values.Decision) -> ListItem {
        return mutate(translate: value.rawValue)
    }
    
    public func value(_ value: String) -> ListItem {
        return mutate(value: value)
    }
    
    public func value(_ value: TemplateValue<String>) -> ListItem {
        return mutate(value: value.rawValue)
    }
    
    public func custom(key: String, value: Any) -> ListItem {
        return mutate(key: key, value: value)
    }
    
    public func on(event: Events.Drag, _ value: String) -> ListItem {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> ListItem {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Wheel, _ value: String) -> ListItem {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> ListItem {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Mouse, _ value: String) -> ListItem {
        return mutate(key: event.rawValue, value: value)
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
