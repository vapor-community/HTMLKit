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
    
    public func modify(if condition: Bool, element: (Area) -> Area) -> Area {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (Area, TemplateValue<T>) -> Area) -> Area {
        
        switch value {
        case .constant(let optional):
            
            guard let value = optional else {
                return self
            }
            
            return self.modify(element(self, .constant(value)))
            
        case .dynamic(let context):
            
            if context.isMasqueradingOptional {
                return self.modify(element(self, .dynamic(context.unsafeCast(to: T.self))))
            
            } else {
                return self.modify(element(self, .dynamic(context.unsafelyUnwrapped)))
            }
        }
    }
}

extension Area: GlobalAttributes, GlobalEventAttributes, GlobalAriaAttributes, AlternateAttribute, CoordinatesAttribute, ShapeAttribute, ReferenceAttribute, TargetAttribute, DownloadAttribute, PingAttribute, RelationshipAttribute, ReferrerPolicyAttribute {
    
    public func accessKey(_ value: Character) -> Area {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Values.Capitalization) -> Area {
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

    public func direction(_ type: Values.Direction) -> Area {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Area {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Values.Hint) -> Area {
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

    public func language(_ type: Values.Language) -> Area {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Area {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Values.Roles) instead")
    public func role(_ value: String) -> Area {
        return mutate(role: value)
    }
    
    public func role(_ value: Values.Role) -> Area {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> Area {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Area {
        return mutate(style: value)
    }

    public func tabIndex(_ value: Int) -> Area {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Area {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ type: Values.Decision) instead")
    public func translate(_ value: String) -> Area {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Values.Decision) -> Area {
        return mutate(translate: type.rawValue)
    }
    
    public func alternate(_ value: String) -> Area {
        return mutate(alternate: value)
    }
    
    public func coordinates(_ value: String) -> Area {
        return mutate(coords: value)
    }
    
    public func shape(_ type: Values.Shape) -> Area {
        return mutate(shape: type.rawValue)
    }
    
    public func reference(_ value: String) -> Area {
        return mutate(href: value)
    }
    
    public func reference(_ value: TemplateValue<String>) -> Area {
        return mutate(href: value.rawValue)
    }
    
    public func target(_ type: Values.Target) -> Area {
        return mutate(target: type.rawValue)
    }
    
    public func download() -> Area {
        return mutate(download: "download")
    }
    
    public func ping(_ value: String) -> Area {
        return mutate(ping: value)
    }
    
    public func relationship(_ type: Values.Relation) -> Area {
        return mutate(rel: type.rawValue)
    }
    
    public func referrerPolicy(_ type: Values.Policy) -> Area {
        return mutate(referrerpolicy: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Area {
        return mutate(key: key, value: value)
    }
    
    public func on(event: Events.Drag, _ value: String) -> Area {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> Area {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Wheel, _ value: String) -> Area {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> Area {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Mouse, _ value: String) -> Area {
        return mutate(key: event.rawValue, value: value)
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

extension Area: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}
