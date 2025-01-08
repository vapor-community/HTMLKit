/// A type representing the logical relation between two conditionals
@_documentation(visibility: internal)
public struct Relation {
    
    /// A enumeration of potential logical terms
    public enum Term {
    
        /// Indicates a conjunction
        ///
        /// All conditions must be true for the relation to be true
        case conjunction
        
        /// Indicates a disjunction
        ///
        /// One condition must be at least true for the relation to be true
        case disjunction
    }
    
    /// The logical term specifying the relation
    internal let term: Term
    
    /// The left-hand side conditional
    internal let lhs: Conditional
    
    /// The right-hand side conditional
    internal let rhs: Conditional
    
    /// Initializes a relation
    ///
    /// - Parameters:
    ///   - term: The term on which the relation acts on
    ///   - lhs: The left-hand side conditional
    ///   - rhs: The right-hand side conditional to test against
    public init(term: Term, lhs: Conditional, rhs: Conditional) {
        
        self.term = term
        self.lhs = lhs
        self.rhs = rhs
    }
}

/// Creates a conjunctional relation between two conditionals
///
/// ```swift
/// Environment.when(value > 0 && value) {
/// }
/// ```
///
/// - Parameters:
///   - lhs: The left-hand side conditional
///   - rhs: An environment value
///
/// - Returns: A conjunctional relation
public func && (lhs: Conditional, rhs: EnvironmentValue) -> Conditional {
    return .relation(Relation(term: .conjunction, lhs: lhs, rhs: .value(rhs)))
}

/// Creates a conjunctional relation between two conditionals
///
/// ```swift
/// Environment.when(value && value > 0) {
/// }
/// ```
///
/// - Parameters:
///   - lhs: The left-hand side conditional
///   - rhs: An environment value
///
/// - Returns: A conjunctional relation
public func && (lhs: EnvironmentValue, rhs: Conditional) -> Conditional {
    return .relation(Relation(term: .conjunction, lhs: .value(lhs), rhs: rhs))
}


/// Creates a conjunctional relation between two conditionals
///
/// ```swift
/// Environment.when(value > 0 && value < 2) {
/// }
/// ```
///
/// - Parameters:
///   - lhs: The left-hand side conditional
///   - rhs: The right-hand side conditional
///
/// - Returns: A conjunctional relation
public func && (lhs: Conditional, rhs: Conditional) -> Conditional {
    return .relation(Relation(term: .conjunction, lhs: lhs, rhs: rhs))
}

/// Creates a disjunctional relation between two conditionals
///
/// ```swift
/// Environment.when(value > 0 || value) {
/// }
/// ```
///
/// - Parameters:
///   - lhs: The left-hand side conditional
///   - rhs: The right-hand side conditional
///
/// - Returns: A disjunctional relation
public func || (lhs: Conditional, rhs: EnvironmentValue) -> Conditional {
    return .relation(Relation(term: .disjunction, lhs: lhs, rhs: .value(rhs)))
}

/// Creates a disjunctional relation between two conditionals
///
/// ```swift
/// Environment.when(value || value > 0) {
/// }
/// ```
///
/// - Parameters:
///   - lhs: The left-hand side conditional
///   - rhs: The right-hand side conditional
///
/// - Returns: A disjunctional relation
public func || (lhs: EnvironmentValue, rhs: Conditional) -> Conditional {
    return .relation(Relation(term: .disjunction, lhs: .value(lhs), rhs: rhs))
}

/// Creates a disjunctional relation between two conditionals
///
/// ```swift
/// Environment.when(value > 0 || value < 2) {
/// }
/// ```
///
/// - Parameters:
///   - lhs: The left-hand side conditional
///   - rhs: The right-hand side conditional
///
/// - Returns: A disjunctional relation
public func || (lhs: Conditional, rhs: Conditional) -> Conditional {
    return .relation(Relation(term: .disjunction, lhs: lhs, rhs: rhs))
}

