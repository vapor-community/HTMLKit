import Foundation

/// A type that represents the localization
public struct Localization {
    
    /// A enumeration of various errors
    public enum Errors: Error {
        
        case missingValue
        case missingTable
        case missingTables
        case localizationFailed
        
        public var description: String {
            
            switch self {
            case .missingValue:
                return "Unable to find a value for the key."
                
            case .missingTable:
                return "Unable to find a translation table for the locale."
                
            case .missingTables:
                return "Unable to find any translations tables."
                
            case .localizationFailed:
                return "Localization failed."
            }
        }
    }
    
    /// The translation tables
    internal var tables: [Locale: [TranslationTable]]?
    
    /// The default locale
    internal var locale: Locale
    
    /// Initiates a localization
    public init(source: URL, locale: Locale) {
        
        self.locale = locale
        self.tables = load(source: source)
    }
    
    /// Loads the tables from a specific path
    internal func load(source: URL) -> [Locale: [TranslationTable]] {
        
        var localTable = [Locale: [TranslationTable]]()
        
        if let enumerator = FileManager.default.enumerator(at: source, includingPropertiesForKeys: nil) {
            
            for case let path as URL in enumerator {
                
                if !path.hasDirectoryPath {
                    
                    if !path.isFileURL {
                        enumerator.skipDescendants()
                        
                    } else {
                        
                        let locale = Locale(tag: path.deletingPathExtension().deletingLastPathComponent().lastPathComponent)
                        
                        if var tables = localTable[locale] {
                            
                            if let strings = NSDictionary(contentsOf: path) as? [String: String] {
                                tables.append(TranslationTable(name: path.deletingPathExtension().lastPathComponent, translations: strings))
                            }
                            
                            localTable[locale] = tables
                        }
                    }
                    
                } else {
                    localTable[Locale(tag: path.lastPathComponent)] = [TranslationTable]()
                }
            }
        }
        
        return localTable
    }
    
    /// Retrieves a value for a specific key from the tables
    public func localize(key: String, locale: Locale? = nil, arguments: [Any]? = nil) throws -> String {
        
        guard let tables = self.tables else {
            throw Errors.missingTables
        }
        
        let currentLocale = locale ?? self.locale
        
        if let translations = tables[currentLocale] {
            
            for translation in translations {
                
                if var value = translation.retrieve(for: key) {
                    
                    if let arguments = arguments {
                        
                        for argument in arguments {

                            switch argument {
                            case let stringValue as String:
                                value = value.replacingOccurrences(of: "%st", with: stringValue)
                                
                            case let dateValue as Date:
                                
                                let formatter = DateFormatter()
                                formatter.dateFormat = currentLocale.date
                                
                                value = value.replacingOccurrences(of: "%dt", with: formatter.string(from: dateValue))
                                
                            case let doubleValue as Double:
                                value = value.replacingOccurrences(of: "%do", with: String(doubleValue))
                                
                            default:
                                break
                            }
                        }
                    }
                    
                    return value
                    
                } else {
                    throw Errors.missingValue
                }
            }
            
        } else {
            throw Errors.missingTable
        }
        
        throw Errors.localizationFailed
    }
}

