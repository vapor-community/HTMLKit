/*
 Abstract:
 The file contains the default definition of different nodes.
 */

import OrderedCollections

/// A type that defines a node with content.
internal protocol ContentNode: AnyNode {

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

/// A type that defines a node without any content.
internal protocol EmptyNode: AnyNode {

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

/// A type that defines a comment node.
internal protocol CommentNode: AnyNode {
    
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
internal protocol DocumentNode: AnyNode {
    
    /// The content of the node.
    var content: String { get }
}

extension DocumentNode {
    
    internal var startTag: String {
        return "<!DOCTYPE \(content)>"
    }
}
