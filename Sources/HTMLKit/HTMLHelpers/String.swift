extension String: _HTML {
    public typealias HTMLScope = Scopes.Anywhere
    public typealias Content = AnyHTML
    
    public var html: AnyHTML<HTMLScope> {
        AnyHTML(node: .literal(self))
    }
}
