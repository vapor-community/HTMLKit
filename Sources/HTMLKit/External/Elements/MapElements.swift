/*
 Abstract:
 The file contains the map elements. The html-element 'map' only allows these elements to be its descendants.
 
 Authors:
 - Mats Moll (https://github.com/matsmoll)
 
 Contributors:
 - Mattes Mohr (https://github.com/mattesmohr)
 
 Note:
 If you about to add something to the file, stick to the official documentation to keep the code consistent.
 */

import OrderedCollections

/// The element defines an image map.
///
/// ```html
/// <area></area>
/// ```
public struct Area: ContentNode, MapElement {

    internal var name: String { "area" }

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

extension Area: GlobalAttributes, AlternateAttribute, CoordinatesAttribute, ShapeAttribute, ReferenceAttribute, TargetAttribute, DownloadAttribute, PingAttribute, RelationshipAttribute, ReferrerPolicyAttribute {
    
    public func accessKey(_ value: String) -> Area {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Area {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Area {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Area {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Area {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Area {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Area {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Area {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Area {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Area {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Area {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Area {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Area {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Area {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Area {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Area {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Area {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Area {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> Area {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Area {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> Area {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> Area {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> Area {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Area {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Area {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Area {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Area {
        return mutate(translate: value)
    }
    
    public func alternate(_ value: String) -> Area {
        return mutate(alternate: value)
    }
    
    public func coordinates(_ value: String) -> Area {
        return mutate(coords: value)
    }
    
    public func shape(_ type: Shape) -> Area {
        return mutate(shape: type.rawValue)
    }
    
    public func reference(_ value: String) -> Area {
        return mutate(href: value)
    }
    
    public func reference(_ value: TemplateValue<String>) -> Area {
        return mutate(href: value.rawValue)
    }
    
    public func target(_ type: Target) -> Area {
        return mutate(target: type.rawValue)
    }
    
    public func download() -> Area {
        return mutate(download: "download")
    }
    
    public func ping(_ value: String) -> Area {
        return mutate(ping: value)
    }
    
    public func relationship(_ type: Relation) -> Area {
        return mutate(rel: type.rawValue)
    }
    
    public func referrerPolicy(_ type: Policy) -> Area {
        return mutate(referrerpolicy: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Area {
        return mutate(key: key, value: value)
    }
}

extension Area: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Area: Modifiable {
    
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
