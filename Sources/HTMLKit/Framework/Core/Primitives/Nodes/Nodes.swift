/*
 Abstract:
 The file contains the default definition of different nodes.
 */

import OrderedCollections

/// A type that defines a node with content.
internal protocol ContentNode: Node {

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
    
    internal func prerender(with formula: Formula) {
        
        formula.add(ingridient: startTag)
        
        if let layouts = content as? [Layout] {
            
            for layout in layouts {
                
                if let nodes = layout.body as? [Node] {
                    
                    for node in nodes {
                        node.prerender(with: formula)
                    }
                }
            }
        }
        
        if let nodes = content as? [Node] {
            
            for node in nodes {
                node.prerender(with: formula)
            }
        }
        
        if let contents = content as? [Content] {
            
            for content in contents {
                
                if let nodes = content as? [Node] {
                    
                    for node in nodes {
                        node.prerender(with: formula)
                    }
                }
            }
        }
        
        formula.add(ingridient: endTag)
    }
    
    internal func render<T>(with manager: ContextManager<T>) -> String {
        
        var result = ""
        
        result += startTag
        
        if let nodes = content as? [Node] {
            
            for node in nodes {
                result += node.render(with: manager)
            }
        }
        
        result += endTag
        
        return result
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
    
    internal func prerender(with formula: Formula) {
        formula.add(ingridient: startTag)
    }
    
    internal func render<T>(with manager: ContextManager<T>) -> String {
        return startTag
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
    
    internal func prerender(with formula: Formula) {
        
        formula.add(ingridient: startTag)
        formula.add(ingridient: content)
        formula.add(ingridient: endTag)
    }
    
    internal func render<T>(with manager: ContextManager<T>) -> String {
        return startTag
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
    
    internal func prerender(with formula: Formula) {       
        formula.add(ingridient: startTag)
    }
    
    internal func render<T>(with manager: ContextManager<T>) -> String {
        return startTag
    }
}
