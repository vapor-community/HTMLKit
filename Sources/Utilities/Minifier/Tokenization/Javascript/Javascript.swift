internal class Javascript {
    
    /// A enumeration of different states of the minifier
    ///
    /// Code is the initial state.
    internal enum InsertionMode: String {
        
        case code
        case beforecomment
        case linecomment
        case blockcomment
        case hashbang
        case aftercomment
        case word
        case string
        case template
        case numeric
    }
    
    /// A enumeration of different level of the logging
    ///
    /// None is the initial state.
    internal enum LogLevel {
        
        case none
        case debug
    }
    
    /// The token collection
    private var tokens: [Token]
    
    /// The temporary slot for a token
    private var token: Token?
    
    /// The insertion mode of the minifier
    private var mode: InsertionMode
    
    /// The level of logging
    private var level: LogLevel
    
    /// Initiates a the javascript minifier
    internal init(mode: InsertionMode = .code, log level: LogLevel = .none) {
        
        self.tokens = []
        self.mode = mode
        self.level = level
    }
    
    /// Logs the steps of the minifier depending on the log level
    private func verbose(function: String, character: Character) {
        
        switch self.level {
            
        case .debug:
            
            if character.isNewline {
                print(function, "newline")
                
            } else if character.isWhitespace {
                print(function, "whitespace")
                
            } else {
                print(function, character)
            }
            
        default:
            break
        }
    }
    
    /// Assigns a temporary token
    private func assign(token: Token) {
        
        self.verbose(function: #function, character: " ")
        
        if self.token != nil {
            fatalError("Cannot assign the token. The previous token needs to be emitted first.")
        }
        
        self.token = token
    }
    
    /// Emits a token into the token collection
    private func emit(token: Token) {
        
        self.verbose(function: #function, character: " ")
        
        self.tokens.append(token)
    }
    
    /// Emits the temporary token into the token collection
    private func emit() {
        
        self.verbose(function: #function, character: " ")
        
        if let token = self.token {
            self.tokens.append(token)
        }
        
        self.token = nil
    }
    
    /// Consumes the content
    internal func consume(_ content: String) -> [Token] {
        
        for character in content.enumerated() {
            
            switch self.mode {
            case .beforecomment:
                self.mode = consumeBeforeComment(character.element)
                
            case .blockcomment:
                self.mode = consumeBlockComment(character.element)
                
            case .linecomment:
                self.mode = consumeLineComment(character.element)
                
            case .aftercomment:
                self.mode = consumeAfterComment(character.element)
                
            case .word:
                self.mode = consumeWord(character.element)
                
            case .string:
                self.mode = consumeStringLiteral(character.element)
                
            case .template:
                self.mode = consumeTemplateLiteral(character.element)
                
            case .numeric:
                self.mode = consumeNumericLiteral(character.element)
                
            default:
                self.mode = consumeCode(character.element)
            }
        }
        
        return self.tokens
    }
    
    /// Consumes the character
    internal func consumeCode(_ character: Character) -> InsertionMode {
        
        self.verbose(function: #function, character: character)
        
        if character.isNewline {
            
            self.emit(token: WhitespaceToken(type: .return ,value: String(character)))
            
            return .code
        }
        
        if character.isWhitespace {
            
            self.emit(token: WhitespaceToken(type: .whitespace, value: String(character)))
            
            return .code
        }
        
        if character.isSemicolon || character.isColon  {
            
            self.emit(token: FormatToken(type: .terminator, value: String(character)))
            
            return .code
        }
        
        if character.isSolidus || character.isNumberSign {
            // ignore character
            return .beforecomment
        }
        
        if character.isBracket || character.isEqualSign || character.isComma || character.isPeriod {
            
            self.emit(token: FormatToken(type: .punctuator, value: String(character)))
            
            return .code
        }
        
        if character.isApostrophe  {
            
            self.assign(token: LiteralToken(type: .string, value: ""))
            
            return .string
        }
        
        if character.isBackTick {
            
            self.assign(token: LiteralToken(type: .template, value: ""))
            
            return .template
        }
        
        if character.isNumber {
            
            self.assign(token: LiteralToken(type: .numeric, value: String(character)))
            
            return .numeric
        }
        
        if character.isOperator || character.isExclamationMark {
            
            self.emit(token: FormatToken(type: .operator, value: String(character)))
            
            return .code
        }
        
        if character.isLetter || character.isDollarSign || character.isUnderscore  {
            
            self.assign(token: WordToken(value: String(character)))
            
            return .word
        }
        
        return .code
    }
    
    /// Consumes the character before the comment
    internal func consumeBeforeComment(_ character: Character) -> InsertionMode {
        
        self.verbose(function: #function, character: character)
        
        if character.isAsterisk  {
            
            self.assign(token: CommentToken(type: .block, value: ""))
            
            // ignore character
            return .blockcomment
        }
        
        if character.isSolidus  {
            
            self.assign(token: CommentToken(type: .line, value: ""))
            
            // ignore character
            return .linecomment
        }
        
        if character.isExclamationMark  {
            
            self.assign(token: CommentToken(type: .hashbang, value: ""))
            
            // ignore character
            return .hashbang
        }
        
        // ignore character
        return .beforecomment
    }
    
    /// Consumes the character of a comment
    internal func consumeLineComment(_ character: Character) -> InsertionMode {
        
        self.verbose(function: #function, character: character)
        
        if character.isNewline {
            
            self.emit()
            
            // ignore character
            return .code
        }
        
        if var token = self.token {
            token.value.append(character)
        }
        
        return .linecomment
    }
    
    /// Consumes the character of a comment
    internal func consumeBlockComment(_ character: Character) -> InsertionMode {
        
        self.verbose(function: #function, character: character)
        
        if character.isAsterisk {
            
            self.emit()
            
            // ignore character
            return .aftercomment
        }
        
        if var token = self.token {
            token.value.append(character)
        }
        
        return .blockcomment
    }
    
    /// Consumes the character after a comment
    internal func consumeAfterComment(_ character: Character) -> InsertionMode {
        
        self.verbose(function: #function, character: character)
        
        if character.isSolidus {
            // ignore character
            return .code
        }
        
        // ignore character
        return .aftercomment
    }
    
    internal func consumeWord(_ character: Character) -> InsertionMode {
        
        self.verbose(function: #function, character: character)
        
        if character.isWhitespace {
            
            self.emit()
            
            self.emit(token: WhitespaceToken(type: .whitespace, value: ""))
            
            return .code
        }
        
        if character.isPeriod {
            
            self.emit()
            
            self.emit(token: FormatToken(type: .punctuator, value: String(character)))
            
            return .code
        }
        
        if character.isColon {
            
            self.emit()
            
            self.emit(token: FormatToken(type: .punctuator, value: String(character)))
            
            return .code
        }
        
        if character.isSemicolon {
            
            self.emit()
            
            self.emit(token: FormatToken(type: .terminator, value: String(character)))
            
            return .code
        }
        
        if character.isBracket {
            
            self.emit()
            
            self.emit(token: FormatToken(type: .punctuator, value: String(character)))
            
            return .code
        }
        
        if var token = self.token {
            token.value.append(character)
            
        } else {
            self.assign(token: WordToken(value: String(character)))
        }

        return .word
    }
    
    /// Consumes the character of a string literal
    internal func consumeStringLiteral(_ character: Character) -> InsertionMode {
        
        self.verbose(function: #function, character: character)
        
        if character.isApostrophe {
            
            self.emit()
            
            return .code
        }
        
        if var token = self.token {
            token.value.append(character)
        }
        
        return .string
    }
    
    /// Consumes the character of a template literal
    internal func consumeTemplateLiteral(_ character: Character) -> InsertionMode {
        
        self.verbose(function: #function, character: character)
        
        if character.isBackTick {
            
            self.emit()
            
            return .code
        }
        
        if var token = self.token {
            token.value.append(character)
        }
        
        return .template
    }
    
    /// Consumes the character of a numeric literal
    internal func consumeNumericLiteral(_ character: Character) -> InsertionMode {
        
        self.verbose(function: #function, character: character)
        
        if character.isSemicolon {
            
            self.emit()
            
            self.emit(token: FormatToken(type: .terminator, value: String(character)))
            
            return .code
        }
        
        if character.isBracket {
            
            self.emit()
            
            self.emit(token: FormatToken(type: .punctuator, value: String(character)))
            
            return .code
        }
        
        if var token = self.token {
            token.value.append(character)
        }
        
        return .numeric
    }
}

extension Javascript {
    
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
    
    /// A type that represents a javascript comment
    internal class CommentToken: Token {
        
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
        internal func present() -> String {
            
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
    internal class LiteralToken: Token {
        
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
        internal func present() -> String {
            
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

    /// A type that represents a word token
    internal class WordToken: Token {
        
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
        internal func present() -> String {
            return value
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
                "of"
            ]
        }
    }
}
