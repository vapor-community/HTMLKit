import Foundation

internal class CSSMinifier {
    
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
    internal var tree: [Ruleset]
    
    /// An indicator for a closure
    internal var sets: [Ruleset]
    
    /// A declaration in the closure of a selector
    private var declaration: Declaration?
    
    /// The  state of the minifier
    private var mode: InsertionMode
    
    /// The level of logging
    private var level: LogLevel
    
    /// Creates a minifier
    internal init(mode: InsertionMode = .code, log level: LogLevel = .none) {
        
        self.tree = []
        self.sets = []
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
    
    /// Pops the last node
    private func pop() {
        
        print(#function)
        
        let last = self.sets.removeLast()
        
        if let penultimate = self.sets.last {
            penultimate.add(ruleset: last)
            
        } else {
            self.tree.append(last)
        }
    }
    
    /// Emits the last declaration
    private func emit() {
        
        print(#function)
        
        if let declaration = self.declaration {
            
            if let last = self.sets.last {
                last.add(declaration: declaration)
            }
        }
        
        self.declaration = nil
    }
    
    /// Consumes the content by the state the minifier is currently in
    internal func consume(content: String) {
        
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
    }
    
    /// Minifies the selector sets in the tree
    internal func minify() -> String {
        return self.tree.map { $0.minify() }.joined()
    }
    
    /// Consumes the character
    internal func consumeCode(_ character: Character) -> InsertionMode {
        
        self.log(function: #function, character: character)
        
        if character == "/" {
            // ignore character
            return .beforecomment
        }
        
        if character == "." {
            
            let set = Ruleset(type: .class, selector: String(character))
            
            self.sets.append(set)
            
            return .selector
        }
        
        if character == ":" {
            
            let set = Ruleset(type: .root, selector: String(character))
            
            self.sets.append(set)
            
            return .selector
        }
        
        if character == "#" {
            
            let set = Ruleset(type: .id, selector: String(character))
            
            self.sets.append(set)
            
            return .selector
        }
        
        if character.isLetter {
            
            let set = Ruleset(type: .element, selector: String(character))
            
            self.sets.append(set)
            
            return .selector
        }
        
        if character == "@" {
            
            let set = Ruleset(type: .query, selector: String(character))
            
            self.sets.append(set)
            
            return .mediaquery
        }
        
        if character == "}" {
            
            self.pop()
            
            return .code
        }
        
        // ignore character
        return .code
    }
    
    /// Consumes the character before the comment
    internal func consumeBeforeComment(_ character: Character) -> InsertionMode {
        
        self.log(function: #function, character: character)
        
        if character == "*" {
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
        
        if character == "*" {
            // ignore character
            return .aftercomment
        }
        
        // ignore character
        return .comment
    }
    
    /// Consumes the character after a comment
    internal func consumeAfterComment(_ character: Character) -> InsertionMode {
        
        self.log(function: #function, character: character)
        
        if character == "/" {
            // ignore character
            
            if !self.sets.isEmpty {
                return .declaration
            }
            
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
        
        if character == "{" {
            
            return .declaration
        }
        
        if let last = self.sets.last {
            last.selector.append(String(character))
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
        
        if character == "}" {
            
            self.pop()
            
            return .code
        }
        
        if character == "/" {
            // ignore character
            return .beforecomment
        }
        
        if character.isWhitespace || character.isNewline {
            // ignore character
            return .declaration
        }
        
        if character.isLetter {
            
            self.declaration = Declaration(type: .property, property: String(character))
            
            return .property
        }
        
        if character == "-" {
            self.declaration = Declaration(type: .variable, property: String(character))
            
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
        
        if character == ":" {
            return .value
        }
        
        if let declaration = self.declaration {
            declaration.property.append(character)
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
        
        if character == ";" {
            
            self.emit()
            
            return .declaration
        }
        
        if character.isNewline  {
            // ignore character
            return .value
        }
        
        if let declaration = self.declaration {
            declaration.value.append(character)
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
        
        if character == "{" {
            
            return .code
        }
        
        if let last = self.sets.last {
            last.selector.append(String(character))
        }
        
        return .mediaquery
    }
}
