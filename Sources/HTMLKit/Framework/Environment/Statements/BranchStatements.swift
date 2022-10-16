/// The statement is for
public struct IF: GlobalElement {
    
    public enum IFPrerenderErrors: Error {
        
        case dynamiclyEvaluatedCondition
    }
    
    public class Condition {

        public let condition: Conditionable
        
        public var localFormula: Formula
        
        public var view: AnyContent = ""
        
        public init(condition: Conditionable) {
            
            self.condition = condition
            localFormula = Formula()
        }
    }

    public let conditions: [Condition]

    public init(_ condition: Conditionable, @ContentBuilder<AnyContent> content: () -> AnyContent) {
        
        let ifCondition = Condition(condition: condition)
        ifCondition.view = content()
        
        self.conditions = [ifCondition]
    }

    public init(conditions: [Condition]) {
        
        self.conditions = conditions
    }
}

extension IF.Condition: Conditionable {

    public func evaluate<T>(with manager: ContextManager<T>) throws -> Bool {
        return try condition.evaluate(with: manager)
    }

    public func render<T>(with manager: ContextManager<T>) throws -> String {
        return try localFormula.render(with: manager)
    }
    
    public func prerender(_ formula: Formula) throws {
        try view.prerender(localFormula)
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
    
    public func render<T>(with manager: ContextManager<T>) throws -> String {
        
        for condition in conditions {
            
            if try condition.evaluate(with: manager) {
                return try condition.render(with: manager)
            }
        }
        
        return ""
    }

    public func prerender(_ formula: Formula) throws {
        
        var isStaticallyEvaluated = true
        
        for condition in conditions {
            
            condition.localFormula.calendar = formula.calendar
            
            condition.localFormula.timeZone = formula.timeZone

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

    public func elseIf(_ condition: Conditionable, @ContentBuilder<AnyContent> content: () -> AnyContent) -> IF {
        
        let ifCondition = Condition(condition: condition)
        ifCondition.view = content()
        
        return .init(conditions: conditions + [ifCondition])
    }

    public func elseIf<B>(isNil path: TemplateValue<B?>, @ContentBuilder<AnyContent> content: () -> AnyContent) -> IF {
        
        let condition = Condition(condition: IsNullCondition<B>(path: path))
        condition.view = content()
        
        return .init(conditions: conditions + [condition])
    }

    public func elseIf<Value>(isNotNil path: TemplateValue<Value?>, @ContentBuilder<AnyContent> content: () -> AnyContent) -> IF {
        
        let condition = Condition(condition: NotNullCondition<Value>(path: path))
        condition.view = content()
        
        return .init(conditions: conditions + [condition])
    }

    public func `else`(@ContentBuilder<AnyContent> content: () -> AnyContent) -> AnyContent {
        
        let trueCondition = Condition(condition: AlwaysTrueCondition())
        trueCondition.view = content()
        
        return IF(conditions: conditions + [trueCondition])
    }
}
