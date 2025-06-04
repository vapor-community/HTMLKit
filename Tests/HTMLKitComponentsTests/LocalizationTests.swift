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
                       <p class="text alignment:leading weight:bold foreground:red">Envoyer le formulaire</p>
                       """
        )
    }
    
    func testFieldLabelLocalization() throws {
        
        let view = TestView {
            FieldLabel("Password", for: "password")
        }
        
        XCTAssertEqual(try renderer!.render(view: view),
                       """
                       <label for="password" class="label">Mot de passe</label>
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
