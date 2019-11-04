extension AttributedHTML where BaseTag.HTMLScope: Scopes.Body {
    public func id(_ ids: String...) -> Modified<BaseTag> {
        self.attribute(key: "id", value: ids.joined(separator: " "))
    }
    
    public func `class`(_ classes: String...) -> Modified<BaseTag> {
        self.attribute(key: "class", value: classes.joined(separator: " "))
    }
}
