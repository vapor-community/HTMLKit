/*
 Abstract:
 The file contains the default definition of a node. It defines which properties and methods a node should come with.
 */

/// A type that represents any html-node.
internal protocol Node: Content {
    
    ///  Prerenders the node.
    func prerender(with formula: Formula)
    
    ///  Renders the node.
    func render<T>(with manager: ContextManager<T>) -> String
}
