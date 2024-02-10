/// A type that represents a markdown token
internal final class MarkdownNode {
    
    /// A enumeration of different kinds of nodes
    internal enum NodeKind {
        
        /// Indicates a block node
        ///
        /// A block node can contain children
        case block(String)
        
        /// Indicates a inline node
        ///
        /// A inline node can not contain any children
        case inline(String)
    }
    
    /// The nodes descendants
    internal var children: [MarkdownNode]
    
    /// The kind of the node
    internal var kind: NodeKind
    
    /// The raw content of the node
    internal var value: String
    
    /// Initiates a markdown node
    internal init(kind: NodeKind, value: String) {
        
        self.kind = kind
        self.value = value
        self.children = []
    }
}

extension MarkdownNode.NodeKind: Equatable {
    
    internal static func ==(lhs: MarkdownNode.NodeKind, rhs: MarkdownNode.NodeKind) -> Bool {
        
        switch (lhs, rhs) {
        case (.block(let a), .block(let b)):
            return a == b
            
        default:
            return false
        }
    }
}
