/*
 Abstract:
 The file contains the node definitions.
 
 Authors:
 - Mats Moll (https://github.com/matsmoll)
 
 Contributors:
 - Mattes Mohr: https://github.com/mattesmohr
 
 Note:
 If you about to add something to the file, stick to the official documentation to keep the code consistent.
 
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
    
    internal func merge(_ new: OrderedDictionary<String, Any>, with current: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        
        current.merge(new) { (_, new) in new }
        
        return current
    }
}

extension ContentNode where Self: Modifiable {
    
    internal func modify(_ element: Self) -> Self {
        
        guard var attributes = self.attributes else {

            return .init(attributes: element.attributes!, content: self.content)
        }
        
        return .init(attributes: merge(element.attributes!, with: &attributes), content: self.content)
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

extension ContentNode where Content == BodyElement {
    
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

extension ContentNode where Content == DescriptionElement {
    
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

extension ContentNode where Content == FigureElement {
    
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

extension ContentNode where Content == FormElement {
    
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

extension ContentNode where Content == BasicElement {
    
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

extension ContentNode where Content == HeadElement {
    
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

extension ContentNode where Content == InputElement {
    
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

extension ContentNode where Content == ListElement {
    
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

extension ContentNode where Content == MapElement {
    
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

extension ContentNode where Content == MediaElement {
    
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

extension ContentNode where Content == ObjectElement {
    
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

extension ContentNode where Content == RubyElement {
    
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

extension ContentNode where Content == TableElement {
    
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

extension ContentNode where Content == HtmlElement {
    
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

extension ContentNode where Content == VectorElement {
    
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

extension EmptyNode where Self: Modifiable {
    
    internal func modify(_ element: Self) -> Self {
        
        guard var attributes = self.attributes else {

            return .init(attributes: element.attributes!)
        }
        
        return .init(attributes: merge(element.attributes!, with: &attributes))
    }
}

/// A type that defines a comment node.
internal protocol CommentNode: AnyNode {
    
    associatedtype T
    
    /// The content of the node.
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

/// The protocol defines the document node.
internal protocol DocumentNode: AnyNode {
    
    associatedtype T
    
    /// The content of the node.
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
