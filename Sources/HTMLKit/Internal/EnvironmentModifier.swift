/// The modifier is for
///
///
public struct EnvironmentModifier: HTMLContent {

    let view: HTMLContent
    let locale: HTMLContent

    let localFormula = HTMLRenderer.Formula()

    public func prerender(_ formula: HTMLRenderer.Formula) throws {
        try view.prerender(localFormula)
        formula.add(mappable: self)
    }

    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        let prevLocale = manager.locale
        manager.locale = try locale.render(with: manager)
        let rendering = try localFormula.render(with: manager)
        manager.locale = prevLocale
        return rendering
    }
}
