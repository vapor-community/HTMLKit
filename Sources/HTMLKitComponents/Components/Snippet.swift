/*
 Abstract:
 The file contains everything related to the snippet component.
 */

import HTMLKit

/// A component that displays code content.
public struct Snippet: View, Modifiable, Identifiable {
    
    public var id: String?
    
    /// The content of the snippet.
    internal var content: [Content]
    
    /// The classes of the snippet.
    internal var classes: [String]
    
    /// Creates a snippet.
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
    
    public func tag(_ value: String) -> Snippet {
        return self.mutate(id: value)
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
    
    public func hidden() -> Snippet {
        return self.mutate(viewstate: Tokens.ViewState.hidden.value)
    }
    
    public func hidden(_ condition: Bool) -> Snippet {
        
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
    
    public func borderColor(_ color: Tokens.BorderColor) -> Snippet {
        return self.mutate(bordercolor: color.value)
    }
    
    public func frame(width: Tokens.ColumnSize, offset: Tokens.ColumnOffset? = nil) -> Snippet {
        return mutate(frame: width.value, offset: offset?.value)
    }
    
    public func margin(insets: EdgeSet = .all, length: Tokens.MarginLength = .small) -> Snippet {
        return self.mutate(margin: length.value, insets: insets)
    }
}
