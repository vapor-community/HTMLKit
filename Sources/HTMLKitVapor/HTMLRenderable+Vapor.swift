//
//  HTMLRenderable+Vapor.swift
//  HTMLKit

import Vapor
import HTMLKit

///// An extension that implements most of the helper functions
extension HTMLRenderable {

    /// Renders a `TemplateView` formula
    ///
    ///     try renderer.render(WelcomeView.self)
    ///
    /// - Parameters:
    ///   - type: The view type to render
    ///   - context: The needed context to render the view with
    /// - Returns: Returns a rendered view in a `HTTPResponse`
    /// - Throws: If the formula do not exists, or if the rendering process fails
    public func render<T: TemplateView>(_ type: T.Type, with context: T.Value) throws -> HTTPResponse {
        return try HTTPResponse(headers: .init([("content-type", "text/html; charset=utf-8")]), body: renderRaw(type, with: context))
    }

    /// Renders a `StaticView` formula
    ///
    ///     try renderer.render(WelcomeView.self)
    ///
    /// - Parameter type: The view type to render
    /// - Returns: Returns a rendered view in a `HTTPResponse`
    /// - Throws: If the formula do not exists, or if the rendering process fails
    public func render<T>(_ type: T.Type) throws -> HTTPResponse where T : StaticView {
        return try HTTPResponse(headers: .init([("content-type", "text/html; charset=utf-8")]), body: renderRaw(type))
    }
}

extension Request {

    /// Creates a `HTMLRenderer` that can render templates
    ///
    /// - Returns: A `HTMLRenderer` containing all the templates
    /// - Throws: If the shared container could not make the `HTMLRenderer`
    public func renderer() throws -> HTMLRenderer {
        return try sharedContainer.make(HTMLRenderer.self)
    }
}
