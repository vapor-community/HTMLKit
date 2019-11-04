public struct AnyHTML<HTMLScope>: ContentRepresentable, _HTML {
    let node: TemplateNode
    
    init(node: TemplateNode) {
        self.node = node
    }
    
    init() {
        self.node = .none
    }
    
    public init<Content: _HTML>(content: Content) {
        if let node = content as? TemplateNode {
            self.node = node
        } else if let content = content as? ContentRepresentable {
            self.node = content.node
        } else {
            self.node = AnyHTML(content: content.html).node
        }
    }
    
    public var html: Never { fatalError() }
}
