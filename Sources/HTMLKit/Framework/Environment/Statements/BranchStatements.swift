/*
 Abstract:
 The file contains the branch statements.
 
 Markings:
 - If
 */

/// The statement is for
public struct IF {
    
    internal class Condition {

        internal let condition: Conditionable
        
        internal var content: AnyContent?
        
        internal init(condition: Conditionable) {
            
            self.condition = condition
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
        
        var isStaticallyEvaluated = true
        
        for condition in self.conditions {
            
            do {
                
                guard isStaticallyEvaluated else {
                    break
                }
                
                if try condition.condition.evaluate(with: ContextManager<Void>(contexts: [:])) {
                    
                    if let content = condition.content as? [AnyContent] {
                        
                        if let nodes = content[0] as? [Node] {
                            
                            for node in nodes {
                                node.prerender(with: formula)
                            }
                        }
                        
                        if let node = content[0] as? Node {
                            node.prerender(with: formula)
                        }
                        
                    } else {
                        
                        if let nodes = condition.content as? [Node] {
                            
                            for node in nodes {
                                node.prerender(with: formula)
                            }
                        }
                    }
                    
                    break
                }
                
            } catch {
                isStaticallyEvaluated = false
            }
        }
        
        if isStaticallyEvaluated == false {
            formula.add(ingridient: self)
        }
    }
    
    internal func render<T>(with manager: ContextManager<T>) -> String {
        
        var result = ""
        
        for condition in self.conditions {
            
            do {
                
                if try condition.evaluate(with: manager) {
                    
                    result += condition.render(with: manager)
                    
                    break
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
        
        if let nodes = content as? [Node] {
            
            for node in nodes {
                node.prerender(with: formula)
            }
        }
    }

    internal func render<T>(with manager: ContextManager<T>) -> String {
        
        var result = ""
        
        if let nodes = content as? [Node] {
            
            for node in nodes {
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
