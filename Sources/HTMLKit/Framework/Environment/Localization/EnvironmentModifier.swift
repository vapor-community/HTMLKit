/*
 Abstract:
 The file contains the environment modifier.
 */

/// The modifier
public struct EnvironmentModifier: Content {

    public let view: Content
    
    public let locale: TemplateValue<String>
}

extension EnvironmentModifier: Node {
    
    internal func prerender(with formula: Formula) {
        formula.add(ingridient: self)
    }
    
    internal func render<T>(with manager: ContextManager<T>) -> String {
        
        manager.locale = try? self.locale.value(from: manager)
    
        var result = ""
        
        if let node = view as? Node {
            result += node.render(with: manager)
        }
        
        return result
    }
}
