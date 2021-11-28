import HTMLKit
import XCTest

final class LocalizationTests: XCTestCase {
    
    struct TestPage: Page {

        @ContentBuilder<AnyContent> var body: AnyContent
    }
    
    var renderer = Renderer()
    
    override func setUp() {
        super.setUp()
        
        try! setupLocalization()
    }
    
    func testLocalization() throws {
        
        let view = TestPage {
            Heading1 {
                "Text"
            }
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

extension LocalizationTests {
    
    static var allTests = [
        ("testLocalization", testLocalization)
    ]
}
