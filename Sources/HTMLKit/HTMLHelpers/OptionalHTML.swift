public struct OptionalHTML<Content: _HTML>: ContentRepresentable, _HTML {
    public typealias HTMLScope = Content.HTMLScope
    
    let content: Content?
    
    var node: TemplateNode {
        if let content = content {
            return TemplateNode(from: content)
        }
        
        return .noContent
    }
    
    public var html: Never { fatalError() }
}

extension Optional: _HTML where Wrapped: _HTML {
    public typealias HTMLScope = Wrapped.HTMLScope
    
    public var html: OptionalHTML<Wrapped> {
        OptionalHTML(content: self)
    }
}
