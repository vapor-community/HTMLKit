/// A condition that evaluates an equal expression between a variable and a constant value
///
///
public struct Equal<Value>: Conditionable where Value: Equatable {

    let path: TemplateValue<Value>

    let value: TemplateValue<Value>

    public func evaluate<T>(with manager: Renderer.ContextManager<T>) throws -> Bool {
        try path.value(from: manager) == value.value(from: manager)
    }
}

/// A condition that evaluates an not equal expression between a variable and a constant value
///
///
public struct NotEqual<Value>: Conditionable where Value: Equatable {

    let path: TemplateValue<Value>

    let value: Value

    public func evaluate<T>(with manager: Renderer.ContextManager<T>) throws -> Bool {
        try path.value(from: manager) != value
    }
}

/// A condition that evaluates a less then expression between a variable and a constant value
///
///
public struct LessThen<Value>: Conditionable where Value: Comparable {

    let path: TemplateValue<Value>

    let value: Value

    public func evaluate<T>(with manager: Renderer.ContextManager<T>) throws -> Bool {
        try path.value(from: manager) < value
    }
}

/// A condition that evaluates a greater then expression between a variable and a constant value
///
///
public struct GreaterThen<Value>: Conditionable where Value: Comparable {

    let path: TemplateValue<Value>

    let value: Value

    public func evaluate<T>(with manager: Renderer.ContextManager<T>) throws -> Bool {
        try path.value(from: manager) > value
    }
}

/// A condition that evaluates a greater then expression between a variable and a constant value
///
///
public struct Between<Value>: Conditionable where Value: Comparable {

    /// The path to the variable
    let path: TemplateValue<Value>

    /// The value to be compared with
    let upperBound: Value

    let lowerBound: Value

    public func evaluate<T>(with manager: Renderer.ContextManager<T>) throws -> Bool {
        try lowerBound...upperBound ~= path.value(from: manager)
    }
}

/// A condition that is allways true
/// Used as the `else` condition
///
struct AlwaysTrueCondition: Conditionable {
    func evaluate<T>(with manager: Renderer.ContextManager<T>) throws -> Bool {
        return true
    }
}

/// A condition that is allways true
/// Used as the `else` condition
///
struct InvertCondition: Conditionable {

    let condition: Conditionable

    func evaluate<T>(with manager: Renderer.ContextManager<T>) throws -> Bool {
        return try !condition.evaluate(with: manager)
    }
}

/// The struct is for
///
///
struct BoolCondition<Root>: Conditionable {

    let path: TemplateValue<Bool>

    func evaluate<T>(with manager: Renderer.ContextManager<T>) throws -> Bool {
        try path.value(from: manager)
    }
}

/// The struct is for
///
///
public struct NullableEqual<Value>: Conditionable where Value: Equatable {

    let path: TemplateValue<Value?>

    let value: Value

    public func evaluate<T>(with manager: Renderer.ContextManager<T>) throws -> Bool {
        try path.value(from: manager) == value
    }
}

/// A condition that evaluates an not equal expression between a variable and a constant value
///
///
public struct NullableNotEqual<Value>: Conditionable where Value: Equatable {

    let path: TemplateValue<Value?>

    let value: Value

    public func evaluate<T>(with manager: Renderer.ContextManager<T>) throws -> Bool {
        try path.value(from: manager) != value
    }
}

/// A condition that evaluates a less then expression between a variable and a constant value
///
///
public struct NullableLessThen<Value>: Conditionable where Value: Comparable {

    let path: TemplateValue<Value?>

    let value: Value

    public func evaluate<T>(with manager: Renderer.ContextManager<T>) throws -> Bool {
        if let pathValue = try path.value(from: manager) {
            return pathValue < value
        } else {
            return false
        }
    }
}

/// A condition that evaluates a greater then expression between a variable and a constant value
///
///
public struct NullableGreaterThen<Value>: Conditionable where Value: Comparable {

    let path: TemplateValue<Value?>

    let value: Value

