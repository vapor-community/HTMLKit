
extension TemplateEmbed: CompiledTemplate {

    // View `CompiledTemplate` documentation
    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        return try templateType.build().render(with: manager)
    }

    // View `BrewableFormula` documentation
    public func brew<R>(_ formula: HTMLRenderer.Formula<R>) throws {
        switch referance {
        case .keyPath(let path): try formula.register(keyPath: path)
        default: break
        }
        try templateType.build().brew(formula)
    }
}
