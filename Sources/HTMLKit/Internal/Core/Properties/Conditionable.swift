/// The protocol defines
///
///
public protocol Conditionable: Content {
    
    func evaluate<T>(with manager: Renderer.ContextManager<T>) throws -> Bool
}

extension Conditionable {

    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try evaluate(with: manager).render(with: manager)
    }

    public func prerender(_ formula: Renderer.Formula) throws {
        formula.add(mappable: self)
    }
}
