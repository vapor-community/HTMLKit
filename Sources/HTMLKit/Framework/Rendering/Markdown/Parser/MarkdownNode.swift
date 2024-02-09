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
    
    internal func render() -> String {
        
        var result = ""
        
        switch kind {
        case .block("emphasis"):
            
            if value.contains("~~") || value.contains("~") {
                
                result += "<del>"
                result += children.flatMap { $0.render() }
                result += "</del>"
                
                break
            }
            
            if value.contains("***") || value.contains("___") {
                
                result += "<em><strong>"
                result += children.flatMap { $0.render() }
                result += "</strong></em>"
                
                break
            }
            
            if value.contains("**") || value.contains("__") {
                
                result += "<strong>"
                result += children.flatMap { $0.render() }
                result += "</strong>"
                
                break
            }
            
            if value.contains("*") || value.contains("_") {
                
                result += "<em>"
                result += children.flatMap { $0.render() }
                result += "</em>"
                
                break
            }

        case .inline("text"):
            result += value
            
        case .block("code"):
            
            result += "<code>"
            result += children.flatMap { $0.render() }
            result += "</code>"

        case .block("link"):
            result += "<a href=\"\(children[1].value)\">\(children[0].value)</a>"
            
        default:
            break
        }
        
        return result
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
