public struct Article: BodyTag {
    public typealias BaseTag = Article
    
    static var tag: StaticString = "article"
    let node: TemplateNode
}
