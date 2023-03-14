import Foundation

/// A type that represents the localization
public class Localization {
    
    /// A enumeration of various errors
    public enum Errors: Error {
        
        case missingKey
        case missingTable
        case missingTables
        case unkownTable
        case noFallback
        
        public var description: String {
            
            switch self {
            case .missingKey:
                return "Unable to find a translation for the key."
                
            case .missingTable:
                return "Unable to find a translation table for the locale."
                
            case .missingTables:
                return "Unable to find any localization tables."
                
            case .unkownTable:
                return "Unkown table name."
                
            case .noFallback:
                return "The fallback needs to be set up first."
            }
        }
    }
    
    /// The localization tables
    internal var tables: [Locale: [TranslationTable]]?
    
    /// The default locale
    internal var locale: Locale?
    
    /// Initiates a localization
    public init() {
    }
    
    /// Initiates a localization
    public init(source: URL, locale: Locale) {
        
        self.locale = locale
        self.tables = load(source: source)
    }
    
    /// Sets the root path
    public func set(source: URL) {
        self.tables = load(source: source)
    }
    
    /// Sets the default locale indentifier
    public func set(locale: String) {
        self.locale = Locale(tag: locale)
    }
    
    /// Loads the tables from a specific path
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
                            
                            if let translations = NSDictionary(contentsOf: path) as? [String: String] {
                                translationTables.append(TranslationTable(name: path.deletingPathExtension().lastPathComponent, translations: translations))
                            }
                            
                            localizationTables[locale] = translationTables
                        }
                    }
                    
                } else {
                    localizationTables[Locale(tag: path.lastPathComponent)] = [TranslationTable]()
                }
            }
        }
        
        return localizationTables
    }
    
    /// Retrieves a value for a specific key from the tables
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
                                translation = translation.replacingOccurrences(of: "%st", with: stringValue)
                                
                            case let dateValue as Date:
                                
                                let formatter = DateFormatter()
                                formatter.dateFormat = currentLocale.date
                                
                                translation = translation.replacingOccurrences(of: "%dt", with: formatter.string(from: dateValue))
                                
                            case let doubleValue as Double:
                                translation = translation.replacingOccurrences(of: "%do", with: String(doubleValue))
                                
                            case let intValue as Int:
                                translation = translation.replacingOccurrences(of: "%in", with: String(intValue))
                                
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
            throw Errors.missingTable
        }
        
        throw Errors.missingKey
    }
    
    /// Retrieves a value for a specific key from a specific table
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
                                    translation = translation.replacingOccurrences(of: "%st", with: stringValue)
                                    
                                case let dateValue as Date:
                                    
                                    let formatter = DateFormatter()
                                    formatter.dateFormat = currentLocale.date
                                    
                                    translation = translation.replacingOccurrences(of: "%dt", with: formatter.string(from: dateValue))
                                    
                                case let doubleValue as Double:
                                    translation = translation.replacingOccurrences(of: "%do", with: String(doubleValue))
                                    
                                case let intValue as Int:
                                    translation = translation.replacingOccurrences(of: "%in", with: String(intValue))
                                    
                                default:
                                    break
                                }
                            }
                        }
                        
                        return translation
                        
                    } else {
                        throw Errors.missingKey
                    }
                }
            }
            
        } else {
            throw Errors.missingTable
        }
        
        throw Errors.unkownTable
    }
}

