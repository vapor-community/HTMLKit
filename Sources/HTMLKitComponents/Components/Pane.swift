import HTMLKit

public struct Pane: View, Modifiable {
    
    internal var id: String?
    
    internal var classes: [String]
    
    internal var label: [Content]
    
    internal var badge: Int?
    
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
    
    public func badge(_ value: Int) -> Pane {
        
        var newSelf = self
        newSelf.badge = value
        
        return newSelf
    }
}
