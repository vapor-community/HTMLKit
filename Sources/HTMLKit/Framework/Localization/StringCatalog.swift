/// A type that represents a string catalog.
internal struct StringCatalog: Codable {
    
    enum CodingKeys: String, CodingKey {
         
        case entries = "strings"
    }
    
    let entries: [String: StringCatalog.Entry]
    
    internal struct Entry: Codable {
        
        let localizations: [String: StringCatalog.Localization]
    }
    
    internal struct Localization: Codable {
        
        enum CodingKeys: String, CodingKey {
             
            case unit = "stringUnit"
        }
        
        let unit: StringCatalog.Unit?
    }
    
    internal struct Unit: Codable {
        
        let value: String
    }
}

