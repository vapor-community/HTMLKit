import Foundation

/// A type that represents the localization
@_documentation(visibility: internal)
public class Localization {
    
    /// A enumeration of errors regarding the localization rendering
    public enum Errors: Error, Equatable {
        
        /// Indicates a missing key
        ///
        /// A key is considered as missing if it cannot be found in the translation table.
        case missingKey(String, String)
        
        /// Indicates a missing table
        ///
        /// A table is considered as missing if there is no translation table for the given locale.
        case missingTable(String)
        
        /// Indicates missing tables
        case missingTables
        
        /// Indicates a unknown table
        ///
        /// A table is considered as unknown if it cannot be found by the given table name.
        case unknownTable(String, String)
        
        /// Indicates there is no fallback configuration set up.
        case noFallback
        
        /// Indicates a loading failure
        case loadingDataFailed
        
        /// Returns a description about the failure reason
        public var description: String {
            
            switch self {
            case .missingKey(let key, let tag):
                return "Unable to find translation key '\(key)' for the locale '\(tag)'."
                
            case .missingTable(let tag):
                return "Unable to find a translation table for the locale '\(tag)'."
                
            case .missingTables:
                return "Unable to find any translation tables."
                
            case .unknownTable(let table, let tag):
                return "Unable to find translation table '\(table)' for the locale '\(tag)'."
                
            case .noFallback:
                return "The fallback needs to be set up first."
                
            case .loadingDataFailed:
                return "Unable to load data."
            }
        }
    }
    
    /// The translations tables
    internal var tables: [Locale: [TranslationTable]]?
    
    /// The default locale
    ///
    /// This locale will be used as the primary locale for translations and as the fallback locale when a translation
    /// is unavailable in other locales.
    internal var locale: Locale?
    
    /// Initializes a localization
    public init() {}
    
    /// Sets the source directory
    ///
    /// - Parameter source: The directory where the translations should be loaded from.
    public func set(source: URL) {
        self.tables = load(source: source)
    }
    
    /// Sets the default locale
    ///
    /// - Parameter locale: A locale tag e.g. en-US
    public func set(locale: String) {
        self.locale = Locale(tag: locale)
    }
    
    /// Initializes a localization
    ///
    /// - Parameters:
    ///   - source: The directory where the translations should be loaded from.
    ///   - locale: The default locale
    public init(source: URL, locale: Locale) {
        
        self.locale = locale
        self.tables = load(source: source)
    }
    
    /// Loads the translation tables from a given directory
    ///
    /// - Parameter source: The directory where the translation tables are located.
    ///
    /// - Returns: The translation tables mapped to their locale
    private func load(source: URL) -> [Locale: [TranslationTable]] {
        
        var localizationTables = [Locale: [TranslationTable]]()
        
        if let enumerator = FileManager.default.enumerator(at: source, includingPropertiesForKeys: nil) {
            
            for case let path as URL in enumerator {
                
                if !path.hasDirectoryPath {
                    
                    if !path.isFileURL {
                        enumerator.skipDescendants()
                        
                    } else {
                        
                        let locale = Locale(tag: path.deletingPathExtension().deletingLastPathComponent().lastPathComponent)
                        
                        if var translationTables = localizationTables[locale] {
                            
                            if let data = try? Foundation.Data(contentsOf: path) {
                                
                                if let translations = try? PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil) as? [String: String] {
                                    translationTables.append(TranslationTable(name: path.deletingPathExtension().lastPathComponent, translations: translations))
                                }
                                
                                localizationTables[locale] = translationTables
                            }
                        }
                    }
                    
                } else {
                    localizationTables[Locale(tag: path.lastPathComponent)] = [TranslationTable]()
                }
            }
        }
        
        return localizationTables
    }
    
    /// Apply interpolation values to the translation for the given locale
    ///
    /// - Parameters:
    ///   - arguments: An array of values used to replace placeholders within the translation string
    ///   - translation: The translation string
    ///   - locale: The locale
    private func interpolate(arguments: [Any], to translation: inout String, for locale: Locale) {
        
        for argument in arguments {

            switch argument {
            case let stringValue as String:
                
                if let range = translation.range(of: "%st") {
                    translation = translation.replacingCharacters(in: range, with: stringValue)
                }
                
            case let dateValue as Date:
                
                let formatter = DateFormatter()
                formatter.dateFormat = locale.dateFormat
                
                if let range = translation.range(of: "%dt") {
                    translation = translation.replacingCharacters(in: range, with: formatter.string(from: dateValue))
                }
                
            case let doubleValue as Double:
                
                if let range = translation.range(of: "%do") {
                    translation = translation.replacingCharacters(in: range, with: String(doubleValue))
                }
                
            case let intValue as Int:
                
                if let range = translation.range(of: "%in") {
                    translation = translation.replacingCharacters(in: range, with: String(intValue))
                }
                
            default:
                break
            }
        }
    }
    
    /// Retrieves the translation for a specified key
    ///
    /// - Parameters:
    ///   - key: The string key to be translated
    ///   - locale: The locale to use when retrieving the translation
    ///
    /// - Returns: The translation
    public func localize(key: LocalizedStringKey, for locale: Locale? = nil) throws -> String {
        
        guard let fallback = self.locale else {
            throw Errors.noFallback
        }
        
        guard let localizationTables = self.tables else {
            throw Errors.missingTables
        }
    
        let currentLocale = locale ?? fallback
        
        guard let translationTables = localizationTables[currentLocale] else {
            throw Errors.missingTable(currentLocale.tag)
        }
        
        if let table = key.table {
            
            guard let translationTable = translationTables.first(where: { $0.name == table }) else {
                throw Errors.unknownTable(table, currentLocale.tag)
            }
            
            guard var translation = translationTable.retrieve(for: key.key) else {
                throw Errors.missingKey(key.key, currentLocale.tag)
            }
        
            if let interpolation = key.interpolation {
                interpolate(arguments: interpolation, to: &translation, for: currentLocale)
            }
            
            return translation
            
        }
        
        for translationTable in translationTables {
            
            if var translation = translationTable.retrieve(for: key.key) {
                
                if let interpolation = key.interpolation {
                    interpolate(arguments: interpolation, to: &translation, for: currentLocale)
                }
                
                return translation
            }
        }
        
        throw Errors.missingKey(key.key, currentLocale.tag)
    }
}

