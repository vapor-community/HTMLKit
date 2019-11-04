public struct A: BodyTag {
    static var tag: StaticString = "a"
    let node: TemplateNode
}

extension AttributedHTML where BaseTag == A {
    public func href<URI: URIStringRepresentable>(_ href: URI) -> Modified<BaseTag> {
        attribute(key: "href", value: href.makeURIString())
    }
}
