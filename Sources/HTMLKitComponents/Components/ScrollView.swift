/*
 Abstract:
 The file contains everything related to the scrollview component.
 */

import HTMLKit

/// A component that displays content in its scrollable area.
public struct ScrollView: View {
    
    /// The content of the scrollview.
    internal var content: [Content]
    
    /// The classes of the scrollview.
    internal var classes: [String]
    
    /// Creates a scrollview.
    public init(direction: Tokens.FlowDirection, @ContentBuilder<Content> content: () -> [Content]) {
        
        self.content = content()
        self.classes = ["scrollview", direction.rawValue]
    }
    
    public var body: Content {
        Division {
            content
        }
        .class(classes.joined(separator: " "))
    }
}
