
/// A protocol that makes a struct to a condition that can be used in an if
public protocol Conditionable {

    /// Evaluates an expression with a context
    ///
    /// - Parameter context: The context to use when evaluating
    /// - Returns: true if the expression is correct else false
    func evaluate<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> Bool
}

extension Bool : Conditionable {
    public func evaluate<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> Bool {
        return self
    }
}

extension ContextVariable : Conditionable where Value == Bool {
    public func evaluate<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> Bool {
        try manager.value(for: self)
    }
}

/// A condition that evaluates an equal expression between a variable and a constant value
public struct Equal<Root, Value>: Conditionable where Value: Equatable {

    /// The path to the variable
    let path: TemplateValue<Root, Value>

    /// The value to be compared with
    let value: Value

    public func evaluate<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> Bool {
        try path.value(from: manager) == value
    }
}

/// A condition that evaluates an not equal expression between a variable and a constant value
public struct NotEqual<Root, Value>: Conditionable where Value: Equatable {

    /// The path to the variable
    let path: TemplateValue<Root, Value>

    /// The value to be compared with
    let value: Value

    public func evaluate<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> Bool {
        try path.value(from: manager) != value
    }
}

/// A condition that evaluates a less then expression between a variable and a constant value
public struct LessThen<Root, Value>: Conditionable where Value: Comparable {

    /// The path to the variable
    let path: TemplateValue<Root, Value>

    /// The value to be compared with
    let value: Value

    public func evaluate<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> Bool {
        try path.value(from: manager) < value
    }
}

/// A condition that evaluates a greater then expression between a variable and a constant value
public struct GreaterThen<Root, Value>: Conditionable where Value: Comparable {

    /// The path to the variable
    let path: TemplateValue<Root, Value>

    /// The value to be compared with
    let value: Value

