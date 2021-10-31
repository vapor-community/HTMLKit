public struct Document: HTMLPage {

    public let type: DocumentType
    public let content: HTMLContent

    public init(type: DocumentType, @HTMLBuilder content: () -> HTMLContent) {
        self.type = type
        self.content = content()
    }

    public var body: HTMLContent {
        [
            "<!DOCTYPE \(type.rawValue)>",
            Html { content }
        ]
    }
}
