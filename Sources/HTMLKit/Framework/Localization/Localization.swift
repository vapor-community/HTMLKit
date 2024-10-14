import Foundation

/// A type that represents the localization
@_documentation(visibility: internal)
public class Localization {
    
    /// A enumeration of errors regarding the localization rendering
    public enum Errors: Error, Equatable {
        
        /// Indicates a missing key
        ///
        /// A key is considered as missing if it cannot be found in the translation table.
        case missingKey(String)
        
        /// Indicates a missing table
        ///
        /// A table is considered as missing if there is no translation table for the given locale.
        case missingTable(String)
        
        /// Indicates missing tables
        case missingTables
        
        /// Indicates a unknown table
        ///
        /// A table is considered as unknown if it cannot be found by the given table name.
        case unknownTable(String)
        
        /// Indicates there is no fallback configuration set up.
        case noFallback
        
        /// Indicates a loading failure
        case loadingDataFailed
        
        /// Returns a description about the failure reason
        public var description: String {
            
            switch self {
            case .missingKey(let key):
                return "Unable to find translation key '\(key)'."
                
            case .missingTable(let tag):
                return "Unable to find a translation table for the locale '\(tag)'."
                
            case .missingTables:
                return "Unable to find any localization tables."
                
            case .unknownTable(let table):
                return "Unable to find translation table '\(table)'."
                
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
    /// This locale will be used as the primary locale for translations and as the fallback locale when a translation is unavailable in other locales.
    internal var locale: Locale?
    
    /// Initialize a localization
    public init() {
    }
    
    /// Initialize a localization
    ///
    /// - Parameters:
    ///   - source: The directory where the translations should be loaded from.
    ///   - locale: The default locale
    public init(source: URL, locale: Locale) {
        
        self.locale = locale
        self.tables = load(source: source)
    }
    
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
    
    /// Loads the translation tables from a given directory
    ///
    /// - Parameter source: The directory where the translation tables are located.
    ///
    /// - Returns: The translation tables mapped to their locale
    internal func load(source: URL) -> [Locale: [TranslationTable]] {
        
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
    
    /// Retrieves the translation for a specified key
    ///
    /// - Parameters:
    ///   - key: The string key to be translated
    ///   - locale: The locale to use when retrieving the translation
    ///   - interpolation: An array of values used to replace placeholders within the translation string
    ///
    /// - Returns: The translation
    public func localize(key: String, locale: Locale? = nil, interpolation: [Any]? = nil) throws -> String {
        
        guard let fallback = self.locale else {
            throw Errors.noFallback
        }
        
        guard let localizationTables = self.tables else {
            throw Errors.missingTables
        }
        
        let currentLocale = locale ?? fallback
        
        if let translationTables = localizationTables[currentLocale] {
            
            for translationTable in translationTables {
                
                if var translation = translationTable.retrieve(for: key) {
                    
                    if let interpolation = interpolation {
                        
                        for argument in interpolation {

                            switch argument {
                            case let stringValue as String:
                                
                                if let range = translation.range(of: "%st") {
                                    translation = translation.replacingCharacters(in: range, with: stringValue)
                                }
                                
                            case let dateValue as Date:
                                
                                let formatter = DateFormatter()
                                formatter.dateFormat = currentLocale.dateFormat
                                
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
                    
                    return translation
                    
                } else {
                    continue
                }
            }
            
        } else {
            throw Errors.missingTable(currentLocale.tag)
        }
        
        throw Errors.missingKey(key)
    }
    
    /// Retrieves the translation for a specified key from a given translation table
    ///
    /// - Parameters:
    ///   - key: The string key to be translated
    ///   - table: The name of the translation table
    ///   - locale: The locale to use when retrieving the translation
    ///   - interpolation: An array of values used to replace placeholders within the translation string
    ///
    /// - Returns: The translation
    public func localize(key: String, table: String, locale: Locale? = nil, interpolation: [Any]? = nil) throws -> String {
        
        guard let fallback = self.locale else {
            throw Errors.noFallback
        }
        
        guard let localizationTables = self.tables else {
            throw Errors.missingTables
        }
        
        let currentLocale = locale ?? fallback
        
        if let translationTables = localizationTables[currentLocale] {
            
            for translationTable in translationTables {
                
                if translationTable.name == table {
                    
                    if var translation = translationTable.retrieve(for: key) {
                        
                        if let interpolation = interpolation {
                            
                            for argument in interpolation {

                                switch argument {
                                case let stringValue as String:
                                    
                                    if let range = translation.range(of: "%st") {
                                        translation = translation.replacingCharacters(in: range, with: stringValue)
                                    }
                                    
                                case let dateValue as Date:
                                    
                                    let formatter = DateFormatter()
                                    formatter.dateFormat = currentLocale.dateFormat
                                    
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
                        
                        return translation
                        
                    } else {
                        throw Errors.missingKey(key)
                    }
                }
            }
            
        } else {
            throw Errors.missingTable(currentLocale.tag)
        }
        
        throw Errors.unknownTable(table)
    }
}

