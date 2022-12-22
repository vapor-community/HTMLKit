/*
 Abstract:
 The file tests the localization.
 */

import HTMLKit
import Lingo
import XCTest

final class LocalizationTests: XCTestCase {
    
    struct TestView: View {

        @ContentBuilder<AnyContent> var body: AnyContent
    }
    
    var renderer: Renderer?
    
    override func setUp() {
        super.setUp()
        
        try! setupLocalization()
    }
    
    func testLocalization() throws {
        
        let view = TestView {
            Heading1("Hallo Welt")
        }
        
        XCTAssertEqual(renderer!.render(view: view),
                       """
                       <h1>Hello World</h1>
                       """
        )
    }
    
    func testEnvironmentLocale() throws {
        
        let view = TestView {
            Heading1("Hallo Welt")
        }
        
        XCTAssertEqual(renderer!.render(view: view),
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
        
        let lingo = try! Lingo(rootPath: currentDirectory.path, defaultLocale: "en")
        
        self.renderer = Renderer(lingo: lingo)
    }
}
