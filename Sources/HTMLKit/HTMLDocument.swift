
/// A simple view that adds a doctype tag
public struct HTMLDocument: StaticView {

    /// The HTML document to render
    public let content: CompiledTemplate

    public init(content: CompiledTemplate...) {
        self.content = content
    }

    public func build() -> CompiledTemplate {
        return [
            doctype("html"),
            content
        ]
    }
}
