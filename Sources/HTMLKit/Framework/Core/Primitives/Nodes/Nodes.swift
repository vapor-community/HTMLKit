/*
 Abstract:
 The file contains the default definition of different nodes.
 */

import OrderedCollections

/// A type that defines a node with content.
internal protocol ContentNode: Node, GlobalAttributes, GlobalEventAttributes {

    associatedtype Content
    
    /// The name of the node.
    var name: String { get }
    
    /// The attributes of the node.
    var attributes: OrderedDictionary<String, Any>? { get }
    
    /// The content of the node.
    var content: [Content] { get }
    
    /// Initiates a node.
    ///
    /// - Parameters:
    ///    - attributes:
    ///    - content:
    init(attributes: OrderedDictionary<String, Any>?, content: [Content])
}

extension ContentNode {
    
    internal var startTag: String {
        
        guard let attributes = attributes else {
            return "<\(name)>"
        }
        
        return "<\(name) \(attributes.map { "\($0.key)=\"\($0.value)\"" }.joined(separator: " "))>"
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

extension ContentNode {
    
    public func accessKey(_ value: Character) -> Self {
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

    public func isEditable(_ value: Bool) -> Self {
        return mutate(contenteditable: value)
    }

    public func direction(_ value: Values.Direction) -> Self {
        return mutate(dir: value.rawValue)
    }

    public func isDraggable(_ value: Bool) -> Self {
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

    public func `is`(_ value: String) -> Self {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Self {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Self {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Self {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Self {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Self {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Self {
        return mutate(id: value)
    }

    public func language(_ value: Values.Language) -> Self {
        return mutate(lang: value.rawValue)
    }

    public func nonce(_ value: String) -> Self {
        return mutate(nonce: value)
    }
    
    public func role(_ value: Values.Role) -> Self {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ value: Bool) -> Self {
        return mutate(spellcheck: value)
    }

    public func style(_ value: String) -> Self {
        return mutate(style: value)
    }

    public func tabIndex(_ value: Int) -> Self {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Self {
        return mutate(title: value)
    }
    
    public func translate(_ value: Values.Decision) -> Self {
        return mutate(translate: value.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Self {
        return mutate(key: key, value: value)
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
internal protocol EmptyNode: Node, GlobalAttributes, GlobalEventAttributes {

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

extension EmptyNode {
    
    internal var startTag: String {
        
        guard let attributes = attributes else {
            return "<\(name)>"
        }
        
        return "<\(name) \(attributes.map { "\($0.key)=\"\($0.value)\"" }.joined(separator: " "))>"
    }
    
    internal func modify(_ element: Self) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: element.attributes)
        }
        
        attributes.merge(element.attributes!) { (_, new) in new }
        
        return .init(attributes: attributes)
    }
}

extension EmptyNode {
    
    public func accessKey(_ value: Character) -> Self {
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

    public func isEditable(_ value: Bool) -> Self {
        return mutate(contenteditable: value)
    }

    public func direction(_ value: Values.Direction) -> Self {
        return mutate(dir: value.rawValue)
    }

    public func isDraggable(_ value: Bool) -> Self {
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

    public func `is`(_ value: String) -> Self {
        return mutate(is: value)
    }

    public func itemId(_ value: String) -> Self {
        return mutate(itemid: value)
    }

    public func itemProperty(_ value: String) -> Self {
        return mutate(itemprop: value)
    }

    public func itemReference(_ value: String) -> Self {
        return mutate(itemref: value)
    }

    public func itemScope(_ value: String) -> Self {
        return mutate(itemscope: value)
    }
    
    public func itemType(_ value: String) -> Self {
        return mutate(itemtype: value)
    }

    public func id(_ value: String) -> Self {
        return mutate(id: value)
    }

    public func language(_ value: Values.Language) -> Self {
        return mutate(lang: value.rawValue)
    }

    public func nonce(_ value: String) -> Self {
        return mutate(nonce: value)
    }
    
    public func role(_ value: Values.Role) -> Self {
        return mutate(role: value.rawValue)
    }

    public func hasSpellCheck(_ value: Bool) -> Self {
        return mutate(spellcheck: value)
    }

    public func style(_ value: String) -> Self {
        return mutate(style: value)
    }

    public func tabIndex(_ value: Int) -> Self {
        return mutate(tabindex: value)
    }

    public func title(_ value: String) -> Self {
        return mutate(title: value)
    }
    
    public func translate(_ value: Values.Decision) -> Self {
        return mutate(translate: value.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Self {
        return mutate(key: key, value: value)
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
internal protocol CommentNode: Node {
    
    /// The content of the node.
    var content: String { get }
}

extension CommentNode {
    
    internal var startTag: String {
        return "<!--"
    }
    
    internal var endTag: String {
        return "-->"
    }
}

/// The protocol defines the document node.
internal protocol DocumentNode: Node {
    
    /// The content of the node.
    var content: String { get }
}

extension DocumentNode {
    
    internal var startTag: String {
        return "<!DOCTYPE \(content)>"
    }
}
