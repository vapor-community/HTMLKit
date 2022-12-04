/*
 Abstract:
 The file contains the branch statements.
 
 Markings:
 - If
 */

/// The statement is for
public struct IF: Content {
    
    internal class Condition {

        internal let condition: Conditionable
        
        internal var content: Content?
        
        internal init(condition: Conditionable) {
            
            self.condition = condition
        }
    }

    private let conditions: [Condition]

    internal init(conditions: [Condition]) {
        self.conditions = conditions
    }
    
    public init(_ condition: Conditionable, @ContentBuilder<Content> content: () -> Content) {
        
        let condition = Condition(condition: condition)
        condition.content = content()
        
        self.conditions = [condition]
    }
    
    public func elseIf(_ condition: Conditionable, @ContentBuilder<Content> content: () -> Content) -> IF {
        
        let condition = Condition(condition: condition)
        condition.content = content()
        
        return .init(conditions: conditions + [condition])
    }

    public func elseIf<T>(isNil path: TemplateValue<T?>, @ContentBuilder<Content> content: () -> Content) -> IF {
        
        let condition = Condition(condition: IsNullCondition<T>(lhs: path))
        condition.content = content()
        
        return .init(conditions: conditions + [condition])
    }

    public func elseIf<T>(isNotNil path: TemplateValue<T?>, @ContentBuilder<Content> content: () -> Content) -> IF {
        
        let condition = Condition(condition: NotNullCondition<T>(lhs: path))
        condition.content = content()
        
        return .init(conditions: conditions + [condition])
    }

    public func `else`(@ContentBuilder<Content> content: () -> Content) -> IF {
        
        let condition = Condition(condition: AlwaysTrueCondition())
        condition.content = content()
        
        return .init(conditions: conditions + [condition])
    }
}

extension IF.Condition: Conditionable {}
