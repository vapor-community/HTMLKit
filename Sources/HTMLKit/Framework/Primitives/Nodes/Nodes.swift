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
    var attributes: OrderedDictionary<String, AttributeData>? { get }
    
    /// The content of the node.
    var content: [Content] { get }
    
    /// The context of the node.
    var context: EscapeContext { get }
    
    /// Initiates a node.
    ///
    /// - Parameters:
    ///    - attributes:
    ///    - content:
    init(attributes: OrderedDictionary<String, AttributeData>?, context: EscapeContext, content: [Content])
}

extension ContentNode {
    
    /// Replaces the attributes, with the new values taking precedence.
    /// 
    /// - Parameter element: The element to replace with.
    /// 
    /// - Returns: The element
    internal func replace(_ element: Self) -> Self {
        
        guard var lhs = self.attributes else {
            return element
        }
        
        guard let rhs = element.attributes else {
            return self
        }
        
        lhs.merge(rhs) { (_, new) in new }
       
        return .init(attributes: lhs, context: self.context, content: self.content)
    }
    
    /// Combines the attributes, incorporating the new values.
    /// 
    /// - Parameter element: The element to combine with.
    /// 
    /// - Returns: The element
    internal func combine(_ element: Self) -> Self {
        
        guard var lhs = self.attributes else {
            return element
        }
        
        guard let rhs = element.attributes else {
            return self
        }
        
        for (key, value) in rhs {
            
            if let attribute = lhs[key] {
                
                switch (attribute.value, value.value) {
                case (.list(var old), .list(let new)):
                    
                    if old != new {
                        
                        old.append(new.values)
                        
                        lhs[key] = .init(old, context: value.context)
                    }
                    
                default:
                    lhs[key] = value
                }
                
            } else {
                lhs[key] = value
            }
        }
       
        return .init(attributes: lhs, context: self.context, content: self.content)
    }
}

/// A type that defines a node without any content.
@_documentation(visibility: internal)
internal protocol EmptyNode: Node {

    /// The name of the node.
    var name: String { get }
    
    /// The attributes of the node.
    var attributes: OrderedDictionary<String, AttributeData>? { get }
    
    /// Initiates a node.
    ///
    /// - Parameters:
    ///    - attributes:
    init(attributes: OrderedDictionary<String, AttributeData>?)
}

extension EmptyNode {
    
    /// Replaces the attributes, with the new values taking precedence.
    /// 
    /// - Parameter element: The element to replace with.
    /// 
    /// - Returns: The element
    internal func replace(_ element: Self) -> Self {
        
        guard var lhs = self.attributes else {
            return element
        }
        
        guard let rhs = element.attributes else {
            return self
        }
        
        lhs.merge(rhs) { (_, new) in new }
        
        return .init(attributes: lhs)
    }
    
    /// Combines the attributes, incorporating the new values.
    /// 
    /// - Parameter element: The element to combine with.
    /// 
    /// - Returns: The element
    internal func combine(_ element: Self) -> Self {
        
        guard var lhs = self.attributes else {
            return element
        }
        
        guard let rhs = element.attributes else {
            return self
        }
        
        for (key, value) in rhs {
            
            if let attribute = lhs[key] {
                
                switch (attribute.value, value.value) {
                case (.list(var old), .list(let new)):
                    
                    if old != new {
                        
                        old.append(new.values)
                        
                        lhs[key] = .init(old, context: value.context)
                    }
                    
                default:
                    lhs[key] = value
                }
                
            } else {
                lhs[key] = value
            }
        }
       
        return .init(attributes: lhs)
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
    var attributes: OrderedDictionary<String, AttributeData>? { get }
    
    /// The content of the node.
    var content: [Content] { get }
    
    /// The context of the node.
    var context: EscapeContext { get }
    
    /// Initiates a node.
    ///
    /// - Parameters:
    ///    - attributes:
    ///    - content:
    init(name: String, attributes: OrderedDictionary<String, AttributeData>?, context: EscapeContext, content: [Content])
}

extension CustomNode {
    
    /// Replaces the attributes, with the new values taking precedence.
    /// 
    /// - Parameter element: The element to replace with.
    /// 
    /// - Returns: The element
    internal func replace(_ element: Self) -> Self {
        
        guard var lhs = self.attributes else {
            return element
        }
        
        guard let rhs = element.attributes else {
            return self
        }
        
        lhs.merge(rhs) { (_, new) in new }
       
        return .init(name: element.name, attributes: lhs, context: self.context, content: self.content)
    }
    
    /// Combines the attributes, incorporating the new values.
    /// 
    /// - Parameter element: The element to combine with.
    /// 
    /// - Returns: The element
    internal func combine(_ element: Self) -> Self {
        
        guard var lhs = self.attributes else {
            return element
        }
        
        guard let rhs = element.attributes else {
            return self
        }
        
        for (key, value) in rhs {
            
            if let attribute = lhs[key] {
                
                switch (attribute.value, value.value) {
                case (.list(var old), .list(let new)):
                    
                    if old != new {
                        
                        old.append(new.values)
                        
                        lhs[key] = .init(old, context: value.context)
                    }
                    
                default:
                    lhs[key] = value
                }
                
            } else {
                lhs[key] = value
            }
        }
       
        return .init(name: element.name, attributes: lhs, context: self.context, content: self.content)
    }
}
