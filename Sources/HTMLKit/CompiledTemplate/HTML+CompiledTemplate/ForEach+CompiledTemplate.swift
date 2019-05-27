
extension TemplateForEach: CompiledTemplate {

    // View `CompiledTemplate` documentation
    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        var values = [Value.Context]()

        switch referance {
        case .keyPath(let keyPath):
            values = try manager.value(at: keyPath)
        case .root(let type):
            values = try (manager.value(for: type) as! [Value.Context])
        }
        var index = 0
        return try values.reduce("") {
            let context = ForEachContext(index: index, context: $1)
            index += 1
            return try $0 + localFormula.render(with: context, lingo: manager.lingo, locale: manager.locale)
        }
    }

    // View `BrewableFormula` documentation
    public func brew<T>(_ formula: HTMLRenderer.Formula<T>) throws {
        localFormula.calendar = formula.calendar
        localFormula.timeZone = formula.timeZone
        formula.add(mappable: self)
        try view.build().brew(localFormula)
    }
}


extension ContextualTemplate {

    /// The curren index in a for-loop
    ///
    /// - Parameter transformation: A transformation to do on the index value e.g. { $0 + 1 }
    /// - Returns: A CompiledTemplate that returns the index
    public func index(_ transformation: @escaping (Int) -> CompiledTemplate = { $0 }) -> CompiledTemplate {
        return unsafeVariable(in: ForEachContext<Self.Context>.self, for: \.index, transformation: transformation)
    }
}
