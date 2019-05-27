
/// Making it possible to embed othet templates in a View
///
///     embed(SomeView.self, contextKey: \.context)
public struct TemplateEmbed<E, T> where T : ContextualTemplate, E : ContextualTemplate {

    /// The type of the template
    public let templateType: T

    /// The key-path the the needed content
    let referance: ContextReferance<E.Context, T.Context>
}
