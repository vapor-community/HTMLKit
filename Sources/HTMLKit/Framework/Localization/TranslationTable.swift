import Foundation

/// A type that represents a translation table
@_documentation(visibility: internal)
public class TranslationTable {
    
    /// The name of the table
    public let name: String
    
    /// The translations in the table
    private var translations: [String: String]
    
    /// Initiates a translation table
    public init(name: String, translations: [String: String]) {
        
        self.name = name
        self.translations = translations
    }
    
    /// Retrieves a translation
    public func retrieve(for key: String) -> String? {
        
        if let translation = self.translations[key] {
            return translation
        }
        
        return nil
    }
    
    /// Adds und updates a translation
    public func upsert(_ translation: String, for key: String) {
        self.translations[key] = translation
    }
}
