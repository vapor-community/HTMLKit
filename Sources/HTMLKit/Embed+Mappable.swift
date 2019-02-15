
extension HTML.EmbedViewTemplate: Mappable {
    public func map<T>(for type: T.Type, with context: T.Context) throws -> String where T : Template {
        return try templateType.build(with: viewContext).map(for: type, with: context)
    }

    public func brew<R>(_ formula: HTML.Renderer.Formula<R>) throws where R: Template {
        formula.register(from: E.self, to: T.self, using: contextKeyPath)
        try templateType.build(with: viewContext).brew(formula)
    }
}

extension HTML.EmbedTemplate: Mappable {
    public func map<T>(for type: T.Type, with context: T.Context) throws -> String where T : Template {
        return try templateType.build().map(for: type, with: context)
    }

    public func brew<R>(_ formula: HTML.Renderer.Formula<R>) throws where R: Template {
        formula.register(from: E.self, to: T.self, using: contextKeyPath)
        try templateType.build().brew(formula)
    }
}

extension KeyPath {

    var rootType: Root.Type { return Root.self }
    var valueType: Value.Type { return Value.self }
}
