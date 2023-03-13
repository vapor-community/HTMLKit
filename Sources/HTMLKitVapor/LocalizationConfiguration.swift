/*
 Abstract:
 The file contains the configuration for the localization.
 */

import Foundation
import HTMLKit

/// The localization
public class LocalizationConfiguration {
    
    /// The  path of the source directory
    internal var defaultDirectory: URL?
    
    /// The default locale indentifier
    internal var defaultLocale: HTMLKit.Locale?
    
    internal var localization: Localization? {
        
        if let defaultDirectory,  let defaultLocale {
            return Localization(source: defaultDirectory, locale: defaultLocale)
        }
        
        return nil
    }
    
    /// Creates a configuration
    public init() {
    }
    
    /// Sets the root path
    public func set(source: URL) {
        self.defaultDirectory = source
    }
    
    /// Sets the default locale indentifier
    public func set(locale: String) {
        self.defaultLocale = Locale(tag: locale)
    }
}
