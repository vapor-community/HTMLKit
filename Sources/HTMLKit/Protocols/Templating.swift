/// A template that changes the information based on the context
/// Checkout `ViewTemplate` if you want something like a BaseTemplate
public protocol Templating: CompiledTemplate, ContextualTemplate {

    /// Builds the view
    ///
    /// - Returns: a view that conforms to `Mappable`
    static func build() -> CompiledTemplate
}

extension Templating {
    public func render<T>(with manager: HTML.Renderer.ContextManager<T>) throws -> String {
        return try Self.build().render(with: manager)
    }

    public func brew<T>(_ formula: HTML.Renderer.Formula<T>) throws {
        try Self.build()
            .brew(formula)
    }
}


extension Templating {
    public static func embed<T: ViewTemplating>(_ template: T.Type, with viewContext: T.ViewContext, contextPath: KeyPath<Self.Context, T.Context>) -> CompiledTemplate {
        return HTML.EmbedViewTemplate<Self, T>(templateType: template,
                                               viewContext: viewContext,
                                               contextKeyPath: contextPath)
    }

    public static func forEach<View>(in collectionPath: KeyPath<Self.Context, [View.Context]>, render view: View.Type) -> CompiledTemplate where View: Templating {
        return HTML.ForEach<Self, View>(view: View.self, collectionPath: collectionPath)
    }

    /// Creates an if statment in a template
    ///
    /// - Parameters:
    ///   - condition: The condition to use
    ///   - view: The view to render
    /// - Returns: An `HTML.IF` object
    public static func renderIf(_ condition: HTML.IF<Self>.Condition, _ view: CompiledTemplate) -> HTML.IF<Self> {
        condition.view = view
        return HTML.IF(conditions: condition)
    }

    /// Creates an if statment in a template
    ///
    /// - Parameters:
    ///   - condition: The condition to use
    ///   - view: The view to render
    /// - Returns: An `HTML.IF` object
    public static func renderIf(_ path: KeyPath<Self.Context, Bool>, _ view: CompiledTemplate) -> HTML.IF<Self> {
        let condition = HTML.IF<Self>.Condition(condition: BoolCondition<Self>(path: path))
        condition.view = view
        return HTML.IF(conditions: condition)
    }
}
