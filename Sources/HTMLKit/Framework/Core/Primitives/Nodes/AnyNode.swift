/*
 Abstract:
 The file contains the default definition of a node. It defines which properties and methods a node should come with.
 */

/// A type that represents any html-node.
internal protocol AnyNode {
    
    var startTag: String { get }
    
    func build(_ formula: Formula) throws
    
    func build<T>(with manager: ContextManager<T>) throws -> String
}
