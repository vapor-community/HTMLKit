public struct AnyBodyTag<Scope: Scopes.Body>: HTML {
    public typealias HTMLScope = Scope
    
    let name: StaticString
    let content: TemplateNode
    let modifiers: [Modifier]
    
    init(_ name: StaticString, content: TemplateNode, modifiers: [Modifier]) {
        self.name = name
        self.content = content
        self.modifiers = modifiers
    }
    
    public init(
        _ name: StaticString,
        @TemplateBuilder<Scope> build: () -> ListContent<Scope>
    ) {
        self.name = name
        self.content = TemplateNode(from: build())
        self.modifiers = []
    }
    
    public init<Element: HTML>(
        _ name: StaticString,
        @TemplateBuilder<Scopes.Body> build: () -> Element
    ) {
        self.name = name
        self.content = TemplateNode(from: build())
        self.modifiers = []
    }
    
    public var html: AnyHTML<HTMLScope> {
        AnyHTML(node: .tag(name: name, content: content, modifiers: modifiers))
    }
}
