
/// A simple view that adds a doctype tag
struct HTMLDocument: StaticView {

    /// The HTML document to render
    let content: CompiledTemplate

    func build() -> CompiledTemplate {
        return [
            doctype("html"),
            content
        ]
    }
}
