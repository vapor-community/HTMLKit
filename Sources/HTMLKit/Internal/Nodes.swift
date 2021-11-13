/// The node is for
///
///
internal protocol ContentNode {

    associatedtype T
    
    var name: String { get }
    
    var attributes: [String: Any]? { get }
    
    var content: T { get }
    
    init(attributes: [String: Any]?, content: T)
}

extension ContentNode where T == Content {
    
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

extension ContentNode where T == String {
    
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
internal protocol EmptyNode {

    var name: String { get }
    
    var attributes: [String: Any]? { get }
    
    init(attributes: [String: Any]?)
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
}

/// The node is for
///
///
internal protocol CommentNode {
    
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
internal protocol DocumentNode {
    
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
