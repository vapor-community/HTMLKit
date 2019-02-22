
extension HTML.EmbedViewTemplate: CompiledTemplate {

    public func render<T>(with manager: HTML.Renderer.ContextManager<T>) throws -> String {
        return try templateType.build(with: viewContext).render(with: manager)
    }

    public func brew<R>(_ formula: HTML.Renderer.Formula<R>) throws {
        formula.register(keyPath: contextKeyPath)
        try templateType.build(with: viewContext).brew(formula)
    }
}

extension HTML.EmbedTemplate: CompiledTemplate {

    public func render<T>(with manager: HTML.Renderer.ContextManager<T>) throws -> String {
        return try templateType.build().render(with: manager)
    }

    public func brew<R>(_ formula: HTML.Renderer.Formula<R>) throws {
        formula.register(keyPath: contextKeyPath)
        try templateType.build().brew(formula)
    }
}
