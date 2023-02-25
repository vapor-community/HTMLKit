/*
 Abstract:
 The file contains a modal component.
 */

import HTMLKit

/// A component that presents a dialog on top of other views.
public struct Modal: View, Modifiable, Actionable {
    
    internal var id: String?
    
    /// The content of the modal.
    internal var content: [Content]
    
    /// The classes of the modal.
    internal var classes: [String]
    
    /// The events of the modal.
    internal var events: [String]?
    
    /// Creates a modal.
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        
        self.content = content()
        self.classes = ["modal"]
    }
    
    public var body: Content {
        Dialog {
            content
        }
        .class(classes.joined(separator: " "))
        .modify(unwrap: id) {
            $0.id($1)
        }
        if let events = self.events {
            Script {
                events
            }
        }
    }
    
    public func id(_ value: String) -> Modal {
        return self.mutate(id: value)
    }
}
