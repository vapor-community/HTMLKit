import HTMLKit
import XCTest

final class LocalizationTests: XCTestCase {
    
    struct TestPage: HTMLPage {
        
        var content: Content
        
        var body: Content {
            content
        }
        
        init(@ContentBuilder builder: () -> Content) {
            content = builder()
        }
    }
    
    var renderer = Renderer()
    
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

extension LocalizationTests {
    
    static var allTests = [
        ("testLocalization", testLocalization)
    ]
}
