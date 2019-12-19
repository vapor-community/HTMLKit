public struct AnyBodyTag: HTML {
    public typealias BaseHTML = Self

    public typealias HTMLScope = Scopes.Body
    let name: StaticString
    let content: TemplateNode?
    let modifiers: [_Modifier]
    
    init(_ name: StaticString, content: TemplateNode?, modifiers: [_Modifier]) {
        self.name = name
        self.content = content
        self.modifiers = modifiers
    }
    
    public init(
        _ name: StaticString,
        @TemplateBuilder<HTMLScope> build: () -> ListContent<HTMLScope>
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
