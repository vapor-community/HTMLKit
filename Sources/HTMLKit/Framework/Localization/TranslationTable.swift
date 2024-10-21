/// A type that represents a translation table
///
/// A translation table stores multiple localized strings, mapping unique string keys to their corresponding translations
internal struct TranslationTable {
    
    /// The name of the table
    internal let name: String
    
    /// The translations in the table
    private let translations: [String: String]
    
    /// Initializes a translation table
    ///
    /// - Parameters:
    ///   - name: The name of the translation table
    ///   - translations: The translations
    internal init(name: String, translations: [String: String]) {
        
        self.name = name
        self.translations = translations
    }
    
    /// Retrieves the translation for the specified key
    ///
    /// - Parameter key: The string key
    /// 
    /// - Returns: The translation
    internal func retrieve(for key: String) -> String? {
        return translations[key]
    }
}
