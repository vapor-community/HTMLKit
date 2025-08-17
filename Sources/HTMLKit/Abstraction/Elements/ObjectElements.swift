import Foundation
import OrderedCollections

/// The alias for the element ``Parameter``.
@_documentation(visibility: internal)
public typealias Param = Parameter

/// An element that represents an object parameter.
///
/// Use `Parameter` to pass parameters to an ``Object``.
///
/// ```swift
/// Object {
///     Parameter()
///         .name("Foo")
///         .value("Bar")
/// }
/// ```
public struct Parameter: EmptyNode, ObjectElement {
    
    internal var name: String { "param" }

    internal var attributes: OrderedDictionary<String, Any>?

    @available(*, deprecated, message: "The parameter element is no longer part of the web standards. Use the data attribute of the object element instead.")
    public init() {}
    
    @available(*, deprecated, message: "The parameter element is no longer part of the web standards. Use the data attribute of the object element instead.")
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

    @available(*, deprecated, message: "The inputmode attribute is actually an enumerated attribute. Use the inputMode(_: Mode) modifier instead.")
    public func inputMode(_ value: String) -> Parameter {
        return mutate(inputmode: value)
    }
    
    public func inputMode(_ value: Values.Mode) -> Parameter {
        return mutate(inputmode: value.rawValue)
    }

    public func `is`(_ value: String) -> Parameter {
        return mutate(is: value)
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: [String]? = nil) -> Parameter {
        return self.mutate(itemscope: "itemscope").mutate(itemid: id).mutate(itemtype: schema?.absoluteString).mutate(itemref: elements?.joined(separator: " "))
    }
    
    public func item(id: String? = nil, as schema: URL? = nil, for elements: String...) -> Parameter {
        return self.mutate(itemscope: "itemscope").mutate(itemid: id).mutate(itemtype: schema?.absoluteString).mutate(itemref: elements.joined(separator: " "))
    }

    @available(*, deprecated, message: "Use the item(id:as:for:) modifier instead.")
    public func itemId(_ value: String) -> Parameter {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Parameter {
        return mutate(itemprop: value)
    }

    @available(*, deprecated, message: "Use the item(id:as:for:) modifier instead.")
    public func itemReference(_ value: String) -> Parameter {
        return mutate(itemref: value)
    }

    @available(*, deprecated, message: "Use the item(id:as:for:) modifier instead.")
    public func itemScope(_ value: String) -> Parameter {
        return mutate(itemscope: value)
    }
    
    @available(*, deprecated, message: "Use the item(id:as:for:) modifier instead.")
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

    @_disfavoredOverload
    public func title(_ value: String) -> Parameter {
        return mutate(title: value)
    }
    
    public func title(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> Parameter {
        return mutate(title: LocalizedString(key: localizedKey, table: tableName))
    }
    
    public func title(verbatim value: String) -> Parameter {
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
    
    @_disfavoredOverload
    public func value(_ value: String) -> Parameter {
        return mutate(value: value)
    }
    
    public func value(_ localizedKey: LocalizedStringKey, tableName: String? = nil) -> Parameter {
        return mutate(value: LocalizedString(key: localizedKey, table: tableName))
    }
    
    public func value(verbatim value: String) -> Parameter {
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
