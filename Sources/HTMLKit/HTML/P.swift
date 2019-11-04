public struct P: BodyTag {
    static var tag: StaticString = "p"
    let node: TemplateNode
}

extension P {
    public init(text: String) {
        self.node = .literal(text)
    }
}
