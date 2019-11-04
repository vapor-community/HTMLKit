public struct Img: NodeRepresentedElement {
    public typealias BaseTag = Img
    public typealias HTMLScope = Scopes.Body
    
    static var tag: StaticString = "img"
    let node: TemplateNode
    
    public init<URI: TemplateValueRepresentable>(src: URI) {
        self.node = .tag(
            name: Self.tag,
            content: .none,
            modifiers: [
                .attribute(name: "src", value: src.makeTemplateValue().value)
        ])
    }
}
