import OrderedCollections

/// The node is for
///
///
internal protocol ContentNode: AnyNode {

    associatedtype Content
    
    var name: String { get }
    
    var attributes: OrderedDictionary<String, Any>? { get }
    
    var content: Content { get }
    
    init(attributes: OrderedDictionary<String, Any>?, content: Content)
}

extension ContentNode {
    
    internal func merge(_ new: OrderedDictionary<String, Any>, with current: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        
        current.merge(new) { (current, _) in current }
        
        return current
    }
}

extension ContentNode where Content == AnyContent {
    
    internal func build(_ formula: Renderer.Formula) throws {

        formula.add(string: "<\(name)")

        if let attributes = attributes {

            attributes.forEach { attribute in
                formula.add(string: " \(attribute.key)=\"\(attribute.value)\"")
            }
        }

        formula.add(string: ">")

        try content.prerender(formula)

        formula.add(string: "</\(name)>")
    }

    internal func build<T>(with manager: Renderer.ContextManager<T>) throws -> String {

        guard let attributes = attributes else {
            return try "<\(name)>\(content.render(with: manager))</\(name)>"
        }
        
        return try "<\(name)" + attributes.map { attribute in return " \(attribute.key)=\"\(attribute.value)\"" } + ">\(content.render(with: manager))</\(name)>" as! String
    }
}

extension ContentNode where Content == String {
    
    internal func build(_ formula: Renderer.Formula) throws {
        
        formula.add(string: "<\(name)")
        
        if let attributes = attributes {

            attributes.forEach { attribute in
                formula.add(string: " \(attribute.key)=\"\(attribute.value)\"")
            }
        }
        
        formula.add(string: ">")
        
        formula.add(string: content)
        
        formula.add(string: "</\(name)>")
    }

    internal func build<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        
        guard let attributes = attributes else {
            return try "<\(name)>\(content.render(with: manager))</\(name)>"
        }
        
        return try "<\(name)" + attributes.map { attribute in return " \(attribute.key)=\"\(attribute.value)\"" } + ">\(content.render(with: manager))</\(name)>" as! String
    }
}

/// The node is for
///
///
internal protocol EmptyNode: AnyNode {

    var name: String { get }
    
    var attributes: OrderedDictionary<String, Any>? { get }
    
    init(attributes: OrderedDictionary<String, Any>?)
}

extension EmptyNode {
    
    internal func build(_ formula: Renderer.Formula) throws {
        
        formula.add(string: "<\(name)")

        if let attributes = attributes {

            attributes.forEach { attribute in
                formula.add(string: " \(attribute.key)=\"\(attribute.value)\"")
            }
        }

        formula.add(string: ">")
    }

    internal func build<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        
        guard let attributes = attributes else {
            return "<\(name)>"
        }
        
        return "<\(name)" + attributes.map { attribute in return " \(attribute.key)=\"\(attribute.value)\"" } + ">" as! String
    }
    
    internal func merge(_ new: OrderedDictionary<String, Any>, with current: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        
        current.merge(new) { (current, _) in current }
        
        return current
    }
}

/// The node is for
///
///
internal protocol CommentNode: AnyNode {
    
    associatedtype T
    
    var content: T { get }
}

extension CommentNode {
    
    internal func build(_ formula: Renderer.Formula) throws {
        
        formula.add(string: "<!--\(content)-->")
    }

    internal func build<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        
        return "<!--\(content)-->"
    }
}

/// The node is for
///
///
internal protocol DocumentNode: AnyNode {
    
    associatedtype T
    
    var content: T { get }
}

extension DocumentNode {
    
    internal func build(_ formula: Renderer.Formula) throws {
        
        formula.add(string: "<!DOCTYPE \(content)>")
    }

    internal func build<T>(with manager: Renderer.ContextManager<T>) throws -> String {

        return "<!DOCTYPE \(content)>"
    }
}
