extension String: HTML {
    public var html: AnyHTML<Scopes.Body> {
        AnyHTML(node: .literal(self))
    }
}
