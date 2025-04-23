import HTMLKit
import XCTest

final class LocalizationTests: XCTestCase {
    
    var renderer: Renderer?
    
    override func setUp() {
        super.setUp()
        
        try! setupLocalization()
    }
    
    /// Tests the localization of a specified translation key
    ///
    /// The test expects the key to exist in the default translation table and to be rendered correctly.
    func testLocalization() throws {
        
        struct MainView: View {
            
            var body: Content {
                Heading1("hello.world")
            }
        }
        
        XCTAssertEqual(try renderer!.render(view: MainView()),
                       """
                       <h1>Hello World</h1>
                       """
        )
    }
    
    /// Tests the localization of a attribute
    ///
    /// The test expects the key to exist in the default translation table and to be rendered correctly.
    func testLocalizationAttribute() throws {
        
        struct TestView: View {
            
            var body: Content {
                Input()
                    .placeholder("hello.world", tableName: nil)
                    .alternate(LocalizedStringKey("hello.world"))
                    .value(LocalizedStringKey("hello.world"), tableName: "web")
                    .title("hello.world", tableName: "mobile")
                Meta()
                    .content("hello.world", tableName: nil)
            }
        }
        
        XCTAssertEqual(try renderer!.render(view: TestView()),
                       """
                       <input placeholder="Hello World" alt="Hello World" value="Hello World" title="Hello World">\
                       <meta content="Hello World">
                       """
        )
    }
    
    /// Tests the localization of string interpolation
    ///
    /// The test expects the key to exist in the default translation table and to be correctly formatted
    /// and rendered accurately.
    func testLocalizationWithStringInterpolation() throws {
        
        struct TestView: View {
            
            var body: Content {
                Paragraph("String: \("John Doe")")
                Paragraph("Integer: \(31)")
                Paragraph("Double: \(12.5)")
                Paragraph("Date: \(Date(timeIntervalSince1970: 50000))")
            }
        }
        
        XCTAssertEqual(try renderer!.render(view: TestView()),
                       """
                       <p>String: John Doe</p>\
                       <p>Integer: 31</p>\
                       <p>Double: 12.5</p>\
                       <p>Date: 01/01/1970</p>
                       """
        )
    }
    
    /// Tests the localization of string interpolation with multiple arguments and various data types
    ///
    /// The test expects the key to exist in the default translation table, to be correctly formatted
    /// with the arguments in the proper order, and to be rendered accurately.
    func testStringInterpolationWithMultipleArguments() throws {
        
        struct TestView: View {
            
            var body: Content {
                Paragraph("Hello \("Jane") and \("John Doe")")
                Paragraph("Do you \(2) have time at \(Date(timeIntervalSince1970: 50000))?")
                Paragraph("cheers.person \("Jean")")
            }
        }
        
        XCTAssertEqual(try renderer!.render(view: TestView()),
                       """
                       <p>Hello Jane and John Doe</p>\
                       <p>Do you 2 have time at 01/01/1970?</p>\
                       <p>Cheers Jean</p>
                       """
        )
    }
    
    /// Tests the localization of a translation key in a specified translation table
    ///
    /// The test expects the key to exist in the specified translation tabl and to be rendered accurately.
    func testLocaliationWithTable() throws {
        
        struct TestView: View {
            
            var body: Content {
                Paragraph("hello.world", tableName: "web")
            }
        }
        
        XCTAssertEqual(try renderer!.render(view: TestView()),
                       """
                       <p>Hello World</p>
                       """
        )
    }
    
    /// Tests the change of the locale by the environment modifier
    ///
    /// The test expects that the localization environment modifier correctly applies the locale
    /// down to nested views
    func testEnvironmentLocalization() throws {
        
        struct MainView: View {
            
            var content: [Content]
            
            init(@ContentBuilder<Content> content: () -> [Content]) {
                self.content = content()
            }
            
            var body: Content {
                Division {
                    content
                }
                .environment(key: \.locale, value: Locale(tag: .french))
            }
        }
        
        struct ChildView: View {
            
            var body: Content {
                MainView {
                    Heading1("hello.world")
                        .environment(key: \.locale)
                }
            }
        }
        
        XCTAssertEqual(try renderer!.render(view: ChildView()),
                       """
                       <div>\
                       <h1>Bonjour le monde</h1>\
                       </div>
                       """
        )
    }
    
    /// Tests the behavior when a localization key is missing
    ///
    /// A key is considered as missing if it cannot be found in the translation table. In this case,
    /// the renderer is expected to use the fallback literal string.
    func testMissingKey() throws {
        
        struct MainView: View {
            
            var body: Content {
                Heading1("unknown.key")
            }
        }
        
        XCTAssertEqual(try renderer!.render(view: MainView()),
                       """
                       <h1>unknown.key</h1>
                       """
        )
    }
    
    /// Tests the behavior when a translation table is missing
    ///
    /// A table is considered as missing if there is no translation table for the given locale. In this case,
    /// the renderer is expected to throw an error.
    func testMissingTable() throws {
        
        struct MainView: View {
            
            var body: Content {
                Division {
                    Heading1("greeting.world")
                        .environment(key: \.locale)
                }
                .environment(key: \.locale, value: Locale(tag: "unknown.tag"))
            }
        }
        
        XCTAssertThrowsError(try renderer!.render(view: MainView())) { error in
            
            guard let localizationError = error as? Localization.Errors else {
                return XCTFail("Unexpected error type: \(error)")
            }
            
            XCTAssertEqual(localizationError, .missingTable("unknown.tag"))
            XCTAssertEqual(localizationError.description, "Unable to find a translation table for the locale 'unknown.tag'.")
        }
    }
    
    /// Tests the behavior when a translation table is unknown
    ///
    /// A table is considered as unknown if it cannot be found by the given table name. In this case,
    /// the renderer is expected to throw an error.
    func testUnknownTable() throws {
        
        struct MainView: View {
            
            var body: Content {
                Heading1("greeting.world", tableName: "unknown.table")
            }
        }
        
        XCTAssertThrowsError(try renderer!.render(view: MainView())) { error in
            
            guard let localizationError = error as? Localization.Errors else {
                return XCTFail("Unexpected error type: \(error)")
            }
            
            XCTAssertEqual(localizationError, .unknownTable("unknown.table", "en-GB"))
            XCTAssertEqual(localizationError.description, "Unable to find translation table 'unknown.table' for the locale 'en-GB'.")
        }
    }
    
    /// Tests the recovery from a missing key
    ///
    /// The renderer should attempt a secondary lookup in the translation tables of the default locale.
    func testRecoveryFromMissingKey() throws {
        
        struct MainView: View {
            
            var content: [Content]
            
            init(@ContentBuilder<Content> content: () -> [Content]) {
                self.content = content()
            }
            
            var body: Content {
                Division {
                    content
                }
                .environment(key: \.locale, value: Locale(tag: .french))
            }
        }
        
        struct ChildView: View {
            
            var body: Content {
                MainView {
                    Heading1("Hello \("John Doe")")
                        .environment(key: \.locale)
                }
            }
        }
        
        XCTAssertEqual(try renderer!.render(view: ChildView()),
                       """
                       <div>\
                       <h1>Hello John Doe</h1>\
                       </div>
                       """
        )
    }
}

extension LocalizationTests {
    
    func setupLocalization() throws {
        
        guard let sourcePath = Bundle.module.url(forResource: "Localization", withExtension: nil) else {
            return
        }
        
        self.renderer = Renderer(localization: .init(source: sourcePath, locale: .init(tag: "en-GB")))
    }
}
