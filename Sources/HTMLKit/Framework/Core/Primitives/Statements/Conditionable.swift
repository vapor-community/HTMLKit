/*
 Abstract:
 The file contains the default definition of a condition. It defines which properties and methods a condition should come with.
 */

/// The protocol defines
public protocol Conditionable: AnyContent {
    
    func evaluate<T>(with manager: ContextManager<T>) throws -> Bool
}

extension Conditionable {

    public func render<T>(with manager: ContextManager<T>) throws -> String {
        try evaluate(with: manager).render(with: manager)
    }

    public func prerender(_ formula: Formula) throws {
        formula.add(content: self)
    }
}
