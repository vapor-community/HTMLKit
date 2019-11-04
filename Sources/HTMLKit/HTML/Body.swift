public struct Body: _HTML {
    public typealias HTMLScope = Root
    
    let node: TemplateNode
    
    public init() {
        self.node = .none
    }
    
    public init(@TemplateBuilder<Scopes.Body> build: () -> ListContent<Scopes.Body>) {
        self.node = TemplateNode(from: build())
    }
    
    public init<Element: HTML>(@TemplateBuilder<Scopes.Body> build: () -> Element) {
        self.node = TemplateNode(from: build())
    }
    
    public var html: AnyHTML<HTMLScope> {
        AnyHTML(node: .tag(name: "body", content: node, modifiers: []))
    }
}
