/// The protocol defines
///
///
public protocol Page: AnyContent {
    
    @ContentBuilder var body: AnyContent { get }
}

extension Page {
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try body.render(with: manager)
    }

    public func prerender(_ formula: Renderer.Formula) throws {
        try body.prerender(formula)
    }

    public var scripts: AnyContent { body.scripts }
}

/// The protocol defines
///
///
public protocol View: AnyContent {
    
    associatedtype Context
    
    var context: TemplateValue<Context> { get }

    @ContentBuilder var body: AnyContent { get }
}

extension View {
    
    public var context: TemplateValue<Context> { .root() }

    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try body.render(with: manager)
    }

    public func prerender(_ formula: Renderer.Formula) throws {
        try body.prerender(formula)
    }

    public var scripts: AnyContent { body.scripts }
}

/// The protocol defines
///
///
public protocol Component: AnyContent {
    
    @ContentBuilder var body: AnyContent { get }
}

extension Component {
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try body.render(with: manager)
    }

    public func prerender(_ formula: Renderer.Formula) throws {
        try body.prerender(formula)
    }

    public var scripts: AnyContent { body.scripts }
}
