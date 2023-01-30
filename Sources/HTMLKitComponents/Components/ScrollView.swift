/*
 Abstract:
 The file contains everything related to the scrollview component.
 */

import HTMLKit

public struct ScrollView: View {
    
    internal var content: [Content]
    
    internal var classes: [String]
    
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
