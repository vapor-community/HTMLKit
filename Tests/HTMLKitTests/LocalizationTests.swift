/*
 Abstract:
 The file tests the localization.
 */

import HTMLKit
import XCTest

final class LocalizationTests: XCTestCase {
    
    var renderer: Renderer?
    
    override func setUp() {
        super.setUp()
        
        try! setupLocalization()
    }
    
    func testLocalization() throws {
        
        struct MainView: View {
            
            var body: Content {
                Heading1("greeting.world")
            }
        }
        
        XCTAssertEqual(try renderer!.render(view: MainView()),
                       """
                       <h1>Hello World</h1>
                       """
        )
    }
    
    func testLocalizationWithStringInterpolation() throws {
        
        struct TestView: View {
            
            var body: Content {
                Heading1("greeting.person", interpolation: "John Doe")
            }
        }
        
        XCTAssertEqual(try renderer!.render(view: TestView()),
                       """
                       <h1>Hello John Doe</h1>
                       """
        )
    }
    
    func testStringInterpolationWithMultipleArguments() throws {
        
        struct TestView: View {
            
            var body: Content {
                Paragraph("personal.intro", interpolation: "John Doe", 31, "Mozart", 5, 21.5)
            }
        }
        
        XCTAssertEqual(try renderer!.render(view: TestView()),
                       """
                       <p>Hello, I am John Doe, and I am 31 years old. I have a dog named Mozart. He is 5 and 21.5 inches tall.</p>
                       """
        )
    }
    
    func testLocaliationWithTable() throws {
        
        struct TestView: View {
            
            var body: Content {
                Paragraph("personal.intro", tableName: "web", interpolation: "John Doe", 31, "Mozart", 5, 21.5)
            }
        }
        
        XCTAssertEqual(try renderer!.render(view: TestView()),
                       """
                       <p>Hello, I am John Doe, and I am 31 years old. I have a dog named Mozart. He is 5 and 21.5 inches tall.</p>
                       """
        )
    }
    
    
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
                    Heading1("greeting.world")
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
    /// the renderer is expected to throw an error.
    func testMissingKey() throws {
         
        struct MainView: View {
            
            var body: Content {
                Heading1("unknown.key")
            }
        }
        
        XCTAssertThrowsError(try renderer!.render(view: MainView())) { error in
            
            guard let localizationError = error as? Localization.Errors else {
                return XCTFail("Unexpected error type: \(error)")
            }
        
            XCTAssertEqual(localizationError, .missingKey("unknown.key"))
            XCTAssertEqual(localizationError.description, "Unable to find translation key 'unknown.key'.")
        }
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
            
            XCTAssertEqual(localizationError, .unknownTable("unknown.table"))
            XCTAssertEqual(localizationError.description, "Unable to find translation table 'unknown.table'.")
        }
    }
}

extension LocalizationTests {
    
    func setupLocalization() throws {
        
        let currentFile = URL(fileURLWithPath: #file).deletingLastPathComponent()
        
        let currentDirectory = currentFile.appendingPathComponent("Localization")
        
        let localization = Localization(source: currentDirectory, locale: Locale(tag: "en-GB"))
        
        self.renderer = Renderer(localization: localization)
    }
}
