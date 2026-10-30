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
        
        #expect {
            try localization!.localize(string: .init(key: "unknown.key"))
        } throws: { error in
            
            guard let localizationError = error as? Localization.Error else {
                return false
            }
            
            return localizationError == .missingKey(identifier: "unknown.key", locale: Locale(tag: "en-GB")) && localizationError.description == "Unable to find translation key 'unknown.key' for the locale 'en-GB'."
        }
    }
    
    /// Tests the behavior when a translation table is unknown.
    ///
    /// A table is considered as unknown if it cannot be found by the given table name. In this case,
    /// the localization is expected to throw an error.
    @Test
    func testMissingTable() throws {
        
        #expect {
            try localization!.localize(string: .init(key: "hello.world", table: "unknown.table"))
        } throws: { error in
            
            guard let localizationError = error as? Localization.Error else {
                return false
            }
            
            return localizationError == .missingTable(name: "unknown.table", locale: Locale(tag: "en-GB")) && localizationError.description == "Unable to find translation table 'unknown.table' for the locale 'en-GB'."
        }
    }
    
    /// Tests the behavior when a translation table is missing.
    ///
    /// A table is considered as missing if there is no translation table for the given locale. In this case,
    /// the localization is expected to throw an error.
    @Test
    mutating func testMissingCatalog() throws {
        
        localization!.set(locale: "tlh-AA")
        
        #expect {
            try localization!.localize(string: .init(key: "hello.world"))
        } throws: { error in
            
            guard let localizationError = error as? Localization.Error else {
                return false
            }
            
            return localizationError == .missingCatalog(locale: Locale(tag: "tlh-AA")) && localizationError.description == "Unable to find a language catalog for the locale 'tlh-AA'."
        }
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
    
    /// Tests the correct use of pluralization.
    @Test
    func testPluralization() throws {
        
        #expect(try localization!.localize(string: .init(key: "\(0) day")) == "0 days")
        #expect(try localization!.localize(string: .init(key: "\(1) day")) == "1 day")
        #expect(try localization!.localize(string: .init(key: "\(2) day")) == "2 days")
        #expect(try localization!.localize(string: .init(key: "\(1.0) day")) == "1.0 days")
        #expect(try localization!.localize(string: .init(key: "\(1.5) day")) == "1.5 days")
    }
    
    /// Tests the correct determination of the plural category.
    @Test
    func testPluraCategories() throws {
        
        let albanian = Locale(tag: "sq-AL")
        
        #expect(albanian.pluralCategory(by: 1) == .one)
        #expect(albanian.pluralCategory(by: 1.0) == .one)
        #expect(albanian.pluralCategory(by: 2) == .other)
        #expect(albanian.pluralCategory(by: 0.9) == .other)
        
        let arabic = Locale(tag: "ar-AE")
        
        #expect(arabic.pluralCategory(by: 0) == .zero)
        #expect(arabic.pluralCategory(by: 0.0) == .zero)
        #expect(arabic.pluralCategory(by: 1) == .one)
        #expect(arabic.pluralCategory(by: 1.0) == .one)
        #expect(arabic.pluralCategory(by: 2) == .two)
        #expect(arabic.pluralCategory(by: 2.0) == .two)
        #expect(arabic.pluralCategory(by: 3) == .few)
        #expect(arabic.pluralCategory(by: 3.0) == .few)
        #expect(arabic.pluralCategory(by: 11) == .many)
        #expect(arabic.pluralCategory(by: 11.0) == .many)
        #expect(arabic.pluralCategory(by: 100) == .other)
        #expect(arabic.pluralCategory(by: 0.1) == .other)
        
        let armenian = Locale(tag: "hy-AM")
        
        #expect(armenian.pluralCategory(by: 1) == .one)
        #expect(armenian.pluralCategory(by: 1.0) == .one)
        #expect(armenian.pluralCategory(by: 2) == .other)
        #expect(armenian.pluralCategory(by: 2.0) == .other)
        
        let belarusian = Locale(tag: "be-BY")
        
        #expect(belarusian.pluralCategory(by: 1) == .one)
        #expect(belarusian.pluralCategory(by: 21.0) == .one)
        #expect(belarusian.pluralCategory(by: 3) == .few)
        #expect(belarusian.pluralCategory(by: 32.0) == .few)
        #expect(belarusian.pluralCategory(by: 0) == .many)
        #expect(belarusian.pluralCategory(by: 5.0) == .many)
        #expect(belarusian.pluralCategory(by: 0.1) == .other)
        
        let bulgarian = Locale(tag: "bg-BG")
        
        #expect(bulgarian.pluralCategory(by: 1) == .one)
        #expect(bulgarian.pluralCategory(by: 1.6) == .other)
        
        let catalan = Locale(tag: "ca-ES")
        
        #expect(catalan.pluralCategory(by: 1) == .one)
        #expect(catalan.pluralCategory(by: 1000000) == .many)
        #expect(catalan.pluralCategory(by: 2) == .other)
        #expect(catalan.pluralCategory(by: 1.5) == .other)
        
        let chinese = Locale(tag: "zh-CN")
        
        #expect(chinese.pluralCategory(by: 15) == .other)
        #expect(chinese.pluralCategory(by: 1.5) == .other)
        
        let croatian = Locale(tag: "hr-HR")
        
        #expect(croatian.pluralCategory(by: 1) == .one)
        #expect(croatian.pluralCategory(by: 0.1) == .one)
        #expect(croatian.pluralCategory(by: 2) == .few)
        #expect(croatian.pluralCategory(by: 0.2) == .few)
        #expect(croatian.pluralCategory(by: 5) == .other)
        #expect(croatian.pluralCategory(by: 0.5) == .other)
        
        let czech = Locale(tag: "cs-CZ")
        
        #expect(czech.pluralCategory(by: 1) == .one)
        #expect(czech.pluralCategory(by: 3) == .few)
        #expect(czech.pluralCategory(by: 1.5) == .many)
        #expect(czech.pluralCategory(by: 5) == .other)
        
        let danish = Locale(tag: "da-DK")
        
        #expect(danish.pluralCategory(by: 1) == .one)
        #expect(danish.pluralCategory(by: 1.6) == .one)
        #expect(danish.pluralCategory(by: 2) == .other)
        #expect(danish.pluralCategory(by: 10.0) == .other)
        
        let dutch = Locale(tag: "nl-NL")
        
        #expect(dutch.pluralCategory(by: 1) == .one)
        #expect(dutch.pluralCategory(by: 2) == .other)
        #expect(dutch.pluralCategory(by: 1.5) == .other)
        
        let english = Locale(tag: "en-GB")
        
        #expect(english.pluralCategory(by: 1) == .one)
        #expect(english.pluralCategory(by: 2) == .other)
        #expect(english.pluralCategory(by: 1.5) == .other)
        
        let estonian = Locale(tag: "et-EE")
        
        #expect(estonian.pluralCategory(by: 1) == .one)
        #expect(estonian.pluralCategory(by: 2) == .other)
        #expect(estonian.pluralCategory(by: 1.5) == .other)
        
        let finnish = Locale(tag: "fi-FI")
        
        #expect(finnish.pluralCategory(by: 1) == .one)
        #expect(finnish.pluralCategory(by: 2) == .other)
        #expect(finnish.pluralCategory(by: 1.5) == .other)
        
        let french = Locale(tag: "fr-FR")
        
        #expect(french.pluralCategory(by: 1) == .one)
        #expect(french.pluralCategory(by: 1.5) == .one)
        #expect(french.pluralCategory(by: 1000000) == .many)
        #expect(french.pluralCategory(by: 2) == .other)
        #expect(french.pluralCategory(by: 2.0) == .other)
        
        let georgian = Locale(tag: "ka-GE")
        
        #expect(georgian.pluralCategory(by: 1) == .one)
        #expect(georgian.pluralCategory(by: 1.0) == .one)
        #expect(georgian.pluralCategory(by: 2) == .other)
        #expect(georgian.pluralCategory(by: 0.9) == .other)
        
        let german = Locale(tag: "de-DE")
        
        #expect(german.pluralCategory(by: 1) == .one)
        #expect(german.pluralCategory(by: 2) == .other)
        #expect(german.pluralCategory(by: 1.5) == .other)
        
        let greek = Locale(tag: "el-GR")
        
        #expect(greek.pluralCategory(by: 1) == .one)
        #expect(greek.pluralCategory(by: 1.0) == .one)
        #expect(greek.pluralCategory(by: 2) == .other)
        #expect(greek.pluralCategory(by: 0.9) == .other)
        
        let hebrew = Locale(tag: "he-IL")
        
        #expect(hebrew.pluralCategory(by: 1) == .one)
        #expect(hebrew.pluralCategory(by: 0.9) == .one)
        #expect(hebrew.pluralCategory(by: 2) == .two)
        #expect(hebrew.pluralCategory(by: 3) == .other)
        #expect(hebrew.pluralCategory(by: 1.0) == .other)
        
        let hindi = Locale(tag: "hi-IN")
        
        #expect(hindi.pluralCategory(by: 1) == .one)
        #expect(hindi.pluralCategory(by: 1.0) == .one)
        #expect(hindi.pluralCategory(by: 2) == .other)
        #expect(hindi.pluralCategory(by: 1.1) == .other)
        
        let hungarian = Locale(tag: "hu-HU")
        
        #expect(hungarian.pluralCategory(by: 1) == .one)
        #expect(hungarian.pluralCategory(by: 1.0) == .one)
        #expect(hungarian.pluralCategory(by: 2) == .other)
        #expect(hungarian.pluralCategory(by: 0.9) == .other)
        
        let icelandic = Locale(tag: "is-IS")
        
        #expect(icelandic.pluralCategory(by: 1) == .one)
        #expect(icelandic.pluralCategory(by: 0.1) == .one)
        
        let indonesian = Locale(tag: "id-ID")
        
        #expect(indonesian.pluralCategory(by: 15) == .other)
        #expect(indonesian.pluralCategory(by: 1.5) == .other)
        
        let italian = Locale(tag: "it-IT")
        
        #expect(italian.pluralCategory(by: 1) == .one)
        #expect(italian.pluralCategory(by: 1000000) == .many)
        #expect(italian.pluralCategory(by: 2) == .other)
        #expect(italian.pluralCategory(by: 1.5) == .other)
        
        let japanese = Locale(tag: "ja-JP")
        
        #expect(japanese.pluralCategory(by: 15) == .other)
        #expect(japanese.pluralCategory(by: 1.5) == .other)
        
        let korean = Locale(tag: "ko-KP")
        
        #expect(korean.pluralCategory(by: 15) == .other)
        #expect(korean.pluralCategory(by: 1.5) == .other)
        
        let latvian = Locale(tag: "lv-LV")
        
        #expect(latvian.pluralCategory(by: 10) == .zero)
        #expect(latvian.pluralCategory(by: 10.0) == .zero)
        #expect(latvian.pluralCategory(by: 1) == .one)
        #expect(latvian.pluralCategory(by: 0.1) == .one)
        #expect(latvian.pluralCategory(by: 2) == .other)
        #expect(latvian.pluralCategory(by: 0.2) == .other)
        
        let lithuanian = Locale(tag: "lt-LT")
        
        #expect(lithuanian.pluralCategory(by: 1) == .one)
        #expect(lithuanian.pluralCategory(by: 1.0) == .one)
        #expect(lithuanian.pluralCategory(by: 2) == .few)
        #expect(lithuanian.pluralCategory(by: 2.0) == .few)
        #expect(lithuanian.pluralCategory(by: 0.1) == .many)
        #expect(lithuanian.pluralCategory(by: 10) == .other)
        #expect(lithuanian.pluralCategory(by: 10.0) == .other)
        
        let macedonian = Locale(tag: "mk-MK")
        
        #expect(macedonian.pluralCategory(by: 1) == .one)
        #expect(macedonian.pluralCategory(by: 0.1) == .one)
        #expect(macedonian.pluralCategory(by: 2) == .other)
        #expect(macedonian.pluralCategory(by: 0.2) == .other)
        
        let maltese = Locale(tag: "mt-MT")
        
        #expect(maltese.pluralCategory(by: 1) == .one)
        #expect(maltese.pluralCategory(by: 1.0) == .one)
        #expect(maltese.pluralCategory(by: 2) == .two)
        #expect(maltese.pluralCategory(by: 2.0) == .two)
        #expect(maltese.pluralCategory(by: 3) == .few)
        #expect(maltese.pluralCategory(by: 3.0) == .few)
        #expect(maltese.pluralCategory(by: 11) == .many)
        #expect(maltese.pluralCategory(by: 11.0) == .many)
        #expect(maltese.pluralCategory(by: 20) == .other)
        #expect(maltese.pluralCategory(by: 0.1) == .other)
        
        let norwegian = Locale(tag: "no-NO")
        
        #expect(norwegian.pluralCategory(by: 1) == .one)
        #expect(norwegian.pluralCategory(by: 1.0) == .one)
        #expect(norwegian.pluralCategory(by: 2) == .other)
        #expect(norwegian.pluralCategory(by: 0.9) == .other)
        
        let polish = Locale(tag: "pl-PL")
        
        #expect(polish.pluralCategory(by: 1) == .one)
        #expect(polish.pluralCategory(by: 2) == .few)
        #expect(polish.pluralCategory(by: 5) == .many)
        #expect(polish.pluralCategory(by: 1.5) == .other)
        
        let portuguese = Locale(tag: "pt-PT")
        
        #expect(portuguese.pluralCategory(by: 1) == .one)
        #expect(portuguese.pluralCategory(by: 1.5) == .one)
        #expect(portuguese.pluralCategory(by: 1000000) == .many)
        #expect(portuguese.pluralCategory(by: 2) == .other)
        #expect(portuguese.pluralCategory(by: 2.0) == .other)
        
        let romanian = Locale(tag: "ro-RO")
        
        #expect(romanian.pluralCategory(by: 1) == .one)
        #expect(romanian.pluralCategory(by: 2) == .few)
        #expect(romanian.pluralCategory(by: 1.5) == .few)
        #expect(romanian.pluralCategory(by: 20) == .other)
        
        let russian = Locale(tag: "ru-RU")
        
        #expect(russian.pluralCategory(by: 1) == .one)
        #expect(russian.pluralCategory(by: 2) == .few)
        #expect(russian.pluralCategory(by: 5) == .many)
        #expect(russian.pluralCategory(by: 1.5) == .other)
        
        let serbian = Locale(tag: "sr-RS")
        
        #expect(serbian.pluralCategory(by: 1) == .one)
        #expect(serbian.pluralCategory(by: 0.1) == .one)
        #expect(serbian.pluralCategory(by: 2) == .few)
        #expect(serbian.pluralCategory(by: 0.2) == .few)
        #expect(serbian.pluralCategory(by: 5) == .other)
        #expect(serbian.pluralCategory(by: 0.5) == .other)
        
        let slovak = Locale(tag: "sk-SK")
        
        #expect(slovak.pluralCategory(by: 1) == .one)
        #expect(slovak.pluralCategory(by: 2) == .few)
        #expect(slovak.pluralCategory(by: 1.5) == .many)
        #expect(slovak.pluralCategory(by: 5) == .other)
        
        let slovenian = Locale(tag: "sl-SI")
        
        #expect(slovenian.pluralCategory(by: 1) == .one)
        #expect(slovenian.pluralCategory(by: 2) == .two)
        #expect(slovenian.pluralCategory(by: 3) == .few)
        #expect(slovenian.pluralCategory(by: 1.5) == .few)
        #expect(slovenian.pluralCategory(by: 5) == .other)
        
        let spanish = Locale(tag: "es-ES")
        
        #expect(spanish.pluralCategory(by: 1) == .one)
        #expect(spanish.pluralCategory(by: 1.0) == .one)
        #expect(spanish.pluralCategory(by: 1000000) == .many)
        #expect(spanish.pluralCategory(by: 0.9) == .other)
        
        let swedish = Locale(tag: "sv-SE")
        
        #expect(swedish.pluralCategory(by: 1) == .one)
        #expect(swedish.pluralCategory(by: 2) == .other)
        #expect(swedish.pluralCategory(by: 1.5) == .other)
        
        let turkish = Locale(tag: "tr-TR")
        
        #expect(turkish.pluralCategory(by: 1) == .one)
        #expect(turkish.pluralCategory(by: 1.0) == .one)
        #expect(turkish.pluralCategory(by: 2) == .other)
        #expect(turkish.pluralCategory(by: 0.9) == .other)
        
        let ukrainian = Locale(tag: "uk-UA")
        
        #expect(ukrainian.pluralCategory(by: 1) == .one)
        #expect(ukrainian.pluralCategory(by: 2) == .few)
        #expect(ukrainian.pluralCategory(by: 5) == .many)
        #expect(ukrainian.pluralCategory(by: 1.5) == .other)
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
