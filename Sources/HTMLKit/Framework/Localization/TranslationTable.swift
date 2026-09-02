/// A type that represents a translation table
///
/// A translation table stores multiple localized strings, mapping unique string keys to their corresponding translations
internal struct TranslationTable: Sendable {
    
    /// The name of the table
    internal let name: String
    
    /// The translations in the table
    private var translations: [String: String]
    
    /// Initializes a translation table
    ///
    /// - Parameters:
    ///   - name: The name of the translation table
    ///   - translations: The translations
    internal init(name: String, translations: [String: String]) {
        
        self.name = name
        self.translations = translations
    }
    
    /// Retrieves the translation for the given key.
    ///
    /// - Parameter key: The string key to look up.
    /// 
    /// - Returns: The translation
    internal func retrieve(for key: String) -> String? {
        return translations[key]
    }
    
    /// Inserts or updates a value in the table for the given key
    ///
    /// - Parameters:
    ///   - value: The value to be stored or updated.
    ///   - key: The key to store at.
    internal mutating func upsert(_ value: String, for key: String) {
        return translations[key] = value
    }
}
