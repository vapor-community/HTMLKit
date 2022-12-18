/*
 Abstract:
 The file contains the default definition of different elements.
 */

import OrderedCollections

/// A type that defines a node with content.
internal protocol ContentElement: Element, GlobalAttributes, GlobalAriaAttributes, GlobalEventAttributes {

    associatedtype ContentType
    
    /// The name of the node.
    var name: String { get }
    
    /// The attributes of the node.
    var attributes: OrderedDictionary<String, Any>? { get }
    
    /// The content of the node.
    var content: [ContentType] { get }
    
    /// Initiates a node.
    ///
    /// - Parameters:
    ///    - attributes:
    ///    - content:
    init(attributes: OrderedDictionary<String, Any>?, content: [ContentType])
}

extension ContentElement {
    
    internal var startTag: String {
        
        if attributes != nil {
            return "<\(name) %attributes%>"
        }
        
        return "<\(name)>"
    }
    
    internal var endTag: String {
        return "</\(name)>"
    }
    
    internal func modify(_ element: Self) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: element.attributes, content: self.content)
        }
        
        attributes.merge(element.attributes!) { (_, new) in new }
       
        return .init(attributes: attributes, content: self.content)
    }
}

extension ContentElement {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: Property<T?>, element: (Self, Property<T>) -> Self) -> Self {
        
        switch value {
        case .constant(let optional):
            
            guard let optional else {
                return self
            }
            
            return self.modify(element(self, .constant(optional)))
            
        case .variable(let variable):
            return self.modify(element(self, .variable(variable.unsafeCast(to: T.self))))
        }
    }
}

extension ContentElement {
    
    public func custom(key: String, value: Any) -> Self {
        return mutate(key: key, value: value)
    }
    
    public func accessKey(_ value: Character) -> Self {
        return mutate(accesskey: value)
    }
    
    public func accessKey(_ value: Property<Character>) -> Self {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ value: Values.Capitalization) -> Self {
        return mutate(autocapitalize: value.rawValue)
    }

