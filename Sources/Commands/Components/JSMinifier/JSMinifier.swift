public class JSMinifier {
    
    /// A enumeration of different states of the minifier
    ///
    /// Code is the initial state.
    public enum InsertionMode: String {
        
        case code
        case beforecomment
        case comment
        case aftercomment
        case word
        case string
        case template
        case numeric
    }
    
    /// A enumeration of different level of the logging
    ///
    /// None is the initial state.
    public enum LogLevel {
        
        case none
        case debug
    }
    
    /// The token collection
    internal var tokens: [Token]
    
    /// The temporary slot for a token
    private var token: Token?
    
    /// The insertion mode of the minifier
    private var mode: InsertionMode
    
    /// The level of logging
    private var level: LogLevel
    
    /// Initiates a the javascript minifier
    public init(mode: InsertionMode = .code, level: LogLevel = .none) {
        
        self.tokens = []
        self.mode = mode
        self.level = level
    }
    
    /// Compresses the selector sets in the tree
    public func minify() -> String {
        return self.tokens.map { $0.minify() }.joined()
    }
    
    /// Logs the steps of the minifier depending on the log level
    private func log(function: String, character: Character) {
        
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
        
        print(#function)
        
        if self.token != nil {
            fatalError("Cannot assign the token. The previous token needs to be emitted first.")
        }
        
        self.token = token
    }
    
    /// Emits a token into the token collection
    private func emit(token: Token) {
        
        print(#function)
        
        self.tokens.append(token)
    }
    
    /// Emits the temporary token into the token collection
    private func emit() {
        
        print(#function)
        
        if let token = self.token {
            self.tokens.append(token)
        }
        
        self.token = nil
    }
    
    /// Consumes the content
    public func consume(content: String) {
        
        for character in content.enumerated() {
            
            switch self.mode {
            case .beforecomment:
                self.mode = consumeBeforeComment(character.element)
                
            case .comment:
                self.mode = consumeComment(character.element)
                
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
    }
    
    /// Consumes the character
    public func consumeCode(_ character: Character) -> InsertionMode {
        
        self.log(function: #function, character: character)
        
        if character.isSemicolon {
            
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
        
        if character.isQuotationMark || character.isApostrophe  {
            
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
        
        if character.isOperator {
            
            self.emit(token: FormatToken(type: .operator, value: String(character)))
            
            return .code
        }
        
        if character.isLetter {
            
            self.assign(token: WordToken(value: String(character)))
            
            return .word
        }
        
        return .code
    }
    
    /// Consumes the character before the comment
    public func consumeBeforeComment(_ character: Character) -> InsertionMode {
        
        self.log(function: #function, character: character)
        
        if character.isAsterisk  {
            
            self.assign(token: CommentToken(type: .block, value: ""))
            
            // ignore character
            return .comment
        }
        
        if character.isSolidus  {
            
            self.assign(token: CommentToken(type: .line, value: ""))
            
            // ignore character
            return .comment
        }
        
        if character.isExclamationMark  {
            
            self.assign(token: CommentToken(type: .hashbang, value: ""))
            
            // ignore character
            return .comment
        }
        
        // ignore character
        return .beforecomment
    }
    
    /// Consumes the character of a comment
    public func consumeComment(_ character: Character) -> InsertionMode {
        
        self.log(function: #function, character: character)
        
        if character.isAsterisk || character.isNewline {
            
            self.emit()
            
            // ignore character
            return .aftercomment
        }
        
        if var token = self.token {
            token.value.append(character)
            
        }
        
        return .comment
    }
    
    /// Consumes the character after a comment
    public func consumeAfterComment(_ character: Character) -> InsertionMode {
        
        self.log(function: #function, character: character)
        
        if character.isSolidus {
            // ignore character
            return .code
        }
        
        if character.isLetter {
            return .word
        }
        
        // ignore character
        return .aftercomment
    }
    
    public func consumeWord(_ character: Character) -> InsertionMode {
        
        self.log(function: #function, character: character)
        
        if character.isWhitespace {
            
            self.emit()
            
            // ignore character
            return .code
        }
        
        if character.isPeriod {
            
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
    public func consumeStringLiteral(_ character: Character) -> InsertionMode {
        
        self.log(function: #function, character: character)
        
        if character.isQuotationMark || character.isApostrophe {
            
            self.emit()
            
            return .code
        }
        
        if var token = self.token {
            token.value.append(character)
        }
        
        return .string
    }
    
    /// Consumes the character of a template literal
    public func consumeTemplateLiteral(_ character: Character) -> InsertionMode {
        
        self.log(function: #function, character: character)
        
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
    public func consumeNumericLiteral(_ character: Character) -> InsertionMode {
        
        self.log(function: #function, character: character)
        
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
