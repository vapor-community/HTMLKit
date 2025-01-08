/// A type that defines a conditonal value which will be evualuated by the renderer.
@_documentation(visibility: internal)
public indirect enum Conditional {
    
    /// Holds an relation
    case relation(Relation)
    
    /// Holds a condition
    case condition(Condition)
    
    /// Holds a negation
    case negation(Negation)
    
    /// Holds a value
    case value(EnvironmentValue)
}
