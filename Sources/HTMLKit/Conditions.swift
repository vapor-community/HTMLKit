
/// A protocol that makes a struct to a condition that can be used in an if
public protocol Conditionable {

    /// Evaluates an expression with a context
    ///
    /// - Parameter context: The context to use when evaluating
    /// - Returns: true if the expression is correct else false
    func evaluate<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> Bool
}

/// A condition that evaluates an equal expression between a variable and a constant value
public struct Equal<Value>: Conditionable where Value: Equatable {

    /// The path to the variable
    let path: TemplateValue<Value>

    /// The value to be compared with
    let value: Value

    public func evaluate<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> Bool {
        var compValue: Value!
        switch path {
        case .variable(let variable): compValue = try manager.value(for: variable)
        case .value(let rawValue): compValue = rawValue
        }
        return compValue == value
    }
}

/// A condition that evaluates an not equal expression between a variable and a constant value
public struct NotEqual<Value>: Conditionable where Value: Equatable {

    /// The path to the variable
    let path: TemplateValue<Value>

    /// The value to be compared with
    let value: Value

    public func evaluate<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> Bool {
        var compValue: Value!
        switch path {
        case .variable(let variable): compValue = try manager.value(for: variable)
        case .value(let rawValue): compValue = rawValue
        }
        return compValue != value
    }
}

/// A condition that evaluates a less then expression between a variable and a constant value
public struct LessThen<Value>: Conditionable where Value: Comparable {

    /// The path to the variable
    let path: TemplateValue<Value>

    /// The value to be compared with
    let value: Value

    public func evaluate<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> Bool {
        var compValue: Value!
        switch path {
        case .variable(let variable): compValue = try manager.value(for: variable)
        case .value(let rawValue): compValue = rawValue
        }
        return compValue < value
    }
}

/// A condition that evaluates a greater then expression between a variable and a constant value
public struct GreaterThen<Value>: Conditionable where Value: Comparable {

    /// The path to the variable
    let path: TemplateValue<Value>

    /// The value to be compared with
    let value: Value

    public func evaluate<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> Bool {
        var compValue: Value!
        switch path {
        case .variable(let variable): compValue = try manager.value(for: variable)
        case .value(let rawValue): compValue = rawValue
        }
        return compValue > value
    }
}

/// A condition that is allways true
/// Used as the `else` condition
struct AllwaysTrueCondition: Conditionable {
    func evaluate<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> Bool {
        return true
    }
}

/// A condition that is allways true
/// Used as the `else` condition
struct InvertCondition: Conditionable {

    let condition: Conditionable

    func evaluate<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> Bool {
        return try !condition.evaluate(with: manager)
    }
}

struct BoolCondition: Conditionable {

    /// The path to the variable
    let path: TemplateValue<Bool>

    func evaluate<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> Bool {
        switch path {
        case .variable(let variable): return try manager.value(for: variable)
        case .value(let rawValue): return rawValue
        }
    }
}

public struct NullableEqual<Value>: Conditionable where Value: Equatable {

    /// The path to the variable
    let path: TemplateValue<Value?>

    /// The value to be compared with
    let value: Value

    public func evaluate<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> Bool {
        var compValue: Value?
        switch path {
        case .variable(let variable): compValue = try manager.value(for: variable)
        case .value(let rawValue): compValue = rawValue
        }
        return compValue == value
    }
}

/// A condition that evaluates an not equal expression between a variable and a constant value
public struct NullableNotEqual<Value>: Conditionable where Value: Equatable {

    /// The path to the variable
    let path: TemplateValue<Value?>

    /// The value to be compared with
    let value: Value

    public func evaluate<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> Bool {
        var compValue: Value?
        switch path {
        case .variable(let variable): compValue = try manager.value(for: variable)
        case .value(let rawValue): compValue = rawValue
        }
        return compValue != value
    }
}

/// A condition that evaluates a less then expression between a variable and a constant value
public struct NullableLessThen<Value>: Conditionable where Value: Comparable {

    /// The path to the variable
    let path: TemplateValue<Value?>

    /// The value to be compared with
    let value: Value

