

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

struct NotNullCondition<Root, Value>: Conditionable where Root: ContextualTemplate {

    /// The path to the variable
    let path: KeyPath<Root.Context, Value?>

    func evaluate(with context: Root.Context) -> Bool {
        return context[keyPath: path] != nil
    }
}
