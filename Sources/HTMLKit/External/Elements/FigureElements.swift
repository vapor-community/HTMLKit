/// ## Description
/// The file contains the figure elements. The html element Figure only allows these elements to be its
/// descendants.
///
/// ## Note
/// If you about to add something to the file, stick to the official documentation to keep the code consistent.
///
/// ## Authors
/// Mats Moll: https://github.com/matsmoll
/// Mattes Mohr: https://github.com/mattesmohr

import OrderedCollections

/// ## Description
/// The alias points to FigureCaption.
///
public typealias Figcaption = FigureCaption

/// ## Description
/// The element is used to label a figure.
///
/// ## References
/// https://html.spec.whatwg.org/#the-figcaption-element
///
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

extension FigureCaption: GlobalAttributes {
    
    public func accessKey(_ value: String) -> FigureCaption {
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

    public func role(_ value: String) -> FigureCaption {
        return mutate(role: value)
    }

    public func hasSpellCheck(_ condition: Bool) -> FigureCaption {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> FigureCaption {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> FigureCaption {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> FigureCaption {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> FigureCaption {
        return mutate(translate: value)
    }
    
    public func custom(key: String, value: Any) -> FigureCaption {
        return mutate(key: key, value: value)
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
