public struct Head: _HTML {
    public typealias HTMLScope = Root
    
    let node: TemplateNode
    
    public init() {
        self.node = .none
    }
    
    public init(@TemplateBuilder<Scopes.Head> build: () -> ListContent<Scopes.Head>) {
        self.node = TemplateNode(from: build())
    }
    
    public init<Element: _HTML>(@TemplateBuilder<Scopes.Head> build: () -> Element) where Element.HTMLScope == Scopes.Head {
        self.node = TemplateNode(from: build())
    }
    
    public var html: AnyHTML<HTMLScope> {
        AnyHTML(node: .tag(name: "head", content: node, modifiers: []))
    }
}
