public struct ListContent<Scope: HTMLScope>: ContentRepresentable, _HTML {
    public typealias HTMLScope = Scope
    let node: TemplateNode
    
    init(list: [TemplateNode]) {
        self.node = .list(list)
    }
    
    public init<C: _HTML>(@TemplateBuilder<Scope> build: () -> C) {
        self.node = TemplateNode(from: build())
    }
    
    public var html: Self { self }
}