    public func evaluate<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> Bool {
        var compValue: Value?
        switch path {
        case .variable(let variable): compValue = try manager.value(for: variable)
        case .value(let rawValue): compValue = rawValue
        }
        if let pathValue = compValue {
            return pathValue < value
        } else {
            return false
        }
    }
}

/// A condition that evaluates a greater then expression between a variable and a constant value
public struct NullableGreaterThen<Value>: Conditionable where Value: Comparable {

    /// The path to the variable
    let path: TemplateValue<Value?>

    /// The value to be compared with
    let value: Value

    public func evaluate<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> Bool {
        var compValue: Value?
        switch path {
        case .variable(let variable): compValue = try manager.value(for: variable)
        case .value(let rawValue): compValue = rawValue
        }
        if let pathValue = compValue {
            return pathValue > value
        } else {
            return false
        }
    }
}

// A condition equal to && in swift
public struct AndCondition: Conditionable {

    /// The first condition
    let first: Conditionable

    /// The second condition
    let second: Conditionable

    public func evaluate<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> Bool {
        return try first.evaluate(with: manager) && second.evaluate(with: manager)
    }
}

// A condition equal to || in swift
public struct OrCondition: Conditionable {

    /// The first condition
    let first: Conditionable

    /// The second condition
    let second: Conditionable

    public func evaluate<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> Bool {
        return try first.evaluate(with: manager) || second.evaluate(with: manager)
    }
}

/// A condition that evaluates a greater then expression between a variable and a constant value
public struct NotNullCondition<Value>: Conditionable {

    /// The path to the variable
    let path: TemplateValue<Value?>

    public func evaluate<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> Bool {
        var compValue: Value?
        switch path {
        case .variable(let variable): compValue = try manager.value(for: variable)
        case .value(let rawValue): compValue = rawValue
        }
        return compValue != nil
    }
}

/// A condition that evaluates a greater then expression between a variable and a constant value
public struct IsNullCondition<Value>: Conditionable {

    /// The path to the variable
    let path: TemplateValue<Value?>

    public func evaluate<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> Bool {
        var compValue: Value?
        switch path {
        case .variable(let variable): compValue = try manager.value(for: variable)
        case .value(let rawValue): compValue = rawValue
        }
        return compValue == nil
    }
}

/// Creates a `Equal` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `TemplateIF.Condition` object
public func == <Value>(lhs: TemplateValue<Value>, rhs: Value) -> IF.Condition where Value: Equatable {
    return IF.Condition(condition: Equal(path: lhs, value: rhs))
}

/// Creates a `Equal` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `TemplateIF.Condition` object
public func != <Value>(lhs: TemplateValue<Value>, rhs: Value) -> IF.Condition where Value: Equatable {
    return IF.Condition(condition: NotEqual(path: lhs, value: rhs))
}

/// Creates a `LessThen` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `TemplateIF.Condition` object
public func < <Value>(lhs: TemplateValue<Value>, rhs: Value) -> IF.Condition where Value: Comparable {
    return IF.Condition(condition: LessThen(path: lhs, value: rhs))
}

/// Creates a `GreaterThen` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `TemplateIF.Condition` object
public func > <Value>(lhs: TemplateValue<Value>, rhs: Value) -> IF.Condition where Value: Comparable {
    return IF.Condition(condition: GreaterThen(path: lhs, value: rhs))
}


/// Creates a `Equal` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `TemplateIF.Condition` object
public func == <Value>(lhs: TemplateValue<Value?>, rhs: Value) -> IF.Condition where Value: Equatable {
    return IF.Condition(condition: NullableEqual(path: lhs, value: rhs))
}

/// Creates a `Equal` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `TemplateIF.Condition` object
public func != <Value>(lhs: TemplateValue<Value?>, rhs: Value) -> IF.Condition where Value: Equatable {
    return IF.Condition(condition: NullableNotEqual(path: lhs, value: rhs))
}

/// Creates a `LessThen` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `TemplateIF.Condition` object
public func < <Value>(lhs: TemplateValue<Value?>, rhs: Value) -> IF.Condition where Value: Comparable {
    return IF.Condition(condition: NullableLessThen(path: lhs, value: rhs))
}

