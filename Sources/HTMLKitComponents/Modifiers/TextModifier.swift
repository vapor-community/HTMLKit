/// A type that describes the modifier of a text component.
public protocol TextModifier {
    
    /// Set the font face for the text.
    ///
    /// - Parameter family: The font face to use for the text.
    ///
    /// - Returns: The text
    func font(_ family: Tokens.FontFamily) -> Self
    
    /// Set the style for the text.
    ///
    /// - Parameter style: The option to apply.
    ///
    /// - Returns: The text
    func textStyle(_ style: Tokens.TextStyle) -> Self
    
    /// Set the style for the text.
    ///
    /// - Parameter style: The configuration to apply.
    ///
    /// - Returns: The text
    func textStyle(_ style: TextConfiguration) -> Self
    
    /// Fill the foreground of the text.
    ///
    /// - Parameter color: The color to use for the foreground.
    ///
    /// - Returns: The text
    func foregroundColor(_ color: Tokens.ForegroundColor) -> Self
    
    /// Set the font size for the text.
    ///
    /// - Parameter size: The unit to size the text.
    ///
    /// - Returns: The component
    func fontSize(_ size: Tokens.FontSize) -> Self
    
    /// Set the font weight for the text.
    ///
    /// - Parameter weight: The weight to apply to the text.
    ///
    /// - Returns: The text
    func fontWeight(_ weight: Tokens.FontWeight) -> Self
    
    /// Set the transformation for the text.
    ///
    /// - Parameter case: The case to apply to the text.
    ///
    /// - Returns: The component
    func textCase(_ case: Tokens.TextCase) -> Self
    
    /// Set the font style for the text.
    ///
    /// - Parameter style: The style to apply to the text.
    ///
    /// - Returns: The text
    func fontStyle(_ style: Tokens.FontStyle) -> Self
    
    /// Set the decoration for the text.
    ///
    /// - Parameter decoration: The decoration to apply to the text.
    ///
    /// - Returns: The text
    func textDecoration(_ decoration: Tokens.TextDecoration) -> Self
    
    /// Apply a bold font weight to the text.
    func bold() -> Self
    
    /// Apply a bold font weight to the text.
    ///
    /// - Parameter condition: Whether to apply the weight.
    ///
    /// - Returns: The text
    func bold(_ condition: Bool) -> Self
    
    /// Apply italics to the text.
    func italic() -> Self
    
    /// Apply italics to the text.
    ///
    /// - Parameter condition: Whether to apply the italics.
    ///
    /// - Returns: The text
    func italic(_ condition: Bool) -> Self
    
    /// Apply an underline to the text.
    func underline() -> Self
    
    /// Apply an underline to the text.
    ///
    /// - Parameter condition: Whether to apply the underline.
    ///
    /// - Returns: The text
    func underline(_ condition: Bool) -> Self
    
    /// Apply an strikethrough to the text.
    func strikethrough() -> Self
    
    /// Apply an strikethrough to the text.
    ///
    /// - Parameter condition: Whether to apply the strikethrough.
    ///
    /// - Returns: The text
    func strikethrough(_ condition: Bool) -> Self
    
    /// Set the line height for the text.
    ///
    /// - Parameter height: Whether to apply the height.
    ///
    /// - Returns: The text
    func lineSpacing(_ height: Tokens.LineHeight) -> Self
    
    /// Set the limit of the lines for the text.
    ///
    /// - Parameter limit: The number of lines to limit the text to.
    ///
    /// - Returns: The text
    func lineLimit(_ limit: Tokens.LineLimit) -> Self
    
    /// Add drop shadow to the view.
    ///
    /// - Parameters:
    ///   - radius: The radius to extend the shadow.
    ///   - color: The color to fill the shadow.
    ///
    /// - Returns: The component
    func shadow(_ radius: Tokens.BlurRadius, color: Tokens.ShadowColor) -> Self
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
    
    internal func mutate(shadow radius: String, color: String) -> Self {
        return mutate(classes: ["shadow:\(radius)", "shadow:\(color)"])
    }
}
