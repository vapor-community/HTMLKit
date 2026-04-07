/// A type that represents a markdown token.
internal final class MarkdownToken {
    
    /// An enumeration of different kind of tokens.
    internal enum TokenKind {
        
        /// Indicates an emphasis token.
        case emphasis

        /// Indicates a text literal.
        case textLiteral
        
        /// Indicates a code token.
        case code
        
        /// Indicates a link token.
        case link
    }
    
    /// The raw value of the token.
    internal var value: String
    
    /// The kind of the token.
    internal var kind: TokenKind
    
    /// Create a markdown token.
    internal init(kind: TokenKind) {
        
        self.kind = kind
        self.value = ""
    }
}
