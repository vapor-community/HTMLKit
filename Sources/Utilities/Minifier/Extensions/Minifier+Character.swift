import Foundation

extension Character {
    
    /// A boolean value indicating whether this character represents an ampersand (U+0026).
    public var isAmpersand: Bool {
        
        if self == "\u{0026}" {
            return true
        }
        
        return false
    }
    
    /// A boolean value indicating whether this character represents a question mark (U+003F).
    public var isQuestionMark: Bool {
        
        if self == "\u{003F}" {
            return true
        }
        
        return false
    }
    
    /// A boolean value indicating whether this character represents a greater-than sign (U+003E).
    public var isGreaterThanSign: Bool {
        
        if self == "\u{003E}" {
            return true
        }
        
        return false
    }
    
    /// A boolean value indicating whether this character represents a less-than sign (U+003C).
    public var isLessThanSign: Bool {
        
        if self == "\u{003C}" {
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
    
    /// A boolean value indicating whether this character represents an exclamation mark (U+0021).
    public var isExclamationMark: Bool {
        
        if self == "\u{0021}" {
            return true
        }
        
        return false
    }
    
    /// A boolean value indicating whether this character represents an equal sign (U+003D).
    public var isEqualSign: Bool {
        
        if self == "\u{003D}" {
            return true
        }
        
        return false
    }
    
    /// A boolean value indicating whether this character represents an apostrophe (U+0027).
    public var isApostrophe: Bool {
        
        if self == "\u{0027}" {
            return true
        }
        
        return false
    }
    
    /// A boolean value indicating whether this character represents an quotation mark (U+0022)
    public var isQuotationMark: Bool {
        
        if self == "\u{0022}" {
            return true
        }
        
        return false
    }
    
    /// A boolean value indicating whether this character represents an hyphen minus (U+002D).
    public var isHyphenMinus: Bool {
        
        if self == "\u{002D}" {
            return true
        }
        
        return false
    }
    
    /// A boolean value indicating whether this character represents a number sign (U+0023).
    public var isNumberSign: Bool {
        
        if self == "\u{0023}" {
            return true
        }
        
        return false
    }
    
    /// A boolean value indicating whether this character represents an asterisk (U+002A).
    public var isAsterisk: Bool {
        
        if self == "\u{002A}" {
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
    
    /// A boolean value indicating whether this character represents a colon (U+003A)
    public var isColon: Bool {
        
        if self == "\u{003A}" {
            return true
        }
        
        return false
    }
    
    /// A boolean value indicating whether this character represents a semicolon (U+003B)
    public var isSemicolon: Bool {
        
        if self == "\u{003B}" {
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
    
    /// A boolean value indicating whether this character represents a comma (U+002C)
    public var isComma: Bool {
        
        if self == "\u{002C}" {
            return true
        }
        
        return false
    }
    
    /// A boolean value indicating whether this character represents a comma (U+0040)
    public var isCommercialAt: Bool {
        
        if self == "\u{0040}" {
            return true
        }
        
        return false
    }
    
    /// A boolean value indicating whether this character represents a comma (U+0024)
    public var isDollarSign: Bool {
        
        if self == "\u{0024}" {
            return true
        }
        
        return false
    }
    
    /// A boolean value indicating whether this character represents a comma (U+005F)
    public var isUnderscore: Bool {
        
        if self == "\u{005F}" {
            return true
        }
        
        return false
    }
    
    /// A boolean value indicating whether this character represents a comma (U+0028)
    public var isLeftParenthesis: Bool {
        
        if self == "\u{0028}" {
            return true
        }
        
        return false
    }
    
    /// A boolean value indicating whether this character represents a comma (U+0029)
    public var isRightParenthesis: Bool {
        
        if self == "\u{0029}" {
            return true
        }
        
        return false
    }
    
    /// A boolean value indicating whether this character represents a comma (U+007B)
    public var isLeftCurlyBracket: Bool {
        
        if self == "\u{007B}" {
            return true
        }
        
        return false
    }
    
    /// A boolean value indicating whether this character represents a comma (U+007D)
    public var isRightCurlyBracket: Bool {
        
        if self == "\u{007D}" {
            return true
        }
        
        return false
    }
    
    public var isLeftSquareBracket: Bool {
        
        if self == "\u{005B}" {
            return true
        }
        
        return false
    }
    
    public var isRightSquareBracket: Bool {
        
        if self == "\u{005D}" {
            return true
        }
        
        return false
    }
    
    /// A boolean value indicating whether this character represents a bracket.
    ///
    /// For example, the following characters all represent brackets:
    ///
    /// - "(" (U+0028 LEFT PARENTHESIS)
    /// - ")" (U+0029 RIGHT PARENTHESIS)
    /// - "{" (U+007B LEFT CURLY BRACKET)
    /// - "}" (U+007D RIGHT CURLY BRACKET)
    /// - "[" (U+005B LEFT SQUARE BRACKET)
    /// - "]" (U+005D RIGHT SQUARE BRACKET)
    public var isBracket: Bool {
        
        if self == "\u{0028}" || self == "\u{0029}" || self == "\u{007B}" || self == "\u{007D}" || self == "\u{005B}" || self == "\u{005D}" {
            return true
        }
        
        return false
    }
    
    /// A boolean value indicating whether this character represents a operator.
    ///
    /// For example, the following characters all represent brackets:
    ///
    /// - "<" (U+003C LESS-THAN SIGN)
    /// - ">" (U+003E GREATER-THAN SIGN
    /// - "+" (U+002B PLUS SIGN)
    /// - "-" (U+2212 MINUS SIGN)
    /// - "\*" (U+002A ASTERSIK SIGN)
    public var isOperator: Bool {
        
        if self == "\u{003C}" || self == "\u{003E}" || self == "\u{002B}" || self == "\u{2212}" || self == "\u{002A}" || self == "\u{007E}" {
            return true
        }
        
        return false
    }
}
