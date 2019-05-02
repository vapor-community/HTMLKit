
extension TemplateForEach: CompiledTemplate {

    // View `CompiledTemplate` documentation
    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        switch referance {
        case .keyPath(let keyPath):
            return try manager.value(at: keyPath).reduce("") {
                try $0 + localFormula.render(with: $1)
            }
        case .root(let type):
            return try (manager.value(for: type) as! [Value.Context]).reduce("") {
                try $0 + localFormula.render(with: $1)
            }
        }
    }

    // View `BrewableFormula` documentation
    public func brew<T>(_ formula: HTMLRenderer.Formula<T>) throws {
        formula.add(mappable: self)
        try view.build().brew(localFormula)
    }
}
