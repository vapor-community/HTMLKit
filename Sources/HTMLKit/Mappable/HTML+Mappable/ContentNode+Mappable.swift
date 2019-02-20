
extension HTML.ContentNode: Mappable {

    public func brew<T>(_ formula: HTML.Renderer.Formula<T>) throws where T: Templating {
        formula.add(string: "<\(nodeName)")
        try attributes.forEach {
            formula.add(string: " ")
            try $0.brew(formula)
        }
        formula.add(string: ">")
        try content.brew(formula)
        formula.add(string: "</\(nodeName)>")
    }

    public func map<T>(for type: T.Type, with context: T.Context) throws -> String where T : Templating {
        return try "<\(nodeName)"
            + attributes.reduce("") { try $0 + " \($1.map(for: type, with: context))" }
            + ">\(content.map(for: type, with: context))</\(nodeName)>"
    }
}
