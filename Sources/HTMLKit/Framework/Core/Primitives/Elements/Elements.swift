/*
 Abstract:
 The file contains the default definition of different elements.
 */

import OrderedCollections

/// A type that defines a node with content.
internal protocol ContentElement: Element {

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

extension ContentElement {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: Property<T?>, element: (Self, Property<T>) -> Self) -> Self {
        return self.modify(element(self, value.unsafeCast(to: T.self)))
    }
}

/// A type that defines a node without any content.
internal protocol EmptyElement: Element {

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

extension EmptyElement {
    
    public func modify(if condition: Bool, element: (Self) -> Self) -> Self {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: Property<T?>, element: (Self, Property<T>) -> Self) -> Self {
        return self.modify(element(self, value.unsafeCast(to: T.self)))
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
