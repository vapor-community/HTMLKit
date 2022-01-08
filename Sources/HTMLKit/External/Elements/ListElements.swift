/// ## Description
/// The file contains the list elements. The html elements OrderedList or UnorderedList only
/// allows these elements to be its descendants.
///
/// ## Note
/// If you about to add something to the file, stick to the official documentation to keep the code consistent.
///
/// ## Authors
/// Mats Moll: https://github.com/matsmoll
/// Mattes Mohr: https://github.com/mattesmohr

import OrderedCollections

/// ## Description
/// The alias points to ListItem.
///
public typealias Li = ListItem

/// ## Description
/// The element represents a item of a list.
///
/// ## References
/// https://html.spec.whatwg.org/#the-li-element
///
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
}

extension ListItem: GlobalAttributes, ValueAttribute {
    
    public func accessKey(_ value: String) -> ListItem {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> ListItem {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> ListItem {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> ListItem {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> ListItem {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> ListItem {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> ListItem {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> ListItem {
        return mutate(enterkeyhint: type.rawValue)
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

    public func language(_ type: Language) -> ListItem {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> ListItem {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> ListItem {
        return mutate(role: value)
    }

    public func role(_ value: Roles) -> ListItem {
        return mutate(role: value.rawValue)
    }
    
    public func hasSpellCheck(_ condition: Bool) -> ListItem {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> ListItem {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> ListItem {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> ListItem {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> ListItem {
        return mutate(translate: value)
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
}

extension ListItem: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension ListItem: Modifiable {
    
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
