/*
 Abstract:
 The file contains everything related to the carousel component.
 */

import HTMLKit

public struct Carousel: View {
    
    internal var indication: [Content]
    
    internal var content: [Content]
    
    internal var classes: [String]
    
    public init(@ContentBuilder<Content> content: () -> [Content],
                @ContentBuilder<Content> indication: () -> [Content]) {
        
        self.content = content()
        self.indication = indication()
        self.classes = ["carousel"]
    }
    
    internal init(indication: [Content], content: [Content], classes: [String]) {
        
        self.indication = indication
        self.content = content
        self.classes = classes
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
        .class(classes.joined(separator: " "))
    }
}

public struct Slide: View, Identifiable, Modifiable {
    
    internal var id: String?
    
    internal var source: String
    
    internal var classes: [String]
    
    internal var caption: [Content]
    
    public init(source: String, @ContentBuilder<Content> caption: () -> [Content]) {
        
        self.source = source
        self.caption = caption()
        self.classes = ["slide"]
    }
    
    internal init(id: String?, source: String, caption: [Content], classes: [String]) {
        
        self.id = id
        self.source = source
        self.caption = caption
        self.classes = classes
    }
    
    public var body: Content {
        Division {
            Division {
                HTMLKit.Image()
                    .source(source)
            }
            .class("slide-thumbnail")
            Division {
                caption
            }
            .class("slide-caption")
        }
        .class(classes.joined(separator: " "))
        .modify(unwrap: id) {
            $0.id($1)
        }
    }
    
    public func tag(_ value: String) -> Slide {
        return self.mutate(id: value)
    }
}

public struct Indicator: View {
    
    internal var tag: String
    
    public init(for tag: String) {
        self.tag = "#" + tag
    }
    
    internal init(tag: String) {
        self.tag = tag
    }
    
    public var body: Content {
        Anchor {
        }
        .reference(tag)
        .class("indicator")
    }
}

