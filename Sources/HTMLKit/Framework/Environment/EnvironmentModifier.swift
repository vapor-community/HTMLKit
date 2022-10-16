/// The modifier is for
///
///
public struct EnvironmentModifier: AnyContent {

    public let view: AnyContent
    
    public let locale: AnyContent
    
    public let localFormula = Formula()

    public func prerender(_ formula: Formula) throws {
        
        try view.prerender(localFormula)
        
        formula.add(content: self)
    }

    public func render<T>(with manager: ContextManager<T>) throws -> String {
        
        let prevLocale = manager.locale
        
        manager.locale = try locale.render(with: manager)
        
        let rendering = try localFormula.render(with: manager)
        
        manager.locale = prevLocale
        
        return rendering
        
    }
}
