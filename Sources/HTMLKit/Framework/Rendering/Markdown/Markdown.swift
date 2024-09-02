import Foundation

internal struct Markdown: Sendable {
    
    /// The markdowns characters
    internal static let characters = CharacterSet(charactersIn: "*_~[`")
    
    /// Initiates the markdown
    internal init() {}
    
    /// Renders the markdown string
    internal func render(string: String) -> String {
        
        let tokens = MarkdownLexer().consume(string: string)
        
        let nodes = MarkdownParser().process(tokens: tokens)
        
        var result = ""
        result += nodes.flatMap { render(node: $0) }
        
        return result
    }
    
    /// Renders the markdown node
    private func render(node: MarkdownNode) -> String {
        
        var result = ""
        
        switch node.kind {
        case .block("emphasis"):
            
            if node.value.contains("~~") || node.value.contains("~") {
                
                result += "<del>"
                result += node.children.flatMap { render(node: $0) }
                result += "</del>"
                
                break
            }
            
            if node.value.contains("***") || node.value.contains("___") {
                
                result += "<em><strong>"
                result += node.children.flatMap { render(node: $0) }
                result += "</strong></em>"
                
                break
            }
            
            if node.value.contains("**") || node.value.contains("__") {
                
                result += "<strong>"
                result += node.children.flatMap { render(node: $0) }
                result += "</strong>"
                
                break
            }
            
            if node.value.contains("*") || node.value.contains("_") {
                
                result += "<em>"
                result += node.children.flatMap { render(node: $0) }
                result += "</em>"
                
                break
            }

        case .inline("text"):
            
            result += node.value
            
        case .block("code"):
            
            result += "<code>"
            result += node.children.flatMap { render(node: $0) }
            result += "</code>"

        case .block("link"):
            
            result += "<a href=\"\(node.children[1].value)\">\(node.children[0].value)</a>"
            
        default:
            break
        }
        
        return result
    }
}
