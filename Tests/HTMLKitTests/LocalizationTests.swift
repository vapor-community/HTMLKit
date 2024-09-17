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
}

extension LocalizationTests {
    
    func setupLocalization() throws {
        
        let currentFile = URL(fileURLWithPath: #file).deletingLastPathComponent()
        
        let currentDirectory = currentFile.appendingPathComponent("Localization")
        
        let localization = Localization(source: currentDirectory, locale: Locale(tag: "en-GB"))
        
        self.renderer = Renderer(localization: localization)
    }
}
