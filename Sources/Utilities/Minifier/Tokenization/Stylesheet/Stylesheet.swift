internal class Stylesheet {
    
    /// A enumeration of different states of the minifier
    ///
    /// Code is the initial state.
    internal enum InsertionMode: String {
        
        case code
        case beforecomment
        case comment
        case aftercomment
        case selector
        case property
        case beforecustomproperty
        case customproperty
        case beforevalue
        case value
        case unidentified
        case string
        case rule
        case argument
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
    
    private var cache: String?
    
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
    
    /// Caches the character for later
    private func cache(character: Character) {
        
        self.verbose(function: #function, character: " ")
        
        if var cache = self.cache {
            
            cache.append(character)
            
            self.cache = cache
            
        } else {
            self.cache = String(character)
        }
    }
    
    /// Clears the cache
    private func clear() -> String {
        
        self.verbose(function: #function, character: " ")
        
        guard let value = self.cache else {
            fatalError("Wait, there is nothing to clear")
        }
        
        self.cache = nil
        
        return value
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
    
    /// Collects the character for the token value
    private func collect(_ character: Character) {
        
        if var token = self.token {
            token.value.append(character)
        }
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
                
            case .property:
                self.mode = consumeProperty(character.element)
                
            case .beforecustomproperty:
                self.mode = consumeBeforeCustomProperty(character.element)
                
            case .customproperty:
                self.mode = consumeCustomProperty(character.element)
                
            case .beforevalue:
                self.mode = consumeBeforeValue(character.element)
                
            case .value:
                self.mode = consumeValue(character.element)
                
            case .unidentified:
                self.mode = consumeUnkown(character.element)
                
            case .string:
                self.mode = consumeStringLiteral(character.element)
                
            case .rule:
                self.mode = consumeRule(character.element)
                
            case .argument:
                self.mode = consumeArgument(character.element)
                
            default:
                self.mode = consumeCode(character.element)
            }
        }
        
        return tokens
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
            
            self.cache(character: character)
            
            return .unidentified
        }
        
        if character.isQuotationMark {
            
            self.assign(token: LiteralToken(value: ""))
            
            return .string
        }
        
        if character.isCommercialAt {
            
            self.assign(token: SelectorToken(type: .rule, value: ""))
            
            return .selector
        }
        
        if character.isHyphenMinus {
            // ignore character
            return .beforecustomproperty
        }
        
        if character.isLeftParenthesis {
            
            self.emit(token: FormatToken(type: .punctuator, value: String(character)))
            
            self.assign(token: RuleToken(value: ""))
            
            return .rule
        }
        
        if character.isLeftCurlyBracket || character.isRightCurlyBracket || character.isComma {
            
            self.emit(token: FormatToken(type: .punctuator, value: String(character)))
            
            return .code
        }
        
        if character.isLeftSquareBracket {
            
            self.assign(token: SelectorToken(type: .attribute, value: String(character)))
            
            return .selector
        }
        
        if character.isOperator {
            
            self.emit(token: FormatToken(type: .operator, value: String(character)))
            
            return .code
        }
        
        return .code
    }
    
    /// Consumes the character before the comment
    internal func consumeBeforeComment(_ character: Character) -> InsertionMode {
        
        self.verbose(function: #function, character: character)
        
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
        
        self.verbose(function: #function, character: character)
        
        if character.isAsterisk {
            
            self.emit()
            
            return .aftercomment
        }
        
        self.collect(character)
        
        return .comment
    }
    
    /// Consumes the character after a comment
    internal func consumeAfterComment(_ character: Character) -> InsertionMode {
        
        self.verbose(function: #function, character: character)
        
        if character.isSolidus {
            
            return .code
        }
        
        // ignore character
        return .aftercomment
    }
    
    /// Consumes a selector
    ///
    /// ```css
    /// .selector {
    /// }
    /// ```
    internal func consumeSelector(_ character: Character) -> InsertionMode {
        
        self.verbose(function: #function, character: character)
        
        if character.isWhitespace {
            
            self.emit()
            
            self.emit(token: WhitespaceToken(type: .whitespace, value: ""))
            
            return .code
        }
        
        self.collect(character)
        
        return .selector
    }
    
    /// Consumes the character of a property
    ///
    /// ```css
    /// property: value;
    /// ```
    internal func consumeProperty(_ character: Character) -> InsertionMode {
        
        self.verbose(function: #function, character: character)
        
        if character.isWhitespace {
           
            self.emit(token: WhitespaceToken(type: .whitespace, value: ""))
            
            return .property
        }
        
        if character.isColon {
            
            self.emit()
            
            self.emit(token: FormatToken(type: .punctuator, value: String(character)))
            
            return .beforevalue
        }
        
        self.collect(character)
        
        return .property
    }
    
    /// Consumes a character before a custom property
    internal func consumeBeforeCustomProperty(_ character: Character) -> InsertionMode {
        
        self.verbose(function: #function, character: character)
        
        if character.isHyphenMinus {
            
            self.assign(token: PropertyToken(type: .custom, value: ""))
            
            return .customproperty
        }
        
        if character.isLetter {
            
            self.assign(token: PropertyToken(type: .browser, value: String(character)))
            
            return .property
        }
        
        return .beforecustomproperty
    }
    
    /// Consumes a character of a custom property
    ///
    /// ```css
    /// --customproperty; value;
    /// ```
    internal func consumeCustomProperty(_ character: Character) -> InsertionMode {
        
        self.verbose(function: #function, character: character)
        
        if character.isWhitespace {
           
            self.emit(token: WhitespaceToken(type: .whitespace, value: ""))
            
            return .customproperty
        }
        
        if character.isColon {
            
            self.emit()
            
            self.emit(token: FormatToken(type: .punctuator, value: String(character)))
            
            return .beforevalue
        }
        
        self.collect(character)
        
        return .customproperty
    }
    
    /// Consumes the character in front of a value
    internal func consumeBeforeValue(_ character: Character) -> InsertionMode {
        
        self.verbose(function: #function, character: character)
        
        if character.isSemicolon {
            
            self.emit()
            
            self.emit(token: FormatToken(type: .terminator, value: String(character)))
            
            return .code
        }
        
        if character.isQuotationMark {
            
            self.assign(token: ValueToken(type: .string, value: ""))
            
            return .value
        }
        
        if character.isNumber {
            
            self.assign(token: ValueToken(type: .numeric, value: String(character)))
            
            return .value
        }
        
        if character.isLetter {
            
            self.assign(token: ValueToken(type: .keyword, value: String(character)))
            
            return .value
        }
        
        if character.isExclamationMark {
            
            self.assign(token: ValueToken(type: .rule, value: String(character)))
            
            return .value
        }
        
        return .beforevalue
    }
    
    /// Consumes the character of a value
    ///
    /// ```css
    /// property: value;
    /// ```
    internal func consumeValue(_ character: Character) -> InsertionMode {
        
        self.verbose(function: #function, character: character)
        
        if character.isSemicolon {
            
            self.emit()
            
            self.emit(token: FormatToken(type: .terminator, value: String(character)))
            
            return .code
        }
        
        if character.isLeftParenthesis {
            
            self.emit()
            
            self.emit(token: FormatToken(type: .parenthesis, value: String(character)))
            
            self.assign(token: ValueToken(type: .function, value: ""))

            return .argument
        }
        
        if character.isWhitespace {
           
            self.emit()
            
            self.emit(token: WhitespaceToken(type: .whitespace, value: String(character)))
            
            return .beforevalue
        }
        
        if character.isQuotationMark {
            
            self.emit()
            
            return .beforevalue
        }
        
        if character.isComma {
            
            self.emit()
            
            self.emit(token: FormatToken(type: .terminator, value: String(character)))
            
            return .beforevalue
        }
        
        self.collect(character)
        
        return .value
    }
    
    /// Consumes a uncertain character sequence
    internal func consumeUnkown(_ character: Character) -> InsertionMode {
        
        self.verbose(function: #function, character: character)
        
        if character.isColon {
            
            self.emit(token: PropertyToken(type: .regular, value: clear()))
            
            self.emit(token: FormatToken(type: .terminator, value: String(character)))
            
            return .beforevalue
        }
        
        if character.isWhitespace || character.isLeftCurlyBracket {
            
            self.emit(token: SelectorToken(type: .type, value: clear()))
            
            self.emit(token: WhitespaceToken(type: .whitespace, value: ""))
            
            return .code
        }
        
        self.cache(character: character)
        
        return .unidentified
    }
    
    /// Consumes a chracter for a string literal
    ///
    /// ```css
    /// "string"
    /// ```
    ///
    internal func consumeStringLiteral(_ character: Character) -> InsertionMode {
        
        self.verbose(function: #function, character: character)
        
        if character.isQuotationMark {
            
            self.emit()
            
            return .code
        }
        
        self.collect(character)
        
        return .string
    }
    
    /// Consumes a character for a rule selector
    ///
    /// ```css
    /// @rule {
    /// }
    /// ```
    internal func consumeRule(_ character: Character) -> InsertionMode {
        
        self.verbose(function: #function, character: character)
        
        if character.isRightParenthesis {
            
            self.emit()
            
            self.emit(token: FormatToken(type: .punctuator, value: String(character)))
            
            return .code
        }
        
        self.collect(character)
        
        return .rule
    }
    
    /// Consumes a character of an function argument
    ///
    /// ```css
    /// function(argument);
    /// ```
    internal func consumeArgument(_ character: Character) -> InsertionMode {
        
        self.verbose(function: #function, character: character)
        
        if character.isRightParenthesis {
            
            let leftParenthesis = self.tokens.filter({ $0.value == "(" })
            let rightParenthesis = self.tokens.filter({ $0.value == ")" })

            if (rightParenthesis.count + 1) != leftParenthesis.count {
                
                self.emit()
                
                self.emit(token: FormatToken(type: .parenthesis, value: String(character)))
                
                self.assign(token: ValueToken(type: .function, value: ""))
                
                return .argument
            }
            
            self.emit()
            
            self.emit(token: FormatToken(type: .parenthesis, value: String(character)))
            
            return .beforevalue
        }
        
        if character.isLeftParenthesis {
            
            self.emit()
            
            self.emit(token: FormatToken(type: .parenthesis, value: String(character)))
            
            self.assign(token: ValueToken(type: .function, value: ""))
            
            return .argument
        }
        
        self.collect(character)
        
        return .argument
    }
}

extension Stylesheet {

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
            
            /// Indicates the set is about an type
            case type
            
            /// Indicates the set is about a class
            case `class`
            
            /// Indicates the set is about a id
            case id
            
            /// Indicates the set is about a root
            case root
            
            /// Indicates a universal selector
            case universal
            
            /// Indicates a attribute selector
            case attribute
            
            /// Indicates a rule selector
            case rule
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
            case .type:
                return "\(value)"
                
            case .class:
                return ".\(value)"
                
            case .id:
                return "#\(value)"
                
            case .root:
                return ":\(value)"
                
            case .universal:
                return value
                
            case .attribute:
                return value
                
            case .rule:
                return "@\(value)"
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
            
            /// Indicates a parenthesis
            case parenthesis
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
            
            /// Indicates a regular property
            case regular
            
            /// Indicates a custom property
            case custom
            
            /// Indicates a browser property
            case browser
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
            case .regular:
                return "\(value)"
                
            case .browser:
                return "-\(value)"
                
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
            
            /// Indicates a function
            case function
            
            /// Indicates a string
            case string
            
            /// indicates a rule
            case rule
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
            case .string:
                return "\"\(value)\""
                
            default:
                return value
            }
        }
    }
    
    internal class LiteralToken: Token {
        
        internal var value: String
        
        internal init(value: String) {
            self.value = value
        }
        
        internal func present() -> String {
            return "\"\(value)\""
        }
    }
    
    internal class RuleToken: Token {
        
        internal var value: String
        
        internal init(value: String) {
            self.value = value
        }
        
        internal func present() -> String {
            return value
        }
    }
}
