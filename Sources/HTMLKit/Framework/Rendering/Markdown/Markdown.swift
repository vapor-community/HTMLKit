import Foundation

internal final class Markdown {
    
    internal static let characters = CharacterSet(charactersIn: "*_~[`")
    
    private var nodes: [MarkdownNode]
    
    internal init() {
        
        self.nodes = []
    }
    
    internal func consume(_ content: String) {
        
        let tokens = MarkdownLexer().consume(string: content)
        
        nodes = MarkdownParser().process(tokens: tokens)
    }
    
    internal func render() -> String {
        
        var result = ""
        
        result += nodes.flatMap { $0.render() }
        
        return result
    }
}
