import HTMLKit

/// An enum that represents a dynamic source.
internal enum DynamicSource {

    /// Holds an environment value, which gets evaluted later.
    case deferred(EnvironmentValue)
    
    /// Holds the pristine string.
    case literal(String)
}
