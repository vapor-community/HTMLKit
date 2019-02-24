
/// A protocol that makes a struct to a condition that can be used in an if
public protocol Conditionable {

    /// Evaluates an expression with a context
    ///
    /// - Parameter context: The context to use when evaluating
    /// - Returns: true if the expression is correct else false
    func evaluate<T>(with manager: HTML.Renderer.ContextManager<T>) throws -> Bool
}

/// A condition that evaluates an equal expression between a variable and a constant value
public struct Equal<Root, Value>: Conditionable where Value: Equatable {

    /// The path to the variable
    let path: KeyPath<Root, Value>

    /// The value to be compared with
    let value: Value

    public func evaluate<T>(with manager: HTML.Renderer.ContextManager<T>) throws -> Bool {
        return try manager.value(at: path) == value
    }
}

/// A condition that evaluates an not equal expression between a variable and a constant value
public struct NotEqual<Root, Value>: Conditionable where Value: Equatable {

    /// The path to the variable
    let path: KeyPath<Root, Value>

    /// The value to be compared with
    let value: Value

    public func evaluate<T>(with manager: HTML.Renderer.ContextManager<T>) throws -> Bool {
        return try manager.value(at: path) != value
    }
}

/// A condition that evaluates a less then expression between a variable and a constant value
public struct LessThen<Root, Value>: Conditionable where Value: Comparable {

    /// The path to the variable
    let path: KeyPath<Root, Value>

    /// The value to be compared with
    let value: Value

    public func evaluate<T>(with manager: HTML.Renderer.ContextManager<T>) throws -> Bool {
        return try manager.value(at: path) < value
    }
}

/// A condition that evaluates a greater then expression between a variable and a constant value
public struct GreaterThen<Root, Value>: Conditionable where Value: Comparable {

    /// The path to the variable
    let path: KeyPath<Root, Value>

    /// The value to be compared with
    let value: Value

    public func evaluate<T>(with manager: HTML.Renderer.ContextManager<T>) throws -> Bool {
        return try manager.value(at: path) > value
    }
}

/// A condition that is allways true
/// Used as the `else` condition
struct AllwaysTrueCondition: Conditionable {
    func evaluate<T>(with manager: HTML.Renderer.ContextManager<T>) throws -> Bool {
        return true
    }
}

struct BoolCondition<Root>: Conditionable where Root: ContextualTemplate {

    /// The path to the variable
    let path: KeyPath<Root.Context, Bool>

    func evaluate<T>(with manager: HTML.Renderer.ContextManager<T>) throws -> Bool {
        return try manager.value(at: path)
    }
}

public struct NullableEqual<Root, Value>: Conditionable where Value: Equatable {

    /// The path to the variable
    let path: KeyPath<Root, Value?>

    /// The value to be compared with
    let value: Value

    public func evaluate<T>(with manager: HTML.Renderer.ContextManager<T>) throws -> Bool {
        return try manager.value(at: path) == value
    }
}

/// A condition that evaluates an not equal expression between a variable and a constant value
public struct NullableNotEqual<Root, Value>: Conditionable where Value: Equatable {

    /// The path to the variable
    let path: KeyPath<Root, Value?>

    /// The value to be compared with
    let value: Value

    public func evaluate<T>(with manager: HTML.Renderer.ContextManager<T>) throws -> Bool {
        return try manager.value(at: path) != value
    }
}

/// A condition that evaluates a less then expression between a variable and a constant value
public struct NullableLessThen<Root, Value>: Conditionable where Value: Comparable {

    /// The path to the variable
    let path: KeyPath<Root, Value?>

    /// The value to be compared with
    let value: Value

    public func evaluate<T>(with manager: HTML.Renderer.ContextManager<T>) throws -> Bool {
        if let pathValue = try manager.value(at: path) {
            return pathValue < value
        } else {
            return false
        }
    }
}

/// A condition that evaluates a greater then expression between a variable and a constant value
public struct NullableGreaterThen<Root, Value>: Conditionable where Value: Comparable {

    /// The path to the variable
    let path: KeyPath<Root, Value?>

    /// The value to be compared with
    let value: Value

