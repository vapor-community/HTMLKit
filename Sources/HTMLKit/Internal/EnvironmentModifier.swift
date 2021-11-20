/// The modifier is for
///
///
public struct EnvironmentModifier: Content {

    let view: Content
    let locale: Content

    let localFormula = Renderer.Formula()

    public func prerender(_ formula: Renderer.Formula) throws {
        try view.prerender(localFormula)
        formula.add(mappable: self)
    }

    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        let prevLocale = manager.locale
        manager.locale = try locale.render(with: manager)
        let rendering = try localFormula.render(with: manager)
        manager.locale = prevLocale
        return rendering
    }
}
