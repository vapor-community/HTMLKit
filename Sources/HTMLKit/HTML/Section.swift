public struct Section: BodyTag {
    public typealias BaseTag = Section
    
    static var tag: StaticString = "section"
    let node: TemplateNode
}
