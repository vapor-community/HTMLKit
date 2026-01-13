import HTMLKit

/// An enum that represents a dynamic source type.
internal enum DynamicType {

    /// Holds a environment value.
    case value(EnvironmentValue)
    
    /// Holds a string
    case string(String)
}
