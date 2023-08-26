import XCTest
import HTMLKit
import HTMLKitComponents

final class LocalizationTests: XCTestCase {
    
    var renderer: Renderer?
    
    override func setUp() {
        super.setUp()
        
        try! setupLocalization()
    }
    
    struct TestView: View {
        
        @ContentBuilder<Content> var body: Content
    }
    
    func testTextLocalization() throws {
        
        let view = TestView {
            Text("button.submit")
                .bold()
                .foregroundColor(.red)
        }
        
        XCTAssertEqual(try renderer!.render(view: view),
                       """
                       <p class="text weight:bold color:red">Envoyer le formulaire</p>
                       """
        )
    }
}

extension LocalizationTests {
    
    func setupLocalization() throws {
        
        let currentFile = URL(fileURLWithPath: #file).deletingLastPathComponent()
        
        let currentDirectory = currentFile.appendingPathComponent("Localization")
        
        let localization = Localization(source: currentDirectory, locale: Locale(tag: "fr"))
        
        self.renderer = Renderer(localization: localization)
    }
}
