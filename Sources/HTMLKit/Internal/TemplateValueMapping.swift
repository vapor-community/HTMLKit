/// The class is for
///
///
public class TemplateValueMapping<B, C> {
    let variable: TemplateValue<B>
    let transform: (B) throws -> C

    init(variable: TemplateValue<B>, transform: @escaping (B) throws -> C) {
        self.variable = variable
        self.transform = transform
    }
}

extension TemplateValueMapping: Content where C: Content {

    public func prerender(_ formula: Renderer.Formula) throws {
        switch variable {
        case .constant(let value): try transform(value).prerender(formula)
        case .dynamic(_): formula.add(mappable: self)
        }
    }

    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        let value = try variable.value(from: manager)
        return try transform(value).render(with: manager)
    }
}