    public func autofocus() -> Self {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Self {
        return mutate(class: value)
    }
    
    public func `class`(_ value: Property<String>) -> Self {
        return mutate(class: value)
    }

    public func isEditable(_ value: Bool) -> Self {
        return mutate(contenteditable: value)
    }
    
    public func isEditable(_ value: Property<Bool>) -> Self {
        return mutate(contenteditable: value)
    }

    public func direction(_ value: Values.Direction) -> Self {
        return mutate(dir: value.rawValue)
    }

    public func isDraggable(_ value: Bool) -> Self {
        return mutate(draggable: value)
    }
    
    public func isDraggable(_ value: Property<String>) -> Self {
        return mutate(draggable: value)
    }

    public func enterKeyHint(_ value: Values.Hint) -> Self {
        return mutate(enterkeyhint: value.rawValue)
    }

    public func hidden() -> Self {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Self {
        return mutate(inputmode: value)
    }
    
    public func inputMode(_ value: Property<String>) -> Self {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Self {
        return mutate(is: value)
    }
    
    public func `is`(_ value: Property<String>) -> Self {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Self {
        return mutate(itemid: value)
    }
    
    public func itemId(_ value: Property<String>) -> Self {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Self {
        return mutate(itemprop: value)
    }
    
    public func itemProperty(_ value: Property<String>) -> Self {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Self {
        return mutate(itemref: value)
    }
    
    public func itemReference(_ value: Property<String>) -> Self {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Self {
        return mutate(itemscope: value)
    }
    
    public func itemScope(_ value: Property<String>) -> Self {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Self {
        return mutate(itemtype: value)
    }
    
    public func itemType(_ value: Property<String>) -> Self {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Self {
        return mutate(id: value)
    }
    
    public func id(_ value: Property<String>) -> Self {
        return mutate(id: value)
    }

    public func language(_ value: Values.Language) -> Self {
        return mutate(lang: value.rawValue)
    }

    public func nonce(_ value: String) -> Self {
        return mutate(nonce: value)
    }
    
    public func nonce(_ value: Property<String>) -> Self {
        return mutate(nonce: value)
    }
    
    public func role(_ value: Values.Role) -> Self {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ value: Bool) -> Self {
        return mutate(spellcheck: value)
    }
    
    public func hasSpellCheck(_ value: Property<Bool>) -> Self {
        return mutate(spellcheck: value)
    }

    public func style(_ value: String) -> Self {
        return mutate(style: value)
    }
    
    public func style(_ value: Property<String>) -> Self {
        return mutate(style: value)
    }

    public func tabIndex(_ value: Int) -> Self {
        return mutate(tabindex: value)
    }
    
    public func tabIndex(_ value: Property<Int>) -> Self {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Self {
        return mutate(title: value)
    }
    
    public func title(_ value: Property<String>) -> Self {
        return mutate(title: value)
    }
    
    public func translate(_ value: Values.Decision) -> Self {
        return mutate(translate: value.rawValue)
    }
    
    public func aria(atomic value: Bool) -> Self {
        return mutate(ariaatomic: value)
    }
    
    public func aria(atomic value: Property<Bool>) -> Self {
        return mutate(ariaatomic: value)
    }
    
    public func aria(busy value: Bool) -> Self {
        return mutate(ariabusy: value)
    }
    
    public func aria(busy value: Property<Bool>) -> Self {
        return mutate(ariabusy: value)
    }
    
    public func aria(controls value: String) -> Self {
        return mutate(ariacontrols: value)
    }
    
    public func aria(controls value: Property<String>) -> Self {
        return mutate(ariacontrols: value)
    }
    
    public func aria(current value: Values.Accessibility.Current) -> Self {
        return mutate(ariacurrent: value.rawValue)
    }
    
    public func aria(describedBy value: String) -> Self {
        return mutate(ariadescribedby: value)
    }
    
    public func aria(describedBy value: Property<String>) -> Self {
        return mutate(ariadescribedby: value)
    }
    
    public func aria(details value: String) -> Self {
        return mutate(ariadetails: value)
    }
    
    public func aria(details value: Property<String>) -> Self {
        return mutate(ariadetails: value)
    }
    
    public func aria(disabled value: Bool) -> Self {
        return mutate(ariadisabled: value)
    }
    
    public func aria(disabled value: Property<Bool>) -> Self {
        return mutate(ariadisabled: value)
    }
    
    public func aria(errorMessage value: String) -> Self {
        return mutate(ariaerrormessage: value)
    }
    
    public func aria(errorMessage value: Property<String>) -> Self {
        return mutate(ariaerrormessage: value)
    }
    
    public func aria(flowTo value: String) -> Self {
        return mutate(ariaflowto: value)
    }
    
    public func aria(flowTo value: Property<String>) -> Self {
        return mutate(ariaflowto: value)
    }
    
    public func aria(hasPopup value: Values.Accessibility.Popup) -> Self {
        return mutate(ariahaspopup: value.rawValue)
    }
    
    public func aria(hidden value: Bool) -> Self {
        return mutate(ariahidden: value)
    }
    
    public func aria(hidden value: Property<Bool>) -> Self {
        return mutate(ariahidden: value)
    }
    
    public func aria(invalid value: Values.Accessibility.Invalid) -> Self {
        return mutate(ariainvalid: value.rawValue)
    }
    
    public func aria(keyShortcuts value: String) -> Self {
        return mutate(ariakeyshortcuts: value)
    }
    
    public func aria(keyShortcuts value: Property<String>) -> Self {
        return mutate(ariakeyshortcuts: value)
    }
    
    public func aria(label value: String) -> Self {
        return mutate(arialabel: value)
    }
    
    public func aria(label value: Property<String>) -> Self {
        return mutate(arialabel: value)
    }
    
    public func aria(labeledBy value: String) -> Self {
        return mutate(arialabeledby: value)
    }
    
    public func aria(labeledBy value: Property<String>) -> Self {
        return mutate(arialabeledby: value)
    }
    
    public func aria(live value: Values.Accessibility.Live) -> Self {
        return mutate(arialive: value.rawValue)
    }
    
    public func aria(owns value: String) -> Self {
        return mutate(ariaowns: value)
    }
    
    public func aria(owns value: Property<String>) -> Self {
        return mutate(ariaowns: value)
    }
    
    public func aria(relevant value: Values.Accessibility.Relevant) -> Self {
        return mutate(ariarelevant: value.rawValue)
    }
    
    public func aria(roleDescription value: String) -> Self {
        return mutate(ariaroledescription: value)
    }
    
    public func aria(roleDescription value: Property<String>) -> Self {
        return mutate(ariaroledescription: value)
    }
    
    public func on(event: Events.Drag, _ value: String) -> Self {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> Self {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> Self {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Mouse, _ value: String) -> Self {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Wheel, _ value: String) -> Self {
        return mutate(key: event.rawValue, value: value)
    }
}

/// A type that defines a node without any content.
internal protocol EmptyElement: Element, GlobalAttributes, GlobalAriaAttributes, GlobalEventAttributes {

    /// The name of the node.
    var name: String { get }
    
    /// The attributes of the node.
    var attributes: OrderedDictionary<String, Any>? { get }
    
    /// Initiates a node.
    ///
    /// - Parameters:
    ///    - attributes:
    init(attributes: OrderedDictionary<String, Any>?)
}

extension EmptyElement {
    
    internal var startTag: String {
        
        if attributes != nil {
            return "<\(name) %attributes%>"
        }
        
        return "<\(name)>"
    }
    
    internal func modify(_ element: Self) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: element.attributes)
        }
        
        attributes.merge(element.attributes!) { (_, new) in new }
        
        return .init(attributes: attributes)
    }
}

extension EmptyElement {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: Property<T?>, element: (Self, Property<T>) -> Self) -> Self {

        switch value {
        case .constant(let optional):
            
            guard let optional else {
                return self
            }
            
            return self.modify(element(self, .constant(optional)))
            
        case .variable(let variable):
            return self.modify(element(self, .variable(variable.unsafeCast(to: T.self))))
        }
    }
}

extension EmptyElement {
    
    public func custom(key: String, value: Any) -> Self {
        return mutate(key: key, value: value)
    }
    
    public func accessKey(_ value: Character) -> Self {
        return mutate(accesskey: value)
    }
    
    public func accessKey(_ value: Property<Character>) -> Self {
        return mutate(accesskey: value)
    }

    public func autocapitalize(_ value: Values.Capitalization) -> Self {
        return mutate(autocapitalize: value.rawValue)
    }

    public func autofocus() -> Self {
        return mutate(autofocus: "autofocus")
    }

    public func `class`(_ value: String) -> Self {
        return mutate(class: value)
    }
    
    public func `class`(_ value: Property<String>) -> Self {
        return mutate(class: value)
    }

    public func isEditable(_ value: Bool) -> Self {
        return mutate(contenteditable: value)
    }
    
    public func isEditable(_ value: Property<Bool>) -> Self {
        return mutate(contenteditable: value)
    }

    public func direction(_ value: Values.Direction) -> Self {
        return mutate(dir: value.rawValue)
    }

    public func isDraggable(_ value: Bool) -> Self {
        return mutate(draggable: value)
    }
    
    public func isDraggable(_ value: Property<String>) -> Self {
        return mutate(draggable: value)
    }

    public func enterKeyHint(_ value: Values.Hint) -> Self {
        return mutate(enterkeyhint: value.rawValue)
    }

    public func hidden() -> Self {
        return mutate(hidden: "hidden")
    }

    public func inputMode(_ value: String) -> Self {
        return mutate(inputmode: value)
    }
    
    public func inputMode(_ value: Property<String>) -> Self {
        return mutate(inputmode: value)
    }

    public func `is`(_ value: String) -> Self {
        return mutate(is: value)
    }
    
    public func `is`(_ value: Property<String>) -> Self {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Self {
        return mutate(itemid: value)
    }
    
    public func itemId(_ value: Property<String>) -> Self {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Self {
        return mutate(itemprop: value)
    }
    
    public func itemProperty(_ value: Property<String>) -> Self {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Self {
        return mutate(itemref: value)
    }
    
    public func itemReference(_ value: Property<String>) -> Self {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Self {
        return mutate(itemscope: value)
    }
    
    public func itemScope(_ value: Property<String>) -> Self {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Self {
        return mutate(itemtype: value)
    }
    
    public func itemType(_ value: Property<String>) -> Self {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Self {
        return mutate(id: value)
    }
    
    public func id(_ value: Property<String>) -> Self {
        return mutate(id: value)
    }

    public func language(_ value: Values.Language) -> Self {
        return mutate(lang: value.rawValue)
    }

    public func nonce(_ value: String) -> Self {
        return mutate(nonce: value)
    }
    
    public func nonce(_ value: Property<String>) -> Self {
        return mutate(nonce: value)
    }
    
    public func role(_ value: Values.Role) -> Self {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ value: Bool) -> Self {
        return mutate(spellcheck: value)
    }
    
    public func hasSpellCheck(_ value: Property<Bool>) -> Self {
        return mutate(spellcheck: value)
    }

    public func style(_ value: String) -> Self {
        return mutate(style: value)
    }
    
    public func style(_ value: Property<String>) -> Self {
        return mutate(style: value)
    }

    public func tabIndex(_ value: Int) -> Self {
        return mutate(tabindex: value)
    }
    
    public func tabIndex(_ value: Property<Int>) -> Self {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Self {
        return mutate(title: value)
    }
    
    public func title(_ value: Property<String>) -> Self {
        return mutate(title: value)
    }
    
    public func translate(_ value: Values.Decision) -> Self {
        return mutate(translate: value.rawValue)
    }
    
    public func aria(atomic value: Bool) -> Self {
        return mutate(ariaatomic: value)
    }
    
    public func aria(atomic value: Property<Bool>) -> Self {
        return mutate(ariaatomic: value)
    }
    
    public func aria(busy value: Bool) -> Self {
        return mutate(ariabusy: value)
    }
    
    public func aria(busy value: Property<Bool>) -> Self {
        return mutate(ariabusy: value)
    }
    
    public func aria(controls value: String) -> Self {
        return mutate(ariacontrols: value)
    }
    
    public func aria(controls value: Property<String>) -> Self {
        return mutate(ariacontrols: value)
    }
    
    public func aria(current value: Values.Accessibility.Current) -> Self {
        return mutate(ariacurrent: value.rawValue)
    }
    
    public func aria(describedBy value: String) -> Self {
        return mutate(ariadescribedby: value)
    }
    
    public func aria(describedBy value: Property<String>) -> Self {
        return mutate(ariadescribedby: value)
    }
    
    public func aria(details value: String) -> Self {
        return mutate(ariadetails: value)
    }
    
    public func aria(details value: Property<String>) -> Self {
        return mutate(ariadetails: value)
    }
    
    public func aria(disabled value: Bool) -> Self {
        return mutate(ariadisabled: value)
    }
    
    public func aria(disabled value: Property<Bool>) -> Self {
        return mutate(ariadisabled: value)
    }
    
    public func aria(errorMessage value: String) -> Self {
        return mutate(ariaerrormessage: value)
    }
    
    public func aria(errorMessage value: Property<String>) -> Self {
        return mutate(ariaerrormessage: value)
    }
    
    public func aria(flowTo value: String) -> Self {
        return mutate(ariaflowto: value)
    }
    
    public func aria(flowTo value: Property<String>) -> Self {
        return mutate(ariaflowto: value)
    }
    
    public func aria(hasPopup value: Values.Accessibility.Popup) -> Self {
        return mutate(ariahaspopup: value.rawValue)
    }
    
    public func aria(hidden value: Bool) -> Self {
        return mutate(ariahidden: value)
    }
    
    public func aria(hidden value: Property<Bool>) -> Self {
        return mutate(ariahidden: value)
    }
    
    public func aria(invalid value: Values.Accessibility.Invalid) -> Self {
        return mutate(ariainvalid: value.rawValue)
    }
    
    public func aria(keyShortcuts value: String) -> Self {
        return mutate(ariakeyshortcuts: value)
    }
    
    public func aria(keyShortcuts value: Property<String>) -> Self {
        return mutate(ariakeyshortcuts: value)
    }
    
    public func aria(label value: String) -> Self {
        return mutate(arialabel: value)
    }
    
    public func aria(label value: Property<String>) -> Self {
        return mutate(arialabel: value)
    }
    
    public func aria(labeledBy value: String) -> Self {
        return mutate(arialabeledby: value)
    }
    
    public func aria(labeledBy value: Property<String>) -> Self {
        return mutate(arialabeledby: value)
    }
    
    public func aria(live value: Values.Accessibility.Live) -> Self {
        return mutate(arialive: value.rawValue)
    }
    
    public func aria(owns value: String) -> Self {
        return mutate(ariaowns: value)
    }
    
    public func aria(owns value: Property<String>) -> Self {
        return mutate(ariaowns: value)
    }
    
    public func aria(relevant value: Values.Accessibility.Relevant) -> Self {
        return mutate(ariarelevant: value.rawValue)
    }
    
    public func aria(roleDescription value: String) -> Self {
        return mutate(ariaroledescription: value)
    }
    
    public func aria(roleDescription value: Property<String>) -> Self {
        return mutate(ariaroledescription: value)
    }
    
    public func on(event: Events.Drag, _ value: String) -> Self {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Clipboard, _ value: String) -> Self {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Keyboard, _ value: String) -> Self {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Mouse, _ value: String) -> Self {
        return mutate(key: event.rawValue, value: value)
    }
    
    public func on(event: Events.Wheel, _ value: String) -> Self {
        return mutate(key: event.rawValue, value: value)
    }
}

/// A type that defines a comment node.
internal protocol CommentElement: Content {
    
    /// The content of the node.
    var content: String { get }
}

extension CommentElement {
    
    internal var startTag: String {
        return "<!--"
    }
    
    internal var endTag: String {
        return "-->"
    }
}

/// The protocol defines the document node.
internal protocol DocumentElement: Content {
    
    /// The content of the node.
    var content: String { get }
}

extension DocumentElement {
    
    internal var startTag: String {
        return "<!DOCTYPE \(content)>"
    }
}
