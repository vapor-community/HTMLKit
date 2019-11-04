public struct Header: BodyTag {
    public typealias BaseTag = Header
    
    static var tag: StaticString = "header"
    let node: TemplateNode
}
