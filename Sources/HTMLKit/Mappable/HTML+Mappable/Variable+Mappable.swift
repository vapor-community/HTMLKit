
extension HTML.Variable: Mappable {

    public func map<T>(for type: T.Type, with context: T.Context) throws -> String where T : Templating {
        guard let rootContext = context as? Root.Context else {
            throw HTML.Errors.incorrectGenericType
        }
        return try rootContext[keyPath: keyPath].map(for: type, with: context)
    }

    public func brew<T>(_ formula: HTML.Renderer.Formula<T>) throws where T: Templating {
        formula.add(variable: self)
    }
}

extension ContextualTemplate {

    /// References a variable in the `Context` type
    ///
    /// - Parameter keyPath: The path to the variable
    /// - Returns: A `Mappable` `HTML.Variable` object
    public static func variable<Value>(at keyPath: KeyPath<Self.Context, Value>) -> HTML.Variable<Self, Value> {
        return HTML.Variable(keyPath: keyPath)
    }

    /// References an optional variable in the `Context` type
    ///
    /// - Parameter keyPath: The path to the variable
    /// - Returns: A `Mappable` `HTML.Variable` object
    public static func variable<Value>(at keyPath: KeyPath<Self.Context, Value?>) -> HTML.Variable<Self, Value?> {
        return HTML.Variable(keyPath: keyPath)
    }
}
