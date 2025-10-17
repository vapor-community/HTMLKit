import HTMLKit

/// An enum that represents a dynamic source type.
public enum DynamicType {

    /// Holds a environment value
    case value(EnvironmentValue)
    
    /// Holds a string
    case string(String)
}

/// An enum that represents a dynamic prompt type.
internal enum PromptType {
    
    /// Holds a key for the localized string.
    case value(LocalizedStringKey)
    
    /// Holds a string.
    case string(String)
}
