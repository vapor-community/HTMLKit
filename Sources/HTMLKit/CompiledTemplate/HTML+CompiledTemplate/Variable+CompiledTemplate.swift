
extension HTML.Variable: CompiledTemplate {

    public func render<T>(with manager: HTML.Renderer.ContextManager<T>) throws -> String {
        return try manager.value(at: keyPath).render(with: manager)
    }

    public func brew<T>(_ formula: HTML.Renderer.Formula<T>) throws {
        formula.add(variable: self)
    }
}

extension ContextualTemplate {

    /// References a variable in the `Context` type
    ///
    /// - Parameter keyPath: The path to the variable
    /// - Returns: A `Mappable` `HTML.Variable` object
    public func variable<Value>(_ keyPath: KeyPath<Self.Context, Value>) -> HTML.Variable<Self.Context, Value> {
        return HTML.Variable(keyPath: keyPath)
    }

    /// References an optional variable in the `Context` type
    ///
    /// - Parameter keyPath: The path to the variable
    /// - Returns: A `Mappable` `HTML.Variable` object
    public func variable<Value>(_ keyPath: KeyPath<Self.Context, Value?>) -> HTML.Variable<Self.Context, Value?> {
        return HTML.Variable(keyPath: keyPath)
    }
}
