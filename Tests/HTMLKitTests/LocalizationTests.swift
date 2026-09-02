@testable import HTMLKit
import XCTest

final class LocalizationTests: XCTestCase {
    
    var localization: Localization?
    
    override func setUp() {
        super.setUp()
        
        try! setupLocalization()
    }
    
    /// Tests the localization of a specified translation key
    ///
    /// The test expects the key to exist in the default translation table and to be rendered correctly.
    func testLocalization() throws {
        
        XCTAssertEqual(try localization!.localize(string: .init(key: "hello.world")), "Hiya World")
        XCTAssertEqual(try localization!.localize(string: .init(key: "hello.xcstrings")), "Hiya String Catalog")
    }
    
    /// Tests the localization of a translation key in a specified translation table
    ///
    /// The test expects the key to exist in the specified translation table and to be rendered accurately.
    func testLocalizationWithTable() throws {
        
        XCTAssertEqual(try localization!.localize(string: .init(key: "hello", table: "mobile")), "Hiya")        
    }
    
    /// Tests the localization of string interpolation
    ///
    /// The test expects the key to exist in the default translation table and to be correctly formatted
    /// and rendered accurately.
    func testLocalizationWithStringInterpolation() throws {
        
        XCTAssertEqual(try localization!.localize(string: .init(key: "String: \("John Doe")")), "String: John Doe")
        XCTAssertEqual(try localization!.localize(string: .init(key: "Integer: \(31)")), "Integer: 31")
        XCTAssertEqual(try localization!.localize(string: .init(key: "Double: \(12.5)")), "Double: 12.5")
        XCTAssertEqual(try localization!.localize(string: .init(key: "Date: \(Date(timeIntervalSince1970: 50000))")), "Date: 01/01/1970")
    }
    
    /// Tests the localization of string interpolation with multiple arguments and various data types
    ///
    /// The test expects the key to exist in the default translation table, to be correctly formatted
    /// with the arguments in the proper order, and to be rendered accurately.
    func testStringInterpolationWithMultipleArguments() throws {
        
        XCTAssertEqual(try localization!.localize(string: .init(key: "Hello \("Jane") and \("John Doe")")), "Hello Jane and John Doe")
        XCTAssertEqual(try localization!.localize(string: .init(key: "Do you \(2) have time at \(Date(timeIntervalSince1970: 50000))?")), "Do you 2 have time at 01/01/1970?")
        XCTAssertEqual(try localization!.localize(string: .init(key: "cheers.person \("Jean")")), "Cheers Jean")
    }
    
    /// Tests the behavior when a localization key is missing
    ///
    /// A key is considered as missing if it cannot be found in the translation table. In this case,
    /// the localization is expected to throw an error.
    func testMissingKey() throws {
        
        XCTAssertThrowsError(try localization!.localize(string: .init(key: "unknown.key")), "unknown.key") { error in
            
            guard let localizationError = error as? Localization.Error else {
                return XCTFail("Unexpected error type: \(error)")
            }
            
            XCTAssertEqual(localizationError, .missingKey("unknown.key", "en-GB"))
            XCTAssertEqual(localizationError.description, "Unable to find translation key 'unknown.key' for the locale 'en-GB'.")
        }
    }
    
    /// Tests the behavior when a translation table is unknown.
    ///
    /// A table is considered as unknown if it cannot be found by the given table name. In this case,
    /// the localization is expected to throw an error.
    func testMissingTable() throws {
        
        XCTAssertThrowsError(try localization!.localize(string: .init(key: "hello.world", table: "unknown.table"))) { error in
            
            guard let localizationError = error as? Localization.Error else {
                return XCTFail("Unexpected error type: \(error)")
            }
            
            XCTAssertEqual(localizationError, .missingTable("unknown.table", "en-GB"))
            XCTAssertEqual(localizationError.description, "Unable to find translation table 'unknown.table' for the locale 'en-GB'.")
        }
    }
    
    /// Tests the behavior when a translation table is missing.
    ///
    /// A table is considered as missing if there is no translation table for the given locale. In this case,
    /// the localization is expected to throw an error.
    func testMissingCatalog() throws {
        
        localization!.set(locale: "tlh-AA")
        
        XCTAssertThrowsError(try localization!.localize(string: .init(key: "hello.world"))) { error in
            
            guard let localizationError = error as? Localization.Error else {
                return XCTFail("Unexpected error type: \(error)")
            }
            
            XCTAssertEqual(localizationError, .missingCatalog("tlh-AA"))
            XCTAssertEqual(localizationError.description, "Unable to find a language catalog for the locale 'tlh-AA'.")
        }
    }
    
    /// Test the correct string interpolation of a localized string key
    func testLocalizedStringKeyInterplation() throws {
        
        let string: LocalizedStringKey = "Hallo \("World")"
        
        XCTAssertEqual(string.value, "Hallo %@")
        XCTAssertEqual(string.fallback, "Hallo World")
        XCTAssertEqual(string.arguments.count, 1)
        
        let integer: LocalizedStringKey = "Hallo \(941)"
        
        XCTAssertEqual(integer.value, "Hallo %lld")
        XCTAssertEqual(integer.fallback, "Hallo 941")
        XCTAssertEqual(integer.arguments.count, 1)
        
        let float: LocalizedStringKey = "Hallo \(9.41)"
        
        XCTAssertEqual(float.value, "Hallo %f")
        XCTAssertEqual(float.fallback, "Hallo 9.41")
        XCTAssertEqual(float.arguments.count, 1)
    }
    
