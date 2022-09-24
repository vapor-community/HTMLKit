/*
 Abstract:
 The file contains everything related to the snippet component.
 */

import HTMLKit

/// A component that displays code content.
public struct Snippet: Component {
    
    /// The content of the snippet.
    internal var content: [AnyContent]
    
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
    internal init(content: [AnyContent], classes: [String]) {
        
        self.content = content
        self.classes = classes
    }
    
    public var body: AnyContent {
        PreformattedText {
            content
        }
        .class(classes.joined(separator: " "))
    }
}
