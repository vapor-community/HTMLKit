//
//  HTMLRenderable+Vapor.swift
//  HTMLKit

import Vapor
import HTMLKit

public struct HTMLKitProvider: Provider {

    public init() {}

    /// Register all services you would like to provide the `Container` here.
    ///
    ///     services.register(RedisCache.self)
    ///
    public func register(_ services: inout Services) throws {
        services.register { container in
            try HTMLRendererFuture(container: container, renderer: container.make())
        }
    }

    /// Called after the container has fully initialized and after `willBoot(_:)`.
    public func didBoot(_ container: Container) throws -> Future<Void> {
        return .done(on: container)
    }
}

public struct HTMLRendererFuture: HTMLRenderable, Service {

    let container: Container
    let renderer: HTMLRenderer

    public func render<T>(raw type: T.Type) throws -> String where T : StaticView {
        try renderer.render(raw: type)
    }

    public func render<T>(raw type: T.Type, with context: T.Value) throws -> String where T : TemplateView {
        try renderer.render(raw: type, with: context)
    }

    public func render<T>(view type: T.Type) throws -> Future<Vapor.View> where T : StaticView {
        guard let data = try render(raw: type).data(using: .utf8) else {
            throw Abort(.internalServerError)
        }
        return container.future(View(data: data))
    }

    public func render<T>(view type: T.Type, with context: T.Value) throws -> Future<Vapor.View> where T : TemplateView {
        guard let data = try render(raw: type, with: context).data(using: .utf8) else {
            throw Abort(.internalServerError)
        }
        return container.future(View(data: data))
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
    public func render<T: TemplateView>(_ type: T.Type, with context: T.Value) throws -> HTTPResponse {
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
}

extension Request {

    /// Creates a `HTMLRenderer` that can render templates
    ///
    /// - Returns: A `HTMLRenderer` containing all the templates
    /// - Throws: If the shared container could not make the `HTMLRenderer`
    public func renderer() throws -> HTMLRendererFuture {
        return try sharedContainer.make(HTMLRendererFuture.self)
    }
}

extension HTMLRenderer : Service {}
