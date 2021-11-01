/// The node is for
///
///
public protocol ContentNode: HTMLNode {

    var content: HTMLContent { get }

    init(attributes: [HTMLAttribute], content: HTMLContent)
}

extension ContentNode {
    
    public func prerender(_ formula: HTMLRenderer.Formula) throws {
        formula.add(string: "<\(name)")
        try attributes.forEach {
            formula.add(string: " ")
            try $0.prerender(formula)
        }
        formula.add(string: ">")
        try content.prerender(formula)
        formula.add(string: "</\(name)>")
    }

    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        try "<\(name)"
            + attributes.reduce("") { try $0 + " \($1.render(with: manager))" }
            + ">\(content.render(with: manager))</\(name)>"
    }
    
    public func copy(with attributes: [HTMLAttribute]) -> Self {
        .init(attributes: attributes, content: content)
    }

    public var scripts: HTMLContent { content.scripts }
}

/// The node is for
///
///
public protocol EmptyNode: HTMLNode {

    init(attributes: [HTMLAttribute])
}

extension EmptyNode {
    
    public func prerender(_ formula: HTMLRenderer.Formula) throws {
        formula.add(string: "<\(name)")
        try attributes.forEach {
            formula.add(string: " ")
            try $0.prerender(formula)
        }
        formula.add(string: ">")
    }

    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        try "<\(name)" + attributes.reduce("") { try $0 + " \($1.render(with: manager))" } + ">"
    }
    
    public func copy(with attributes: [HTMLAttribute]) -> Self {
        .init(attributes: attributes)
    }
}
