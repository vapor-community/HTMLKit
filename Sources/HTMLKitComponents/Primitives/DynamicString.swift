import HTMLKit

/// An enum that represents a dynamic string.
internal enum DynamicString {
    
    /// Holds a key for the localized string.
    case localized(LocalizedStringKey, String?)
    
    /// Holds the pristine string.
    case literal(String)
    
    /// Holds an environment value, which gets evaluted later.
    case deferred(EnvironmentValue)
}
