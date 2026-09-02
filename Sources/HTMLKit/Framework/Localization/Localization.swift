import Foundation

/// A type that represents the localization
@_documentation(visibility: internal)
public struct Localization: Sendable {
    
    /// An enumeration of errors regarding the localization rendering.
    public enum Error: Swift.Error, Equatable {
        
        /// Indicates a missing key.
        ///
        /// A key is considered as missing if it cannot be found in the translation table.
        case missingKey(String, String)
        
        /// Indicates a missing table.
        ///
        /// A table is considered as missing if it cannot be found in the language catalog.
        case missingTable(String, String)
        
        /// Indicates a missing catalog.
        ///
        /// A catalog is considered as missing if it cannot be found in the localization folder.
        case missingCatalog(String)
        
        /// Indicates missing language catalogs.
        case missingCatalogs
        
        /// Indicates there is no fallback configuration set up.
        case missingFallback
        
        /// Indicates a loading failure
        case loadingDataFailed
        
        /// Returns a description about the failure reason
        public var description: String {
            
            switch self {
            case .missingKey(let key, let tag):
                return "Unable to find translation key '\(key)' for the locale '\(tag)'."
                
            case .missingTable(let table, let tag):
                return "Unable to find translation table '\(table)' for the locale '\(tag)'."
                
            case .missingCatalog(let tag):
                return "Unable to find a language catalog for the locale '\(tag)'."
                
            case .missingCatalogs:
                return "Unable to find any language catalog."  
                
            case .missingFallback:
                return "The fallback locale is not set up."
                
            case .loadingDataFailed:
                return "Unable to load data."
            }
        }
    }
    
    /// The available languages.
    internal var availableLanguages: [Locale] {
        
        guard let catalogs = self.catalogs else {
            return []
        }
        
        return catalogs.map(\.key)
    }
    
    /// Indicates whether the localization is properly configured
    internal var isConfigured: Bool {
        
        if self.catalogs != nil && self.locale != nil {
            return true
        }
        
        return false
    }
    
    /// The translations tables
    internal var catalogs: [Locale: [TranslationTable]]?
    
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
    public mutating func set(source: URL) {
        self.catalogs = load(source: source)
    }
    
    /// Sets the default locale
    ///
    /// - Parameter locale: A locale tag e.g. en-US
    public mutating func set(locale: String) {
        self.locale = Locale(tag: locale)
    }
    
    /// Initializes a localization
    ///
    /// - Parameters:
    ///   - source: The directory where the translations should be loaded from.
    ///   - locale: The default locale
    public init(source: URL, locale: Locale) {
        
        self.locale = locale
        self.catalogs = load(source: source)
    }
    
    /// Loads the translation tables from a given directory
    ///
    /// - Parameter source: The directory where the translation tables are located.
    ///
    /// - Returns: The translation tables mapped to their locale
    private func load(source: URL) -> [Locale: [TranslationTable]] {
        
        var catalogs = [Locale: [TranslationTable]]()
        
        if let enumerator = FileManager.default.enumerator(at: source, includingPropertiesForKeys: nil) {
            
            for case let path as URL in enumerator {
                
                if !path.hasDirectoryPath {
                    
                    if !path.isFileURL {
                        enumerator.skipDescendants()
                        
                    } else {
                        
                        if path.pathExtension == "strings" {
                            
                            let locale = Locale(tag: path.deletingPathExtension().deletingLastPathComponent().lastPathComponent)
                            
                            if var tables = catalogs[locale] {
                                
                                if let data = try? Foundation.Data(contentsOf: path) {
                                    
                                    if let translations = try? PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil) as? [String: String] {
                                        tables.append(TranslationTable(name: path.deletingPathExtension().lastPathComponent, translations: translations))
                                    }
                                    
                                    catalogs[locale] = tables
                                }
                                
                            } else {
                                
                                if let data = try? Foundation.Data(contentsOf: path) {
                                    
                                    if let translations = try? PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil) as? [String: String] {
                                        catalogs[locale] = [TranslationTable(name: path.deletingPathExtension().lastPathComponent, translations: translations)]
                                    }
                                }
                            }
                        }
                        
                        if path.pathExtension == "xcstrings" {
                           
                            if let data = try? Foundation.Data(contentsOf: path) {
                                
                                if let catalog = try? JSONDecoder().decode(StringCatalog.self, from: data) {
                                    
                                    for (key, entry) in catalog.entries {
                                        
                                        for (tag, localization) in entry.localizations {
                                            
                                            if let unit = localization.unit {
                                                
                                                let locale = Locale(tag: tag)
                                                
                                                if let tables = catalogs[locale] {
                                                    
                                                    for var table in tables {
                                                        
                                                        if table.name == path.deletingPathExtension().lastPathComponent {
                                                            table.upsert(unit.value, for: key)
                                                        }
                                                    }
                                                    
                                                    catalogs[locale] = tables
                                                    
                                                } else {
                                            
                                                    catalogs[locale] = [TranslationTable(name: path.deletingPathExtension().lastPathComponent, translations: [key: unit.value])]
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        
        return catalogs
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
            throw Error.missingFallback
        }
        
        guard let catalogs = self.catalogs else {
            throw Error.missingCatalogs
        }
    
        let candidate = getPossibleLanguage(locale, fallback)
        
        guard let tables = catalogs[candidate] else {
            throw Error.missingCatalog(candidate.tag)
        }
        
        if let table = string.table {
            
            guard let match = tables.first(where: { $0.name == table }) else {
                throw Error.missingTable(table, candidate.tag)
            }
            
            guard var translation = match.retrieve(for: string.key.value) else {
                throw Error.missingKey(string.key.value, candidate.tag)
            }
        
            interpolate(arguments: string.key.arguments, to: &translation, for: candidate)
            
            return translation
            
        }
        
        for table in tables {
            
            if var translation = table.retrieve(for: string.key.value) {
                
                interpolate(arguments: string.key.arguments, to: &translation, for: candidate)
                
                return translation
            }
        }
        
        throw Error.missingKey(string.key.value, candidate.tag)
    }
    
    /// Recovers from an error.
    ///
    /// - Parameters:
    ///   - priorError: The prior error to compare to
    ///   - string: The string to localize
    ///
    /// - Returns: The translation or the string literal
    internal func recover(from priorError: Error, with string: LocalizedString) throws -> String {
        
        do {
            
            return try localize(string: string)
            
        } catch let error as Error {
            
            switch error {
            case .missingKey where error != priorError:
                return try recover(from: error, with: string)
                
            case .missingTable where error != priorError:
                return try recover(from: error, with: string)
                
            default:
                return string.key.fallback
            }
        }
    }
    
    /// Returns the possible language.
    /// 
    /// - Parameter current: The current language.
    /// 
    /// - Returns: The possible language.
    internal func getPossibleLanguage(_ current: Locale?, _ other: Locale) -> Locale {
        
        guard let current = current else {
            return other
        }
        
        if self.availableLanguages.contains(current) {
            return current
        }
        
        let next = Locale(tag: current.language!)
        
        if self.availableLanguages.contains(next) {
            return next
        }
        
        return other
    }
}
