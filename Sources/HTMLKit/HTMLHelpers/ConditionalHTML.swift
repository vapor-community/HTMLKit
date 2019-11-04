public struct ConditionalHTML<
    True: _HTML, False: _HTML
>: ContentRepresentable, _HTML where True.HTMLScope == False.HTMLScope {
    public typealias HTMLScope = True.HTMLScope
    
    enum Condition {
        case trueCase(True)
        case falseCase(False)
    }
    
    let condition: Condition
    
    var node: TemplateNode {
        return html.node
    }
    
    public var html: AnyHTML<HTMLScope> { AnyHTML(node: node) }
}
