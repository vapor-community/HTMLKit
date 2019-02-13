
/// A node that wrap around any content that is renderable
///
///     ViewContentNode(nodeName: "div", content: "Some text") // <div>Some text</div>
public struct HTMLContentNode: HTMLRepresentable {

    /// The name of the type of node
    ///
    ///     nodeName = "div" // <div>...</div>
    ///     nodeName = "p" // <p>...</p>
    var nodeName: String

    /// The attributes in an node
    ///
    ///     attributes = [.class("text-dark")] // <`nodeName` class="text-dark">...</`nodeName`>
    var attributes: [HTMLAttributeNode]

    /// The content to be wrapped
    ///
    ///     content = "Some text" // <...>Some text</...>
    var content: HTMLRepresentable

    init(nodeName: String, attributes: [HTMLAttributeNode] = [], content: HTMLRepresentable) {
        self.nodeName = nodeName
        self.attributes = attributes
        self.content = content
    }
}


/// Makes the node renderable
extension HTMLContentNode {

    public func prerender(in builder: HTMLBuilder) throws {
        builder.add("<\(nodeName)" + attributes.reduce("") { $0 + " \($1.render())" } + ">")
        try content.prerender(in: builder)
        builder.add("</\(nodeName)>")
    }

    public func render<T>(for templateType: T.Type, with context: T.Context) throws -> HTML where T : HTMLViewTemplate {
        return try "<\(nodeName)" + attributes.reduce("") { $0 + " \($1.render())" } + ">\(content.render(for: templateType, with: context))</\(nodeName)>"
    }
}
