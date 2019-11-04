public struct Root {
    let node: TemplateNode
    
    init(node: TemplateNode) {
        self.node = node
    }
    
    public var html: AnyHTML<HTMLScope> {
        AnyHTML(node: node)
    }
    
    public init<Content: _HTML>(
        @TemplateBuilder<Scopes.Root> content: @escaping () -> Content
    ) where Content.HTMLScope == Root {
        node = .lazy({ TemplateNode(from: content()) })
    }
}
