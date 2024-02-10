/// A type that represents a markdown token
internal final class MarkdownToken {
    
    /// A enumeration of different tokens
    internal enum TokenKind {
        
        /// Indicates a emphasis token
        case emphasis

        /// Indicates a text literal
        case textLiteral
        
        /// Indicates a code token
        case code
        
        /// Indicates a link token
        case link
    }
    
    /// The raw value of the token
    internal var value: String
    
    /// The kind of the token
    internal var kind: TokenKind
    
    /// Initiates a markdown token
    internal init(kind: TokenKind) {
        
        self.kind = kind
        self.value = ""
    }
}
