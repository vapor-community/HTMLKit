
extension HTML.EmbedTemplate: CompiledTemplate {

    // View `CompiledTemplate` documentation
    public func render<T>(with manager: HTML.Renderer.ContextManager<T>) throws -> String {
        return try templateType.build().render(with: manager)
    }

    // View `BrewableFormula` documentation
    public func brew<R>(_ formula: HTML.Renderer.Formula<R>) throws {
        try formula.register(keyPath: contextKeyPath)
        try templateType.build().brew(formula)
    }
}
