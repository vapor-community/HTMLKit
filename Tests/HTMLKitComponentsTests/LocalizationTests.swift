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
    
    func testButtonLocalization() throws {
        
        let view = TestView {
            Button("Create", role: .submit)
            Button(role: .submit) {
            }
            .accessibilityLabel("Create")
            Button(role: .submit) {
            }
            .accessibilityLabel(verbatim: "Create")
        }
        
        XCTAssertEqual(try renderer!.render(view: view),
                       """
                       <button type="submit" class="button">Créer</button>\
                       <button type="submit" class="button" aria-label="Créer"></button>\
                       <button type="submit" class="button" aria-label="Create"></button>
                       """
        )
    }
    
    func testLinkLocalization() throws {
        
        let view = TestView {
            LinkButton("Create", destination: "#")
        }
        
        XCTAssertEqual(try renderer!.render(view: view),
                       """
                       <a href="#" target="_self" class="button" role="button">Créer</a>
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
    
    func testImageLocalization() throws {
        
        let view = TestView {
            Image(source: "/")
                .accessibilityLabel("Profile Avatar")
            Image(source: "/")
                .accessibilityLabel(verbatim: "Profile Avatar")
        }
        
        XCTAssertEqual(try renderer!.render(view: view),
                       """
                       <img src="/" class="image" alt="Avatar de profil">\
                       <img src="/" class="image" alt="Profile Avatar">
                       """
        )
    }
    
    func testVideoLocalization() throws {
        
        let view = TestView {
            Video(source: "/")
                .accessibilityLabel("Group Interview")
            Video(source: "/")
                .accessibilityLabel(verbatim: "Group Interview")
        }
        
        XCTAssertEqual(try renderer!.render(view: view),
                       """
                       <video src="/" controls="controls" class="video" aria-label="Entretien collectif"></video>\
                       <video src="/" controls="controls" class="video" aria-label="Group Interview"></video>
                       """
        )
    }
    
    func testSymbolLocalization() throws {
        
        let view = TestView {
            Symbol(system: .folder)
                .accessibilityLabel("Folder")
            Symbol(system: .folder)
                .accessibilityLabel(verbatim: "Folder")
        }
        
        XCTAssertEqual(try renderer!.render(view: view),
                       """
                       <svg viewbox="0 0 20 16" class="symbol" role="img">\
                       <title>Dossier</title>\
                       <path d="M2,12L2,4C2,2.896 2.896,2 4,2L6.923,2C6.966,2 7.009,2.006 7.05,2.017C7.062,2.021 7.074,2.025 7.086,2.031C7.255,2.117 9,3 9,3L16,3C17.104,3 18,3.896 18,5L18,12C18,13.104 17.104,14 16,14L4,14C2.896,14 2,13.104 2,12ZM16.5,6L16.5,5C16.5,4.724 16.276,4.5 16,4.5L9.084,4.5C9.039,4.5 8.75,4.512 8.616,4.506C8.566,4.495 8.518,4.478 8.473,4.454C8.106,4.267 6.644,3.505 6.644,3.505L4,3.5C3.724,3.5 3.5,3.724 3.5,4L3.5,6L16.5,6ZM3.5,7.5L3.5,12C3.5,12.276 3.724,12.5 4,12.5L16,12.5C16.276,12.5 16.5,12.276 16.5,12L16.5,7.5L3.5,7.5Z"></path>\
                       </svg>\
                       <svg viewbox="0 0 20 16" class="symbol" role="img">\
                       <title>Folder</title>\
                       <path d="M2,12L2,4C2,2.896 2.896,2 4,2L6.923,2C6.966,2 7.009,2.006 7.05,2.017C7.062,2.021 7.074,2.025 7.086,2.031C7.255,2.117 9,3 9,3L16,3C17.104,3 18,3.896 18,5L18,12C18,13.104 17.104,14 16,14L4,14C2.896,14 2,13.104 2,12ZM16.5,6L16.5,5C16.5,4.724 16.276,4.5 16,4.5L9.084,4.5C9.039,4.5 8.75,4.512 8.616,4.506C8.566,4.495 8.518,4.478 8.473,4.454C8.106,4.267 6.644,3.505 6.644,3.505L4,3.5C3.724,3.5 3.5,3.724 3.5,4L3.5,6L16.5,6ZM3.5,7.5L3.5,12C3.5,12.276 3.724,12.5 4,12.5L16,12.5C16.276,12.5 16.5,12.276 16.5,12L16.5,7.5L3.5,7.5Z"></path>\
                       </svg>
                       """
        )
    }
    
    func testBarMarkLocalization() throws {
        
        let view = TestView {
            BarMark("Folder", value: 941)
        }
        
        XCTAssertEqual(try renderer!.render(view: view),
                       """
                       <g class="mark type:bar">\
                       <rect>941</rect>\
                       <text class="mark-label">Dossier</text>\
                       </g>
                       """)
    }
}

extension LocalizationTests {
    
    func setupLocalization() throws {
        
        guard let source = Bundle.module.url(forResource: "Localization", withExtension: nil) else {
            return
        }
        
        let localization = Localization(source: source, locale: Locale(tag: "fr"))
        
        self.renderer = Renderer(localization: localization)
    }
}
