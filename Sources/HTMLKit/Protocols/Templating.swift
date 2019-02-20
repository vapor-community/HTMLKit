/// A template that changes the information based on the context
/// Checkout `ViewTemplate` if you want something like a BaseTemplate
public protocol Templating: Mappable, ContextualTemplate {

    /// Builds the view
    ///
    /// - Returns: a view that conforms to `Mappable`
    static func build() -> Mappable
}

extension Templating {
    public func map<T>(for type: T.Type, with context: T.Context) throws -> String where T : Templating {
        return try Self.build().map(for: type, with: context)
    }

    public func brew<T>(_ formula: HTML.Renderer.Formula<T>) throws where T: Templating {
        try Self.build()
            .brew(formula)
    }
}


extension Templating {
    public static func embed<T: ViewTemplating>(_ template: T.Type, with viewContext: T.ViewContext, contextPath: KeyPath<Self.Context, T.Context>) -> Mappable {
        return HTML.EmbedViewTemplate<Self, T>(templateType: template,
                                               viewContext: viewContext,
                                               contextKeyPath: contextPath)
    }

    public static func forEach<View>(in collectionPath: KeyPath<Self.Context, [View.Context]>, render view: View.Type) -> Mappable where View: Templating {
        return HTML.ForEach<Self, View>(view: View.self, collectionPath: collectionPath)
    }

    /// Creates an if statment in a template
    ///
    /// - Parameters:
    ///   - condition: The condition to use
    ///   - view: The view to render
    /// - Returns: An `HTML.IF` object
    public static func renderIf<C>(_ condition: HTML.IF<Self>.Condition<C>, _ view: Mappable) -> HTML.IF<Self> {
        condition.view = view
        return HTML.IF(conditions: condition)
    }

    /// Creates an if statment in a template
    ///
    /// - Parameters:
    ///   - condition: The condition to use
    ///   - view: The view to render
    /// - Returns: An `HTML.IF` object
    public static func renderIf(_ path: KeyPath<Self.Context, Bool>, _ view: Mappable) -> HTML.IF<Self> {
        let condition = HTML.IF.Condition(condition: BoolCondition<Self>(path: path))
        condition.view = view
        return HTML.IF(conditions: condition)
    }
}
