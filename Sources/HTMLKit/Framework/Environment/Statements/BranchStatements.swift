/*
 Abstract:
 The file contains the branch statements.
 
 Markings:
 - If
 */

/// The statement is for
public struct IF: GlobalElement {
    
    public enum IFPrerenderErrors: Error {
        
        case dynamiclyEvaluatedCondition
    }
    
    internal class Condition {

        internal let condition: Conditionable
        
        internal var formula: Formula
        
        internal var view: AnyContent
        
        internal init(condition: Conditionable) {
            
            self.condition = condition
            self.view = ""
            self.formula = Formula()
        }
    }

    internal let conditions: [Condition]

    internal init(conditions: [Condition]) {
        self.conditions = conditions
    }
    
    public init(_ condition: Conditionable, @ContentBuilder<AnyContent> content: () -> AnyContent) {
        
        let condition = Condition(condition: condition)
        condition.view = content()
        
        self.conditions = [condition]
    }
    
    public func elseIf(_ condition: Conditionable, @ContentBuilder<AnyContent> content: () -> AnyContent) -> IF {
        
        let condition = Condition(condition: condition)
        condition.view = content()
        
        return .init(conditions: conditions + [condition])
    }

    public func elseIf<T>(isNil path: TemplateValue<T?>, @ContentBuilder<AnyContent> content: () -> AnyContent) -> IF {
        
        let condition = Condition(condition: IsNullCondition<T>(path: path))
        condition.view = content()
        
        return .init(conditions: conditions + [condition])
    }

    public func elseIf<T>(isNotNil path: TemplateValue<T?>, @ContentBuilder<AnyContent> content: () -> AnyContent) -> IF {
        
        let condition = Condition(condition: NotNullCondition<T>(path: path))
        condition.view = content()
        
        return .init(conditions: conditions + [condition])
    }

    public func `else`(@ContentBuilder<AnyContent> content: () -> AnyContent) -> IF {
        
        let condition = Condition(condition: AlwaysTrueCondition())
        condition.view = content()
        
        return .init(conditions: conditions + [condition])
    }
}

extension IF: AnyContent {

    public var scripts: AnyContent {
        
        IF(conditions: conditions.map { htmlCondition in
            
            let scriptCondition = IF.Condition(condition: htmlCondition.condition)
            scriptCondition.view = htmlCondition.view.scripts
            
            return scriptCondition
        })
    }
    
    public func prerender(_ formula: Formula) throws {
        
        var isStaticallyEvaluated = true
        
        for condition in conditions {
            
            condition.formula.calendar = formula.calendar
            
            condition.formula.timeZone = formula.timeZone

            do {
                
                guard isStaticallyEvaluated else {
                    throw IFPrerenderErrors.dynamiclyEvaluatedCondition
                }
                
                let testContext = ContextManager<Void>(contexts: [:])
                
                if try condition.condition.evaluate(with: testContext) {
                    
                    try condition.view.prerender(formula)
                    
                    return // Returning as the first true condition should be the only one that is rendered
                }
                
            } catch {
                
                isStaticallyEvaluated = false
                
                try condition.prerender(formula)
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
        try view.prerender(formula)
    }

    public func render<T>(with manager: ContextManager<T>) throws -> String {
        return try formula.render(with: manager)
    }
}

extension IF.Condition: Conditionable {

    public func evaluate<T>(with manager: ContextManager<T>) throws -> Bool {
        return try condition.evaluate(with: manager)
    }
}

