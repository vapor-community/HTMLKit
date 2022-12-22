import XCTest
import HTMLKit
@testable import HTMLKitComponents

final class ComponentTests: XCTestCase {
    
    struct TestPage: Page {
        
        @ContentBuilder<AnyContent> var body: AnyContent
    }
    
    let renderer = Renderer()
    
    func testActionButton() throws {
        
        let page = TestPage {
            ActionButton(destination: "uri") {
                "Button"
            }
        }
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <a href="uri" class="button" role="button">Button</a>
                       """
        )
    }
    
    func testGroup() throws {
        
        let page = TestPage {
            HTMLKitComponents.Group {
            }
        }
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <div class="group"></div>
                       """
        )
    }
    
    func testCollection() throws {
        
        let page = TestPage {
            Collection {
            }
        }
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <ul class="collection ratio:50"></ul>
                       """
        )
    }
    
    func testCollectionItem() throws {
        
        let page = TestPage {
            CollectionItem {
            }
        }
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <li class="collection-item"></li>
                       """
        )
    }
    
    func testFormContainer() throws {
        
        let page = TestPage {
            HTMLKitComponents.Form {
            }
        }
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <form method="post" class="form"></form>
                       """
        )
    }
    
    func testFieldLabel() throws {
        
        let page = TestPage {
            FieldLabel(for: "name") {
                "Name"
            }
        }
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <label for="name" class="label">Name</label>
                       """
        )
    }
    
    func testTextField() throws {
        
        let page = TestPage {
            TextField(name: "name")
        }
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <input type="text" id="name" name="name" class="input type:textfield">
                       """
        )
    }
    
    func testTextEditor() throws {
        
        let page = TestPage {
            TextEditor(name: "name") {
                "value"
            }
        }
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <textarea id="name" name="name" class="input type:texteditor" rows="1">value</textarea>
                       """
        )
    }

    func testSlider() throws {
        
        let page = TestPage {
            Slider(name: "name")
        }
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <input type="range" id="name" name="name" class="input type:slider">
                       """
        )
    }
  
    func testDatePicker() throws {
        
        let page = TestPage {
            DatePicker(name: "name")
        }
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <input type="date" id="name" name="name" class="input type:datepicker">
                       """
        )
    }
  
    func testSecureField() throws {
        
        let page = TestPage {
            SecureField(name: "password")
        }
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <input type="password" id="password" name="password" class="input type:securefield">
                       """
        )
    }
    
    func testCheckField() throws {
        
        let page = TestPage {
            CheckField(name: "name", value: "value")
        }
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <input type="checkbox" id="name" name="name" value="value" class="input type:checkfield">
                       """
        )
    }
    
    func testRadioSelect() throws {
        
        let page = TestPage {
            RadioSelect(name: "name", value: "value")
        }
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <input type="radio" id="name" name="name" value="value" class="input type:radioselect">
                       """
        )
    }
    
    func testImage() throws {
        
        let page = TestPage {
            Image(source: "source")
        }
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <div class="image">\
                       <img src="source" role="img">\
                       </div>
                       """
        )
    }
    
    func testList() throws {
        
        let page = TestPage {
            List(direction: .vertical) {
            }
        }
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <ul class="list direction:vertical"></ul>
                       """
        )
    }
    
    func testListRow() throws {
        
        let page = TestPage {
            ListRow {
            }
        }
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <li class="list-row"></li>
                       """
        )
    }
    
    func testLink() throws {
        
        let page = TestPage {
            Link(destination: "uri") {
                "link"
            }
        }
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <a href="uri" class="link">link</a>
                       """
        )
    }
    
    func testVStack() throws {
        
        let page = TestPage {
            VStack {
            }
        }
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <div class="vstack alignment:leading"></div>
                       """
        )
    }
    
    func testHStack() throws {
        
        let page = TestPage {
            HStack {
            }
        }
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <div class="hstack alignment:center"></div>
                       """
        )
    }

    func testZStack() throws {
        
        let page = TestPage {
            ZStack {
            }
        }
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <div class="zstack"></div>
                       """
        )
    }
    
    
    func testStackColumn() throws {
        
        let page = TestPage {
            StackColumn(size: .twelve) {
            }
        }
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <div class="stack-column size:12"></div>
                       """
        )
    }
    
    func testText() throws {
       
        let page = TestPage {
            Text {
            }
            .fontSize(.large)
            .fontTransformation(.uppercase)
            .foregroundColor(.blue)
            .bold()
        }
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <p class="text size:large transformation:uppercase color:blue weight:bold"></p>
                       """
        )
    }
    
    func testProgressView() throws {
        
        let page = TestPage {
            ProgressView(name: "name") {
            }
        }
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <progress class="progress"></progress>
                       """
        )
    }
    
    func testSnippet() throws {
        
        let page = TestPage {
            Snippet(highlight: .html) {
                """
                <div>
                <h3>headline</h3>
                </div>
                """
            }
        }
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <pre class="snippet hightlight:html">\
                       <p>&lt;div&gt;</p>\
                       <p>&lt;h3&gt;headline&lt;/h3&gt;</p>\
                       <p>&lt;/div&gt;</p>\
                       </pre>
                       """
        )
    }
    
    func testToggle() throws {
        
        let page = TestPage {
            Toggle(name: "name")
        }
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <label tabindex="0" class="toggle">\
                       <input type="checkbox" id="name" name="name">\
                       <div class="toggle-slider"></div>\
                       </label>
                       """
        )
    }
}
