/// A condition that evaluates an equal expression between a variable and a constant value
internal struct Equal<Value>: Conditionable where Value: Equatable {

    internal let path: TemplateValue<Value>
    
    internal let value: TemplateValue<Value>

    internal func evaluate<T>(with manager: ContextManager<T>) throws -> Bool {
        return try path.value(from: manager) == value.value(from: manager)
    }
}

/// A condition that evaluates an not equal expression between a variable and a constant value
internal struct NotEqual<Value>: Conditionable where Value: Equatable {

    internal let path: TemplateValue<Value>
    
    internal let value: Value

    internal func evaluate<T>(with manager: ContextManager<T>) throws -> Bool {
        return try path.value(from: manager) != value
    }
}

/// A condition that evaluates a less then expression between a variable and a constant value
internal struct LessThen<Value>: Conditionable where Value: Comparable {

    internal let path: TemplateValue<Value>
    
    internal let value: Value

    internal func evaluate<T>(with manager: ContextManager<T>) throws -> Bool {
        return try path.value(from: manager) < value
    }
}

/// A condition that evaluates a greater then expression between a variable and a constant value
internal struct GreaterThen<Value>: Conditionable where Value: Comparable {

    internal let path: TemplateValue<Value>
    
    internal let value: Value

    internal func evaluate<T>(with manager: ContextManager<T>) throws -> Bool {
        return try path.value(from: manager) > value
    }
}

/// A condition that evaluates a greater then expression between a variable and a constant value
internal struct Between<Value>: Conditionable where Value: Comparable {

    internal let path: TemplateValue<Value>
    
    internal let upperBound: Value
    
    internal let lowerBound: Value

    internal func evaluate<T>(with manager: ContextManager<T>) throws -> Bool {
        return try lowerBound...upperBound ~= path.value(from: manager)
    }
}

/// A condition that is allways true
internal struct AlwaysTrueCondition: Conditionable {
    
    internal func evaluate<T>(with manager: ContextManager<T>) throws -> Bool {
        return true
    }
}

/// A condition that is allways true
internal struct InvertCondition: Conditionable {

    internal let condition: Conditionable

    internal func evaluate<T>(with manager: ContextManager<T>) throws -> Bool {
        return try !condition.evaluate(with: manager)
    }
}

/// The struct is for
internal struct BoolCondition<Root>: Conditionable {

    internal let path: TemplateValue<Bool>

    internal func evaluate<T>(with manager: ContextManager<T>) throws -> Bool {
        return try path.value(from: manager)
    }
}

/// The struct is for
internal struct NullableEqual<Value>: Conditionable where Value: Equatable {

    internal let path: TemplateValue<Value?>
    
    internal let value: Value

    internal func evaluate<T>(with manager: ContextManager<T>) throws -> Bool {
        return try path.value(from: manager) == value
    }
}

/// A condition that evaluates an not equal expression between a variable and a constant value
internal struct NullableNotEqual<Value>: Conditionable where Value: Equatable {

    internal let path: TemplateValue<Value?>
    
    internal let value: Value

    internal func evaluate<T>(with manager: ContextManager<T>) throws -> Bool {
        return try path.value(from: manager) != value
    }
}

/// A condition that evaluates a less then expression between a variable and a constant value
internal struct NullableLessThen<Value>: Conditionable where Value: Comparable {

    internal let path: TemplateValue<Value?>
    
    internal let value: Value

    internal func evaluate<T>(with manager: ContextManager<T>) throws -> Bool {
        
        if let pathValue = try path.value(from: manager) {
            return pathValue < value
            
        } else {
            return false
        }
    }
}

/// A condition that evaluates a greater then expression between a variable and a constant value
internal struct NullableGreaterThen<Value>: Conditionable where Value: Comparable {

    internal let path: TemplateValue<Value?>
    
    internal let value: Value

    internal func evaluate<T>(with manager: ContextManager<T>) throws -> Bool {
        
        if let pathValue = try path.value(from: manager) {
            return pathValue > value
            
        } else {
            return false
        }
    }
}

/// The struct is for
internal struct AndCondition: Conditionable {

