/// A type that represents a locale
public struct Locale: Hashable {
    
    /// A enumeration of possible tags
    public enum Tag: String {
        
        case arabic = "ar"
        case english = "en"
        case french = "fr"
        case german = "de"
        case hindi = "es"
        case bengali = "bn"
        case russian = "ru"
        case portuguese = "pt"
        case indonesian = "id"
    }
    
    /// The language code
    public var language: String? {
        return tag.components(separatedBy: "-").first
    }
    
    /// The region code
    public var region: String? {
        
        let components = tag.components(separatedBy: "-")
        
        if components.count > 1 {
            return components.last
        }
        
        return nil
    }
    
    /// The currency sign
    public var currency: String? {
        return currencyRule[tag]
    }
    
    /// The delimeter character
    public var delimiter: String? {
        return delimiterRule[tag]
    }
    
    /// The delimeter character
    public var date: String? {
        return dateRule[tag]
    }
    
    /// The locale identifier
    public let tag: String
    
    /// Initiates a locale
    public init(tag: String) {
        self.tag = tag
    }
    
    /// Initiates a locale with a predefined tag
    public init(tag: Tag) {
        self.tag = tag.rawValue
    }
}

extension Locale {
    
    var currencyRule: [String: String] {
        return ["en-GB": "£"]
    }
    
    var delimiterRule: [String: String] {
        return ["en-GB": "."]
    }
    
    var dateRule: [String: String] {
        return  ["en-GB": "MM/dd/yyyy"]
    }
}
