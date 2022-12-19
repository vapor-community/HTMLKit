/*
 Abstract:
 The file contains the localized.
 */

/// The struct thats contains the information for the localization
public struct LocalizedStringKey<T: Encodable>: LocalizeContent {

    public let key: String
    
    public let variable: Property<T>?
    
    /// Initiates a localized string key with a context
    public init(key: String, context: Property<T>) {
        
        self.key = key
        self.variable = context
    }
}

extension LocalizedStringKey where T == Empty {
    
    /// Initiates a localized string key
    public init(key: String) {
        
        self.key = key
        self.variable = nil
    }
}
