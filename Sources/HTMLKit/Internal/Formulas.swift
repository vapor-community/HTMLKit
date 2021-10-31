/// The template is for
///
///
public protocol HTMLTemplate: HTMLContent {
    
    associatedtype Context
    
    var context: TemplateValue<Context> { get }

    var body: HTMLContent { get }
}

extension HTMLTemplate {
    
    public var context: TemplateValue<Context> { .root() }

    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        try body.render(with: manager)
    }

    public func prerender(_ formula: HTMLRenderer.Formula) throws {
        try body.prerender(formula)
    }

    public var scripts: HTMLContent { body.scripts }
}

/// The page is for
///
///
public protocol HTMLPage: HTMLContent {
    
    var body: HTMLContent { get }
}

extension HTMLPage {
    
    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        try body.render(with: manager)
    }

    public func prerender(_ formula: HTMLRenderer.Formula) throws {
        try body.prerender(formula)
    }

    public var scripts: HTMLContent { body.scripts }
}

/// The component ist for
///
///
public protocol HTMLComponent: HTMLContent {
    
    var body: HTMLContent { get }
}

extension HTMLComponent {
    
    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        try body.render(with: manager)
    }

    public func prerender(_ formula: HTMLRenderer.Formula) throws {
        try body.prerender(formula)
    }

    public var scripts: HTMLContent { body.scripts }
}
