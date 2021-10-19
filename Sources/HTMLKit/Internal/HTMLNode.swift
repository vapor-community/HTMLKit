public struct HTMLNode: ContentNode {

    public var name: String { "html" }

    public var attributes: [HTMLAttribute] = []

    public var content: HTMLContent

    public init(@HTMLBuilder builder: () -> HTMLContent) {
        content = builder()
    }

    public init(attributes: [HTMLAttribute] = [], content: HTMLContent = "") {
        self.content = content
        self.attributes = attributes
    }
}
