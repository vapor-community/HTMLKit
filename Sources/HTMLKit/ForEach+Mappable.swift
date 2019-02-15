
extension HTML.ForEach: Mappable {
    public func map<T>(for type: T.Type, with context: T.Context) throws -> String where T : Template {
        guard let rootContext = context as? Root.Context else {
            throw HTML.Errors.incorrectGenericType
        }
        let render = view.build()
        return try rootContext[keyPath: collectionPath].reduce("") {
            try $0 + render.map(for: view, with: $1)
        }
    }

    public func brew<T>(_ formula: HTML.Renderer.Formula<T>) throws where T: Template {
        formula.add(mappable: self)
    }
}
