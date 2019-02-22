
public protocol Component: TemplateBuilder {
    associatedtype ViewContext

    static func build(with context: ViewContext) -> CompiledTemplate
}

extension Component {
    static func embed(with context: Self.ViewContext) -> CompiledTemplate {
        return Self.build(with: context)
    }
}
