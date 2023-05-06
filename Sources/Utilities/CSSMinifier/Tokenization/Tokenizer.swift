internal class Tokenizer {
    
    /// A enumeration of different states of the minifier
    ///
    /// Code is the initial state.
    internal enum InsertionMode: String {
        
        case code
        case beforecomment
        case comment
        case aftercomment
        case selector
        case declaration
        case property
        case value
        case mediaquery
    }
    
    /// A enumeration of different level of the logging
    ///
    /// None is the initial state.
    internal enum LogLevel {
        
        case none
        case debug
    }
    
    /// The tree with nodes
    private var tokens: [Token]
    
    /// The temporary slot for a token
    private var token: Token?
    
    /// The  state of the minifier
    private var mode: InsertionMode
    
    /// The level of logging
    private var level: LogLevel
    
    /// Creates a minifier
    internal init(mode: InsertionMode = .code, log level: LogLevel = .none) {
        
        self.tokens = []
        self.mode = mode
        self.level = level
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
    
    /// Consumes the content by the state the minifier is currently in
    public func consume(_ content: String) -> [Token] {
        
        for character in content.enumerated() {
            
            switch self.mode {
                
            case .beforecomment:
                self.mode = consumeBeforeComment(character.element)
                
            case .comment:
                self.mode = consumeComment(character.element)
                
            case .aftercomment:
                self.mode = consumeAfterComment(character.element)
                
            case .selector:
                self.mode = consumeSelector(character.element)
                
            case .declaration:
                self.mode = consumeDeclaration(character.element)
                
            case .property:
                self.mode = consumeProperty(character.element)
                
            case .value:
                self.mode = consumeValue(character.element)
                
            case .mediaquery:
                self.mode = consumeMediaQuery(character.element)
                
            default:
                self.mode = consumeCode(character.element)
            }
        }
        
        return tokens
    }
    
    /// Consumes the character
    internal func consumeCode(_ character: Character) -> InsertionMode {
        
        self.log(function: #function, character: character)
        
        if character.isNewline {
            
            self.emit(token: WhitespaceToken(type: .return ,value: String(character)))
            
            return .code
        }
        
        if character.isWhitespace {
            
            self.emit(token: WhitespaceToken(type: .whitespace, value: String(character)))
            
            return .code
        }
        
        if character.isSolidus {
            // ignore character
            return .beforecomment
        }
        
        if character.isPeriod {
            
            self.assign(token: SelectorToken(type: .class, value: ""))
            
            return .selector
        }
        
        if character.isColon {
            
            self.assign(token: SelectorToken(type: .root, value: ""))
            
            return .selector
        }
        
        if character.isNumberSign {
            
            self.assign(token: SelectorToken(type: .id, value: ""))
            
            return .selector
        }
        
        if character.isLetter {
            
            self.assign(token: SelectorToken(type: .element, value: ""))
            
            return .selector
        }
        
        if character.isBracket {
            
            self.emit(token: FormatToken(type: .punctuator, value: String(character)))
            
            return .declaration
        }
        
        return .code
    }
    
    /// Consumes the character before the comment
    internal func consumeBeforeComment(_ character: Character) -> InsertionMode {
        
        self.log(function: #function, character: character)
        
        if character.isSolidus {
            
            self.assign(token: CommentToken(type: .line, value: ""))
        
            // ignore character
            return .comment
        }
        
        if character.isAsterisk {
            
            self.assign(token: CommentToken(type: .block, value: ""))
        
            // ignore character
            return .comment
        }
        
        // ignore character
        return .beforecomment
    }
    
    /// Consumes the character of a comment
    ///
    /// ```css
    /// /* comment */
    /// ```
    internal func consumeComment(_ character: Character) -> InsertionMode {
        
        self.log(function: #function, character: character)
        
        if character.isAsterisk {
            
            self.emit()
            
            return .aftercomment
        }
        
        if var token = self.token {
            token.value.append(character)
        }
        
        return .comment
    }
    
    /// Consumes the character after a comment
    internal func consumeAfterComment(_ character: Character) -> InsertionMode {
        
        self.log(function: #function, character: character)
        
        if character.isSolidus {
            
            return .code
        }
        
        // ignore character
        return .aftercomment
    }
    
    /// Consumes a css selector
    ///
    /// ```css
    /// selector {
    /// }
    /// ```
    internal func consumeSelector(_ character: Character) -> InsertionMode {
        
        self.log(function: #function, character: character)
        
        if character.isWhitespace {
            
            self.emit()
            
            // ignore character
            return .code
        }
        
        if var token = self.token {
            token.value.append(character)
        }
        
        return .selector
    }
    
    /// Consumes the character of a declaration
    ///
    /// ```css
    /// {
    /// }
    /// ```
    internal func consumeDeclaration(_ character: Character) -> InsertionMode {
        
        self.log(function: #function, character: character)
        
        if character.isBracket {
            
            self.emit(token: FormatToken(type: .punctuator, value: String(character)))
            
            return .code
        }
        
        if character.isLetter {
        
            self.assign(token: PropertyToken(type: .standard, value: String(character)))
            
            return .property
        }
        
        return .declaration
    }
    
    /// Consumes the character of a property
    ///
    /// ```css
    /// property:value;
    /// ```
    internal func consumeProperty(_ character: Character) -> InsertionMode {
        
        self.log(function: #function, character: character)
        
        if character.isWhitespace {
            // ignore character
            return .property
        }
        
        if character.isColon {
            
            self.emit()
            
            self.emit(token: FormatToken(type: .punctuator, value: String(character)))
            
            return .value
        }
        
        if var token = self.token {
            token.value.append(character)
        }
        
        return .property
    }
    
    /// Consumes the character of a value
    ///
    /// ```css
    /// property:value;
    /// ```
    internal func consumeValue(_ character: Character) -> InsertionMode {
        
        self.log(function: #function, character: character)
        
        if character.isWhitespace {
            // ignore character
            return .value
        }
        
        if character.isSemicolon {
            
            self.emit()
            
            self.emit(token: FormatToken(type: .terminator, value: String(character)))
            
            return .declaration
        }
        
        if var token = self.token {
            token.value.append(character)
            
        } else {
            self.assign(token: ValueToken(type: .keyword, value: String(character)))
        }
        
        return .value
    }
    
    /// Consumes a character of a media query
    ///
    /// ```css
    /// @media ()
    /// ```
    internal func consumeMediaQuery(_ character: Character) -> InsertionMode {
        
        self.log(function: #function, character: character)
        
        return .mediaquery
    }
}
