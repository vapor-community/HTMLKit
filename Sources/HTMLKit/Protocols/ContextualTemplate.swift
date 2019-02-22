
/// A template that changes dipending on the context
public protocol ContextualTemplate: TemplateBuilder {
    associatedtype Context
}


extension ContextualTemplate {

    public func embed<E>(withPath path: KeyPath<E, Context>) -> HTML.EmbedTemplate<E, Self> {
        return HTML.EmbedTemplate.init(templateType: self, contextKeyPath: path)
    }

    public func forEach<View>(in collectionPath: KeyPath<Self.Context, [View.Context]>, render view: View) -> CompiledTemplate where View: ContextualTemplate {
        return HTML.ForEach<Self, View>(view: view, collectionPath: collectionPath)
    }

    /// Creates an if statment in a template
    ///
    /// - Parameters:
    ///   - condition: The condition to use
    ///   - view: The view to render
    /// - Returns: An `HTML.IF` object
    public func renderIf(_ condition: HTML.IF<Self>.Condition, _ view: CompiledTemplate) -> HTML.IF<Self> {
        condition.view = view
        return HTML.IF(conditions: condition)
    }

    /// Creates an if statment in a template
    ///
    /// - Parameters:
    ///   - condition: The condition to use
    ///   - view: The view to render
    /// - Returns: An `HTML.IF` object
    public func renderIf(_ path: KeyPath<Self.Context, Bool>, _ view: CompiledTemplate) -> HTML.IF<Self> {
        let condition = HTML.IF<Self>.Condition(condition: BoolCondition<Self>(path: path))
        condition.view = view
        return HTML.IF(conditions: condition)
    }
}
