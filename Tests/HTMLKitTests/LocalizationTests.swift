/*
 Abstract:
 The file tests the localization.
 */

import HTMLKit
import XCTest

final class LocalizationTests: XCTestCase {
    
    struct TestView: View {

        @ContentBuilder<Content> var body: Content
    }
    
    var renderer = Renderer()
    
    override func setUp() {
        super.setUp()
        
        try! setupLocalization()
    }
    
    func testLocalization() throws {
        
        let view = TestView {
            Heading1("greeting.world")
        }
        
        renderer.add(view: view)
        
        XCTAssertEqual(renderer.render(view: view),
                       """
                       <h1>Hello World</h1>
                       """
        )
    }
    
    func testLocalizationWithStringInterpolation() throws {

        struct TestContext: ViewModel {

            var name: String
        }
        
        struct TestView: View {

            @Context(TestContext.self)
            var context
            
            var body: Content {
                Heading1("greeting.person", with: $context.name)
            }
        }
        
        renderer.add(view: TestView())
        
        XCTAssertEqual(renderer.render(view: TestView(), with: TestContext(name: "Stephen")),
                       """
                       <h1>Hello Stephen</h1>
                       """
        )
    }
}

extension LocalizationTests {
    
    func setupLocalization() throws {
        
        let currentFile = URL(fileURLWithPath: #file).deletingLastPathComponent()
        
        let currentDirectory = currentFile.appendingPathComponent("Localization")

        try renderer.add(lingo: .init(rootPath: currentDirectory.path, defaultLocale: "en"))
    }
}
