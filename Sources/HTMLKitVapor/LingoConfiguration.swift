/*
 Abstract:
 The file contains the configuration for Lingo.
 */

import Foundation
import Lingo

/// The localization
public class LingoConfiguration {
    
    /// A enumeration of possible locale identifier
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
    
    /// The root path
    internal var defaultDirectory: String
    
    /// The locale indentifier
    internal var defaultLocale: String
    
    internal var lingo: Lingo? {
        return try? Lingo(rootPath: defaultDirectory, defaultLocale: defaultLocale)
    }
    
    /// Creates a configuration
    internal init() {
        
        self.defaultDirectory = "Resources/Localization"
        self.defaultLocale = "en"
    }
    
    /// Sets the root path
    public func set(directory: URL) {
        self.defaultDirectory = directory.path
    }
    
    /// Sets the default locale indentifier
    public func set(locale: Locale) {
        self.defaultLocale = locale.rawValue
    }
}
