import Foundation

/// A type that represents a translation table
public class TranslationTable {
    
    /// The name of the table
    public let name: String
    
    /// The translations strings
    private var translations: [String: String]
    
    /// Initiates a translation table
    public init(name: String, translations: [String: String]) {
        
        self.name = name
        self.translations = translations
    }
    
    /// Retrieves a translation string
    public func retrieve(for key: String) -> String? {
        
        if let value = self.translations[key] {
            return value
        }
        
        return nil
    }
    
    /// Adds und updates an translation string
    public func upsert(_ value: String, for key: String) {
        self.translations[key] = value
    }
}
