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
        
        internal var content: AnyContent
        
        internal init(condition: Conditionable) {
            
            self.condition = condition
            self.content = ""
        }
    }

    internal let conditions: [Condition]

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

extension IF: AnyContent {

    public var scripts: AnyContent {
        
        IF(conditions: conditions.map { htmlCondition in
            
            let scriptCondition = IF.Condition(condition: htmlCondition.condition)
            scriptCondition.content = htmlCondition.content.scripts
            
            return scriptCondition
        })
    }
    
    public func prerender(_ formula: Formula) throws {
        
        var isStaticallyEvaluated = true
        
        for condition in conditions {

            do {
                
                guard isStaticallyEvaluated else {
                    break
                }
                
                if try condition.condition.evaluate(with: ContextManager<Void>(contexts: [:])) {
                    
                    try condition.content.prerender(formula)
                    
                    break
                }
                
            } catch {
                isStaticallyEvaluated = false
            }
        }
        
        if isStaticallyEvaluated == false {
            formula.add(content: self)
        }
    }
    
    public func render<T>(with manager: ContextManager<T>) throws -> String {
        
        for condition in conditions {
            
            if try condition.evaluate(with: manager) {
                return try condition.render(with: manager)
            }
        }
        
        return ""
    }
}

extension IF.Condition: AnyContent {
    
    public func prerender(_ formula: Formula) throws {
        try content.prerender(formula)
    }

    public func render<T>(with manager: ContextManager<T>) throws -> String {
        return try content.render(with: manager)
    }
}

extension IF.Condition: Conditionable {

    public func evaluate<T>(with manager: ContextManager<T>) throws -> Bool {
        return try condition.evaluate(with: manager)
    }
}

