/// ## Description
/// The file contains the input elements. The html element Input only allows these elements to be its
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
/// The alias points to OptionGroup.
///
public typealias Optgroup = OptionGroup

/// ## Description
/// The element represents a group of options.
///
/// ## References
/// https://html.spec.whatwg.org/#the-optgroup-element
///
public struct OptionGroup: ContentNode, InputElement {

    internal var name: String { "optgroup" }

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

extension OptionGroup: GlobalAttributes, DisabledAttribute, LabelAttribute {

    public func accessKey(_ value: String) -> OptionGroup {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> OptionGroup {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> OptionGroup {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> OptionGroup {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> OptionGroup {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> OptionGroup {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> OptionGroup {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> OptionGroup {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> OptionGroup {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> OptionGroup {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> OptionGroup {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> OptionGroup {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> OptionGroup {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> OptionGroup {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> OptionGroup {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> OptionGroup {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> OptionGroup {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> OptionGroup {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> OptionGroup {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> OptionGroup {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> OptionGroup {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> OptionGroup {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> OptionGroup {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> OptionGroup {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> OptionGroup {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> OptionGroup {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> OptionGroup {
        return mutate(translate: value)
    }

    public func disabled() -> OptionGroup {
        return mutate(disabled: "disabled")
    }
    
    public func label(_ value: String) -> OptionGroup {
        return mutate(label: value)
    }
    
    public func custom(key: String, value: Any) -> OptionGroup {
        return mutate(key: key, value: value)
    }
}

extension OptionGroup: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension OptionGroup: Modifiable {
    
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

/// ## Description
/// The element represents an option.
///
/// ## References
/// https://html.spec.whatwg.org/#the-option-element
///
public struct Option: ContentNode, InputElement {

    internal var name: String { "option" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [String]

    public init(@ContentBuilder<String> content: () -> [String]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [String]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Option: GlobalAttributes, DisabledAttribute, LabelAttribute, ValueAttribute {
    
    public func accessKey(_ value: String) -> Option {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Option {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Option {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Option {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Option {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Option {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Option {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Option {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Option {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Option {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Option {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Option {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Option {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Option {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Option {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Option {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Option {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Option {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> Option {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Option {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> Option {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> Option {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> Option {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Option {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Option {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Option {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Option {
        return mutate(translate: value)
    }

    public func disabled() -> Option {
        return mutate(disabled: "disabled")
    }
    
    public func label(_ value: String) -> Option {
        return mutate(label: value)
    }
    
    public func value(_ value: String) -> Option {
        return mutate(value: value)
    }
    
    public func value(_ value: TemplateValue<String>) -> Option {
        return mutate(value: value.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Option {
        return mutate(key: key, value: value)
    }
}

extension Option: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Option: Modifiable {
    
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

/// ## Description
/// The element represents a caption for the rest of the contents of a fieldset.
///
/// ## References
/// https://html.spec.whatwg.org/#the-legend-element
///
public struct Legend: ContentNode, InputElement {

    internal var name: String { "legend" }

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

extension Legend: GlobalAttributes {
    
    public func accessKey(_ value: String) -> Legend {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Legend {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Legend {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Legend {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Legend {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Legend {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Legend {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Legend {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Legend {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Legend {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Legend {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Legend {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Legend {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Legend {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Legend {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Legend {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Legend {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Legend {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> Legend {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Legend {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> Legend {
        return mutate(role: value)
    }

    public func role(_ value: Roles) -> Legend {
        return mutate(role: value.rawValue)
    }
    
    public func hasSpellCheck(_ condition: Bool) -> Legend {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Legend {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Legend {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Legend {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Legend {
        return mutate(translate: value)
    }
    
    public func custom(key: String, value: Any) -> Legend {
        return mutate(key: key, value: value)
    }
}

extension Legend: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Legend: Modifiable {
    
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

/// ## Description
/// The element represents a summary, caption, or legend for the rest of the content.
///
/// ## References
/// https://html.spec.whatwg.org/#the-summary-element
///
public struct Summary: ContentNode, InputElement {

    internal var name: String { "summary" }

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

extension Summary: GlobalAttributes {
    
    public func accessKey(_ value: String) -> Summary {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ type: Capitalization) -> Summary {
        return mutate(autocapitalize: type.rawValue)
    }

    public func autofocus() -> Summary {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Summary {
        return mutate(class: value)
    }

    public func isEditable(_ condition: Bool) -> Summary {
        return mutate(contenteditable: condition)
    }

    public func direction(_ type: Direction) -> Summary {
        return mutate(dir: type.rawValue)
    }

    public func isDraggable(_ condition: Bool) -> Summary {
        return mutate(draggable: condition)
    }

    public func enterKeyHint(_ type: Hint) -> Summary {
        return mutate(enterkeyhint: type.rawValue)
    }

    public func hidden() -> Summary {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Summary {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Summary {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Summary {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Summary {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Summary {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Summary {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Summary {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Summary {
        return mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Summary {
        return mutate(id: value.rawValue)
    }

    public func language(_ type: Language) -> Summary {
        return mutate(lang: type.rawValue)
    }

    public func nonce(_ value: String) -> Summary {
        return mutate(nonce: value)
    }

    public func role(_ value: String) -> Summary {
        return mutate(role: value)
    }
    
    public func role(_ value: Roles) -> Summary {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ condition: Bool) -> Summary {
        return mutate(spellcheck: condition)
    }

    public func style(_ value: String) -> Summary {
        return mutate(style: value)
    }

    public func tabIndex(_ value: String) -> Summary {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Summary {
        return mutate(title: value)
    }

    public func translate(_ value: String) -> Summary {
        return mutate(translate: value)
    }
    
    public func custom(key: String, value: Any) -> Summary {
        return mutate(key: key, value: value)
    }
}

extension Summary: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

extension Summary: Modifiable {
    
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
