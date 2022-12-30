import HTMLKit

public struct Card: View, Modifiable {
    
    internal var content: [Content]
    
    internal var classes: [String]
    
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        
        self.content = content()
        self.classes = ["card"]
    }
    
    public var body: Content {
        Division {
           content
        }
        .class(self.classes.joined(separator: " "))
    }
}
