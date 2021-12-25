/// ## Description
/// The file contains layout components.
///
/// ## Note
/// If you about to add something to the file, stick to the official documentation to keep the code consistent.
///
/// ## Authors
/// Mats Moll: https://github.com/matsmoll
/// Mattes Mohr: https://github.com/mattesmohr

/// ## Description
/// The protocol is for
///
/// ## References
///
public protocol Page: GlobalElement {
    
    @ContentBuilder<AnyContent> var body: AnyContent { get }
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

/// ## Description
/// The protocol is for
///
/// ## References
///
public protocol View: GlobalElement {
    
    associatedtype Context
    
    var context: TemplateValue<Context> { get }

    @ContentBuilder<AnyContent> var body: AnyContent { get }
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

/// ## Description
/// The protocol is for
///
/// ## References
///
public protocol Component: GlobalElement {
    
    @ContentBuilder<AnyContent> var body: AnyContent { get }
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
