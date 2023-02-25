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
    
    internal func mutate(font class: String) -> Self {
        return self.mutate(class: `class`)
    }
    
    internal func mutate(foregroundcolor class: String) -> Self {
        return self.mutate(class: `class`)
    }
    
    internal func mutate(fontsize class: String) -> Self {
        return self.mutate(class: `class`)
    }
    
    internal func mutate(fontweight class: String) -> Self {
        return self.mutate(class: `class`)
    }
    
    internal func mutate(fonttransformation class: String) -> Self {
        return self.mutate(class: `class`)
    }
    
    internal func mutate(fontstyle class: String) -> Self {
        return self.mutate(class: `class`)
    }
    
    internal func mutate(bold class: String) -> Self {
        return self.mutate(class: `class`)
    }
    
    internal func mutate(italic class: String) -> Self {
        return self.mutate(class: `class`)
    }
    
    internal func mutate(underline class: String) -> Self {
        return self.mutate(class: `class`)
    }
}
