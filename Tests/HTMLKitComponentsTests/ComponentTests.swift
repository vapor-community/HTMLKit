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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <label for="name" class="label">Name</label>
                       """
        )
    }
    
    func testTextField() throws {
        
        let page = TestPage {
            TextField(name: "name")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <textarea id="name" name="name" class="input type:texteditor" rows="1">value</textarea>
                       """
        )
    }

    func testSlider() throws {
        
        let page = TestPage {
            Slider(name: "name")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <input type="range" id="name" name="name" class="input type:slider">
                       """
        )
    }
  
    func testDatePicker() throws {
        
        let page = TestPage {
            DatePicker(name: "name")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <input type="date" id="name" name="name" class="input type:datepicker">
                       """
        )
    }
  
    func testSecureField() throws {
        
        let page = TestPage {
            SecureField(name: "password")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <input type="password" id="password" name="password" class="input type:securefield">
                       """
        )
    }
    
    func testCheckField() throws {
        
        let page = TestPage {
            CheckField(name: "name", value: "value")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <input type="checkbox" id="name" name="name" value="value" class="input type:checkfield">
                       """
        )
    }
    
    func testRadioSelect() throws {
        
        let page = TestPage {
            RadioSelect(name: "name", value: "value")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <input type="radio" id="name" name="name" value="value" class="input type:radioselect">
                       """
        )
    }
    
    func testImage() throws {
        
        let page = TestPage {
            Image(source: "source")
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
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
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <label tabindex="0" class="toggle">\
                       <input type="checkbox" id="name" name="name">\
                       <div class="toggle-slider"></div>\
                       </label>
                       """
        )
    }
}
