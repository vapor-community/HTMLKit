import Foundation

extension Character {
    
    /// A boolean value indicating whether this character represents an asterisk (U+002A).
    internal var isAsterisk: Bool {
        
        if self == "\u{002A}" {
            return true
        }
        
        return false
    }
    
    /// A boolean value indicating whether this character represents a comma (U+005F).
    internal var isUnderscore: Bool {
        
        if self == "\u{005F}" {
            return true
        }
        
        return false
    }

    /// A boolean value indicating whether this character represents a tilde (U+007E).
    internal var isTilde: Bool {
        
        if self == "\u{007E}" {
            return true
        }
        
        return false
    }
    
    /// A boolean value indicating whether this character represents a back tick (U+0060).
    public var isBackTick: Bool {
        
        if self == "\u{0060}" {
            return true
        }
        
        return false
    }
    
    /// A boolean value indicating whether this character represents a left square bracket (U+005B).
    public var isLeftSquareBracket: Bool {
        
        if self == "\u{005B}" {
            return true
        }
        
        return false
    }
    
    /// A boolean value indicating whether this character represents a right square bracket (U+005D).
    public var isRightSquareBracket: Bool {
        
        if self == "\u{005D}" {
            return true
        }
        
        return false
    }
    
    /// A boolean value indicating whether this character represents a left parenthesis (U+0028).
    public var isLeftParenthesis: Bool {
        
        if self == "\u{0028}" {
            return true
        }
        
        return false
    }
    
    /// A boolean value indicating whether this character represents a right parenthesis (U+0029).
    public var isRightParenthesis: Bool {
        
        if self == "\u{0029}" {
            return true
        }
        
        return false
    }
    
    /// A boolean value indicating whether this character represents a solidus (U+002F).
    public var isSolidus: Bool {
        
        if self == "\u{002F}" {
            return true
        }
        
        return false
    }
    
    /// A boolean value indicating whether this character represents a colon (U+003A).
    public var isColon: Bool {
        
        if self == "\u{003A}" {
            return true
        }
        
        return false
    }
    
    /// A boolean value indicating whether this character represents a period (U+002E).
    public var isPeriod: Bool {
        
        if self == "\u{002E}" {
            return true
        }
        
        return false
    }
}
