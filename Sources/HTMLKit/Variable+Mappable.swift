
extension HTML.Variable: Mappable {

    public func map<T>(for type: T.Type, with context: T.Context) throws -> String where T : Template {
        guard let rootContext = context as? Root.Context else {
            throw HTML.Errors.incorrectGenericType
        }
        return try rootContext[keyPath: keyPath].map(for: type, with: context)
    }

    public func brew<T>(_ formula: HTML.Renderer.Formula<T>) throws where T: Template {
        formula.add(variable: self)
    }
}

extension ContextualTemplate {
    public static func variable<Value>(at keyPath: KeyPath<Self.Context, Value>) -> HTML.Variable<Self, Value> {
        return HTML.Variable(keyPath: keyPath)
    }

    public static func variable<Value>(at keyPath: KeyPath<Self.Context, Value?>) -> HTML.Variable<Self, Value?> {
        return HTML.Variable(keyPath: keyPath)
    }
}
