/*
 Abstract:
 The file contains the protocols for the layout-components.
 
 Authors:
 - Mats Moll (https://github.com/matsmoll)
 
 Contributors:
 - Mattes Mohr (https://github.com/mattesmohr)
 
 Note:
 If you about to add something to the file, stick to the official documentation to keep the code consistent.
 */

/// A type that defines a page layout.
///
/// The page covers the whole frame of a hompage. It can contain views and components.
public protocol Page: GlobalElement {
    
    /// The content of the page.
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

/// A type that defines a view layout.
///
/// The view is a single part of page. It can contain views ad components.
public protocol View: GlobalElement {
    
    associatedtype Context
    
    var context: TemplateValue<Context> { get }

    /// The content of the view.
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

/// A type that defines a component layout.
///
/// The component is a partial part of a view or page.
public protocol Component: GlobalElement {
    
    /// The content of the component.
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
