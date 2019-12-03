public struct Img: NodeRepresentedElement {
    public typealias BaseTag = Img
    public typealias HTMLScope = Scopes.Body
    
    static let hasContent = false
    static let tag: StaticString = "img"
    var node: TemplateNode { .noContent }
    let modifiers: [_Modifier]
    
    public init<URI: TemplateValueRepresentable>(src: URI) {
        self.modifiers = [
            .attribute(name: "src", value: src.makeTemplateValue())
        ]
    }
}
