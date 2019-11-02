//
//  HTMLRenderable+Vapor.swift
//  HTMLKit

import Vapor
import HTMLKit

public struct HTMLKitProvider: Provider {

    public init() {}

    public func register(_ services: inout Services) throws {
        services.register(HTMLRenderer())
    }

    /// Called after the container has fully initialized and after `willBoot(_:)`.
    public func didBoot(_ container: Container) throws -> Future<Void> {
        return .done(on: container)
    }
}

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
    public func render<T: TemplateView>(_ type: T.Type, with context: T.Context) throws -> HTTPResponse {
        return try HTTPResponse(headers: .init([("content-type", "text/html; charset=utf-8")]), body: render(raw: type, with: context))
    }

    /// Renders a `StaticView` formula
    ///
    ///     try renderer.render(WelcomeView.self)
    ///
    /// - Parameter type: The view type to render
    /// - Returns: Returns a rendered view in a `HTTPResponse`
    /// - Throws: If the formula do not exists, or if the rendering process fails
    public func render<T>(_ type: T.Type) throws -> HTTPResponse where T : StaticView {
        return try HTTPResponse(headers: .init([("content-type", "text/html; charset=utf-8")]), body: render(raw: type))
    }

    public func render<T>(view type: T.Type) throws -> View where T : StaticView {
        guard let data = try render(raw: type).data(using: .utf8) else {
            throw Abort(.internalServerError)
        }
        return View(data: data)
    }

    public func render<T>(view type: T.Type, with context: T.Context) throws -> View where T : TemplateView {
        guard let data = try render(raw: type, with: context).data(using: .utf8) else {
            throw Abort(.internalServerError)
        }
        return View(data: data)
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

extension HTMLRenderer : Service {}

extension TemplateView {
    public func render(with context: Context, for request: Request) throws -> Future<View> {
        return request.future()
            .map { _ in
                let renderer = try request.renderer()
                do {
                    return try renderer.render(view: Self.self, with: context)
                } catch HTMLRenderer.Errors.unableToFindFormula {
                    try renderer.add(view: self)
                    return try renderer.render(view: Self.self, with: context)
                }
        }
    }
}

extension StaticView {
    public func render(for request: Request) throws -> Future<View> {
        return request.future()
            .map { _ in
                let renderer = try request.renderer()
                do {
                    return try renderer.render(view: Self.self)
                } catch HTMLRenderer.Errors.unableToFindFormula {
                    try renderer.add(view: self)
                    return try renderer.render(view: Self.self)
                }
        }
    }
}
