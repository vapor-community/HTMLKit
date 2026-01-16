/*
 Abstract:
 The file contains the default definition of different nodes.
 */

import OrderedCollections

/// A type that defines a node with content.
@_documentation(visibility: internal)
internal protocol ContentNode: Node {

    associatedtype Content
    
    /// The name of the node.
    var name: String { get }
    
    /// The attributes of the node.
    var attributes: OrderedDictionary<String, Any>? { get }
    
    /// The content of the node.
    var content: [Content] { get }
    
    /// The context of the node.
    var context: EscapeContext { get }
    
    /// Initiates a node.
    ///
    /// - Parameters:
    ///    - attributes:
    ///    - content:
    init(attributes: OrderedDictionary<String, Any>?, context: EscapeContext, content: [Content])
}

extension ContentNode {
    
    internal func modify(_ element: Self) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: element.attributes, context: self.context, content: self.content)
        }
        
        attributes.merge(element.attributes!) { (_, new) in new }
       
        return .init(attributes: attributes, context: self.context, content: self.content)
    }
}

/// A type that defines a node without any content.
@_documentation(visibility: internal)
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
@_documentation(visibility: internal)
internal protocol CommentNode: Node {
    
    /// The content of the node.
    var content: String { get }
    
    /// The context of the node.
    var context: EscapeContext { get }
}

/// The protocol defines the document node.
@_documentation(visibility: internal)
internal protocol DocumentNode: Node {
    
    /// The content of the node.
    var content: String { get }
    
    /// The context of the node.
    var context: EscapeContext { get }
}

@_documentation(visibility: internal)
public protocol CustomNode: Node {

    associatedtype Content
    
    /// The name of the node.
    var name: String { get set }
    
    /// The attributes of the node.
    var attributes: OrderedDictionary<String, Any>? { get }
    
    /// The content of the node.
    var content: [Content] { get }
    
    /// The context of the node.
    var context: EscapeContext { get }
    
    /// Initiates a node.
    ///
    /// - Parameters:
    ///    - attributes:
    ///    - content:
    init(name: String, attributes: OrderedDictionary<String, Any>?, context: EscapeContext, content: [Content])
}

extension CustomNode {
    
    internal func modify(_ element: Self) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(name: element.name, attributes: element.attributes, context: self.context, content: self.content)
        }
        
        attributes.merge(element.attributes!) { (_, new) in new }
       
        return .init(name: element.name, attributes: attributes, context: self.context, content: self.content)
    }
}
