/// The protocol defines
///
///
public protocol Page: Content {
    
    @ContentBuilder var body: Content { get }
}

extension Page {
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try body.render(with: manager)
    }

    public func prerender(_ formula: Renderer.Formula) throws {
        try body.prerender(formula)
    }

    public var scripts: Content { body.scripts }
}

/// The protocol defines
///
///
public protocol View: Content {
    
    associatedtype Context
    
    var context: TemplateValue<Context> { get }

    @ContentBuilder var body: Content { get }
}

extension View {
    
    public var context: TemplateValue<Context> { .root() }

    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try body.render(with: manager)
    }

    public func prerender(_ formula: Renderer.Formula) throws {
        try body.prerender(formula)
    }

    public var scripts: Content { body.scripts }
}

/// The protocol defines
///
///
public protocol Component: Content {
    
    @ContentBuilder var body: Content { get }
}

extension Component {
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try body.render(with: manager)
    }

    public func prerender(_ formula: Renderer.Formula) throws {
        try body.prerender(formula)
    }

    public var scripts: Content { body.scripts }
}
