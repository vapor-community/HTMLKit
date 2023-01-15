/*
 Abstract:
 The file contains a dropdown component.
 */

import HTMLKit

public struct Dropdown: View {
    
    internal var label: [Content]
    
    internal var content: [Content]
    
    internal var classes: [String]
    
    public init(@ContentBuilder<Content> content: () -> [Content], @ContentBuilder<Content> label: () -> [Content]) {
        
        self.label = label()
        self.content = content()
        self.classes = ["dropdown"]
    }
    
    public var body: Content {
        Division {
            Division {
                label
            }
            .class("dropdown-label")
            Division {
                content
            }
            .class("dropdown-content")
        }
        .class(classes.joined(separator: " "))
        .tabIndex(1)
    }
}
