import HTMLKit

public class Card: View {
    
    public var header: [Content]?
    public var content: [Content]
    
    internal var classes: [String]
    
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        
        self.content = content()
        self.classes = ["card"]
    }
    
    public init(@ContentBuilder<Content> content: () -> [Content],
                @ContentBuilder<Content> header: () -> [Content]) {
        
        self.content = content()
        self.header = header()
        self.classes = ["card"]
    }
    
    public var body: Content {
        Division {
            Division {
                header
            }
            .class("card-header")
            Division {
                content
            }
            .class("card-body")
        }
        .class(classes.joined(separator: " "))
    }
}
