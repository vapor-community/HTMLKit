import XCTest
import HTMLKit
@testable import HTMLKitComponents

final class ComponentTests: XCTestCase {
    
    struct TestPage: Page {
        
        @ContentBuilder<AnyContent> var body: AnyContent
    }
    
    let renderer = Renderer()
    
    func testActionButton() throws {
        
        let view = TestPage {
            ActionButton(destination: "uri") {
                "Button"
            }
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <a href="uri" class="button" role="button">Button</a>
                       """
        )
    }
    
    func testGroup() throws {
        
        let view = TestPage {
            HTMLKitComponents.Group {
            }
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <div class="group"></div>
                       """
        )
    }
    
    func testCollection() throws {
        
        let view = TestPage {
            Collection {
            }
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <ul class="collection ratio:50"></ul>
                       """
        )
    }
    
    func testCollectionItem() throws {
        
        let view = TestPage {
            CollectionItem {
            }
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <li class="collection-item"></li>
                       """
        )
    }
    
    func testFormContainer() throws {
        
        let view = TestPage {
            HTMLKitComponents.Form {
            }
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <form method="post" class="form"></form>
                       """
        )
    }
    
    func testFieldLabel() throws {
        
        let view = TestPage {
            FieldLabel(for: "name") {
                "Name"
            }
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <label for="name" class="label">Name</label>
                       """
        )
    }
    
    func testTextField() throws {
        
        let view = TestPage {
            TextField(name: "name")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <input type="text" id="name" name="name" class="input type:textfield">
                       """
        )
    }
    
    func testTextEditor() throws {
        
        let view = TestPage {
            TextEditor(name: "name") {
                "value"
            }
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <textarea id="name" name="name" class="input type:texteditor" rows="1">value</textarea>
                       """
        )
    }

    func testSlider() throws {
        
        let view = TestPage {
            Slider(name: "name")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <input type="range" id="name" name="name" class="input type:slider">
                       """
        )
    }
  
    func testDatePicker() throws {
        
        let view = TestPage {
            DatePicker(name: "name")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <input type="date" id="name" name="name" class="input type:datepicker">
                       """
        )
    }
  
    func testSecureField() throws {
        
        let view = TestPage {
            SecureField(name: "password")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <input type="password" id="password" name="password" class="input type:securefield">
                       """
        )
    }
    
    func testCheckField() throws {
        
        let view = TestPage {
            CheckField(name: "name", value: "value")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <input type="checkbox" id="name" name="name" value="value" class="input type:checkfield">
                       """
        )
    }
    
    func testRadioSelect() throws {
        
        let view = TestPage {
            RadioSelect(name: "name", value: "value")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <input type="radio" id="name" name="name" value="value" class="input type:radioselect">
                       """
        )
    }
    
    func testImage() throws {
        
        let view = TestPage {
            Image(source: "source")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <div class="image">\
                       <img src="source" role="img">\
                       </div>
                       """
        )
    }
    
    func testList() throws {
        
        let view = TestPage {
            List(direction: .vertical) {
            }
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <ul class="list direction:vertical"></ul>
                       """
        )
    }
    
    func testListRow() throws {
        
        let view = TestPage {
            ListRow {
            }
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <li class="list-row"></li>
                       """
        )
    }
    
    func testLink() throws {
        
        let view = TestPage {
            Link(destination: "uri") {
                "link"
            }
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <a href="uri" class="link">link</a>
                       """
        )
    }
    
    func testVStack() throws {
        
        let view = TestPage {
            VStack {
            }
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <div class="vstack alignment:leading"></div>
                       """
        )
    }
    
    func testHStack() throws {
        
        let view = TestPage {
            HStack {
            }
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <div class="hstack alignment:center"></div>
                       """
        )
    }

    func testZStack() throws {
        
        let view = TestPage {
            ZStack {
            }
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <div class="zstack"></div>
                       """
        )
    }
    
    
    func testStackColumn() throws {
        
        let view = TestPage {
            StackColumn(size: .twelve) {
            }
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <div class="stack-column size:12"></div>
                       """
        )
    }
    
    func testText() throws {
       
        let view = TestPage {
            Text {
            }
            .fontSize(.large)
            .fontTransformation(.uppercase)
            .foregroundColor(.blue)
            .bold()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <p class="text size:large transformation:uppercase color:blue weight:bold"></p>
                       """
        )
    }
    
    func testProgressView() throws {
        
        let view = TestPage {
            ProgressView(name: "name") {
            }
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <progress class="progress"></progress>
                       """
        )
    }
    
    func testSnippet() throws {
        
        let view = TestPage {
            Snippet(highlight: .html) {
                """
                <div>
                <h3>headline</h3>
                </div>
                """
            }
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
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
        
        let view = TestPage {
            Toggle(name: "name")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <label tabindex="0" class="toggle">\
                       <input type="checkbox" id="name" name="name">\
                       <div class="toggle-slider"></div>\
                       </label>
                       """
        )
    }
}
