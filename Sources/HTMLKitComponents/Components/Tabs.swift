/*
 Abstract:
 The file contains a tabs component.
 */

import HTMLKit

/// A compnonent that cycles through an amount of views.
public struct Tabs: View, Identifiable, Modifiable {
    
    internal var id: String?
    
    /// The content of the carousel.
    internal var content: [Pane]
    
    /// The classes of the carousel.
    internal var classes: [String]
    
    /// Creates a carousel.
    public init(@ContentBuilder<Pane> content: () -> [Pane]) {
        
        self.content = content()
        self.classes = ["tabs"]
    }
    
    public var body: Content {
        Division {
            Division {
                for item in content {
                    Anchor {
                        item.label
                    }
                    .class("tab-label")
                    .modify(unwrap: item.id) {
                        $0.reference("#" + $1)
                    }
                }
            }
            .class("tabs-labels")
            Division {
                content
            }
            .class("tabs-panes")
        }
        .class(classes.joined(separator: " "))
        .modify(unwrap: id) {
            $0.id($1)
        }
    }
    
    public func tag(_ value: String) -> Tabs {
        return self.mutate(id: value)
    }
}


public struct Pane: View, Modifiable {
    
    internal var id: String?
    
    internal var classes: [String]
    
    internal var label: [Content]
    
    internal var content: [Content]
    
    public init(@ContentBuilder<Content> content: () -> [Content], @ContentBuilder<Content> label: () -> [Content]) {
        
        self.content = content()
        self.label = label()
        self.classes = ["pane"]
    }
    
    public var body: Content {
        Division {
            content
        }
        .class(classes.joined(separator: " "))
        .modify(unwrap: id) {
            $0.id($1)
        }
    }
    
    public func tag(_ value: String) -> Pane {
        
        var newSelf = self
        newSelf.id = value
        
        return newSelf
    }
}
