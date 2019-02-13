
/// A node that wrap around any content that is renderable
///
///     HTMLDataNode(nodeName: "img", attributes: [.src("url")]) // <img src="url"/>
public struct HTMLDataNode: HTMLRepresentable {

    /// The name of the type of node
    ///
    ///     nodeName = "img" // <img .../>
    ///     nodeName = "link" // <link .../>
    var nodeName: String

    /// The attributes in an node
    ///
    ///     attributes = [.class("text-dark")] // <`nodeName` class="text-dark"/>
    var attributes: [HTMLAttributeNode]

    init(nodeName: String, attributes: [HTMLAttributeNode]) {
        self.nodeName = nodeName
        self.attributes = attributes
    }
}


/// Makes the node renderable
extension HTMLDataNode {
    public func render<T>(for templateType: T.Type, with context: T.Context) throws -> HTML where T : HTMLViewTemplate {
        return "<\(nodeName)" + attributes.reduce("") { $0 + " \($1.render())" } + "/>"
    }

    public func prerender(in builder: HTMLBuilder) throws {
        builder.add("<\(nodeName)" + attributes.reduce("") { $0 + " \($1.render())" } + "/>")
    }
}

