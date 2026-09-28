/// A type that represents a string catalog.
internal struct StringCatalog: Codable {
    
    internal enum CodingKeys: String, CodingKey {
         
        case entries = "strings"
    }
    
    /// The entries within the catalog.
    internal let entries: [String: StringCatalog.Entry]
}

extension StringCatalog {
    
    /// A type that represents a catalog entry.
    internal struct Entry: Codable {
        
        /// The associated values.
        internal let localizations: [String: StringCatalog.Localization]
        
        /// The associated comment.
        internal let comment: String?
    }
    
    /// A type that represents a entry value.
    internal struct Localization: Codable {
        
        internal enum CodingKeys: String, CodingKey {
             
            case unit = "stringUnit"
        }
        
        internal let unit: StringCatalog.Unit?
    }
    
    /// A type that represents a value representation.
    internal struct Unit: Codable {
        
        internal let value: String
    }
}

