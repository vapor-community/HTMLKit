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
        
        let condition = Condition(condition: IsNullCondition<T>(lhs: path))
        condition.view = content()
        
        return .init(conditions: conditions + [condition])
    }

    public func elseIf<T>(isNotNil path: TemplateValue<T?>, @ContentBuilder<AnyContent> content: () -> AnyContent) -> IF {
        
        let condition = Condition(condition: NotNullCondition<T>(lhs: path))
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
}

extension IF.Condition: AnyContent {}

extension IF.Condition: Conditionable {

    public func evaluate<T>(with manager: ContextManager<T>) throws -> Bool {
        return try condition.evaluate(with: manager)
    }
}

