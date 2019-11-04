public struct Meta: HeadElement {
    let node: TemplateNode
    
    init(_ modifiers: [Modifier]) {
        node = .tag(name: "meta", content: .none, modifiers: modifiers)
    }
    
    public static func viewport(content: String) -> Meta {
        self.init([
            .attribute(name: "name", value: "viewport"),
            .attribute(name: "content", value: .literal(content)),
        ])
    }
    
    public static func charset(_ charset: Charset) -> Meta {
        self.init([
            .attribute(name: "charset", value: .literal(charset.value))
        ])
    }
    
    public var html: AnyHTML<Scopes.Head> {
        AnyHTML(node: node)
    }
}
