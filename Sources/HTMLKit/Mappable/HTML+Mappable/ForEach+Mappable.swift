
extension HTML.ForEach: Mappable {
    public func map<T>(for type: T.Type, with context: T.Context) throws -> String where T : Templating {
        guard let rootContext = context as? Root.Context else {
            throw HTML.Errors.incorrectGenericType
        }
        return try rootContext[keyPath: collectionPath].reduce("") {
            try $0 + localFormula.render(with: $1)
        }
    }

    public func brew<T>(_ formula: HTML.Renderer.Formula<T>) throws where T: Templating {
        formula.add(mappable: self)
        try view.build().brew(localFormula)
    }
}
