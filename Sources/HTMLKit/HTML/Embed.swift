public struct Embed: BodyTag {
    public typealias BaseTag = Embed
    
    static var tag: StaticString = "embed"
    let node: TemplateNode
}

extension AttributedHTML where BaseTag == Embed {
    public func src<URI: TemplateValueRepresentable>(_ src: URI) -> Modified<BaseTag> {
        attribute(key: "src", value: src.makeTemplateValue())
    }
}
