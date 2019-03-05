
/// A template that changes dipending on the context
public protocol ContextualTemplate: TemplateBuilder {
    associatedtype Context
}

public struct NoContext {}
public protocol StaticView: ContextualTemplate where Context == NoContext {}


extension ContextualTemplate {

    /// Embeds a view in a template
    ///
    /// - Parameter path: The path to the `Context` needed to render the embeded view
    /// - Returns: A `TemplateEmbed` object that conteins the view
    public func embed<T>(_ template: T, withPath path: KeyPath<Context, T.Context>) -> TemplateEmbed<Self, T> where T : ContextualTemplate {
        return TemplateEmbed.init(templateType: template, referance: .keyPath(path))
    }

    /// Embeds a view in a template
    ///
    /// - Parameter path: The path to the `Context` needed to render the embeded view
    /// - Returns: A `TemplateEmbed` object that conteins the view
    public func embed<T>(_ template: T) -> TemplateEmbed<Self, T> where T : ContextualTemplate, T.Context == Context {
        return TemplateEmbed.init(templateType: template, referance: .self(Self.self))
    }

    /// Creates a for each loop in a template
    ///
    /// - Parameters:
    ///   - collectionPath: The path to the context to loop
    ///   - view: The view to render
    /// - Returns: A ´CompiledTemplate` that will loop the context
    public func forEach<View>(in collectionPath: KeyPath<Self.Context, [View.Context]>, render view: View) -> CompiledTemplate where View: ContextualTemplate {
        return TemplateForEach<Self, View>(view: view, referance: .keyPath(collectionPath))
    }

    /// Creates a for each loop in a template
    ///
    /// - Parameters:
    ///   - collectionPath: The path to the context to loop
    ///   - view: The view to render
    /// - Returns: A ´CompiledTemplate` that will loop the context
    public func forEach<View>(render view: View) -> CompiledTemplate where View: ContextualTemplate, Context == [View.Context] {
        return TemplateForEach<Self, View>(view: view, referance: .self(Self.self))
    }

    /// Creates an if statment in a template
    ///
    /// - Parameters:
    ///   - condition: The condition to use
    ///   - view: The view to render
    /// - Returns: An `TemplateIF` object
    public func runtimeIf(_ condition: TemplateIF<Self>.Condition, _ view: CompiledTemplate...) -> TemplateIF<Self> {
        condition.view = view
        return TemplateIF(conditions: condition)
    }

    /// Creates an if statment in a template
    ///
    /// - Parameters:
    ///   - condition: The condition to use
    ///   - view: The view to render
    /// - Returns: An `TemplateIF` object
    public func runtimeIf(_ path: KeyPath<Self.Context, Bool>, _ view: CompiledTemplate...) -> TemplateIF<Self> {
        let condition = TemplateIF<Self>.Condition(condition: BoolCondition<Self>(path: path))
        condition.view = view
        return TemplateIF(conditions: condition)
    }

    /// Add an else if condition
    ///
    /// - Parameters:
    ///   - path: The path to evaluate
    ///   - render: The view to render if true
    /// - Returns: returns a modified if statment
    public func runtimeIf<Value>(isNil path: KeyPath<Self.Context, Value?>, _ render: CompiledTemplate...) -> TemplateIF<Self> {
        let condition = TemplateIF<Self>.Condition(condition: IsNullCondition<Self.Context, Value>(path: path))
        condition.view = render
        return TemplateIF<Self>.init(conditions: condition)
    }

    /// Add an else if condition
    ///
    /// - Parameters:
    ///   - path: The path to evaluate
    ///   - render: The view to render if true
    /// - Returns: returns a modified if statment
    public func runtimeIf<Value>(isNotNil path: KeyPath<Self.Context, Value?>, _ render: CompiledTemplate...) -> TemplateIF<Self> {
        let condition = TemplateIF<Self>.Condition(condition: NotNullCondition<Self.Context, Value>(path: path))
        condition.view = render
        return TemplateIF<Self>.init(conditions: condition)
    }
}
