import HTMLKit
import XCTest

final class LocalizationTests: XCTestCase {
    
    struct TestPage: HTMLPage {
        
        var content: HTMLContent
        
        var body: HTMLContent {
            content
        }
        
        init(@HTMLBuilder builder: () -> HTMLContent) {
            content = builder()
        }
    }
    
    var renderer = HTMLRenderer()
    
    override func setUp() {
        super.setUp()
        
        try! setupLocalization()
    }
    
    func testLocalization() throws {
        
        let view = TestPage {
            Heading1("Hallo Welt")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <h1>Hello World</h1>
                       """
        )
    }
}

extension LocalizationTests {
    
    func setupLocalization() throws {
        
        let currentFile = URL(fileURLWithPath: #file).deletingLastPathComponent()
        
        let currentDirectory = currentFile.appendingPathComponent("Localization")
        
        try renderer.registerLocalization(atPath: currentDirectory.path, defaultLocale: "en")
    }
}

