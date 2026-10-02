@testable import HTMLKit
import Testing
import Foundation

@Suite
struct LocalizationTests {
    
    var localization: Localization?
    
    init() {
        self.localization = setupLocalization()
    }
    
    /// Tests the localization of a specified translation key
    ///
    /// The test expects the key to exist in the default translation table and to be rendered correctly.
    @Test
    func testLocalization() throws {
        
        #expect(try localization!.localize(string: .init(key: "hello.world")) == "Hiya World")
        #expect(try localization!.localize(string: .init(key: "hello.xcstrings")) == "Hiya String Catalog")
    }
    
    /// Tests the localization of a translation key in a specified translation table
    ///
    /// The test expects the key to exist in the specified translation table and to be rendered accurately.
    @Test
    func testLocalizationWithTable() throws {
        
        #expect(try localization!.localize(string: .init(key: "hello", table: "mobile")) == "Hiya")        
    }
    
    /// Tests the localization of string interpolation
    ///
    /// The test expects the key to exist in the default translation table and to be correctly formatted
    /// and rendered accurately.
    @Test
    func testLocalizationWithStringInterpolation() throws {
        
        #expect(try localization!.localize(string: .init(key: "String: \("John Doe")")) == "String: John Doe")
        #expect(try localization!.localize(string: .init(key: "Integer: \(31)")) == "Integer: 31")
        #expect(try localization!.localize(string: .init(key: "Double: \(12.5)")) == "Double: 12.5")
        #expect(try localization!.localize(string: .init(key: "Date: \(Date(timeIntervalSince1970: 0))")) == "Date: 01/01/1970")
    }
    
    /// Tests the localization of string interpolation with multiple arguments and various data types
    ///
    /// The test expects the key to exist in the default translation table, to be correctly formatted
    /// with the arguments in the proper order, and to be rendered accurately.
    @Test
    func testStringInterpolationWithMultipleArguments() throws {
        
        #expect(try localization!.localize(string: .init(key: "Hello \("Jane") and \("John Doe")")) == "Hello Jane and John Doe")
        #expect(try localization!.localize(string: .init(key: "Do you \(2) have time at \(Date(timeIntervalSince1970: 0))?")) == "Do you 2 have time at 01/01/1970?")
        #expect(try localization!.localize(string: .init(key: "cheers.person \("Jean")")) == "Cheers Jean")
    }
    
    /// Tests the behavior when a localization key is missing
    ///
    /// A key is considered as missing if it cannot be found in the translation table. In this case,
    /// the localization is expected to throw an error.
    @Test
    func testMissingKey() throws {
        
        let error = #expect(throws: Localization.Error.missingKey(identifier: "unknown.key", locale: Locale(tag: "en-GB"))) { 
            try localization!.localize(string: .init(key: "unknown.key"))
        }
        
        let unwrapped = try #require(error)
        
