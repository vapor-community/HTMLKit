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
    
    func testDisclosureLocalization() throws {
        
        let view = TestView {
            Disclosure("Forgot password?") {
            }
        }
        
        XCTAssertEqual(try renderer!.render(view: view),
                       """
                       <div class="disclosure">\
                       <div class="disclosure-head">\
                       <p class="disclosure-label">Mot de passe oublié?</p>\
                       <svg viewbox="0 0 20 16" xmlns="http://www.w3.org/2000/svg" class="state-indicator">\
                       <path d="M7.28,2.241C6.987,1.957 6.987,1.497 7.28,1.213C7.573,0.929 8.048,0.929 8.341,1.213L14.811,7.486C15.103,7.77 15.103,8.23 14.811,8.514L8.28,14.787C7.987,15.071 7.512,15.071 7.22,14.787C6.927,14.503 6.927,14.043 7.22,13.759L13.22,8L7.28,2.241Z">\
                       <title>state indicator</title>\
                       </path>\
                       </svg>\
                       </div>\
                       <div class="disclosure-body">\
                       <div class="disclosure-content"></div>\
                       </div>\
                       </div>
                       """
        )
    }

    func testCheckFieldLocalization() throws {
        
        let view = TestView {
            CheckField("Password", value: "password")
        }
        
        XCTAssertEqual(try renderer!.render(view: view),
                       """
                       <div class="checkfield">\
                       <input type="checkbox" value="password" class="checkinput">\
                       <label>Mot de passe</label>\
                       </div>
                       """
        )
    }
    
    func testRadioSelectLocalization() throws {
        
        let view = TestView {
            RadioSelect("Password", value: "password")
        }
        
        XCTAssertEqual(try renderer!.render(view: view),
                       """
                       <div class="radioselect">\
                       <input type="radio" value="password" class="radioinput">\
                       <label>Mot de passe</label>\
                       </div>
                       """
        )
    }
    
    func testPromptLocalization() throws {
        
        let view = TestView {
            TextField(name: "password", prompt: "Password")
        }
        
        XCTAssertEqual(try renderer!.render(view: view),
                       """
                       <input type="text" name="password" class="textfield" placeholder="Mot de passe">
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
