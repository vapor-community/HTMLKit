/// A view that will allways be the same, no matter the context
public protocol Viewable: ViewBuildable, Mappable {

    /// Builds the view
    ///
    /// - Returns: Returns a view that conforms to `Mappable`
    func build() -> Mappable
}

extension Viewable {
    public func map<T>(for type: T.Type, with context: T.Context) throws -> String where T : Templating {
        return try build()
            .map(for: type, with: context)
    }

    public func brew<T>(_ formula: HTML.Renderer.Formula<T>) throws where T : Templating {
        try build().brew(formula)
    }
}
