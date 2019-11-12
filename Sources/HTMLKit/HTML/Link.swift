public struct Link: HeadElement {
    let node: TemplateNode
    
    init(_ modifiers: [_Modifier]) {
        node = .tag(name: "link", content: .none, modifiers: modifiers)
    }
    
    public static func stylesheet<URI: TemplateValueRepresentable>(
        _ uri: URI
    ) -> Link {
        self.init([
            .attribute(name: "stylesheet", value: uri.makeTemplateValue()),
        ])
    }
    
    public var html: AnyHTML<Scopes.Head> {
        AnyHTML(node: node)
    }
}
