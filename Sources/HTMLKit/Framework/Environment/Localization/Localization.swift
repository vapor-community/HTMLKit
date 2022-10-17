/*
 Abstract:
 The file contains the localization.
 */

public class Localization {
    
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
    
    internal let source: String
    
    internal let locale: Locale
    
    public init(source: String, locale: Locale) {
        
        self.source = source
        self.locale = locale
    }
}
