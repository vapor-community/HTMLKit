/*
 Abstract:
 The file contains the default definition of a condition. It defines which properties and methods a condition should come with.
 */

/// The protocol defines
public protocol Conditionable: AnyContent {
    
    func evaluate<T>(with manager: ContextManager<T>) throws -> Bool
}
