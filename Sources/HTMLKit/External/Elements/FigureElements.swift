/*
 Abstract:
 The file contains the figure elements. The html-element 'figure' only allows these elements to be its descendants.
 
 Authors:
 - Mats Moll (https://github.com/matsmoll)
 
 Contributors:
 - Mattes Mohr (https://github.com/mattesmohr)
 
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
}

extension FigureCaption: GlobalAttributes, GlobalEventAttributes, GlobalAriaAttributes {
    
    public func accessKey(_ value: Character) -> FigureCaption {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> FigureCaption {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> FigureCaption {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> FigureCaption {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> FigureCaption {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> FigureCaption {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> FigureCaption {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> FigureCaption {
        return mutate(enterkeyhint: type.rawValue)
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

    public func language(_ type: Language) -> FigureCaption {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> FigureCaption {
        return mutate(nonce: value)
    }

    @available(*, deprecated, message: "use role(_ value: Roles) instead")
    public func role(_ value: String) -> FigureCaption {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> FigureCaption {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> FigureCaption {
        return mutate(spellcheck: condition)
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

    @available(*, deprecated, message: "use translate(_ type: Decision) instead")
    public func translate(_ value: String) -> FigureCaption {
        return mutate(translate: value)
    }
    
    public func translate(_ type: Decision) -> FigureCaption {
        return mutate(translate: type.rawValue)
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
    
    public func aria(current value: Accessibility.Current) -> FigureCaption {
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
    
    public func aria(hasPopup value: Accessibility.Popup) -> FigureCaption {
        return mutate(ariahaspopup: value.rawValue)
    }
    
    public func aria(hidden value: Bool) -> FigureCaption {
        return mutate(ariahidden: value)
    }
    
    public func aria(invalid value: Accessibility.Invalid) -> FigureCaption {
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
    
    public func aria(live value: Accessibility.Live) -> FigureCaption {
        return mutate(arialive: value.rawValue)
    }
    
    public func aria(owns value: String) -> FigureCaption {
        return mutate(ariaowns: value)
    }
    
    public func aria(relevant value: Accessibility.Relevant) -> FigureCaption {
        return mutate(ariarelevant: value.rawValue)
    }
    
    public func aria(roleDescription value: String) -> FigureCaption {
        return mutate(ariaroledescription: value)
    }
}

extension FigureCaption: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension FigureCaption: Modifiable {
    
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
