import HTMLKit

/// A view that represents a grouping.
///
/// Use `Grouping` to collect content.
///
/// ```swift
/// Grouping {
///     Button(role: .button) {
///         "Lorem ipsum"
///     }
///     Button(role: .button) {
///         "Lorem ipsum"
///     }
/// }
/// ```
public struct Grouping: View, Modifiable, Identifiable {
    
    /// The unique identifier of the grouping.
    internal var id: String?
    
    /// The body content of the grouping.
    internal var content: [Content]
    
    /// The class names for the grouping.
    internal var classes: [String]
    
    /// Create a grouping.
    ///
    /// - Parameter content: The grouping's content.
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        
        self.content = content()
        self.classes = ["grouping"]
    }

    public var body: Content {
        Division {
            content
        }
        .class(classes.joined(separator: " "))
        .modify(unwrap: id) {
            $0.id($1)
        }
    }
    
    /// Set the frame for the grouping.
    ///
    /// - Parameters:
    ///   - width: The width to constrain the frame to.
    ///   - height: The height to constrain the frame to.
    ///   - alignment: The rule to align the frame relative to its parent.
    ///
    /// - Returns: The grouping
    public func frame(width: Tokens.ViewWidth, height: Tokens.ViewHeight? = nil, alignment: Tokens.FrameAlignment? = nil) -> Grouping {
        
        var newSelf = self
        
        if let height {
            newSelf.classes.append("height:\(height.value)")
        }
        
        if let alignment {
            newSelf.classes.append("frame-alignment:\(alignment.value)")
        }
        
        newSelf.classes.append("width:\(width.value)")
        
        return newSelf
    }
    
    /// Set the identifier for the grouping.
    ///
    /// - Parameter value: The value of the identifier.
    ///
    /// - Returns: The grouping
    public func tag(_ value: String) -> Grouping {
        return self.mutate(id: value)
    }
}

extension Grouping: TextModifier {
    
    public func font(_ family: Tokens.FontFamily) -> Grouping {
        return mutate(fontfamily: family.value)
    }
    
    public func textStyle(_ style: Tokens.TextStyle) -> Grouping {
        return self.mutate(textstyle: style.value)
    }
    
    public func textStyle(_ style: TextConfiguration) -> Grouping {
        return self.mutate(classes: style.configuration)
    }
    
    public func foregroundColor(_ color: Tokens.ForegroundColor) -> Grouping {
        return self.mutate(foregroundcolor: color.value)
    }
    
    public func fontSize(_ size: Tokens.FontSize) -> Grouping {
        return self.mutate(fontsize: size.value)
    }
    
    public func fontWeight(_ weight: Tokens.FontWeight) -> Grouping {
        return self.mutate(fontweight: weight.value)
    }
    
    public func textCase(_ case: Tokens.TextCase) -> Grouping {
        return self.mutate(textcase: `case`.value)
    }
    
    public func textDecoration(_ decoration: Tokens.TextDecoration) -> Grouping {
        return self.mutate(textdecoration: decoration.value)
    }
    
    public func fontStyle(_ style: Tokens.FontStyle) -> Grouping {
        return self.mutate(fontstyle: style.value)
    }
    
    public func bold(_ condition: Bool = true) -> Grouping {
        
        if condition {
            return self.mutate(fontweight: Tokens.FontWeight.bold.value)
        }
        
        return self
    }
    
    public func italic(_ condition: Bool = true) -> Grouping {
    
        if condition {
            return self.mutate(fontstyle: Tokens.FontStyle.italic.value)
        }
        
        return self
    }
    
    public func underline(_ condition: Bool = true) -> Grouping {
        
        if condition {
            return self.mutate(textdecoration: Tokens.TextDecoration.underline.value)
        }
        
        return self
    }
    
    public func strikethrough(_ condition: Bool = true) -> Grouping {
        
        if condition {
            return self.mutate(textdecoration: Tokens.TextDecoration.strikeThrough.value)
        }
        
        return self
    }
    
    public func lineSpacing(_ height: Tokens.LineHeight) -> Grouping {
        return self.mutate(lineheight: height.value)
    }
    
    public func lineLimit(_ limit: Tokens.LineLimit) -> Grouping {
        return self.mutate(linelimit: limit.value)
    }
    
    public func shadow(_ radius: Tokens.BlurRadius, color: Tokens.ShadowColor = .black) -> Grouping {
        return mutate(shadow: radius.value, color: color.value)
    }
}
