
/// A template that changes dipending on the context
public protocol ContextualTemplate: TemplateBuilder {
    associatedtype Context
}


extension ContextualTemplate {

    /// Embeds a view in a template
    ///
    /// - Parameter path: The path to the `Context` needed to render the embeded view
    /// - Returns: A `HTML.EmbedTemplate` object that conteins the view
    public func embed<E>(withPath path: KeyPath<E, Context>) -> HTML.EmbedTemplate<E, Self> {
        return HTML.EmbedTemplate.init(templateType: self, contextKeyPath: path)
    }

    /// Creates a for each loop in a template
    ///
    /// - Parameters:
    ///   - collectionPath: The path to the context to loop
    ///   - view: The view to render
    /// - Returns: A ´CompiledTemplate` that will loop the context
    public func forEach<View>(in collectionPath: KeyPath<Self.Context, [View.Context]>, render view: View) -> CompiledTemplate where View: ContextualTemplate {
        return HTML.ForEach<Self, View>(view: view, collectionPath: collectionPath)
    }

    /// Creates an if statment in a template
    ///
    /// - Parameters:
    ///   - condition: The condition to use
    ///   - view: The view to render
    /// - Returns: An `HTML.IF` object
    public func renderIf(_ condition: HTML.IF<Self>.Condition, _ view: CompiledTemplate...) -> HTML.IF<Self> {
        condition.view = view
        return HTML.IF(conditions: condition)
    }

    /// Creates an if statment in a template
    ///
    /// - Parameters:
    ///   - condition: The condition to use
    ///   - view: The view to render
    /// - Returns: An `HTML.IF` object
    public func renderIf(_ path: KeyPath<Self.Context, Bool>, _ view: CompiledTemplate...) -> HTML.IF<Self> {
        let condition = HTML.IF<Self>.Condition(condition: BoolCondition<Self>(path: path))
        condition.view = view
        return HTML.IF(conditions: condition)
    }

    /// Creates a dynamic version of the node, that makes it possible to run if statments when adding attributes
    ///
    /// - Parameter tag: The tag to make dynamic
    /// - Returns: A `Dynamic` version of the tag
    public func `dynamic`(_ tag: HTML.ContentNode) -> HTML.ContentNode.Dynamic<Self> {
        return .init(node: tag)
    }

    /// Creates a dynamic version of the node, that makes it possible to run if statments when adding attributes
    ///
    /// - Parameter tag: The tag to make dynamic
    /// - Returns: A `Dynamic` version of the tag
    public func `dynamic`(_ tag: HTML.DataNode) -> HTML.DataNode.Dynamic<Self> {
        return .init(node: tag)
    }
}
