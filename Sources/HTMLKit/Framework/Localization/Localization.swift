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
    
    /// Indicates whether the localization is properly configured
    internal var isConfigured: Bool {
        
        if self.tables != nil && self.locale != nil {
            return true
        }
        
        return false
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
    
    /// Replace the value with the placeholder
    ///
    /// - Parameters:
    ///   - placeholder: The placeholder to be replaced in
    ///   - value: The value to replace the placeholder with
    ///   - translation: The string in which the replacement will occur
    private func replace(placeholder: String, with value: String, on translation: inout String) {
        
        if let range = translation.range(of: placeholder) {
            translation = translation.replacingCharacters(in: range, with: value)
        }
    }
    
    /// Apply interpolation values to the translation for the given locale
    ///
    /// - Parameters:
    ///   - arguments: The arguments to replace the placeholders with
    ///   - translation: The string in which the interpolation will occur
    ///   - locale: The locale to respect during interpolation
    private func interpolate(arguments: [InterpolationArgument], to translation: inout String, for locale: Locale) {
        
        for argument in arguments {
            
            switch argument {
            case .int(let int):
                
                replace(placeholder: argument.placeholder, with: String(int), on: &translation)
                
            case .string(let string):
                
                replace(placeholder: argument.placeholder, with: string, on: &translation)
                
            case .double(let double):
                
                replace(placeholder: argument.placeholder, with: String(double), on: &translation)
                
            case .float(let float):
                
                replace(placeholder: argument.placeholder, with: String(float), on: &translation)
                
            case .date(let date):
                
                let formatter = DateFormatter()
                formatter.dateFormat = locale.dateFormat
                
                replace(placeholder: argument.placeholder, with: formatter.string(from: date), on: &translation)
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
    public func localize(string: LocalizedString, for locale: Locale? = nil) throws -> String {
        
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
        
        if let table = string.table {
            
            guard let translationTable = translationTables.first(where: { $0.name == table }) else {
                throw Errors.unknownTable(table, currentLocale.tag)
            }
            
            guard var translation = translationTable.retrieve(for: string.key.value) else {
                throw Errors.missingKey(string.key.value, currentLocale.tag)
            }
        
            if let interpolation = string.key.interpolation {
                interpolate(arguments: interpolation, to: &translation, for: currentLocale)
            }
            
            return translation
            
        }
        
        for translationTable in translationTables {
            
            if var translation = translationTable.retrieve(for: string.key.value) {
                
                if let interpolation = string.key.interpolation {
                    interpolate(arguments: interpolation, to: &translation, for: currentLocale)
                }
                
                return translation
            }
        }
        
        throw Errors.missingKey(string.key.value, currentLocale.tag)
    }
    
    /// Recovers from an error.
    ///
    /// - Parameters:
    ///   - priorError: The prior error to compare to
    ///   - string: The string to localize
    ///
    /// - Returns: The translation or the string literal
    internal func recover(from priorError: Errors, with string: LocalizedString) throws -> String {
        
        do {
            
            return try localize(string: string)
            
        } catch let error as Errors {
            
            switch error {
            case .missingKey where error != priorError:
                return try recover(from: error, with: string)
                
            case .missingTable where error != priorError:
                return try recover(from: error, with: string)
                
            default:
                return string.key.literal
            }
        }
    }
}
