/*
 Abstract:
 The file contains the default definition of different nodes.
 */

import OrderedCollections

/// A type that defines a node with content.
internal protocol ContentNode: Node {

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
    
    internal func modify(_ element: Self) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: element.attributes, content: self.content)
        }
        
        attributes.merge(element.attributes!) { (_, new) in new }
       
        return .init(attributes: attributes, content: self.content)
    }
}

/// A type that defines a node without any content.
internal protocol EmptyNode: Node {

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
    
    internal func modify(_ element: Self) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: element.attributes)
        }
        
        attributes.merge(element.attributes!) { (_, new) in new }
        
        return .init(attributes: attributes)
    }
}

/// A type that defines a comment node.
internal protocol CommentNode: Node {
    
    /// The content of the node.
    var content: String { get }
}

/// The protocol defines the document node.
internal protocol DocumentNode: Node {
    
    /// The content of the node.
    var content: String { get }
}

public protocol CustomNode: Node {

    associatedtype Content
    
    /// The name of the node.
    var name: String { get set }
    
    /// The attributes of the node.
    var attributes: OrderedDictionary<String, Any>? { get }
    
    /// The content of the node.
    var content: [Content] { get }
    
    /// Initiates a node.
    ///
    /// - Parameters:
    ///    - attributes:
    ///    - content:
    init(name: String, attributes: OrderedDictionary<String, Any>?, content: [Content])
}

extension CustomNode {
    
    internal func modify(_ element: Self) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(name: element.name, attributes: element.attributes, content: self.content)
        }
        
        attributes.merge(element.attributes!) { (_, new) in new }
       
        return .init(name: element.name, attributes: attributes, content: self.content)
    }
}
