/// A type that represents a markdown token
internal final class MarkdownToken {
    
    internal enum TokenKind {
        case ephasis
        case textLiteral
        case code
        case link
    }
    
    internal var value: String
    
    internal var kind: TokenKind
    
    internal init(kind: TokenKind) {
        
        self.kind = kind
        self.value = ""
    }
}
