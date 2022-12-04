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
            Heading1("Hallo Welt")
        }
        
        renderer.add(view: view)
        
        XCTAssertEqual(renderer.render(view: view),
                       """
                       <h1>Hello World</h1>
                       """
        )
    }
    
    func testEnvironmentLocale() throws {
        
        let view = TestView {
            Heading1("Hallo Welt")
                .environment(locale: "fr")
        }
        
        renderer.add(view: view)
        
        XCTAssertEqual(renderer.render(view: view),
                       """
                       <h1>Bonjour le monde</h1>
                       """
        )
    }
}

extension LocalizationTests {
    
    func setupLocalization() throws {
        
        let currentFile = URL(fileURLWithPath: #file).deletingLastPathComponent()
        
        let currentDirectory = currentFile.appendingPathComponent("Localization")
        
        try renderer.add(localization: .init(source: currentDirectory.path, locale: .english))
    }
}
