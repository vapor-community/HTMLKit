/*
 Abstract:
 The file contains the modifiers for text components.
 */

/// A type that describes the modifier of a text component.
public protocol TextModifier {
    
    func font(_ family: Tokens.FontFamily) -> Self
    
    /// Sets the style of the text.
    func textStyle(_ style: Tokens.TextStyle) -> Self
    
    /// Sets the style of the text.
    func textStyle(_ style: TextConfiguration) -> Self
    
    /// Sets the foreground color of the text.
    func foregroundColor(_ color: Tokens.ForegroundColor) -> Self
    
    /// Sets the size of the text.
    func fontSize(_ size: Tokens.FontSize) -> Self
    
    /// Sets the weight of the text.
    func fontWeight(_ weight: Tokens.FontWeight) -> Self
    
    /// Sets the transformation for the text.
    func textCase(_ case: Tokens.TextCase) -> Self
    
    /// Sets the style of the font.
    func fontStyle(_ style: Tokens.FontStyle) -> Self
    
    /// Sets the decoration for the text.
    func textDecoration(_ decoration: Tokens.TextDecoration) -> Self
    
    /// Applies a bold font weight to the text.
    func bold() -> Self
    
    func bold(_ condition: Bool) -> Self
    
    /// Applies italics to the text.
    func italic() -> Self
    
    func italic(_ condition: Bool) -> Self
    
    /// Applies an underline to the text.
    func underline() -> Self
    
    func underline(_ condition: Bool) -> Self
    
    /// Applies an strikethrough to the text.
    func strikethrough() -> Self
    
    func strikethrough(_ condition: Bool) -> Self
    
    /// Sets the line height for the text.
    func lineSpacing(_ height: Tokens.LineHeight) -> Self
    
    /// Sets the limit of the lines for the text.
    func lineLimit(_ limit: Tokens.LineLimit) -> Self
}

extension TextModifier where Self: Modifiable {
    
    internal func mutate(fontfamily value: String) -> Self {
        return self.mutate(class: "font:\(value)")
    }
    
    internal func mutate(textstyle value: String) -> Self {
        return self.mutate(class: "style:\(value)")
    }
    
    internal func mutate(foregroundcolor value: String) -> Self {
        return self.mutate(class: "foreground:\(value)")
    }
    
    internal func mutate(fontsize value: String) -> Self {
        return self.mutate(class: "size:\(value)")
    }
    
    internal func mutate(fontweight value: String) -> Self {
        return self.mutate(class: "weight:\(value)")
    }
    
    internal func mutate(textcase value: String) -> Self {
        return self.mutate(class: "case:\(value)")
    }
    
    internal func mutate(fontstyle value: String) -> Self {
        return self.mutate(class: "style:\(value)")
    }
    
    internal func mutate(textdecoration value: String) -> Self {
        return self.mutate(class: "decoration:\(value)")
    }
    
    internal func mutate(lineheight value: String) -> Self {
        return self.mutate(class: "height:\(value)")
    }
    
    internal func mutate(linelimit value: String) -> Self {
        return self.mutate(class: "limit:\(value)")
    }
}
