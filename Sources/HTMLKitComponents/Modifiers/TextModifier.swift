/*
 Abstract:
 The file contains the modifiers for text components.
 */

/// A type that describes the modifier of a text component.
public protocol TextModifier {
    
    /// Sets the style of the text.
    func font(_ style: Tokens.TextStyle) -> Self
    
    /// Sets the foreground color of the text.
    func foregroundColor(_ color: Tokens.ForegroundColor) -> Self
    
    /// Sets the size of the text.
    func fontSize(_ size: Tokens.FontSize) -> Self
    
    /// Sets the weight of the text.
    func fontWeight(_ weight: Tokens.FontWeight) -> Self
    
    /// Sets the transformation for the text.
    func fontTransformation(_ transformation: Tokens.TextTransformation) -> Self
    
    /// Sets the style of the font.
    func fontStyle(_ style: Tokens.FontStyle) -> Self
    
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
    
    internal func mutate(font value: String) -> Self {
        return self.mutate(class: "style:\(value)")
    }
    
    internal func mutate(foregroundcolor value: String) -> Self {
        return self.mutate(class: "color:\(value)")
    }
    
    internal func mutate(fontsize value: String) -> Self {
        return self.mutate(class: "size:\(value)")
    }
    
    internal func mutate(fontweight value: String) -> Self {
        return self.mutate(class: "weight:\(value)")
    }
    
    internal func mutate(fonttransformation value: String) -> Self {
        return self.mutate(class: "transformation:\(value)")
    }
    
    internal func mutate(fontstyle value: String) -> Self {
        return self.mutate(class: "style:\(value)")
    }
    
    internal func mutate(fontdecoration value: String) -> Self {
        return self.mutate(class: "decoration:\(value)")
    }
    
    internal func mutate(lineheight value: String) -> Self {
        return self.mutate(class: "height:\(value)")
    }
    
    internal func mutate(linelimit value: String) -> Self {
        return self.mutate(class: "limit:\(value)")
    }
}
