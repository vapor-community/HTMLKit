import Foundation

public class ViewLocalization {
    
    public enum Locale: String {
        
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
    
    internal var directory: String
    
    internal var locale: String
    
    public init() {
        
        self.directory = "Resources/Localization"
        self.locale = "en"
    }
    
    public func set(directory: URL) {
        self.directory = directory.path
    }
    
    public func set(locale: Locale) {
        self.locale = locale.rawValue
    }
}
