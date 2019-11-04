public struct Title: HeadElement {
    let title: TemplateNode
    
//    public init(_ title: String) {
//        self.title = .literal(title)
//    }
    
    public init(_ string: String) {
        title = .literal(string)
    }
    
    public var html: AnyHTML<HTMLScope> {
        AnyHTML(node: .tag(name: "title", content: title, modifiers: []))
    }
}
