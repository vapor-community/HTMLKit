/*
 Abstract:
 The file contains the figure elements. The html-element 'figure' only allows these elements to be its descendants.
 
 Note:
 If you about to add something to the file, stick to the official documentation to keep the code consistent.
 */

import OrderedCollections

/// The alias for the element FigureCaption.
///
/// Figcaption is the official tag and can be used instead of FigureCaption.
///
/// ```html
/// <figcaption></figcaption>
/// ```
public typealias Figcaption = FigureCaption

/// The element is used to label a figure.
///
/// ```html
/// <figcaption></figcaption>
/// ```
public struct FigureCaption: ContentNode, FigureElement {

    internal var name: String { "figcaption" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
    
    public func modify(if condition: Bool, element: (FigureCaption) -> FigureCaption) -> FigureCaption {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: TemplateValue<T?>, element: (FigureCaption, TemplateValue<T>) -> FigureCaption) -> FigureCaption {
        
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

    public func isEditable(_ value: Bool) -> FigureCaption {
        return mutate(contenteditable: value)
    }

    public func direction(_ value: Values.Direction) -> FigureCaption {
        return mutate(dir: value.rawValue)
    }

    public func isDraggable(_ value: Bool) -> FigureCaption {
        return mutate(draggable: value)
    }

    public func enterKeyHint(_ value: Values.Hint) -> FigureCaption {
        return mutate(enterkeyhint: value.rawValue)
    }

    public func hidden() -> FigureCaption {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> FigureCaption {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> FigureCaption {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> FigureCaption {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> FigureCaption {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> FigureCaption {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> FigureCaption {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> FigureCaption {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> FigureCaption {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> FigureCaption {
        return mutate(id: value.rawValue)
    }

    public func language(_ value: Values.Language) -> FigureCaption {
        return mutate(lang: value.rawValue)
    }

    public func nonce(_ value: String) -> FigureCaption {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Values.Roles) instead")
    public func role(_ value: String) -> FigureCaption {
        return mutate(role: value)
    }
    
    public func role(_ value: Values.Role) -> FigureCaption {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ value: Bool) -> FigureCaption {
        return mutate(spellcheck: value)
    }

    public func style(_ value: String) -> FigureCaption {
        return mutate(style: value)
    }

    public func tabIndex(_ value: Int) -> FigureCaption {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> FigureCaption {
        return mutate(title: value)
    }

    @available(*, deprecated, message: "use translate(_ value: Values.Decision) instead")
    public func translate(_ value: String) -> FigureCaption {
        return mutate(translate: value)
    }
    
    public func translate(_ value: Values.Decision) -> FigureCaption {
        return mutate(translate: value.rawValue)
    }
    
    public func custom(key: String, value: Any) -> FigureCaption {
        return mutate(key: key, value: value)
    }
    
    public func on(event: Events.Drag, _ value: String) -> FigureCaption {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> FigureCaption {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> FigureCaption {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Mouse, _ value: String) -> FigureCaption {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Wheel, _ value: String) -> FigureCaption {
        return mutate(key: event.rawValue, value: value)
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

extension FigureCaption: AnyContent {
    
    public func prerender(_ formula: Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}
