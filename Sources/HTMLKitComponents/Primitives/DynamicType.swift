import HTMLKit

public enum DynamicType {
    
    case value(EnvironmentValue)
    case string(String)
}

/// An enum that represents a dynamic prompt type.
internal enum PromptType {
    
    /// Holds a key for the localized string.
    case value(LocalizedStringKey)
    
    /// Holds a string.
    case string(String)
}
