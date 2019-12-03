public struct Conditional<
    True,
    False
>{
    let condition: TemplateRuntimeValue
    let contextId: String
    let content: True
    let failureContent: False?
}

extension Conditional: ContentRepresentable, _HTML where True: _HTML, False: _HTML, True.HTMLScope == False.HTMLScope {
    public typealias HTMLScope = True.HTMLScope
    
    var node: TemplateNode {
        let failureNode: TemplateNode
        
        if let failureContent = failureContent {
            failureNode = AnyHTML<HTMLScope>(content: failureContent).node
        } else {
            failureNode = .noContent
        }
        
        return .conditional(
            condition,
            contextId,
            AnyHTML<HTMLScope>(content: content).node,
            failureNode
        )
    }
    
    public var html: Never { fatalError() }
}

public func renderConditional<Root, Content: HTML>(
    if condition: HTMLContext<Root, Bool>,
    @TemplateBuilder<Content.HTMLScope> build: () -> Content
) -> Conditional<Content, Never> {
    return Conditional(
        condition: condition.runtimeValue,
        contextId: condition.contextId,
        content: build(),
        failureContent: nil
    )
}
