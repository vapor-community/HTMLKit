/// A view that will allways be the same, no matter the context
public protocol Viewable: CompiledTemplate {

    /// Builds the view
    ///
    /// - Returns: Returns a view that conforms to `Mappable`
    func build() -> CompiledTemplate
}

extension Viewable {
    public func render<T>(with manager: HTML.Renderer.ContextManager<T>) throws -> String {
        return try build().render(with: manager)
    }

    public func brew<T>(_ formula: HTML.Renderer.Formula<T>) throws {
        try build().brew(formula)
    }
}
