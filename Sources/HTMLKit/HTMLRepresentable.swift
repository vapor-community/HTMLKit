
public typealias HTML = String

/// A protocol making it possible to render a html document
public protocol HTMLRepresentable {
    /// Renders a presentable view
    ///
    /// - Returns: A renderd view
    /// - Throws: If the render fails for any reason
    func render<T: HTMLViewTemplate>(for templateType: T.Type, with context: T.Context) throws -> HTML

    func prerender(in builder: HTMLBuilder) throws
}


extension Array: HTMLRepresentable where Element == HTMLRepresentable {

    public func render<T>(for templateType: T.Type, with context: T.Context) throws -> HTML where T : HTMLViewTemplate {
        return try self.reduce("") { try $0 + $1.render(for: templateType, with: context) }
    }

    public func prerender(in builder: HTMLBuilder) throws {
        try self.forEach {
            try $0.prerender(in: builder)
        }
    }
}

extension String: HTMLRepresentable {
    public func render<T>(for templateType: T.Type, with context: T.Context) throws -> HTML where T : HTMLViewTemplate {
        return self
    }

    public func prerender(in builder: HTMLBuilder) throws {
        builder.add(self)
    }
}
