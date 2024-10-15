import Foundation

/// A type that represents a translation table
///
/// A translation table stores multiple localized strings, mapping unique string keys to their corresponding translations
@_documentation(visibility: internal)
public class TranslationTable {
    
    /// The name of the table
    public let name: String
    
    /// The translations in the table
    private var translations: [String: String]
    
    /// Initialize a translation table
    ///
    /// - Parameters:
    ///   - name: The name of the translation table
    ///   - translations: The translations
    public init(name: String, translations: [String: String]) {
        
        self.name = name
        self.translations = translations
    }
    
    /// Retrieves the translation for the specified key
    ///
    /// - Parameter key: The string key
    ///
    /// - Returns: The translation
    public func retrieve(for key: String) -> String? {
        
        if let translation = self.translations[key] {
            return translation
        }
        
        return nil
    }
    
    /// Adds or updates a translation to the translation table
    ///
    /// - Parameters:
    ///   - translation: The translation
    ///   - key: The string key to which the translation should be associated
    public func upsert(_ translation: String, for key: String) {
        self.translations[key] = translation
    }
}
