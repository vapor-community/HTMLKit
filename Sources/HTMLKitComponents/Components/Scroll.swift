/*
 Abstract:
 The file contains everything related to the scrollview component.
 */

import HTMLKit

/// A component that displays content in its scrollable area.
public struct Scroll: View {
    
    /// The content of the scrollview.
    internal var content: [Content]
    
    /// The classes of the scrollview.
    internal var classes: [String]
    
    /// Creates a scrollview.
    public init(showIndicators: Bool = true, @ContentBuilder<Content> content: () -> [Content]) {
        
        self.content = content()
        self.classes = ["scroll"]
        
        if showIndicators != true {
            self.classes.append("indicators:false")
        }
    }
    
    public var body: Content {
        Division {
            content
        }
        .class(classes.joined(separator: " "))
    }
}
