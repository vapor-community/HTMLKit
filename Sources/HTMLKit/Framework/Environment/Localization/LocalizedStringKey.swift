/*
 Abstract:
 The file contains the localized.
 */

/// The struct thats contains the information for the localization
public struct LocalizedStringKey<T: Encodable>: LocalizedContent {

    public let key: String
    
    public let context: TemplateValue<T>?
    
    /// Initiates a localized string key with a context
    public init(key: String, context: TemplateValue<T>) {
        
        self.key = key
        self.context = context
    }
}

extension LocalizedStringKey where T == Empty {
    
    /// Initiates a localized string key
    public init(key: String) {
        
        self.key = key
        self.context = nil
    }
}
