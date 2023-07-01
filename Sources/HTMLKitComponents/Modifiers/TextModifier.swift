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
    
    /// Applies italics to the text.
    func italic() -> Self
    
    /// Applies an underline to the text.
    func underline() -> Self
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
}
