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
        
        let page = TestPage {
            Heading1("Hallo Welt")
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
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
        
        try renderer.add(localization: .init(source: currentDirectory.path, locale: .english))
    }
}