    internal let first: Conditionable
    
    internal let second: Conditionable

    internal func evaluate<T>(with manager: ContextManager<T>) throws -> Bool {
        return try first.evaluate(with: manager) && second.evaluate(with: manager)
    }
}

/// The struct is for
internal struct OrCondition: Conditionable {

    internal let first: Conditionable
    
    internal let second: Conditionable

    internal func evaluate<T>(with manager: ContextManager<T>) throws -> Bool {
        return try first.evaluate(with: manager) || second.evaluate(with: manager)
    }
}

/// A condition that evaluates a greater then expression between a variable and a constant value
internal struct NotNullCondition<Value>: Conditionable {

    internal let path: TemplateValue<Value?>

    internal func evaluate<T>(with manager: ContextManager<T>) throws -> Bool {
        return try path.value(from: manager) != nil
    }
}

/// A condition that evaluates a greater then expression between a variable and a constant value
internal struct NotNullConditionGeneral<Value>: Conditionable {

    internal let path: TemplateValue<Value>

    internal func evaluate<T>(with manager: ContextManager<T>) throws -> Bool {
        
        if let value = try path.value(from: manager) as? Defineable {
            return value.isDefinded
            
        } else {
            return true
        }
    }
}

/// A condition that evaluates a greater then expression between a variable and a constant value
internal struct IsNullConditionGeneral<Value>: Conditionable {

    internal let path: TemplateValue<Value>

    internal func evaluate<T>(with manager: ContextManager<T>) throws -> Bool {
        
        if let value = try path.value(from: manager) as? Defineable {
            return value.isDefinded == false
            
        } else {
            return false
        }
    }
}

/// The struct is for
internal struct InCollectionCondition<Value>: Conditionable where Value: Equatable {

    internal let valuePath: TemplateValue<Value>
    
    internal let arrayPath: TemplateValue<[Value]>

    internal init(value: TemplateValue<Value>, array: TemplateValue<[Value]>) {
        
        self.valuePath = value
        self.arrayPath = array
    }

    internal func evaluate<T>(with manager: ContextManager<T>) throws -> Bool {
        
        let value = try valuePath.value(from: manager)
        let array = try arrayPath.value(from: manager)
        
        return array.contains(where: { $0 == value })
    }
}

/// The struct is for
internal struct InCollectionConditionOptional<Value>: Conditionable where Value: Equatable {

    internal let valuePath: TemplateValue<Value?>
    
    internal let arrayPath: TemplateValue<[Value]>

    internal init(value: TemplateValue<Value?>, array: TemplateValue<[Value]>) {
        
        self.valuePath = value
        self.arrayPath = array
    }

    internal func evaluate<T>(with manager: ContextManager<T>) throws -> Bool {
        
        guard let value = try valuePath.value(from: manager) else {
            return false
        }
        
        let array = try arrayPath.value(from: manager)
        
        return array.contains(where: { $0 == value })
    }
}

/// A condition that evaluates a greater then expression between a variable and a constant value
internal struct IsNullCondition<Value>: Conditionable {

    internal let path: TemplateValue<Value?>

    internal func evaluate<T>(with manager: ContextManager<T>) throws -> Bool {
        return try path.value(from: manager) == nil
    }
}

/// Creates a `Equal` condition
///
///
public func == <Value>(lhs: TemplateValue<Value>, rhs: Value) -> Conditionable where Value: Equatable {
    return Equal(path: lhs, value: TemplateValue<Value>.constant(rhs))
}

/// Creates a `Equal` condition
///
///
public func == <Value>(lhs: TemplateValue<Value>, rhs: TemplateValue<Value>) -> Conditionable where Value: Equatable {
    return Equal(path: lhs, value: rhs)
}

/// Creates a `Equal` condition
///
///
public func != <Value>(lhs: TemplateValue<Value>, rhs: Value) -> Conditionable where Value: Equatable {
    return NotEqual(path: lhs, value: rhs)
}

/// Creates a `LessThen` condition
///
///
public func < <Value>(lhs: TemplateValue<Value>, rhs: Value) -> Conditionable where Value: Comparable {
    return LessThen(path: lhs, value: rhs)
}

