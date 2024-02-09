internal class MarkdownLexer {
    
    /// A enumeration of different states of the tokenizer
    ///
    /// Initial is the initial state.
    internal enum InsertionMode {
        
        case initial
        case asteriskEmphasis
        case tildeEmphasis
        case underscoreEmphasis
        case textLiteral
        case code
        case link
    }
    
    /// A enumeration of different level of logging
    ///
    /// None is the initial state.
    internal enum LogLevel {
        
        case none
        case information
        case debug
    }
    
    /// The  current state of the tokenizer
    private var mode: InsertionMode
    
    /// The temporary token collection
    private var tokens: [MarkdownToken]
    
    /// The level of logging
    private var level: LogLevel
    
    /// Creates a the tokenizer
    internal init(mode: InsertionMode = .initial, log level: LogLevel = .none) {
        
        self.mode = .initial
        self.level = level
        self.tokens = []
    }
    
    /// Verboses the steps of the tokenizer depending on the log level
    private func verbose(_ message: Any...) {
        
        switch self.level {
        case .information:
            print("Message:", message)
            
        default:
            break
        }
    }
    
    /// Emits a token into the token collection
    private func emit(token: MarkdownToken) {
        
        self.verbose(#function)
        
        self.tokens.append(token)
    }
    
    /// Consumes the content by the state the tokenizer is currently in
    internal func consume(string: String) -> [MarkdownToken] {
        
        for character in string {
            
            switch mode {
            case .asteriskEmphasis:
                self.mode = consumeAsteriskEmphisis(character)
                
            case .tildeEmphasis:
                self.mode = consumeTildeEmphisis(character)
                
            case .underscoreEmphasis:
                self.mode = consumeUnderscoreEmphisis(character)
                
            case .textLiteral:
                self.mode = consumeTextLiteral(character)
                
            case .code:
                self.mode = consumeCode(character)
                
            case .link:
                self.mode = consumeLink(character)
                
            default:
                self.mode = consumeCharacter(character)
            }
        }
        
        return self.tokens
    }
    
    /// Consumes the character
    private func consumeCharacter(_ character: Character) -> InsertionMode {
        
        self.verbose(#function, character)
        
        if character.isBackTick {
            
            let token = MarkdownToken(kind: .code)
            token.value += String(character)
            
            self.emit(token: token)
            
            return .code
        }
        
        if character.isAsterisk {
            
            let token = MarkdownToken(kind: .ephasis)
            token.value += String(character)
            
            self.emit(token: token)
            
            return .asteriskEmphasis
        }
        
        if  character.isTilde {
            
            let token = MarkdownToken(kind: .ephasis)
            token.value += String(character)
            
            self.emit(token: token)
            
            return .tildeEmphasis
        }
        
        if  character.isUnderscore {
            
            let token = MarkdownToken(kind: .ephasis)
            token.value += String(character)
            
            self.emit(token: token)
            
            return .underscoreEmphasis
        }
        
        if character.isLetter || character.isWhitespace || character.isPeriod {
            
            let token = MarkdownToken(kind: .textLiteral)
            token.value += String(character)
            
            self.emit(token: token)
            
            return .textLiteral
        }
        
        if character.isLeftSquareBracket {
            
            let token = MarkdownToken(kind: .link)
            
            self.emit(token: token)
            
            return .link
        }
        
        return .initial
    }
    
    /// Consumes a character for a bold or italic emphisis
    ///
    /// ```
    /// *italic*
    /// ```
    ///
    private func consumeAsteriskEmphisis(_ character: Character) -> InsertionMode {
        
        self.verbose(#function, character)
        
        if character.isTilde {
            
            let token = MarkdownToken(kind: .ephasis)
            token.value += String(character)
            
            self.emit(token: token)
            
            return .tildeEmphasis
        }
        
        if character.isUnderscore {
            
            let token = MarkdownToken(kind: .ephasis)
            token.value.append(character)
            
            self.emit(token: token)
            
            return .underscoreEmphasis
        }
        
        if character.isLetter || character.isPeriod {
            
            let token = MarkdownToken(kind: .textLiteral)
            token.value += String(character)
            
            self.emit(token: token)
            
            return .textLiteral
        }
        
        if character.isWhitespace {
            
            let token = MarkdownToken(kind: .textLiteral)
            token.value += String(character)
            
            self.emit(token: token)
            
            return .textLiteral
        }
        
        if let last = self.tokens.last {
            last.value += String(character)
        }
        
        return .asteriskEmphasis
    }
    
    /// Consumes a character for a strikethrough emphisis
    ///
    /// ```
    /// ~~string~~
    /// ```
    ///
    private func consumeTildeEmphisis(_ character: Character) -> InsertionMode {
        
        self.verbose(#function, character)
        
        if character.isAsterisk {
            
            let token = MarkdownToken(kind: .ephasis)
            token.value += String(character)
            
            self.emit(token: token)
            
            return .asteriskEmphasis
        }
        
        if character.isUnderscore {
            
            let token = MarkdownToken(kind: .ephasis)
            token.value += String(character)
            
            self.emit(token: token)
            
            return .underscoreEmphasis
        }
        
        if character.isLetter || character.isPeriod {
            
            let token = MarkdownToken(kind: .textLiteral)
            token.value += String(character)
            
            self.emit(token: token)
            
            return .textLiteral
        }
        
        if character.isWhitespace {
            
            let token = MarkdownToken(kind: .textLiteral)
            token.value += String(character)
            
            self.emit(token: token)
            
            return .textLiteral
        }
        
        if let last = self.tokens.last {
            last.value += String(character)
        }
        
        return .tildeEmphasis
    }
    
    /// Consumes a character for a bold or italic emphisis
    ///
    /// ```
    /// _string_
    /// ```
    ///
    private func consumeUnderscoreEmphisis(_ character: Character) -> InsertionMode {
        
        self.verbose(#function, character)
        
        if character.isAsterisk {
            
            let token = MarkdownToken(kind: .ephasis)
            token.value += String(character)
            
            self.emit(token: token)
            
            return .asteriskEmphasis
        }
        
        if character.isTilde {
            
            let token = MarkdownToken(kind: .ephasis)
            token.value += String(character)
            
            self.emit(token: token)
            
            return .tildeEmphasis
        }
        
        if character.isLetter || character.isPeriod {
            
            let token = MarkdownToken(kind: .textLiteral)
            token.value += String(character)
            
            self.emit(token: token)
            
            return .textLiteral
        }
        
        if character.isWhitespace {
            
            let token = MarkdownToken(kind: .textLiteral)
            token.value += String(character)
            
            self.emit(token: token)
            
            return .textLiteral
        }
        
        if let last = self.tokens.last {
            last.value += String(character)
        }
        
        return .underscoreEmphasis
    }
    
    /// Consumes a character for a text literal
    ///
    /// ```
    /// Text
    /// ```
    ///
    private func consumeTextLiteral(_ character: Character) -> InsertionMode {
        
        self.verbose(#function, character)
        
        if character.isAsterisk {

            let token = MarkdownToken(kind: .ephasis)
            token.value += String(character)
            
            self.emit(token: token)
            
            return .asteriskEmphasis
        }
        
        if character.isTilde {

            let token = MarkdownToken(kind: .ephasis)
            token.value += String(character)
            
            self.emit(token: token)
            
            return .tildeEmphasis
        }
        
        if character.isUnderscore {
            
            let token = MarkdownToken(kind: .ephasis)
            token.value += String(character)
            
            self.emit(token: token)
            
            return .underscoreEmphasis
        }
        
        if character.isBackTick {
            
            let token = MarkdownToken(kind: .code)
            token.value += String(character)
            
            self.emit(token: token)
            
            return .code
        }
        
        if character.isRightSquareBracket{
            
            return .link
        }
        
        if character.isRightParenthesis {
            
            return .initial
        }
        
        if let last = self.tokens.last {
            last.value += String(character)
        }
        
        return .textLiteral
    }
    
    /// Consumes a character for a code emphisis
    ///
    /// ```
    /// `code`
    /// ```
    ///
    private func consumeCode(_ character: Character) -> InsertionMode {
        
        self.verbose(#function, character)
        
        if character.isLetter || character.isWhitespace {
            
            let token = MarkdownToken(kind: .textLiteral)
            token.value += String(character)
            
            self.emit(token: token)
            
            return .textLiteral
        }
        
        return .initial
    }
    
    /// Consumes a character for a link emphisis
    ///
    /// ```
    /// [Vapor](https://www.vapor.codes)
    /// ```
    ///
    private func consumeLink(_ character: Character) -> InsertionMode {
        
        self.verbose(#function, character)
        
        if character.isLetter {
            
            let token = MarkdownToken(kind: .textLiteral)
            token.value += String(character)
            
            self.emit(token: token)
            
            return .textLiteral
        }
        
        if character.isLeftParenthesis {
            return .link
        }
        
        return .initial
    }
}