    public func evaluate<T>(with manager: Renderer.ContextManager<T>) throws -> Bool {
        if let pathValue = try path.value(from: manager) {
            return pathValue > value
        } else {
            return false
        }
    }
}

/// The struct is for
///
///
public struct AndCondition: Conditionable {

    let first: Conditionable

    let second: Conditionable

    public func evaluate<T>(with manager: Renderer.ContextManager<T>) throws -> Bool {
        return try first.evaluate(with: manager) && second.evaluate(with: manager)
    }
}

/// The struct is for
///
///
public struct OrCondition: Conditionable {

    let first: Conditionable

    let second: Conditionable

    public func evaluate<T>(with manager: Renderer.ContextManager<T>) throws -> Bool {
        return try first.evaluate(with: manager) || second.evaluate(with: manager)
    }
}

/// A condition that evaluates a greater then expression between a variable and a constant value
///
///
public struct NotNullCondition<Value>: Conditionable {

    let path: TemplateValue<Value?>

    public func evaluate<T>(with manager: Renderer.ContextManager<T>) throws -> Bool {
        try path.value(from: manager) != nil
    }
}

/// A condition that evaluates a greater then expression between a variable and a constant value
///
///
public struct NotNullConditionGeneral<Value>: Conditionable {

    let path: TemplateValue<Value>

    public func evaluate<T>(with manager: Renderer.ContextManager<T>) throws -> Bool {
        if let value = try path.value(from: manager) as? Defineable {
            return value.isDefinded
        } else {
            return true
        }
    }
}

/// A condition that evaluates a greater then expression between a variable and a constant value
///
///
public struct IsNullConditionGeneral<Value>: Conditionable {

    let path: TemplateValue<Value>

    public func evaluate<T>(with manager: Renderer.ContextManager<T>) throws -> Bool {
        if let value = try path.value(from: manager) as? Defineable {
            return value.isDefinded == false
        } else {
            return false
        }
    }
}

/// The struct is for
///
///
public struct InCollectionCondition<Value>: Conditionable where Value: Equatable {

    let valuePath: TemplateValue<Value>
    let arrayPath: TemplateValue<[Value]>

    public init(value: TemplateValue<Value>, array: TemplateValue<[Value]>) {
        self.valuePath = value
        self.arrayPath = array
    }

    public func evaluate<T>(with manager: Renderer.ContextManager<T>) throws -> Bool {
        let value = try valuePath.value(from: manager)
        let array = try arrayPath.value(from: manager)
        return array.contains(where: { $0 == value })
    }
}

/// The struct is for
///
///
public struct InCollectionConditionOptional<Value>: Conditionable where Value: Equatable {

    let valuePath: TemplateValue<Value?>
    let arrayPath: TemplateValue<[Value]>

    public init(value: TemplateValue<Value?>, array: TemplateValue<[Value]>) {
        self.valuePath = value
        self.arrayPath = array
    }

    public func evaluate<T>(with manager: Renderer.ContextManager<T>) throws -> Bool {
        guard let value = try valuePath.value(from: manager) else {
            return false
        }
        let array = try arrayPath.value(from: manager)
        return array.contains(where: { $0 == value })
    }
}

/// A condition that evaluates a greater then expression between a variable and a constant value
///
///
public struct IsNullCondition<Value>: Conditionable {

    let path: TemplateValue<Value?>

    public func evaluate<T>(with manager: Renderer.ContextManager<T>) throws -> Bool {
        try path.value(from: manager) == nil
    }
}

