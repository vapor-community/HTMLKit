
/// A template that changes dipending on the context
public protocol ContextualTemplate: TemplateBuilder {
    associatedtype Context
}

extension ContextualTemplate {
    public static func embed<T: Templating>(_ template: T.Type, contextPath: KeyPath<Self.Context, T.Context>) -> CompiledTemplate {
        return HTML.EmbedTemplate<Self, T>(templateType: template,
                                           contextKeyPath: contextPath)
    }
}
