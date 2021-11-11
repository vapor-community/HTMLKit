/// The protocol defines
///
///
public protocol Conditionable: HTMLContent {
    
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
