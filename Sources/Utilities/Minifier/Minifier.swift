public struct Minifier {
    
    public init() {
    }
    
    public func minify(css content: String) -> String {
        
        let tokens = Stylesheet().consume(content)
        
        return tokens.drop(while: { $0 is Stylesheet.CommentToken || $0 is Stylesheet.WhitespaceToken }).map( { $0.present() } ).joined()
    }
    
    public func minify(js content: String) -> String {
        
        let tokens = Javascript().consume(content)
        
        return tokens.drop(while: { $0 is Javascript.CommentToken || $0 is Javascript.WhitespaceToken }).map( { $0.present() } ).joined()
    }
}
