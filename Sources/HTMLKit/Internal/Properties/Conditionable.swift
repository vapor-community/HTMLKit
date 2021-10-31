/// A protocol that makes a struct to a condition that can be used in an if
public protocol Conditionable: HTMLContent {

    /// Evaluates an expression with a context
    ///
    /// - Parameter context: The context to use when evaluating
    /// - Returns: true if the expression is correct else false
    func evaluate<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> Bool
}

extension Conditionable {

    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        try evaluate(with: manager).render(with: manager)
    }

    public func prerender(_ formula: HTMLRenderer.Formula) throws {
        formula.add(mappable: self)
    }
}
