/// A type that represents a markdown token
internal final class MarkdownNode {
    
    internal enum NodeKind {
        case block(String)
        case inline(String)
    }
    
    internal var children: [MarkdownNode]
    
    internal var kind: NodeKind
    
    internal var value: String
    
    internal init(kind: NodeKind, value: String) {
        
        self.kind = kind
        self.value = value
        self.children = []
    }
}

extension MarkdownNode.NodeKind: Equatable {
    
    public static func ==(lhs: MarkdownNode.NodeKind, rhs: MarkdownNode.NodeKind) -> Bool {
        
        switch (lhs, rhs) {
        case (.block(let a), .block(let b)):
            return a == b
            
        default:
            return false
        }
    }
}