        #expect(unwrapped.description == "Unable to find translation key 'unknown.key' for the locale 'en-GB'.")
    }
    
    /// Tests the behavior when a translation table is unknown.
    ///
    /// A table is considered as unknown if it cannot be found by the given table name. In this case,
    /// the localization is expected to throw an error.
    @Test
    func testMissingTable() throws {
    
        let error = #expect(throws: Localization.Error.missingTable(name: "unknown.table", locale: Locale(tag: "en-GB"))) { 
            try localization!.localize(string: .init(key: "hello.world", table: "unknown.table"))
        }
        
        let unwrapped = try #require(error)
        
        #expect(unwrapped.description == "Unable to find translation table 'unknown.table' for the locale 'en-GB'.")
    }
    
    /// Tests the behavior when a translation table is missing.
    ///
    /// A table is considered as missing if there is no translation table for the given locale. In this case,
    /// the localization is expected to throw an error.
    @Test
    mutating func testMissingCatalog() throws {
        
        localization!.set(locale: "tlh-AA")
        
        let error = #expect(throws: Localization.Error.missingCatalog(locale: Locale(tag: "tlh-AA"))) { 
            try localization!.localize(string: .init(key: "hello.world"))
        }
        
        let unwrapped = try #require(error)
        
        #expect(unwrapped.description == "Unable to find a language catalog for the locale 'tlh-AA'.")
    }
    
    /// Test the correct string interpolation of a localized string key
    @Test
    func testLocalizedStringKeyInterplation() throws {
        
        let string: LocalizedStringKey = "Hallo \("World")"
        
        #expect(string.value == "Hallo %@")
        #expect(string.fallback == "Hallo World")
        #expect(string.arguments.count == 1)
        
        let integer: LocalizedStringKey = "Hallo \(941)"
        
        #expect(integer.value == "Hallo %lld")
        #expect(integer.fallback == "Hallo 941")
        #expect(integer.arguments.count == 1)
        
        let float: LocalizedStringKey = "Hallo \(9.41)"
        
        #expect(float.value == "Hallo %f")
        #expect(float.fallback == "Hallo 9.41")
        #expect(float.arguments.count == 1)
    }
    
    /// Test the correct camparsion of the localized string key
    @Test
    func testLocalizedStringKeyComparison() throws {
        
        let lhs: LocalizedStringKey = "Hallo \("Universe")"
        let rhs: LocalizedStringKey = "Hallo \("World")"
        
        #expect(lhs.value == rhs.value)
        #expect(lhs.fallback != rhs.fallback)
        #expect(lhs.arguments.count == rhs.arguments.count)
        
        #expect(lhs != rhs)
    }
    
    /// Test a locale of a language
    @Test
    func testLocale() throws {
    
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        
        let english = Locale(tag: "en")
        
        #expect(english.tag == "en")
        #expect(english.language == "en")
        #expect(english.region == nil)
        #expect(english.currencyCode == nil)
        #expect(english.currencySymbol == nil)
        #expect(english.decimalSeparator == nil)
        #expect(english.dateFormat == nil)
        #expect(english.timeFormat == nil)
        
        let british = Locale(tag: "en-GB")
        
        #expect(british.tag == "en-GB")
        #expect(british.language == "en")
        #expect(british.region == "GB")
        #expect(british.currencyCode == "GBP")
        #expect(british.currencySymbol == "£")
        #expect(british.decimalSeparator == ".")
        #expect(british.dateFormat == "dd/MM/yyyy")
        #expect(british.timeFormat == "HH:mm:ss")
        
        formatter.dateFormat = "\(british.dateFormat!) \(british.timeFormat!)"
        
        #expect(formatter.string(from: Date(timeIntervalSince1970: 0)) == "01/01/1970 00:00:00")
        
        let german = Locale(tag: "de-DE")
        
        #expect(german.tag == "de-DE")
        #expect(german.language == "de")
        #expect(german.region == "DE")
        #expect(german.currencyCode == "EUR")
        #expect(german.currencySymbol == "€")
        #expect(german.decimalSeparator == ",")
        #expect(german.dateFormat == "dd.MM.yyyy")
        #expect(german.timeFormat == "HH:mm:ss")
        
        formatter.dateFormat = "\(german.dateFormat!) \(german.timeFormat!)"
        
        #expect(formatter.string(from: Date(timeIntervalSince1970: 0)) == "01.01.1970 00:00:00")
    }
    
    /// Test the correct comparison of two locales
    @Test
    func testLocaleComparsion() throws {        
        #expect(Locale(tag: .english) != Locale(tag: .german))
    }
    
    /// Test the correct available languages
    @Test
    func testAvailableLanguage() throws {
    
        #expect(localization!.availableLanguages.count == 3)
        #expect(localization!.availableLanguages.contains(Locale(tag: "en")) == true)
        #expect(localization!.availableLanguages.contains(Locale(tag: "en-GB")) == true)
        #expect(localization!.availableLanguages.contains(Locale(tag: "fr")) == true)
    }
    
    /// Tests the correct locale chain
    @Test
    func testLocaleChain() throws {
        
        let american = Locale(tag: "en-US")
    
        let missingRegion = localization!.getPossibleLanguage(american, localization!.locale!)
        
        #expect(missingRegion.tag == "en")
        #expect(missingRegion.language == "en")
        #expect(missingRegion.region == nil)
        
        let french = Locale(tag: "fr")
    
        let existingLanguage = localization!.getPossibleLanguage(french, localization!.locale!)
        
        #expect(existingLanguage.tag == "fr")
        #expect(existingLanguage.language == "fr")
        #expect(existingLanguage.region == nil)
        
        let german = Locale(tag: "de-DE")
    
        let missingLanguage = localization!.getPossibleLanguage(german, localization!.locale!)
        
        #expect(missingLanguage.tag == "en-GB")
        #expect(missingLanguage.language == "en")
        #expect(missingLanguage.region == "GB")
    }
    
    /// Tests the correct loading of the associated comments from the string catalog.
    @Test
    func testLoadingAssociatedComment() throws {
        
        let catalogs = try #require(localization!.catalogs)
        
        let tables = try #require(catalogs[Locale(tag: "en-GB")])
            
        let table = try #require(tables.first(where: { $0.name == "Localizable" }))
        
        let translation = try #require(table.retrieve(for: "hello.xcstrings"))
        
        #expect(translation.comment == "One more thing")
    }
}

extension LocalizationTests {
    
    func setupLocalization() -> Localization? {
        
        guard let sourcePath = Bundle.module.url(forResource: "Localization", withExtension: nil) else {
            return nil
        }
        
        return Localization(source: sourcePath, locale: .init(tag: "en-GB"))
    }
}
