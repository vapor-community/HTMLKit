

public protocol AnyCondition {
    /// Evaluates an expression with a context that may or may not be in the correct format
    ///
    /// - Parameter context: The context to use when evaluateing
    /// - Returns: true if the expression is correct else false
    func anyEvaluate(with context: Any) -> Bool
}

typealias AnyMappableCondition = AnyCondition & Mappable

/// A protocol that makes a struct to a condition that can be used in an if
public protocol Conditionable: AnyCondition {

    associatedtype Root: ContextualTemplate

    /// Evaluates an expression with a context
    ///
    /// - Parameter context: The context to use when evaluating
    /// - Returns: true if the expression is correct else false
    func evaluate(with context: Root.Context) -> Bool
}

extension Conditionable {
    public func anyEvaluate(with context: Any) -> Bool {
        if let context = context as? Root.Context {
            return evaluate(with: context)
        } else {
            return false
        }
    }
}

/// A condition that evaluates an equal expression between a variable and a constant value
public struct Equal<Root, Value>: Conditionable where Root: ContextualTemplate, Value: Equatable {

    /// The path to the variable
    let path: KeyPath<Root.Context, Value>

    /// The value to be compared with
    let value: Value

    public func evaluate(with context: Root.Context) -> Bool {
        return context[keyPath: path] == value
    }
}

/// A condition that evaluates an not equal expression between a variable and a constant value
public struct NotEqual<Root, Value>: Conditionable where Root: ContextualTemplate, Value: Equatable {

    /// The path to the variable
    let path: KeyPath<Root.Context, Value>

    /// The value to be compared with
    let value: Value

    public func evaluate(with context: Root.Context) -> Bool {
        return context[keyPath: path] != value
    }
}

/// A condition that evaluates a less then expression between a variable and a constant value
public struct LessThen<Root, Value>: Conditionable where Root: ContextualTemplate, Value: Comparable {

    /// The path to the variable
    let path: KeyPath<Root.Context, Value>

    /// The value to be compared with
    let value: Value

    public func evaluate(with context: Root.Context) -> Bool {
        return context[keyPath: path] < value
    }
}

/// A condition that evaluates a greater then expression between a variable and a constant value
public struct GreaterThen<Root, Value>: Conditionable where Root: ContextualTemplate, Value: Comparable {

    /// The path to the variable
    let path: KeyPath<Root.Context, Value>

    /// The value to be compared with
    let value: Value

    public func evaluate(with context: Root.Context) -> Bool {
        return context[keyPath: path] > value
    }
}

/// A condition that is allways true
struct AllwaysTrueCondition<Root>: Conditionable where Root: ContextualTemplate {
    func evaluate(with context: Root.Context) -> Bool {
        return true
    }
}

struct BoolCondition<Root>: Conditionable where Root: ContextualTemplate {

    /// The path to the variable
    let path: KeyPath<Root.Context, Bool>

    func evaluate(with context: Root.Context) -> Bool {
        return context[keyPath: path]
    }
}

public struct NullableEqual<Root, Value>: Conditionable where Root: ContextualTemplate, Value: Equatable {

    /// The path to the variable
    let path: KeyPath<Root.Context, Value?>

    /// The value to be compared with
    let value: Value

    public func evaluate(with context: Root.Context) -> Bool {
        return context[keyPath: path] == value
    }
}

/// A condition that evaluates an not equal expression between a variable and a constant value
public struct NullableNotEqual<Root, Value>: Conditionable where Root: ContextualTemplate, Value: Equatable {

    /// The path to the variable
    let path: KeyPath<Root.Context, Value?>

    /// The value to be compared with
    let value: Value

    public func evaluate(with context: Root.Context) -> Bool {
        return context[keyPath: path] != value
    }
}

/// A condition that evaluates a less then expression between a variable and a constant value
public struct NullableLessThen<Root, Value>: Conditionable where Root: ContextualTemplate, Value: Comparable {