extension TemplateValue: Conditionable where Value == Bool {
    public func evaluate<T>(with manager: Renderer.ContextManager<T>) throws -> Bool {
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
public func == <Value>(lhs: TemplateValue<Value>, rhs: Value) -> Conditionable where Value: Equatable {
    return Equal(path: lhs, value: TemplateValue<Value>.constant(rhs))
}

/// Creates a `Equal` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `TemplateConditionable` object
public func == <Value>(lhs: TemplateValue<Value>, rhs: TemplateValue<Value>) -> Conditionable where Value: Equatable {
    return Equal(path: lhs, value: rhs)
}

/// Creates a `Equal` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `TemplateConditionable` object
public func != <Value>(lhs: TemplateValue<Value>, rhs: Value) -> Conditionable where Value: Equatable {
    return NotEqual(path: lhs, value: rhs)
}

/// Creates a `LessThen` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `TemplateConditionable` object
public func < <Value>(lhs: TemplateValue<Value>, rhs: Value) -> Conditionable where Value: Comparable {
    return LessThen(path: lhs, value: rhs)
}

/// Creates a `GreaterThen` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `TemplateConditionable` object
public func > <Value>(lhs: TemplateValue<Value>, rhs: Value) -> Conditionable where Value: Comparable {
    return GreaterThen(path: lhs, value: rhs)
}

public func ~= <Value>(lhs: Range<Value>, rhs: TemplateValue<Value>) -> Conditionable where Value: Comparable {
    return Between(path: rhs, upperBound: lhs.upperBound, lowerBound: lhs.lowerBound)
}

public func ~= <Value>(lhs: ClosedRange<Value>, rhs: TemplateValue<Value>) -> Conditionable where Value: Comparable {
    return Between(path: rhs, upperBound: lhs.upperBound, lowerBound: lhs.lowerBound)
}

public func ~= <Value>(lhs: TemplateValue<Value>, rhs: Range<Value>) -> Conditionable where Value: Comparable {
    return Between(path: lhs, upperBound: rhs.upperBound, lowerBound: rhs.lowerBound)
}

public func ~= <Value>(lhs: TemplateValue<Value>, rhs: ClosedRange<Value>) -> Conditionable where Value: Comparable {
    return Between(path: lhs, upperBound: rhs.upperBound, lowerBound: rhs.lowerBound)
}

/// Creates a `Equal` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `TemplateConditionable` object
public func == <Value>(lhs: TemplateValue<Value?>, rhs: Value) -> Conditionable where Value: Equatable {
    return NullableEqual(path: lhs, value: rhs)
}

/// Creates a `Equal` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `TemplateConditionable` object
public func != <Value>(lhs: TemplateValue<Value?>, rhs: Value) -> Conditionable where Value: Equatable {
    return NullableNotEqual(path: lhs, value: rhs)
}

/// Creates a `LessThen` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `TemplateConditionable` object
public func < <Value>(lhs: TemplateValue<Value?>, rhs: Value) -> Conditionable where Value: Comparable {
    return NullableLessThen(path: lhs, value: rhs)
}

/// Creates a `GreaterThen` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `TemplateConditionable` object
public func > <Value>(lhs: TemplateValue<Value?>, rhs: Value) -> Conditionable where Value: Comparable {
    return NullableGreaterThen(path: lhs, value: rhs)
}

/// Creates a `GreaterThen` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `TemplateConditionable` object
public func >= <Value>(lhs: TemplateValue<Value>, rhs: Value) -> Conditionable where Value: Comparable {
    return InvertCondition(condition: LessThen(path: lhs, value: rhs))
}

/// Creates a `GreaterThen` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `TemplateConditionable` object
public func <= <Value>(lhs: TemplateValue<Value>, rhs: Value) -> Conditionable where Value: Comparable {
    return InvertCondition(condition: GreaterThen(path: lhs, value: rhs))
}

/// Creates a `GreaterThen` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `TemplateConditionable` object
public func >= <Value>(lhs: TemplateValue<Value?>, rhs: Value) -> Conditionable where Value: Comparable {
    return InvertCondition(condition: NullableLessThen(path: lhs, value: rhs))
}

/// Creates a `GreaterThen` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `TemplateConditionable` object
public func <= <Value>(lhs: TemplateValue<Value?>, rhs: Value) -> Conditionable where Value: Comparable {
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

/// Creates a `InvertCondition` condition
///
/// - Parameters:
///   - lhs: The key path
///   - rhs: The constant value
/// - Returns: A `TemplateConditionable` object
public prefix func ! (condition: Conditionable) -> Conditionable {
    return InvertCondition(condition: condition)
}
