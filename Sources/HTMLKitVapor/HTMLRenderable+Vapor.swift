////
////  HTMLRenderable+Vapor.swift
////  HTMLKit
////
////  Created by Mats Mollestad on 16/09/2019.
////
//
import Vapor
import HTMLKit
//
//
/////// An extension that implements most of the helper functions
//extension HTMLRenderable {
//
//    /// Renders a `StaticView` formula
//    ///
//    ///     try renderer.render(WelcomeView.self)
//    ///
//    /// - Parameter type: The view type to render
//    /// - Returns: Returns a rendered view in a `Response`
//    /// - Throws: If the formula do not exists, or if the rendering process fails
//    public func render<T: TemplateView>(_ type: T.Type, with value: T.Value) throws -> Response {
//        return try Response(headers: .init([("content-type", "text/html; charset=utf-8")]), body: .init(string: renderRaw(type, with: value)))
//    }
//
//    public func render<T: StaticView>(_ type: T.Type) throws -> Response {
//        return try Response(headers: .init([("content-type", "text/html; charset=utf-8")]), body: .init(string: renderRaw(type)))
//    }
//}

extension HTMLRenderable {

    /// Renders a `StaticView` formula
    ///
    ///     try renderer.render(WelcomeView.self)
    ///
    /// - Parameter type: The view type to render
    /// - Returns: Returns a rendered view in a `Response`
    /// - Throws: If the formula do not exists, or if the rendering process fails
    public func render<T: TemplateView>(_ type: T.Type, with value: T.Value) throws -> HTTPResponse {
        try HTTPResponse(headers: .init([("content-type", "text/html; charset=utf-8")]), body: renderRaw(type, with: value))
    }

    public func render<T: StaticView>(_ type: T.Type) throws -> HTTPResponse {
        try HTTPResponse(headers: .init([("content-type", "text/html; charset=utf-8")]), body: renderRaw(type))
    }
}

extension HTMLRenderer: Service {}

extension Request {

    /// Creates a `HTMLRenderer` that can render templates
    ///
    /// - Returns: A `HTMLRenderer` containing all the templates
    /// - Throws: If the shared container could not make the `HTMLRenderer`
    public func renderer() throws -> HTMLRenderable {
        return try sharedContainer.make(HTMLRenderable.self)
    }
}