/// Creates a `GreaterThen` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `TemplateIF.Condition` object
public func > <Value>(lhs: TemplateValue<Value?>, rhs: Value) -> IF.Condition where Value: Comparable {
    return IF.Condition(condition: NullableGreaterThen(path: lhs, value: rhs))
}

/// Creates a `GreaterThen` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `TemplateIF.Condition` object
public func >= <Value>(lhs: TemplateValue<Value>, rhs: Value) -> IF.Condition where Value: Comparable {
    return IF.Condition(condition: InvertCondition(condition: LessThen(path: lhs, value: rhs)))
}

/// Creates a `GreaterThen` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `TemplateIF.Condition` object
public func <= <Value>(lhs: TemplateValue<Value>, rhs: Value) -> IF.Condition where Value: Comparable {
    return IF.Condition(condition: InvertCondition(condition: GreaterThen(path: lhs, value: rhs)))
}

/// Creates a `GreaterThen` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `TemplateIF.Condition` object
public func >= <Value>(lhs: TemplateValue<Value?>, rhs: Value) -> IF.Condition where Value: Comparable {
    return IF.Condition(condition: InvertCondition(condition: NullableLessThen(path: lhs, value: rhs)))
}

/// Creates a `GreaterThen` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `TemplateIF.Condition` object
public func <= <Value>(lhs: TemplateValue<Value?>, rhs: Value) -> IF.Condition where Value: Comparable {
    return IF.Condition(condition: InvertCondition(condition: NullableGreaterThen(path: lhs, value: rhs)))
}

/// Creates a `AndCondition` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `TemplateIF.Condition` object
public func && (lhs: IF.Condition, rhs: IF.Condition) -> IF.Condition {
    return IF.Condition(condition: AndCondition(first: lhs, second: rhs))
}

/// Creates a `AndCondition` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `TemplateIF.Condition` object
public func && (lhs: TemplateValue<Bool>, rhs: IF.Condition) -> IF.Condition {
    let lhsCondition = BoolCondition(path: lhs)
    return IF.Condition(condition: AndCondition(first: lhsCondition, second: rhs))
}

/// Creates a `AndCondition` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `TemplateIF.Condition` object
public func && (lhs: IF.Condition, rhs: TemplateValue<Bool>) -> IF.Condition {
    let rhsCondition = BoolCondition(path: rhs)
    return IF.Condition(condition: AndCondition(first: lhs, second: rhsCondition))
}

/// Creates a `AndCondition` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `TemplateIF.Condition` object
public func && (lhs: TemplateValue<Bool>, rhs: TemplateValue<Bool>) -> IF.Condition {
    let lhsCondition = BoolCondition(path: lhs)
    let rhsCondition = BoolCondition(path: rhs)
    return IF.Condition(condition: AndCondition(first: lhsCondition, second: rhsCondition))
}

/// Creates a `OrCondition` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `TemplateIF.Condition` object
public func || (lhs: IF.Condition, rhs: IF.Condition) -> IF.Condition {
    return IF.Condition(condition: OrCondition(first: lhs, second: rhs))
}

/// Creates a `AndCondition` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `TemplateIF.Condition` object
public func || (lhs: TemplateValue<Bool>, rhs: IF.Condition) -> IF.Condition {
    let lhsCondition = BoolCondition(path: lhs)
    return IF.Condition(condition: AndCondition(first: lhsCondition, second: rhs))
}

/// Creates a `AndCondition` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `TemplateIF.Condition` object
public func || (lhs: IF.Condition, rhs: TemplateValue<Bool>) -> IF.Condition {
    let rhsCondition = BoolCondition(path: rhs)
    return IF.Condition(condition: AndCondition(first: lhs, second: rhsCondition))
}

/// Creates a `AndCondition` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `TemplateIF.Condition` object
public func || (lhs: TemplateValue<Bool>, rhs: TemplateValue<Bool>) -> IF.Condition {
    let lhsCondition = BoolCondition(path: lhs)
    let rhsCondition = BoolCondition(path: rhs)
    return IF.Condition(condition: AndCondition(first: lhsCondition, second: rhsCondition))
}
