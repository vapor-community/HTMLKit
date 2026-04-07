import Foundation

extension Character {
    
    /// Whether this character represents an asterisk.
    internal var isAsterisk: Bool {
        
        if self == "\u{002A}" {
            return true
        }
        
        return false
    }
    
    /// Whether this character represents a comma.
    internal var isUnderscore: Bool {
        
        if self == "\u{005F}" {
            return true
        }
        
        return false
    }

    /// Whether this character represents a tilde.
    internal var isTilde: Bool {
        
        if self == "\u{007E}" {
            return true
        }
        
        return false
    }
    
    /// Whether this character represents a back tick.
    public var isBackTick: Bool {
        
        if self == "\u{0060}" {
            return true
        }
        
        return false
    }
    
    /// Whether this character represents a left square bracket.
    public var isLeftSquareBracket: Bool {
        
        if self == "\u{005B}" {
            return true
        }
        
        return false
    }
    
    /// Whether this character represents a right square bracket.
    public var isRightSquareBracket: Bool {
        
        if self == "\u{005D}" {
            return true
        }
        
        return false
    }
    
    /// Whether this character represents a left parenthesis.
    public var isLeftParenthesis: Bool {
        
        if self == "\u{0028}" {
            return true
        }
        
        return false
    }
    
    /// Whether this character represents a right parenthesis.
    public var isRightParenthesis: Bool {
        
        if self == "\u{0029}" {
            return true
        }
        
        return false
    }
    
    /// Whether this character represents a solidus.
    public var isSolidus: Bool {
        
        if self == "\u{002F}" {
            return true
        }
        
        return false
    }
    
    /// Whether this character represents a colon.
    public var isColon: Bool {
        
        if self == "\u{003A}" {
            return true
        }
        
        return false
    }
    
    /// Whether this character represents a period.
    public var isPeriod: Bool {
        
        if self == "\u{002E}" {
            return true
        }
        
        return false
    }
    
    /// Whether this character represents a period.
    public var isComma: Bool {
        
        if self == "\u{002C}" {
            return true
        }
        
        return false
    }
}
