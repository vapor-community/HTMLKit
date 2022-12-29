import HTMLKit

public struct Modal: View, Modifiable, Actionable {
    
    internal var id: String?
    
    internal var content: [Content]
    
    internal var classes: [String]
    
    internal var events: [String]?
    
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
