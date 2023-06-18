/*
 Abstract:
 The file contains everything related to the snippet component.
 */

import HTMLKit

/// A component that displays code content.
public struct Snippet: View, Modifiable {
    
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
        
        self.classes = ["snippet", highlight.rawValue]
    }
    
    /// Creates a snippet.
    internal init(content: [Content], classes: [String]) {
        
        self.content = content
        self.classes = classes
    }
    
    public var body: Content {
        PreformattedText {
            content
        }
        .class(classes.joined(separator: " "))
    }
}

extension Snippet: ViewModifier {

    public func opacity(_ value: Tokens.OpacityValue) -> Snippet {
        return self.mutate(opacity: value.rawValue)
    }
    
    public func zIndex(_ index: Tokens.PositionIndex) -> Snippet {
        return self.mutate(zindex: index.rawValue)
    }
    
    public func backgroundColor(_ color: Tokens.BackgroundColor) -> Snippet {
        return self.mutate(backgroundcolor: color.rawValue)
    }
    
    public func hidden() -> Snippet {
        return self.mutate(viewstate: Tokens.ViewState.hidden.rawValue)
    }
    
    public func colorScheme(_ scheme: Tokens.ColorScheme) -> Snippet {
        return self.mutate(scheme: scheme.rawValue)
    }
    
    public func padding(_ length: Tokens.PaddingLength) -> Snippet {
        return self.mutate(padding: length.rawValue)
    }
    
    public func padding(insets: EdgeSet, _ length: Tokens.PaddingLength) -> Snippet {
        return self.mutate(padding: length.rawValue, insets: insets)
    }
    
    public func borderShape(_ shape: Tokens.BorderShape) -> Snippet {
        return self.mutate(bordershape: shape.rawValue)
    }
    
    public func borderColor(_ color: Tokens.BorderColor) -> Snippet {
        return self.mutate(bordercolor: color.rawValue)
    }
    
    public func frame(width: Tokens.ColumnSize, offset: Tokens.ColumnOffset? = nil) -> Snippet {
        
        if let offset {
            return self.mutate(frame: [width.rawValue, offset.rawValue])
        }
        
        return self.mutate(class: width.rawValue)
    }
}
