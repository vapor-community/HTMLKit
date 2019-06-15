
/// A protocol that makes a struct to a condition that can be used in an if
public protocol Conditionable {

    /// Evaluates an expression with a context
    ///
    /// - Parameter context: The context to use when evaluating
    /// - Returns: true if the expression is correct else false
    func evaluate<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> Bool
}

/// A condition that evaluates an equal expression between a variable and a constant value
public struct Equal<Root, Value>: Conditionable where Value: Equatable {

    /// The path to the variable
    let path: ContextVariable<Root, Value>

    /// The value to be compared with
    let value: Value

    public func evaluate<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> Bool {
        return try manager.value(for: path) == value
    }
}

/// A condition that evaluates an not equal expression between a variable and a constant value
public struct NotEqual<Root, Value>: Conditionable where Value: Equatable {

    /// The path to the variable
    let path: ContextVariable<Root, Value>

    /// The value to be compared with
    let value: Value

    public func evaluate<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> Bool {
        return try manager.value(for: path) != value
    }
}

/// A condition that evaluates a less then expression between a variable and a constant value
public struct LessThen<Root, Value>: Conditionable where Value: Comparable {

    /// The path to the variable
    let path: KeyPath<Root, Value>

    /// The value to be compared with
    let value: Value

    public func evaluate<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> Bool {
        return try manager.value(at: path) < value
    }
}

/// A condition that evaluates a greater then expression between a variable and a constant value
public struct GreaterThen<Root, Value>: Conditionable where Value: Comparable {

    /// The path to the variable
    let path: KeyPath<Root, Value>

    /// The value to be compared with
    let value: Value