    public func evaluate<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> Bool {
        try path.value(from: manager) > value
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

struct BoolCondition<Root>: Conditionable {

    /// The path to the variable
    let path: TemplateValue<Root, Bool>

    func evaluate<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> Bool {
        try path.value(from: manager)
    }
}

public struct NullableEqual<Root, Value>: Conditionable where Value: Equatable {

    /// The path to the variable
    let path: TemplateValue<Root, Value?>

    /// The value to be compared with
    let value: Value

    public func evaluate<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> Bool {
        try path.value(from: manager) == value
    }
}

/// A condition that evaluates an not equal expression between a variable and a constant value
public struct NullableNotEqual<Root, Value>: Conditionable where Value: Equatable {

    /// The path to the variable
    let path: TemplateValue<Root, Value?>

    /// The value to be compared with
    let value: Value

    public func evaluate<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> Bool {
        try path.value(from: manager) != value
    }
}

/// A condition that evaluates a less then expression between a variable and a constant value
public struct NullableLessThen<Root, Value>: Conditionable where Value: Comparable {

    /// The path to the variable
    let path: TemplateValue<Root, Value?>

    /// The value to be compared with
    let value: Value

    public func evaluate<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> Bool {
        if let pathValue = try path.value(from: manager) {
            return pathValue < value
        } else {
            return false
        }
    }
}

/// A condition that evaluates a greater then expression between a variable and a constant value
public struct NullableGreaterThen<Root, Value>: Conditionable where Value: Comparable {

    /// The path to the variable
    let path: TemplateValue<Root, Value?>

    /// The value to be compared with
    let value: Value

    public func evaluate<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> Bool {
        if let pathValue = try path.value(from: manager) {
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
public struct NotNullCondition<Root, Value>: Conditionable {

    /// The path to the variable
    let path: TemplateValue<Root, Value?>

    public func evaluate<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> Bool {
        try path.value(from: manager) != nil
    }
}

/// A condition that evaluates a greater then expression between a variable and a constant value
public struct IsNullCondition<Root, Value>: Conditionable {

    /// The path to the variable
    let path: TemplateValue<Root, Value?>

    public func evaluate<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> Bool {
        try path.value(from: manager) == nil
    }
}

extension TemplateValue : Conditionable where Value == Bool {
    public func evaluate<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> Bool {
        switch self {
        case .constant(let value): return value
        case .dynamic(let variable): return try manager.value(for: variable)
        }
    }
}

/// Creates a `Equal` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `TemplateConditionable` object
public func == <Root, Value>(lhs: TemplateValue<Root, Value>, rhs: Value) -> Conditionable where Value: Equatable {
    return Equal(path: lhs, value: rhs)
}

/// Creates a `Equal` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `TemplateConditionable` object
public func != <Root, Value>(lhs: TemplateValue<Root, Value>, rhs: Value) -> Conditionable where Value: Equatable {
    return NotEqual(path: lhs, value: rhs)
}

/// Creates a `LessThen` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `TemplateConditionable` object
public func < <Root, Value>(lhs: TemplateValue<Root, Value>, rhs: Value) -> Conditionable where Value: Comparable {
    return LessThen(path: lhs, value: rhs)
}

/// Creates a `GreaterThen` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `TemplateConditionable` object
public func > <Root, Value>(lhs: TemplateValue<Root, Value>, rhs: Value) -> Conditionable where Value: Comparable {
    return GreaterThen(path: lhs, value: rhs)
}


/// Creates a `Equal` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `TemplateConditionable` object
public func == <Root, Value>(lhs: TemplateValue<Root, Value?>, rhs: Value) -> Conditionable where Value: Equatable {
    return NullableEqual(path: lhs, value: rhs)
}

/// Creates a `Equal` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `TemplateConditionable` object
public func != <Root, Value>(lhs: TemplateValue<Root, Value?>, rhs: Value) -> Conditionable where Value: Equatable {
    return NullableNotEqual(path: lhs, value: rhs)
}

/// Creates a `LessThen` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `TemplateConditionable` object
public func < <Root, Value>(lhs: TemplateValue<Root, Value?>, rhs: Value) -> Conditionable where Value: Comparable {
    return NullableLessThen(path: lhs, value: rhs)
}

/// Creates a `GreaterThen` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `TemplateConditionable` object
public func > <Root, Value>(lhs: TemplateValue<Root, Value?>, rhs: Value) -> Conditionable where Value: Comparable {
    return NullableGreaterThen(path: lhs, value: rhs)
}

/// Creates a `GreaterThen` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `TemplateConditionable` object
public func >= <Root, Value>(lhs: TemplateValue<Root, Value>, rhs: Value) -> Conditionable where Value: Comparable {
    return InvertCondition(condition: LessThen(path: lhs, value: rhs))
}

/// Creates a `GreaterThen` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `TemplateConditionable` object
public func <= <Root, Value>(lhs: TemplateValue<Root, Value>, rhs: Value) -> Conditionable where Value: Comparable {
    return InvertCondition(condition: GreaterThen(path: lhs, value: rhs))
}

/// Creates a `GreaterThen` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `TemplateConditionable` object
public func >= <Root, Value>(lhs: TemplateValue<Root, Value?>, rhs: Value) -> Conditionable where Value: Comparable {
    return InvertCondition(condition: NullableLessThen(path: lhs, value: rhs))
}

/// Creates a `GreaterThen` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `TemplateConditionable` object
public func <= <Root, Value>(lhs: TemplateValue<Root, Value?>, rhs: Value) -> Conditionable where Value: Comparable {
    return InvertCondition(condition: NullableGreaterThen(path: lhs, value: rhs))
}

/// Creates a `AndCondition` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `TemplateConditionable` object
public func && (lhs: Conditionable, rhs: Conditionable) -> Conditionable {
    return AndCondition(first: lhs, second: rhs)
}

/// Creates a `OrCondition` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `TemplateConditionable` object
public func || (lhs: Conditionable, rhs: Conditionable) -> Conditionable {
    return OrCondition(first: lhs, second: rhs)
}
