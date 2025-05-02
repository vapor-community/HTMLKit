import HTMLKit
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
        
        XCTAssertEqual(try localization!.localize(string: .init(key: "hello.world")), "Hello World")
    }
    
    /// Tests the localization of a translation key in a specified translation table
    ///
    /// The test expects the key to exist in the specified translation table and to be rendered accurately.
    func testLocalizationWithTable() throws {
        
        XCTAssertEqual(try localization!.localize(string: .init(key: "hello.world", table: "web")), "Hello World")
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
            
            guard let localizationError = error as? Localization.Errors else {
                return XCTFail("Unexpected error type: \(error)")
            }
            
            XCTAssertEqual(localizationError, .missingKey("unknown.key", "en-GB"))
            XCTAssertEqual(localizationError.description, "Unable to find translation key 'unknown.key' for the locale 'en-GB'.")
        }
    }
    
    /// Tests the behavior when a translation table is missing.
    ///
    /// A table is considered as missing if there is no translation table for the given locale. In this case,
    /// the localization is expected to throw an error.
    func testMissingTable() throws {
        
        XCTAssertThrowsError(try localization!.localize(string: .init(key: "hello.world"), for: .init(tag: "unknown.tag"))) { error in
            
            guard let localizationError = error as? Localization.Errors else {
                return XCTFail("Unexpected error type: \(error)")
            }
            
            XCTAssertEqual(localizationError, .missingTable("unknown.tag"))
            XCTAssertEqual(localizationError.description, "Unable to find a translation table for the locale 'unknown.tag'.")
        }
    }
    
    /// Tests the behavior when a translation table is unknown.
    ///
    /// A table is considered as unknown if it cannot be found by the given table name. In this case,
    /// the localization is expected to throw an error.
    func testUnknownTable() throws {
        
        XCTAssertThrowsError(try localization!.localize(string: .init(key: "hello.world", table: "unknown.table"))) { error in
            
            guard let localizationError = error as? Localization.Errors else {
                return XCTFail("Unexpected error type: \(error)")
            }
            
            XCTAssertEqual(localizationError, .unknownTable("unknown.table", "en-GB"))
            XCTAssertEqual(localizationError.description, "Unable to find translation table 'unknown.table' for the locale 'en-GB'.")
        }
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
