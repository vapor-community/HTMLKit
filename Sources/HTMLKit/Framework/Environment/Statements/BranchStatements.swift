/*
 Abstract:
 The file contains the branch statements.
 
 Markings:
 - If
 */

/// The statement is for
public struct IF: GlobalElement {
    
    internal class Condition {

        internal let condition: Conditionable
        
        internal var formula: Formula
        
        internal var content: AnyContent?
        
        internal init(condition: Conditionable) {
            
            self.condition = condition
            self.formula = Formula()
        }
    }

    private let conditions: [Condition]

    internal init(conditions: [Condition]) {
        self.conditions = conditions
    }
    
    public init(_ condition: Conditionable, @ContentBuilder<AnyContent> content: () -> AnyContent) {
        
        let condition = Condition(condition: condition)
        condition.content = content()
        
        self.conditions = [condition]
    }
    
    public func elseIf(_ condition: Conditionable, @ContentBuilder<AnyContent> content: () -> AnyContent) -> IF {
        
        let condition = Condition(condition: condition)
        condition.content = content()
        
        return .init(conditions: conditions + [condition])
    }

    public func elseIf<T>(isNil path: TemplateValue<T?>, @ContentBuilder<AnyContent> content: () -> AnyContent) -> IF {
        
        let condition = Condition(condition: IsNullCondition<T>(lhs: path))
        condition.content = content()
        
        return .init(conditions: conditions + [condition])
    }

    public func elseIf<T>(isNotNil path: TemplateValue<T?>, @ContentBuilder<AnyContent> content: () -> AnyContent) -> IF {
        
        let condition = Condition(condition: NotNullCondition<T>(lhs: path))
        condition.content = content()
        
        return .init(conditions: conditions + [condition])
    }

    public func `else`(@ContentBuilder<AnyContent> content: () -> AnyContent) -> IF {
        
        let condition = Condition(condition: AlwaysTrueCondition())
        condition.content = content()
        
        return .init(conditions: conditions + [condition])
    }
}

extension IF: Node {
    
    internal func prerender(with formula: Formula) {
        
        for condition in self.conditions {
            
            do {
                
                if try condition.condition.evaluate(with: ContextManager<Void>(contexts: [:])) {
                    
                    if let content = condition.view as? [AnyContent] {
                        
                        if let nodes = content[0] as? [Node] {
                            
                            for node in nodes {
                                node.prerender(with: formula)
                            }
                        }
                        
                        if let node = content[0] as? Node {
                            node.prerender(with: formula)
                        }
                        
                    } else {
                        
                        if let nodes = condition.view as? [Node] {
                            
                            for node in nodes {
                                node.prerender(with: formula)
                            }
                        }
                    }
                    
                    return
                }
                
            } catch {
                condition.prerender(with: formula)
            }
        }
    }
    
    internal func render<T>(with manager: ContextManager<T>) -> String {
        
        var result = ""
        
        for condition in self.conditions {
            
            do {
                
                if try condition.evaluate(with: manager) {
                    result += condition.render(with: manager)
                }
                
            } catch {
                return result
            }
        }
        
        return result
    }
}

extension IF.Condition: Node {
    
    internal func prerender(with formula: Formula) {
        
        if let nodes = view as? [Node] {
            
            for node in nodes {
                node.prerender(with: formula)
            }
        }
    }

    internal func render<T>(with manager: ContextManager<T>) -> String {
        
        var result = ""
        
        for ingridient in formula.ingredients {
            
            if let node = ingridient as? Node {
                result += node.render(with: manager)
            }
        }
        
        return result
    }
}

extension IF.Condition: Conditionable {

    public func evaluate<T>(with manager: ContextManager<T>) throws -> Bool {
        return try condition.evaluate(with: manager)
    }
}
