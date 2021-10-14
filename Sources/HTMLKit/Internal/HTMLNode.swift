public struct HTMLNode: ContentNode {

    public var name: String { "html" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTML

    public init(@HTMLBuilder builder: () -> HTML) {
        content = builder()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTML = "") {
        self.content = content
        self.attributes = attributes
    }
}
