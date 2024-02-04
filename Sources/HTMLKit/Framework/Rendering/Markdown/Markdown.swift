internal class Markdown {
    
    /// A enumeration of different states of the tokenizer
    ///
    /// Initial is the initial state.
    internal enum InsertionMode {
        
        case initial
        case asteriskEmphisis
        case tildeEmphisis
        case underscoreEmphisis
        case textLiteral
        case code
        case link
    }
    
    /// A enumeration of different level of the logging
    ///
    /// None is the initial state.
    internal enum LogLevel {
        
        case none
        case debug
    }
    
    /// The  state of the tokenizer
    private var mode: InsertionMode
    
    /// The tree with the tokens
    private var tokens: [Token]
    
    /// The level of logging
    private var level: LogLevel
    
    /// Creates a the tokenizer
    internal init(mode: InsertionMode = .initial, log level: LogLevel = .none) {
        
        self.mode = .initial
        self.level = level
        self.tokens = []
    }
    
    /// Verboses the steps of the tokenizer depending on the log level
    private func verbose(function: String, character: Character? = nil) {
        
        switch self.level {
            
        case .debug:
            
            if let character = character {
                
                if character.isNewline {
                    print(function, "newline")
                    
                } else if character.isWhitespace {
                    print(function, "whitespace")
                    
                } else {
                    print(function, character)
                }
                
            } else {
                print(function)
            }
            
        default:
            break
        }
    }
    
    /// Pops the last token into the penultimate token
    private func pop() {
        
        self.verbose(function: #function)
        
        let last = self.tokens.removeLast()
        
        if let penultimate = self.tokens.last {
            
            if var block = penultimate as? BlockToken {
                block.add(child: last)
                
            } else {
                // Put it back...
                self.tokens.append(last)
            }
            
        } else {
            // Put it back...
            self.tokens.insert(last, at: 0)
        }
    }
    
    /// Consumes the content by the state the tokenizer is currently in
    internal func consume(string: String) {
        
        for character in string {
            
            switch mode {
            case .asteriskEmphisis:
                self.mode = consumeAsteriskEmphisis(character)
                
            case .tildeEmphisis:
                self.mode = consumeTildeEmphisis(character)
                
            case .underscoreEmphisis:
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
    }
    
    /// Transforms the token tree in its HTML representation
    internal func render() -> String {
        
        var output = ""
        output += self.tokens.flatMap { $0.render() }
        
        return output
    }
    
    internal func reset() {
        
        self.tokens.removeAll()
        
        self.mode = .initial
    }
    
    /// Consumes the character
    private func consumeCharacter(_ character: Character) -> InsertionMode {
        
        self.verbose(function: #function, character: character)
        
        if character.isBackTick {
            
            let token = CodeToken()
            token.value += String(character)
            
            self.tokens.append(token)
            
            return .code
        }
        
        if character.isAsterisk {
            
            let token = EmphisisToken()
            token.value += String(character)
            
            self.tokens.append(token)
            
            return .asteriskEmphisis
        }
        
        if  character.isTilde {
            
            let token = EmphisisToken()
            token.value += String(character)
            
            self.tokens.append(token)
            
            return .tildeEmphisis
        }
        
        if  character.isUnderscore {
            
            let token = EmphisisToken()
            token.value += String(character)
            
            self.tokens.append(token)
            
            return .underscoreEmphisis
        }
        
        if character.isLetter || character.isWhitespace || character.isPeriod {
            
            let token = TextToken()
            token.value += String(character)
            
            self.tokens.append(token)
            
            return .textLiteral
        }
        
        if character.isLeftSquareBracket {
            
            let token = LinkToken()
            
            self.tokens.append(token)
            
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
        
        self.verbose(function: #function, character: character)
        
        if character.isAsterisk {
            
            if var last = self.tokens.last {
                last.value += String(character)
            }
            
            return .asteriskEmphisis
        }
        
        if character.isTilde {
            
            let token = EmphisisToken()
            token.value += String(character)
            
            self.tokens.append(token)
            
            return .tildeEmphisis
        }
        
        if character.isUnderscore {
            
            let token = EmphisisToken()
            token.value.append(character)
            
            self.tokens.append(token)
            
            return .underscoreEmphisis
        }
        
        if character.isLetter {
            
            let token = TextToken()
            token.value += String(character)
            
            self.tokens.append(token)
            
            return .textLiteral
        }
        
        if character.isWhitespace {
            
            self.pop()
            
            let token = TextToken()
            token.value += String(character)
            
            self.tokens.append(token)
            
            return .textLiteral
        }
        
        return .initial
    }
    
    /// Consumes a character for a strikethrough emphisis
    ///
    /// ```
    /// ~~string~~
    /// ```
    ///
    private func consumeTildeEmphisis(_ character: Character) -> InsertionMode {
        
        self.verbose(function: #function, character: character)
        
        if character.isAsterisk {
            
            let token = EmphisisToken()
            token.value += String(character)
            
            self.tokens.append(token)
            
            return .asteriskEmphisis
        }
        
        if character.isTilde {
            
            if var last = self.tokens.last {
                last.value += String(character)
            }
            
            return .tildeEmphisis
        }
        
        if character.isUnderscore {

            let token = EmphisisToken()
            token.value += String(character)
            
            self.tokens.append(token)
            
            return .underscoreEmphisis
        }
        
        if character.isLetter {
            
            let token = TextToken()
            token.value += String(character)
            
            self.tokens.append(token)
            
            return .textLiteral
        }
        
        if character.isWhitespace {
            
            self.pop()
            
            let token = TextToken()
            token.value += String(character)
            
            self.tokens.append(token)
            
            return .textLiteral
        }
        
        return .initial
    }
    
    /// Consumes a character for a bold or italic emphisis
    ///
    /// ```
    /// _string_
    /// ```
    ///
    private func consumeUnderscoreEmphisis(_ character: Character) -> InsertionMode {
        
        self.verbose(function: #function, character: character)
        
        if character.isAsterisk {
            
            let token = EmphisisToken()
            token.value += String(character)
            
            self.tokens.append(token)
            
            return .asteriskEmphisis
        }
        
        if character.isTilde {
            
            let token = EmphisisToken()
            token.value += String(character)
            
            self.tokens.append(token)
            
            return .tildeEmphisis
        }
        
        if character.isUnderscore {
            
            if var last = self.tokens.last {
                last.value += String(character)
            }
            
            return .underscoreEmphisis
        }
        
        if character.isLetter {
            
            let token = TextToken()
            token.value += String(character)
            
            self.tokens.append(token)
            
            return .textLiteral
        }
        
        if character.isWhitespace {
            
            self.pop()
            
            let token = TextToken()
            token.value += String(character)
            
            self.tokens.append(token)
            
            return .textLiteral
        }
        
        return .initial
    }
    
    /// Consumes a character for a text literal
    ///
    /// ```
    /// Text
    /// ```
    ///
    private func consumeTextLiteral(_ character: Character) -> InsertionMode {
        
        self.verbose(function: #function, character: character)
        
        if character.isLetter || character.isWhitespace || character.isSolidus || character.isColon || character.isPeriod {
            
            if var last = self.tokens.last {
                last.value += String(character)
            }
            
            return .textLiteral
        }
        
        if character.isAsterisk {
            
            self.pop()
            
            let token = EmphisisToken()
            token.value += String(character)
            
            self.tokens.append(token)
            
            return .asteriskEmphisis
        }
        
        if character.isTilde {
            
            self.pop()
            
            let token = EmphisisToken()
            token.value += String(character)
            
            self.tokens.append(token)
            
            return .tildeEmphisis
        }
        
        if character.isUnderscore {
            
            self.pop()
            
            let token = EmphisisToken()
            token.value += String(character)
            
            self.tokens.append(token)
            
            return .underscoreEmphisis
        }
        
        if character.isBackTick {
            
            self.pop()
            
            let token = CodeToken()
            token.value += String(character)
            
            self.tokens.append(token)
            
            return .code
        }
        
        if character.isRightSquareBracket{
            
            self.pop()
            
            return .link
        }
        
        if character.isRightParenthesis {
            
            self.pop()
            
            return .initial
        }
        
        return .initial
    }
    
    /// Consumes a character for a code emphisis
    ///
    /// ```
    /// `code`
    /// ```
    ///
    private func consumeCode(_ character: Character) -> InsertionMode {
        
        self.verbose(function: #function, character: character)
        
        if character.isLetter || character.isWhitespace {
            
            let token = TextToken()
            token.value += String(character)
            
            self.tokens.append(token)
            
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
        
        self.verbose(function: #function, character: character)
        
        if character.isLetter {
            
            let token = TextToken()
            token.value += String(character)
            
            self.tokens.append(token)
            
            return .textLiteral
        }
        
        if character.isLeftParenthesis {
            return .link
        }
        
        return .initial
    }
}

extension Markdown {
    
    /// A type that represents a emphisis token
    internal class EmphisisToken: BlockToken {
        
        /// A enumeration of the variation of emphisis tokens
        private enum TokenKind {
            
            /// Indicates a strike through emphisis
            case strikethrough
            
            /// Indicates a italic emphisis
            case italic
            
            /// Indicates a bold emphisis
            case bold
            
            /// Indicates a italic and bold emphisis
            case both
        }
        
        internal var children: [Token]
        
        /// The value of the token
        internal var value: String
        
        private var kind: TokenKind {
            
            if value.contains("~~") || value.contains("~") {
                return .strikethrough
            }
            
            if value.contains("***") || value.contains("___") {
                return .both
            }
            
            if value.contains("**") || value.contains("__") {
                return .bold
            }
            
            return .italic
        }
        
        /// Initiates a emphisis token
        internal init() {
            
            self.value = ""
            self.children = []
        }
        
        /// Renders a token into its HTML representation
        internal func render() -> String {
            
            var output = ""
            
            switch kind {
            case .strikethrough:
                
                if !children.isEmpty {
                    
                    output += "<del>"
                    output += children.flatMap { $0.render() }
                    
                } else {
                    output += "</del>"
                }
                
            case .italic:
            
                if !children.isEmpty {
                    
                    output += "<em>"
                    output += children.flatMap { $0.render() }
                    
                } else {
                    output += "</em>"
                }
                
            case .bold:
                
                if !children.isEmpty {
                    
                    output += "<strong>"
                    output += children.flatMap { $0.render() }
                    
                } else {
                    output += "</strong>"
                }
                
            case .both:
                
                if !children.isEmpty {
                    
                    output += "<em><strong>"
                    output += children.flatMap { $0.render() }
                    
                } else {
                    output += "</strong></em>"
                }
            }
            
            return output
        }
    }

    /// A type that represents a text token
    internal class TextToken: Token {
        
        /// The value of the token
        internal var value: String
        
        /// Initiates a text token
        internal init() {
            
            self.value = ""
        }
        
        /// Renders a token into its HTML representation
        internal func render() -> String {
            return value
        }
    }

    /// A type that represents a emphisis token
    internal class LinkToken: BlockToken {
        
        internal var children: [Token]
        
        /// The value of the token
        internal var value: String
        
        /// Initiates a link token
        internal init() {
            
            self.value = ""
            self.children = []
        }
        
        /// Renders a token into its HTML representation
        internal func render() -> String {
            return "<a href=\"\(children[1].value)\">\(children[0].value)</a>"
        }
    }

    /// A type that represents a code token
    internal class CodeToken: BlockToken {
        
        internal var children: [Token]
        
        /// The value of the token
        internal var value: String
        
        /// Initiates a code token
        internal init() {
            
            self.value = ""
            self.children = []
        }
        
        /// Renders a token into its HTML representation
        internal func render() -> String {
            
            var output = ""
            
            if !children.isEmpty {
                
                output += "<code>"
                output += children.flatMap { $0.render() }
                
            } else {
                output += "</code>"
            }
            
            return output
        }
    }

}
