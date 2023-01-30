/*
 Abstract:
 The file contains everything related to the carousel component.
 */

import HTMLKit

public struct Carousel: View {
    
    public var indication: [Content]
    
    public var content: [Content]
    
    public init(@ContentBuilder<Content> content: () -> [Content],
                @ContentBuilder<Content> indication: () -> [Content]) {
        
        self.content = content()
        self.indication = indication()
    }
    
    public var body: Content {
        Division {
            Division {
                content
            }
            .class("carousel-content")
            Division {
                indication
            }
            .class("carousel-indication")
        }
        .class("carousel")
    }
}

public struct Indicator: View {
    
    public var id: String
    
    public init(id: String) {
        self.id = id
    }
    
    public var body: Content {
        Anchor {
        }
        .reference(id)
        .class("indicator")
    }
}