    /// Test the correct camparsion of the localized string key
    func testLocalizedStringKeyComparison() throws {
        
        let lhs: LocalizedStringKey = "Hallo \("Universe")"
        let rhs: LocalizedStringKey = "Hallo \("World")"
        
        XCTAssertEqual(lhs.value, rhs.value)
        XCTAssertNotEqual(lhs.fallback, rhs.fallback)
        XCTAssertEqual(lhs.arguments.count, rhs.arguments.count)
        
        XCTAssertNotEqual(lhs, rhs)
    }
    
    /// Test a locale of a language
    func testLocale() throws {
    
        let formatter = DateFormatter()
        
        let english = Locale(tag: "en")
        
        XCTAssertEqual(english.tag, "en")
        XCTAssertEqual(english.language, "en")
        XCTAssertEqual(english.region, nil)
        XCTAssertEqual(english.currencyCode, nil)
        XCTAssertEqual(english.currencySymbol, nil)
        XCTAssertEqual(english.decimalSeparator, nil)
        XCTAssertEqual(english.dateFormat, nil)
        XCTAssertEqual(english.timeFormat, nil)
        
        let british = Locale(tag: "en-GB")
        
        XCTAssertEqual(british.tag, "en-GB")
        XCTAssertEqual(british.language, "en")
        XCTAssertEqual(british.region, "GB")
        XCTAssertEqual(british.currencyCode, "GBP")
        XCTAssertEqual(british.currencySymbol, "£")
        XCTAssertEqual(british.decimalSeparator, ".")
        XCTAssertEqual(british.dateFormat, "dd/MM/yyyy")
        XCTAssertEqual(british.timeFormat, "HH:mm:ss")
        
        formatter.dateFormat = "\(british.dateFormat!) \(british.timeFormat!)"
        
        XCTAssertEqual(formatter.string(from: Date(timeIntervalSince1970: 1)), "01/01/1970 01:00:01")
        
        let german = Locale(tag: "de-DE")
        
        XCTAssertEqual(german.tag, "de-DE")
        XCTAssertEqual(german.language, "de")
        XCTAssertEqual(german.region, "DE")
        XCTAssertEqual(german.currencyCode, "EUR")
        XCTAssertEqual(german.currencySymbol, "€")
        XCTAssertEqual(german.decimalSeparator, ",")
        XCTAssertEqual(german.dateFormat, "dd.MM.yyyy")
        XCTAssertEqual(german.timeFormat, "HH:mm:ss")
        
        formatter.dateFormat = "\(german.dateFormat!) \(german.timeFormat!)"
        
        XCTAssertEqual(formatter.string(from: Date(timeIntervalSince1970: 1)), "01.01.1970 01:00:01")
    }
    
    /// Test the correct comparison of two locales
    func testLocaleComparsion() throws {        
        XCTAssertNotEqual(Locale(tag: .english), Locale(tag: .german))
    }
    
    /// Test the correct available languages
    func testAvailableLanguage() throws {
    
        XCTAssertEqual(localization!.availableLanguages.count, 3)
        XCTAssertEqual(localization!.availableLanguages.contains(Locale(tag: "en")), true)
        XCTAssertEqual(localization!.availableLanguages.contains(Locale(tag: "en-GB")), true)
        XCTAssertEqual(localization!.availableLanguages.contains(Locale(tag: "fr")), true)
    }
    
    /// Tests the correct locale chain
    func testLocaleChain() throws {
        
        let american = Locale(tag: "en-US")
    
        let missingRegion = localization!.getPossibleLanguage(american, localization!.locale!)
        
        XCTAssertEqual(missingRegion.tag, "en")
        XCTAssertEqual(missingRegion.language, "en")
        XCTAssertEqual(missingRegion.region, nil)
        
        let french = Locale(tag: "fr")
    
        let existingLanguage = localization!.getPossibleLanguage(french, localization!.locale!)
        
        XCTAssertEqual(existingLanguage.tag, "fr")
        XCTAssertEqual(existingLanguage.language, "fr")
        XCTAssertEqual(existingLanguage.region, nil)
        
        let german = Locale(tag: "de-DE")
    
        let missingLanguage = localization!.getPossibleLanguage(german, localization!.locale!)
        
        XCTAssertEqual(missingLanguage.tag, "en-GB")
        XCTAssertEqual(missingLanguage.language, "en")
        XCTAssertEqual(missingLanguage.region, "GB")
    }
}

extension LocalizationTests {
    
    func setupLocalization() throws {
        
        guard let sourcePath = Bundle.module.url(forResource: "Localization", withExtension: nil) else {
            return
        }
        
        self.localization = Localization(source: sourcePath, locale: .init(tag: "en-GB"))
    }
}
