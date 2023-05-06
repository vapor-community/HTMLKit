public struct Minifier {
    
    public init() {
    }
    
    public func minify(_ content: String) -> String {
        
        let tokens = Tokenizer().consume(content)
        
        return tokens.drop(while: { $0 is CommentToken || $0 is WhitespaceToken }).map( { $0.present() } ).joined()
    }
}
