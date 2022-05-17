/*
 Abstract:
 The file contains the object elements. The html-element 'object' only allows these elements to be its descendants.
 
 Authors:
 - Mats Moll (https://github.com/matsmoll)
 
 Contributors:
 - Mattes Mohr (https://github.com/mattesmohr)
 
 Note:
 If you about to add something to the file, stick to the official documentation to keep the code consistent.
 */

import OrderedCollections

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
}

extension Parameter: GlobalAttributes, NameAttribute, ValueAttribute {
    
    public func accessKey(_ value: String) -> Parameter {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Parameter {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Parameter {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Parameter {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Parameter {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Parameter {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Parameter {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Parameter {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Parameter {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Parameter {
        return mutate(inputmode: value)
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
    
    public func id(_ value: TemplateValue<String>) -> Parameter {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> Parameter {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Parameter {
        return mutate(nonce: value)
    }
    
    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Parameter {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> Parameter {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> Parameter {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Parameter {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Parameter {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Parameter {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Parameter {
        return mutate(translate: value)
    }

    public func name(_ value: String) -> Parameter {
        return mutate(name: value)
    }
    
    public func name(_ value: TemplateValue<String>) -> Parameter {
        return mutate(name: value.rawValue)
    }
    
    public func value(_ value: String) -> Parameter {
        return mutate(value: value)
    }
    
    public func value(_ value: TemplateValue<String>) -> Parameter {
        return mutate(value: value.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Parameter {
        return mutate(key: key, value: value)
    }
}

extension Parameter: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Parameter: Modifiable {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMascadingOptional {
                
                return modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                
                return modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}
