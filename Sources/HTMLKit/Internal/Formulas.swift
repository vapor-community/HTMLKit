/// The protocol defines
///
///
public protocol HTMLTemplate: Content {
    
    associatedtype Context
    
    var context: TemplateValue<Context> { get }

    var body: Content { get }
}

extension HTMLTemplate {
    
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
public protocol HTMLPage: Content {
    
    var body: Content { get }
}

extension HTMLPage {
    
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
public protocol HTMLComponent: Content {
    
    var body: Content { get }
}

extension HTMLComponent {
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try body.render(with: manager)
    }

    public func prerender(_ formula: Renderer.Formula) throws {
        try body.prerender(formula)
    }

    public var scripts: Content { body.scripts }
}
