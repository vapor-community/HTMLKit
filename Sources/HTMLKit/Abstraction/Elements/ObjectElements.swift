/*
 Abstract:
 The file contains the object elements. The html-element 'object' only allows these elements to be its descendants.

 Note:
 If you about to add something to the file, stick to the official documentation to keep the code consistent.
 */

import OrderedCollections

/// The alias for the element Parameter.
///
/// Param is the official tag and can be used instead of Parameter.
///
/// ```html
/// <param>
/// ```
@_documentation(visibility: internal)
public typealias Param = Parameter

/// The element defines parameters for plugins invoked by an object element.
///
/// ```html
/// <param>
/// ```
public struct Parameter: EmptyNode, ObjectElement {
    
    internal var name: String { "param" }

    internal var attributes: OrderedDictionary<String, Any>?

    public init() {}
    
    internal init(attributes: OrderedDictionary<String, Any>?) {
        self.attributes = attributes
    }
    
    public func modify(if condition: Bool, element: (Parameter) -> Parameter) -> Parameter {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (Parameter, T) -> Parameter) -> Parameter {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension Parameter: GlobalAttributes, GlobalEventAttributes, NameAttribute, ValueAttribute {
    
    public func accessKey(_ value: Character) -> Parameter {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ value: Values.Capitalization) -> Parameter {
        return mutate(autocapitalize: value.rawValue)
    }

    public func autofocus() -> Parameter {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Parameter {
        return mutate(class: value)
    }

    public func isEditable(_ value: Bool) -> Parameter {
        return mutate(contenteditable: value)
    }

    public func direction(_ value: Values.Direction) -> Parameter {
        return mutate(dir: value.rawValue)
    }

    public func isDraggable(_ value: Bool) -> Parameter {
        return mutate(draggable: value)
    }

    public func enterKeyHint(_ value: Values.Hint) -> Parameter {
        return mutate(enterkeyhint: value.rawValue)
    }

    public func hidden() -> Parameter {
        return mutate(hidden: "hidden")
    }
    
    public func hidden(_ condition: Bool) -> Parameter {
        
        if condition {
            return mutate(hidden: "hidden")
        }
        
        return self
    }

    public func inputMode(_ value: String) -> Parameter {
        return mutate(inputmode: value)
    }
    
    public func inputMode(_ value: Values.Mode) -> Parameter {
        return mutate(inputmode: value.rawValue)
    }

    public func `is`(_ value: String) -> Parameter {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Parameter {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Parameter {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Parameter {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Parameter {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Parameter {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Parameter {
        return mutate(id: value)
    }

    public func language(_ value: Values.Language) -> Parameter {
        return mutate(lang: value.rawValue)
    }

    public func nonce(_ value: String) -> Parameter {
        return mutate(nonce: value)
    }
    
    public func role(_ value: Values.Role) -> Parameter {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ value: Bool) -> Parameter {
        return mutate(spellcheck: value)
    }

    public func style(_ value: String) -> Parameter {
        return mutate(style: value)
    }

    public func tabIndex(_ value: Int) -> Parameter {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Parameter {
        return mutate(title: value)
    }
    
    public func translate(_ value: Values.Decision) -> Parameter {
        return mutate(translate: value.rawValue)
    }
    
    public func inert() -> Parameter {
        return mutate(inert: "inert")
    }
    
    public func inert(_ condition: Bool) -> Parameter {

        if condition {
            return mutate(inert: "inert")
        }
        
        return self
    }

    public func name(_ value: String) -> Parameter {
        return mutate(name: value)
    }
    
    public func value(_ value: String) -> Parameter {
        return mutate(value: value)
    }
    
    public func popover(_ value: Values.Popover.State) -> Parameter {
        return mutate(popover: value.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Parameter {
        return mutate(key: key, value: value)
    }
    
    public func on(event: Events.Drag, _ value: String) -> Parameter {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> Parameter {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Wheel, _ value: String) -> Parameter {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> Parameter {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Mouse, _ value: String) -> Parameter {
        return mutate(key: event.rawValue, value: value)
    }
}
