/// A type that represents a set of plural categories.
public enum PluralCategory: String, Sendable {
 
    /// Indicates the empty form.
    case zero
    
    /// Indicates the singular form.
    case one
    
    /// Indicates the dual form.
    case two
    
    /// Indicates the paucal form.
    case few
    
    /// Indicates the plural form.
    case many
    
    /// Indicates the default form.
    case other
}
