

struct HTMLDocument: StaticView {

    let content: CompiledTemplate

    func build() -> CompiledTemplate {
        return [
            doctype("html"),
            content
        ]
    }
}