/// Creates a `GreaterThen` condition
///
///
public func > <Value>(lhs: TemplateValue<Value>, rhs: Value) -> Conditionable where Value: Comparable {
    return GreaterThen(path: lhs, value: rhs)
}

/// Creates a `GreaterThen` condition
///
///
public func ~= <Value>(lhs: Range<Value>, rhs: TemplateValue<Value>) -> Conditionable where Value: Comparable {
    return Between(path: rhs, upperBound: lhs.upperBound, lowerBound: lhs.lowerBound)
}

/// Creates a `GreaterThen` condition
///
///
public func ~= <Value>(lhs: ClosedRange<Value>, rhs: TemplateValue<Value>) -> Conditionable where Value: Comparable {
    return Between(path: rhs, upperBound: lhs.upperBound, lowerBound: lhs.lowerBound)
}

/// Creates a `GreaterThen` condition
///
///
public func ~= <Value>(lhs: TemplateValue<Value>, rhs: Range<Value>) -> Conditionable where Value: Comparable {
    return Between(path: lhs, upperBound: rhs.upperBound, lowerBound: rhs.lowerBound)
}

/// Creates a `GreaterThen` condition
///
///
public func ~= <Value>(lhs: TemplateValue<Value>, rhs: ClosedRange<Value>) -> Conditionable where Value: Comparable {
    return Between(path: lhs, upperBound: rhs.upperBound, lowerBound: rhs.lowerBound)
}

/// Creates a `Equal` condition
///
///
public func == <Value>(lhs: TemplateValue<Value?>, rhs: Value) -> Conditionable where Value: Equatable {
    return NullableEqual(path: lhs, value: rhs)
}

/// Creates a `Equal` condition
///
///
public func != <Value>(lhs: TemplateValue<Value?>, rhs: Value) -> Conditionable where Value: Equatable {
    return NullableNotEqual(path: lhs, value: rhs)
}

/// Creates a `LessThen` condition
///
///
public func < <Value>(lhs: TemplateValue<Value?>, rhs: Value) -> Conditionable where Value: Comparable {
    return NullableLessThen(path: lhs, value: rhs)
}

/// Creates a `GreaterThen` condition
///
///
public func > <Value>(lhs: TemplateValue<Value?>, rhs: Value) -> Conditionable where Value: Comparable {
    return NullableGreaterThen(path: lhs, value: rhs)
}

/// Creates a `GreaterThen` condition
///
///
public func >= <Value>(lhs: TemplateValue<Value>, rhs: Value) -> Conditionable where Value: Comparable {
    return InvertCondition(condition: LessThen(path: lhs, value: rhs))
}

/// Creates a `GreaterThen` condition
///
///
public func <= <Value>(lhs: TemplateValue<Value>, rhs: Value) -> Conditionable where Value: Comparable {
    return InvertCondition(condition: GreaterThen(path: lhs, value: rhs))
}

/// Creates a `GreaterThen` condition
///
///
public func >= <Value>(lhs: TemplateValue<Value?>, rhs: Value) -> Conditionable where Value: Comparable {
    return InvertCondition(condition: NullableLessThen(path: lhs, value: rhs))
}

/// Creates a `GreaterThen` condition
///
///
public func <= <Value>(lhs: TemplateValue<Value?>, rhs: Value) -> Conditionable where Value: Comparable {
    return InvertCondition(condition: NullableGreaterThen(path: lhs, value: rhs))
}

/// Creates a `AndCondition` condition
///
///
public func && (lhs: Conditionable, rhs: Conditionable) -> Conditionable {
    return AndCondition(first: lhs, second: rhs)
}

/// Creates a `OrCondition` condition
///
///
public func || (lhs: Conditionable, rhs: Conditionable) -> Conditionable {
    return OrCondition(first: lhs, second: rhs)
}

/// Creates a `InvertCondition` condition
///
///
public prefix func ! (condition: Conditionable) -> Conditionable {
    return InvertCondition(condition: condition)
}
