/*
 Abstract:
 The file tests the localization.
 */

import HTMLKit
import Lingo
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
        
        struct TestContext: Encodable {

            var person: Person
        }
        
        struct Person: Encodable {
            
            var name: String
        }
        
        struct TestView: View {
            
            var context: TestContext
            
            var body: Content {
                Heading1("greeting.person", with: context.person)
            }
        }
        
        XCTAssertEqual(try renderer!.render(view: TestView(context: TestContext(person: Person(name: "John Doe")))),
                       """
                       <h1>Hello John Doe</h1>
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
                .environment(key: \.locale, value: "fr")
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
        
        let lingo = try! Lingo(rootPath: currentDirectory.path, defaultLocale: "en")
        
        self.renderer = Renderer(lingo: lingo)
    }
}
