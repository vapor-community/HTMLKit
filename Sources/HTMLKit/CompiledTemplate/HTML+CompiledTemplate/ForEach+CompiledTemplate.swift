
extension HTML.ForEach: CompiledTemplate {

    // View `CompiledTemplate` documentation
    public func render<T>(with manager: HTML.Renderer.ContextManager<T>) throws -> String {
        return try manager.value(at: collectionPath).reduce("") {
            try $0 + localFormula.render(with: $1)
        }
    }

    // View `BrewableFormula` documentation
    public func brew<T>(_ formula: HTML.Renderer.Formula<T>) throws {
        formula.add(mappable: self)
        try view.build().brew(localFormula)
    }
}
