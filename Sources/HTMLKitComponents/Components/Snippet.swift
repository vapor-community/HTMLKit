import HTMLKit

/// A view that represents a code snippet.
///
/// Use `Snippet` to display and highlight blocks of code.
///
/// ```swift
/// Snippet(highlight: .html) {
///     """
///     <h3>Lorem ipsum</h3>
///     """
/// }
/// ```
public struct Snippet: View, Modifiable, Identifiable {
    
    /// The unique identifier of the snippet.
    internal var id: String?
    
    /// The body content of the snippet.
    internal var content: [Content]
    
    /// The class names for the snippet.
    internal var classes: [String]
    
    /// Create a snippet.
    ///
    /// - Parameters:
    ///   - highlight: The language to highlight.
    ///   - content: The snippet's content.
    public init(highlight: Tokens.SyntaxHighlight, content: () -> String) {
        
        self.content = content()
            .replacingOccurrences(of: "<", with: "&lt;")
            .replacingOccurrences(of: ">", with: "&gt;")
            .components(separatedBy: "\n")
            .map { line in
                
                return Paragraph { line }
            }
        
        self.classes = ["snippet", "highlight:\(highlight.value)"]
    }
    
    public var body: Content {
        PreformattedText {
            content
        }
        .class(classes.joined(separator: " "))
        .modify(unwrap: id) {
            $0.id($1)
        }
    }
    
    /// Set the identifier for the snippet.
    ///
    /// - Parameter value: The value of the identifier
    ///
    /// - Returns: The snippet
    public func tag(_ value: String) -> Snippet {
        return self.mutate(id: value)
    }
    
    /// Set the style for the snippet.
    ///
    /// - Parameter style: The configuration to apply to.
    ///
    /// - Returns: The snippet
    public func snippetStyle(_ style: SnippetConfiguration) -> Snippet {
        return self.mutate(classes: style.configuration)
    }
}

extension Snippet: ViewModifier {

    public func opacity(_ value: Tokens.OpacityValue) -> Snippet {
        return self.mutate(opacity: value.value)
    }
    
    public func zIndex(_ index: Tokens.PositionIndex) -> Snippet {
        return self.mutate(zindex: index.value)
    }
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> Snippet {
        return self.mutate(backgroundcolor: color.value)
    }
    
    public func hidden(_ condition: Bool = true) -> Snippet {
        
        if condition {
            return self.mutate(viewstate: Tokens.ViewState.hidden.value)
        }
        
        return self
    }
    
    public func colorScheme(_ scheme: Tokens.ColorScheme) -> Snippet {
        return self.mutate(scheme: scheme.value)
    }
    
    public func padding(insets: EdgeSet = .all, length: Tokens.PaddingLength = .small) -> Snippet {
        return self.mutate(padding: length.value, insets: insets)
    }
    
    public func borderShape(_ shape: Tokens.BorderShape) -> Snippet {
        return self.mutate(bordershape: shape.value)
    }
    
    public func border(_ color: Tokens.BorderColor, width: Tokens.BorderWidth = .small) -> Snippet {
        return self.mutate(border: color.value, width: width.value)
    }
    
    public func frame(width: Tokens.ViewWidth, height: Tokens.ViewHeight? = nil, alignment: Tokens.FrameAlignment? = nil) -> Snippet {
        return mutate(frame: width.value, height: height?.value, alignment: alignment?.value)
    }
    
    public func margin(insets: EdgeSet = .all, length: Tokens.MarginLength = .small) -> Snippet {
        return self.mutate(margin: length.value, insets: insets)
    }
}
