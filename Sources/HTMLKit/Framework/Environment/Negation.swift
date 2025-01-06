/// A type thats represents an invert condition
@_documentation(visibility: internal)
public struct Negation: Conditionable {
    
    /// The left-hand side conditional
    public let lhs: Conditionable
}


/// Creates a invert condition
///
/// ```swift
/// Environment.when(!value) {
/// }
/// ```
///
/// - Parameters:
///   - lhs: The left-hand side conditional
///
/// - Returns: A invert
public prefix func ! (lhs: Conditionable) -> Negation {
    return Negation(lhs: lhs)
}
