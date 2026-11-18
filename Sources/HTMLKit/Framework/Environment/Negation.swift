/// A type that represents an invert conditional.
@_documentation(visibility: internal)
public struct Negation {
    
    /// The left-hand side conditional.
    internal let value: EnvironmentValue
    
    /// Creates a negation.
    ///
    /// - Parameter value: The value to evaluate.
    internal init(value: EnvironmentValue) {
        
        self.value = value
    }
}

/// Creates an invert conditional.
///
/// ```swift
/// Environment.when(!value) {
/// }
/// ```
///
/// - Parameters:
///   - lhs: The left-hand side conditional.
///
/// - Returns: An invert conditional.
public prefix func ! (value: EnvironmentValue) -> Conditional {
    return .negation(Negation(value: value))
}