    /// The path to the variable
    let path: KeyPath<Root.Context, Value?>

    /// The value to be compared with
    let value: Value

    public func evaluate(with context: Root.Context) -> Bool {
        if let pathValue = context[keyPath: path] {
            return pathValue < value
        } else {
            return false
        }
    }
}

/// A condition that evaluates a greater then expression between a variable and a constant value
public struct NullableGreaterThen<Root, Value>: Conditionable where Root: ContextualTemplate, Value: Comparable {

    /// The path to the variable
    let path: KeyPath<Root.Context, Value?>

    /// The value to be compared with
    let value: Value

    public func evaluate(with context: Root.Context) -> Bool {
        if let pathValue = context[keyPath: path] {
            return pathValue > value
        } else {
            return false
        }
    }
}

/// Creates a `Equal` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `HTML.IF.Condition` object
public func == <Root, Value>(lhs: KeyPath<Root.Context, Value>, rhs: Value) -> HTML.IF<Root>.Condition<Equal<Root, Value>> where Root: ContextualTemplate, Value: Equatable {
    return HTML.IF.Condition(condition: Equal(path: lhs, value: rhs))
}

/// Creates a `Equal` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `HTML.IF.Condition` object
public func != <Root, Value>(lhs: KeyPath<Root.Context, Value>, rhs: Value) -> HTML.IF<Root>.Condition<NotEqual<Root, Value>> where Root: ContextualTemplate, Value: Equatable {
    return HTML.IF.Condition(condition: NotEqual(path: lhs, value: rhs))
}

/// Creates a `LessThen` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `HTML.IF.Condition` object
public func < <Root, Value>(lhs: KeyPath<Root.Context, Value>, rhs: Value) -> HTML.IF<Root>.Condition<LessThen<Root, Value>> where Root: ContextualTemplate, Value: Comparable {
    return HTML.IF.Condition(condition: LessThen(path: lhs, value: rhs))
}

/// Creates a `GreaterThen` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `HTML.IF.Condition` object
public func > <Root, Value>(lhs: KeyPath<Root.Context, Value>, rhs: Value) -> HTML.IF<Root>.Condition<GreaterThen<Root, Value>> where Root: ContextualTemplate, Value: Comparable {
    return HTML.IF.Condition(condition: GreaterThen(path: lhs, value: rhs))
}


/// Creates a `Equal` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `HTML.IF.Condition` object
public func == <Root, Value>(lhs: KeyPath<Root.Context, Value?>, rhs: Value) -> HTML.IF<Root>.Condition<NullableEqual<Root, Value>> where Root: ContextualTemplate, Value: Equatable {
    return HTML.IF.Condition(condition: NullableEqual(path: lhs, value: rhs))
}

/// Creates a `Equal` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `HTML.IF.Condition` object
public func != <Root, Value>(lhs: KeyPath<Root.Context, Value?>, rhs: Value) -> HTML.IF<Root>.Condition<NullableNotEqual<Root, Value>> where Root: ContextualTemplate, Value: Equatable {
    return HTML.IF.Condition(condition: NullableNotEqual(path: lhs, value: rhs))
}

/// Creates a `LessThen` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `HTML.IF.Condition` object
public func < <Root, Value>(lhs: KeyPath<Root.Context, Value?>, rhs: Value) -> HTML.IF<Root>.Condition<NullableLessThen<Root, Value>> where Root: ContextualTemplate, Value: Comparable {
    return HTML.IF.Condition(condition: NullableLessThen(path: lhs, value: rhs))
}

/// Creates a `GreaterThen` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `HTML.IF.Condition` object
public func > <Root, Value>(lhs: KeyPath<Root.Context, Value?>, rhs: Value) -> HTML.IF<Root>.Condition<NullableGreaterThen<Root, Value>> where Root: ContextualTemplate, Value: Comparable {
    return HTML.IF.Condition(condition: NullableGreaterThen(path: lhs, value: rhs))
}