    public func evaluate<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> Bool {
        return try manager.value(at: path) > value
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

//struct BoolCondition<Root>: Conditionable where Root: ContextualTemplate {
//
//    /// The path to the variable
//    let path: KeyPath<Root.Context, Bool>
//
//    func evaluate<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> Bool {
//        return try manager.value(at: path)
//    }
//}

public struct NullableEqual<Root, Value>: Conditionable where Value: Equatable {

    /// The path to the variable
    let path: ContextVariable<Root, Value?>

    /// The value to be compared with
    let value: Value

    public func evaluate<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> Bool {
        return try manager.value(for: path) == value
    }
}

/// A condition that evaluates an not equal expression between a variable and a constant value
public struct NullableNotEqual<Root, Value>: Conditionable where Value: Equatable {

    /// The path to the variable
    let path: ContextVariable<Root, Value?>

    /// The value to be compared with
    let value: Value

    public func evaluate<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> Bool {
        return try manager.value(for: path) != value
    }
}

/// A condition that evaluates a less then expression between a variable and a constant value
public struct NullableLessThen<Root, Value>: Conditionable where Value: Comparable {

    /// The path to the variable
    let path: KeyPath<Root, Value?>

    /// The value to be compared with
    let value: Value

    public func evaluate<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> Bool {
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

    public func evaluate<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> Bool {
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
    let path: KeyPath<Root, Value?>

    public func evaluate<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> Bool {
        return try manager.value(at: path) != nil
    }
}

/// A condition that evaluates a greater then expression between a variable and a constant value
public struct IsNullCondition<Root, Value>: Conditionable {

    /// The path to the variable
    let path: KeyPath<Root, Value?>

    public func evaluate<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> Bool {
        return try manager.value(at: path) == nil
    }
}

/// Creates a `Equal` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `TemplateIF.Condition` object
public func == <Root, Value>(lhs: ContextVariable<Root, Value>, rhs: Value) -> IF.Condition where Value: Equatable {
    return IF.Condition(condition: Equal(path: lhs, value: rhs))
}

/// Creates a `Equal` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `TemplateIF.Condition` object
public func != <Root, Value>(lhs: ContextVariable<Root, Value>, rhs: Value) -> IF.Condition where Value: Equatable {
    return IF.Condition(condition: NotEqual(path: lhs, value: rhs))
}

///// Creates a `LessThen` condition
/////
///// - Parameters:
/////   - lhs: The key path
/////   - rhs: The constant value
///// - Returns: A `TemplateIF.Condition` object
//public func < <Root, Value>(lhs: KeyPath<Root.Context, Value>, rhs: Value) -> IF<Root>.Condition where Root: ContextualTemplate, Value: Comparable {
//    return IF.Condition(condition: LessThen(path: lhs, value: rhs))
//}
//
///// Creates a `GreaterThen` condition
/////
///// - Parameters:
/////   - lhs: The key path
/////   - rhs: The constant value
///// - Returns: A `TemplateIF.Condition` object
//public func > <Root, Value>(lhs: KeyPath<Root.Context, Value>, rhs: Value) -> IF<Root>.Condition where Root: ContextualTemplate, Value: Comparable {
//    return IF.Condition(condition: GreaterThen(path: lhs, value: rhs))
//}
//
//
/// Creates a `Equal` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `TemplateIF.Condition` object
public func == <Root, Value>(lhs: ContextVariable<Root, Value?>, rhs: Value) -> IF.Condition where Value: Equatable {
    return IF.Condition(condition: NullableEqual(path: lhs, value: rhs))
}

/// Creates a `Equal` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `TemplateIF.Condition` object
public func != <Root, Value>(lhs: ContextVariable<Root, Value?>, rhs: Value) -> IF.Condition where Value: Equatable {
    return IF.Condition(condition: NullableNotEqual(path: lhs, value: rhs))
}

///// Creates a `LessThen` condition
/////
///// - Parameters:
/////   - lhs: The key path
/////   - rhs: The constant value
///// - Returns: A `TemplateIF.Condition` object
//public func < <Root, Value>(lhs: KeyPath<Root.Context, Value?>, rhs: Value) -> IF<Root>.Condition where Root: ContextualTemplate, Value: Comparable {
//    return IF.Condition(condition: NullableLessThen(path: lhs, value: rhs))
//}
//
///// Creates a `GreaterThen` condition
/////
///// - Parameters:
/////   - lhs: The key path
/////   - rhs: The constant value
///// - Returns: A `TemplateIF.Condition` object
//public func > <Root, Value>(lhs: KeyPath<Root.Context, Value?>, rhs: Value) -> IF<Root>.Condition where Root: ContextualTemplate, Value: Comparable {
//    return IF.Condition(condition: NullableGreaterThen(path: lhs, value: rhs))
//}
//
///// Creates a `GreaterThen` condition
/////
///// - Parameters:
/////   - lhs: The key path
/////   - rhs: The constant value
///// - Returns: A `TemplateIF.Condition` object
//public func >= <Root, Value>(lhs: KeyPath<Root.Context, Value>, rhs: Value) -> IF<Root>.Condition where Root: ContextualTemplate, Value: Comparable {
//    return IF.Condition(condition: InvertCondition(condition: LessThen(path: lhs, value: rhs)))
//}
//
///// Creates a `GreaterThen` condition
/////
///// - Parameters:
/////   - lhs: The key path
/////   - rhs: The constant value
///// - Returns: A `TemplateIF.Condition` object
//public func <= <Root, Value>(lhs: KeyPath<Root.Context, Value>, rhs: Value) -> IF<Root>.Condition where Root: ContextualTemplate, Value: Comparable {
//    return IF.Condition(condition: InvertCondition(condition: GreaterThen(path: lhs, value: rhs)))
//}
//
///// Creates a `GreaterThen` condition
/////
///// - Parameters:
/////   - lhs: The key path
/////   - rhs: The constant value
///// - Returns: A `TemplateIF.Condition` object
//public func >= <Root, Value>(lhs: KeyPath<Root.Context, Value?>, rhs: Value) -> IF<Root>.Condition where Root: ContextualTemplate, Value: Comparable {
//    return IF.Condition(condition: InvertCondition(condition: NullableLessThen(path: lhs, value: rhs)))
//}
//
///// Creates a `GreaterThen` condition
/////
///// - Parameters:
/////   - lhs: The key path
/////   - rhs: The constant value
///// - Returns: A `TemplateIF.Condition` object
//public func <= <Root, Value>(lhs: KeyPath<Root.Context, Value?>, rhs: Value) -> IF<Root>.Condition where Root: ContextualTemplate, Value: Comparable {
//    return IF.Condition(condition: InvertCondition(condition: NullableGreaterThen(path: lhs, value: rhs)))
//}
//
///// Creates a `AndCondition` condition
/////
///// - Parameters:
/////   - lhs: The key path
/////   - rhs: The constant value
///// - Returns: A `TemplateIF.Condition` object
//public func && <Root>(lhs: IF<Root>.Condition, rhs: IF<Root>.Condition) -> IF<Root>.Condition where Root: ContextualTemplate {
//    return IF<Root>.Condition(condition: AndCondition(first: lhs, second: rhs))
//}
//
///// Creates a `AndCondition` condition
/////
///// - Parameters:
/////   - lhs: The key path
/////   - rhs: The constant value
///// - Returns: A `TemplateIF.Condition` object
//public func && <Root>(lhs: KeyPath<Root.Context, Bool>, rhs: IF<Root>.Condition) -> IF<Root>.Condition where Root: ContextualTemplate {
//    let lhsCondition = BoolCondition<Root>(path: lhs)
//    return IF<Root>.Condition(condition: AndCondition(first: lhsCondition, second: rhs))
//}
//
///// Creates a `AndCondition` condition
/////
///// - Parameters:
/////   - lhs: The key path
/////   - rhs: The constant value
///// - Returns: A `TemplateIF.Condition` object
//public func && <Root>(lhs: IF<Root>.Condition, rhs: KeyPath<Root.Context, Bool>) -> IF<Root>.Condition where Root: ContextualTemplate {
//    let rhsCondition = BoolCondition<Root>(path: rhs)
//    return IF<Root>.Condition(condition: AndCondition(first: lhs, second: rhsCondition))
//}
//
///// Creates a `AndCondition` condition
/////
///// - Parameters:
/////   - lhs: The key path
/////   - rhs: The constant value
///// - Returns: A `TemplateIF.Condition` object
//public func && <Root>(lhs: KeyPath<Root.Context, Bool>, rhs: KeyPath<Root.Context, Bool>) -> IF<Root>.Condition where Root: ContextualTemplate {
//    let lhsCondition = BoolCondition<Root>(path: lhs)
//    let rhsCondition = BoolCondition<Root>(path: rhs)
//    return IF<Root>.Condition(condition: AndCondition(first: lhsCondition, second: rhsCondition))
//}
//
///// Creates a `OrCondition` condition
/////
///// - Parameters:
/////   - lhs: The key path
/////   - rhs: The constant value
///// - Returns: A `TemplateIF.Condition` object
//public func || <Root>(lhs: IF<Root>.Condition, rhs: IF<Root>.Condition) -> IF<Root>.Condition where Root: ContextualTemplate {
//    return IF<Root>.Condition(condition: OrCondition(first: lhs, second: rhs))
//}
//
///// Creates a `AndCondition` condition
/////
///// - Parameters:
/////   - lhs: The key path
/////   - rhs: The constant value
///// - Returns: A `TemplateIF.Condition` object
//public func || <Root>(lhs: KeyPath<Root.Context, Bool>, rhs: IF<Root>.Condition) -> IF<Root>.Condition where Root: ContextualTemplate {
//    let lhsCondition = BoolCondition<Root>(path: lhs)
//    return IF<Root>.Condition(condition: AndCondition(first: lhsCondition, second: rhs))
//}
//
///// Creates a `AndCondition` condition
/////
///// - Parameters:
/////   - lhs: The key path
/////   - rhs: The constant value
///// - Returns: A `TemplateIF.Condition` object
//public func || <Root>(lhs: IF<Root>.Condition, rhs: KeyPath<Root.Context, Bool>) -> IF<Root>.Condition where Root: ContextualTemplate {
//    let rhsCondition = BoolCondition<Root>(path: rhs)
//    return IF<Root>.Condition(condition: AndCondition(first: lhs, second: rhsCondition))
//}
//
///// Creates a `AndCondition` condition
/////
///// - Parameters:
/////   - lhs: The key path
/////   - rhs: The constant value
///// - Returns: A `TemplateIF.Condition` object
//public func || <Root>(lhs: KeyPath<Root.Context, Bool>, rhs: KeyPath<Root.Context, Bool>) -> IF<Root>.Condition where Root: ContextualTemplate {
//    let lhsCondition = BoolCondition<Root>(path: lhs)
//    let rhsCondition = BoolCondition<Root>(path: rhs)
//    return IF<Root>.Condition(condition: AndCondition(first: lhsCondition, second: rhsCondition))
//}