    public func evaluate<T>(with manager: HTML.Renderer.ContextManager<T>) throws -> Bool {
        if let pathValue = try manager.value(at: path) {
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

    public func evaluate<T>(with manager: HTML.Renderer.ContextManager<T>) throws -> Bool {
        return try first.evaluate(with: manager) && second.evaluate(with: manager)
    }
}

// A condition equal to || in swift
public struct OrCondition: Conditionable {

    /// The first condition
    let first: Conditionable

    /// The second condition
    let second: Conditionable

    public func evaluate<T>(with manager: HTML.Renderer.ContextManager<T>) throws -> Bool {
        return try first.evaluate(with: manager) || second.evaluate(with: manager)
    }
}

/// Creates a `Equal` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `HTML.IF.Condition` object
public func == <Root, Value>(lhs: KeyPath<Root.Context, Value>, rhs: Value) -> HTML.IF<Root>.Condition where Root: ContextualTemplate, Value: Equatable {
    return HTML.IF.Condition(condition: Equal(path: lhs, value: rhs))
}

/// Creates a `Equal` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `HTML.IF.Condition` object
public func != <Root, Value>(lhs: KeyPath<Root.Context, Value>, rhs: Value) -> HTML.IF<Root>.Condition where Root: ContextualTemplate, Value: Equatable {
    return HTML.IF.Condition(condition: NotEqual(path: lhs, value: rhs))
}

/// Creates a `LessThen` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `HTML.IF.Condition` object
public func < <Root, Value>(lhs: KeyPath<Root.Context, Value>, rhs: Value) -> HTML.IF<Root>.Condition where Root: ContextualTemplate, Value: Comparable {
    return HTML.IF.Condition(condition: LessThen(path: lhs, value: rhs))
}

/// Creates a `GreaterThen` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `HTML.IF.Condition` object
public func > <Root, Value>(lhs: KeyPath<Root.Context, Value>, rhs: Value) -> HTML.IF<Root>.Condition where Root: ContextualTemplate, Value: Comparable {
    return HTML.IF.Condition(condition: GreaterThen(path: lhs, value: rhs))
}


/// Creates a `Equal` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `HTML.IF.Condition` object
public func == <Root, Value>(lhs: KeyPath<Root.Context, Value?>, rhs: Value) -> HTML.IF<Root>.Condition where Root: ContextualTemplate, Value: Equatable {
    return HTML.IF.Condition(condition: NullableEqual(path: lhs, value: rhs))
}

/// Creates a `Equal` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `HTML.IF.Condition` object
public func != <Root, Value>(lhs: KeyPath<Root.Context, Value?>, rhs: Value) -> HTML.IF<Root>.Condition where Root: ContextualTemplate, Value: Equatable {
    return HTML.IF.Condition(condition: NullableNotEqual(path: lhs, value: rhs))
}

/// Creates a `LessThen` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `HTML.IF.Condition` object
public func < <Root, Value>(lhs: KeyPath<Root.Context, Value?>, rhs: Value) -> HTML.IF<Root>.Condition where Root: ContextualTemplate, Value: Comparable {
    return HTML.IF.Condition(condition: NullableLessThen(path: lhs, value: rhs))
}

/// Creates a `GreaterThen` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `HTML.IF.Condition` object
public func > <Root, Value>(lhs: KeyPath<Root.Context, Value?>, rhs: Value) -> HTML.IF<Root>.Condition where Root: ContextualTemplate, Value: Comparable {
    return HTML.IF.Condition(condition: NullableGreaterThen(path: lhs, value: rhs))
}

/// Creates a `AndCondition` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `HTML.IF.Condition` object
public func && <Root>(lhs: HTML.IF<Root>.Condition, rhs: HTML.IF<Root>.Condition) -> HTML.IF<Root>.Condition where Root: ContextualTemplate {
    return HTML.IF<Root>.Condition(condition: AndCondition(first: lhs, second: rhs))
}

/// Creates a `OrCondition` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `HTML.IF.Condition` object
public func || <Root>(lhs: HTML.IF<Root>.Condition, rhs: HTML.IF<Root>.Condition) -> HTML.IF<Root>.Condition where Root: ContextualTemplate {
    return HTML.IF<Root>.Condition(condition: OrCondition(first: lhs, second: rhs))
}
