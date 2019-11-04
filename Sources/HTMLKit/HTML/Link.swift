public struct Link: HeadElement {
    let node: TemplateNode
    
    init(_ modifiers: [Modifier]) {
        node = .tag(name: "link", content: .none, modifiers: modifiers)
    }
    
    public static func stylesheet<URI: URIStringRepresentable>(
        _ uri: URI
    ) -> Link {
        self.init([
            .attribute(
                name: "stylesheet",
                value: uri.makeURIString()
            ),
        ])
    }
    
    public var html: AnyHTML<HTMLScope> {
        AnyHTML(node: node)
    }
}
