/*
 Abstract:
 The file contains the conditions.
 
 Markings:
 - Equal
 - NotEqual
 - LessThan
 - LessThanOrEqual
 - GreaterThan
 - GreaterThanOrEqual
 - Between
 - And
 - Or
 */

/// A condition that evaluates an equal expression between a variable and a constant value
internal struct EqualCondition<Value: Equatable>: Conditionable {

    private let lhs: TemplateValue<Value>
    
    private let rhs: Value
    
    internal init(lhs: TemplateValue<Value>, rhs: Value) {
         
        self.lhs = lhs
        self.rhs = rhs
    }
}

/// A condition that evaluates an not equal expression between a variable and a constant value
internal struct NotEqualCondition<Value: Equatable>: Conditionable {

    private let lhs: TemplateValue<Value>
    
    private let rhs: Value
    
    internal init(lhs: TemplateValue<Value>, rhs: Value) {
         
        self.lhs = lhs
        self.rhs = rhs
    }
}

/// A condition that evaluates a less than expression between a variable and a constant value
internal struct LessThanCondition<Value: Comparable>: Conditionable {

    private let lhs: TemplateValue<Value>
    
    private let rhs: Value
    
    internal init(lhs: TemplateValue<Value>, rhs: Value) {
         
        self.lhs = lhs
        self.rhs = rhs
    }
}

/// A condition that evaluates a greater than expression between a variable and a constant value
internal struct GreaterThanCondition<Value: Comparable>: Conditionable {

    private let lhs: TemplateValue<Value>
    
    private let rhs: Value
    
    internal init(lhs: TemplateValue<Value>, rhs: Value) {
         
        self.lhs = lhs
        self.rhs = rhs
    }
}

/// A condition...
internal struct BetweenCondition<Value: Strideable>: Conditionable {

    private let lhs: TemplateValue<Value>
    
    private let rhs: ClosedRange<Value>
    
    internal init(lhs: TemplateValue<Value>, rhs: ClosedRange<Value>) {
        
        self.lhs = lhs
        self.rhs = rhs
    }
    
    internal init(lhs: TemplateValue<Value>, rhs: Range<Value>) {
        
        self.lhs = lhs
        self.rhs = rhs.lowerBound...rhs.upperBound
    }
}

/// A condition that is always true
internal struct AlwaysTrueCondition: Conditionable {
    
    internal init() {}
}

/// A condition...
internal struct NotNullCondition<Value>: Conditionable {

    private let lhs: TemplateValue<Value?>
    
    internal init(lhs: TemplateValue<Value?>) {
        
        self.lhs = lhs
    }
}

/// A condition...
internal struct NotNullConditionGeneral<Value>: Conditionable {

    private let lhs: TemplateValue<Value>
    
    internal init(lhs: TemplateValue<Value>) {
        
        self.lhs = lhs
    }
}

/// A condition...
internal struct IsNullCondition<Value>: Conditionable {

    private let lhs: TemplateValue<Value?>
    
    internal init(lhs: TemplateValue<Value?>) {
        
        self.lhs = lhs
    }
}

/// A condition...
internal struct IsNullConditionGeneral<Value>: Conditionable {

    private let lhs: TemplateValue<Value>
    
    internal init(lhs: TemplateValue<Value>) {
        
        self.lhs = lhs
    }
}

/// A condition...
internal struct InvertCondition: Conditionable {

    private let lhs: Conditionable
    
    internal init(lhs: Conditionable) {
        
        self.lhs = lhs
    }
}

/// A condition...
internal struct AndCondition: Conditionable {

    private let lhs: Conditionable
    
    private let rhs: Conditionable
    
    internal init(lhs: Conditionable, rhs: Conditionable) {
        
        self.lhs = lhs
        self.rhs = rhs
    }
}

/// A condition...
internal struct OrCondition: Conditionable {

    private let lhs: Conditionable
    
    private let rhs: Conditionable
    
    internal init(lhs: Conditionable, rhs: Conditionable) {
        
        self.lhs = lhs
        self.rhs = rhs
    }
}

/// The operator
public func && (lhs: Conditionable, rhs: Conditionable) -> Conditionable {
    return AndCondition(lhs: lhs, rhs: rhs)
}

/// The operator
public func || (lhs: Conditionable, rhs: Conditionable) -> Conditionable {
    return OrCondition(lhs: lhs, rhs: rhs)
}

/// The operator to invert a condition
public prefix func ! (condition: Conditionable) -> Conditionable {
    return InvertCondition(lhs: condition)
}
