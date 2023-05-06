/// A Type that represents a javascript token
internal protocol Token {
    
    var value: String { get set }
    
    func present() -> String
}

internal class WhitespaceToken: Token {
    
    /// A enumeration of the variations of comment tokens
    internal enum TokenType {
        
        /// Indicates a single line comment
        case whitespace
        
        /// Indicates a multiline comment
        case `return`
    }
    
    /// The type of the token
    internal var type: TokenType
    
    /// The value of the token
    internal var value: String
    
    /// Initiates a comment token
    internal init(type: TokenType, value: String) {
        
        self.type = type
        self.value = value
    }
    
    internal func present() -> String {
        
        switch type {
        case .return:
            return "\r\n"
            
        case .whitespace:
            return " "
        }
    }
}

/// A type that represents a css comment
internal class CommentToken: Token {
    
    /// A enumeration of the variations of comment tokens
    internal enum TokenType {
        
        /// Indicates a single line comment
        case line
        
        /// Indicates a multiline comment
        case block
    }
    
    /// The type of the token
    internal var type: TokenType
    
    /// The value of the token
    internal var value: String
    
    /// Initiates a comment token
    internal init(type: TokenType, value: String) {
        
        self.type = type
        self.value = value
    }
    
    /// Minifies a comment token
    internal func present() -> String {
        
        switch type {
        case .line:
            return "//\(value)"
            
        case .block:
            return "/*\(value)*/"
        }
    }
}

/// A type that represents a css comment
internal class SelectorToken: Token {
    
    /// A enumeration of the variations of comment tokens
    internal enum TokenType {
        
        /// Indicates the set is about an element
        case element
        
        /// Indicates the set is about a class
        case `class`
        
        /// Indicates the set is about a id
        case id
        
        /// Indicates the set is about a root
        case root
    }
    
    /// The type of the token
    internal var type: TokenType
    
    /// The value of the token
    internal var value: String
    
    /// Initiates a comment token
    internal init(type: TokenType, value: String) {
        
        self.type = type
        self.value = value
    }
    
    /// Minifies a comment token
    internal func present() -> String {
        
        switch type {
        case .element:
            return "\(value)"
            
        case .class:
            return ".\(value)"
            
        case .id:
            return "#\(value)"
            
        case .root:
            return ":\(value)"
        }
    }
}

/// A type that represents a format control token
internal class FormatToken: Token {
    
    /// A enumeration of the variation of format tokens
    internal enum TokenType {
        
        /// Indicates a punctiation
        case punctuator
        
        /// Indicates a line terminator character
        case terminator
        
        /// Indicates a line operator character
        case `operator`
    }
    
    /// The type of the token
    internal var type: TokenType
    
    /// The value of the token
    internal var value: String
    
    /// Initiates a format token
    internal init(type: TokenType, value: String) {
        
        self.type = type
        self.value = value
    }
    
    /// Minifies a format token
    internal func present() -> String {
        return value
    }
}

/// A type that represents a format control token
internal class PropertyToken: Token {
    
    /// A enumeration of the variation of format tokens
    internal enum TokenType {
        
        /// Indicates a punctiation
        case standard
        
        /// Indicates a line terminator character
        case custom
    }
    
    /// The type of the token
    internal var type: TokenType
    
    /// The value of the token
    internal var value: String
    
    /// Initiates a format token
    internal init(type: TokenType, value: String) {
        
        self.type = type
        self.value = value
    }
    
    /// Minifies a format token
    internal func present() -> String {
        
        switch type {
        case .standard:
            return "\(value)"
            
        case .custom:
            return "--\(value)"
        }
    }
}

/// A type that represents a format control token
internal class ValueToken: Token {
    
    /// A enumeration of the variation of format tokens
    internal enum TokenType {
        
        /// Indicates a punctiation
        case keyword
        
        /// Indicates a line terminator character
        case numeric
        
        case function
    }
    
    /// The type of the token
    internal var type: TokenType
    
    /// The value of the token
    internal var value: String
    
    /// Initiates a format token
    internal init(type: TokenType, value: String) {
        
        self.type = type
        self.value = value
    }
    
    /// Minifies a format token
    internal func present() -> String {
        return value
    }
}
