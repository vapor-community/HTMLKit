/// A Type that represents a javascript token
internal protocol Token {
    
    var value: String { get set }
    
    func minify() -> String
}

/// A type that represents a javascript comment
public class CommentToken: Token {
    
    /// A enumeration of the variations of comment tokens
    internal enum TokenType {
        
        /// Indicates a single line comment
        case line
        
        /// Indicates a multiline comment
        case block
        
        /// Indicates a hashbang comment
        case hashbang
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
    internal func minify() -> String {
        
        switch type {
        case .line:
            return "//\(value)"
            
        case .block:
            return "/*\(value)*/"
            
        case .hashbang:
            return "#!\(value)"
        }
    }
}

/// A type that represents a javascript literal
public class LiteralToken: Token {
    
    /// A enumeration of the variations of literal tokens
    internal enum TokenType {
        
        /// Indiciates a boolean literal
        case boolean
        
        /// Indiciates a string literal
        case string
        
        /// Indiciates a template literal
        case template
        
        /// Indiciates a numeric literal
        case numeric
        
        /// Indiciates a null value
        case null
        
        /// Indiciates regular expression
        case regularexpression
    }
    
    /// The type of the token
    internal var type: TokenType
    
    /// The value of the token
    internal var value: String
    
    /// Initiates a literal token
    internal init(type: TokenType, value: String) {
        
        self.type = type
        self.value = value
    }
    
    /// Minifies a literal token
    internal func minify() -> String {
        
        switch type {
        case .string:
            return "'\(value)'"
            
        case .template:
            return "`\(value)`"
            
        default:
            return value
        }
    }
}

/// A type that represents a format control token
public class FormatToken: Token {
    
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
    internal func minify() -> String {
        return value
    }
}

/// A type that represents a word token
public class WordToken: Token {
    
    /// A enumeration of the variations of word tokens
    internal enum TokenType {
        
        /// Indicates a reserved word
        case keyword
        
        /// Indicates a identifier
        case identifier
    }
    
    /// The type of the token
    internal var type: TokenType {
        
        if !keywords.contains(value) {
            return .identifier
        }
        
        return .keyword
    }
    
    /// The value of the token
    internal var value: String
    
    /// Initiates a word token
    internal init(value: String) {
        
        self.value = value
    }
    
    /// Minifies a word token
    internal func minify() -> String {
        
        switch type {
        case .keyword:
            
            // append whitespace
            if declarations.contains(value) {
                return "\(value) "
            }
            
            // prepend and append whitespace
            if operators.contains(value) {
                return " \(value) "
            }
            
            return value
            
        default:
            return value
        }
    }
}

extension WordToken {
    
    /// A set of keywords that need one whitespace before and after its declaration
    private var operators: Set<String> {
        return [
            "of",
        ]
    }
    
    /// A set of keywords that need one whitespace after its declaration
    private var declarations: Set<String> {
        return [
            "let",
            "const",
            "var",
            "return",
            "new"
        ]
    }
    
    /// A set of keywords
    private var keywords: Set<String> {
        return [
            "await",
            "break",
            "case",
            "catch",
            "class",
            "const",
            "continue",
            "debugger",
            "default",
            "delete",
            "do",
            "else",
            "enum",
            "export",
            "extends",
            "false",
            "finally",
            "for",
            "function",
            "if",
            "implements",
            "import",
            "in",
            "instanceof",
            "interface",
            "let",
            "new",
            "null",
            "package",
            "private",
            "protected",
            "public",
            "return",
            "super",
            "switch",
            "static",
            "this",
            "throw",
            "try",
            "true",
            "typeof",
            "var",
            "void",
            "while",
            "with",
            "yield",
        ]
    }
}
