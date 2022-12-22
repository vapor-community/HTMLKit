import XCTest
import HTMLKit
@testable import HTMLKitComponents

final class ComponentTests: XCTestCase {
    
    struct TestView: View {
        
        @ContentBuilder<AnyContent> var body: AnyContent
    }
    
    let renderer = Renderer()
    
    func testActionButton() throws {
        
        let view = TestView {
            ActionButton(destination: "uri") {
                "Button"
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <a href="uri" class="button" role="button">Button</a>
                       """
        )
    }
    
    func testGroup() throws {
        
        let view = TestView {
            HTMLKitComponents.Group {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <div class="group"></div>
                       """
        )
    }
    
    func testCollection() throws {
        
        let view = TestView {
            Collection {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <ul class="collection ratio:50"></ul>
                       """
        )
    }
    
    func testCollectionItem() throws {
        
        let view = TestView {
            CollectionItem {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <li class="collection-item"></li>
                       """
        )
    }
    
    func testFormContainer() throws {
        
        let view = TestView {
            HTMLKitComponents.Form {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <form method="post" class="form"></form>
                       """
        )
    }
    
    func testFieldLabel() throws {
        
        let view = TestView {
            FieldLabel(for: "name") {
                "Name"
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <label for="name" class="label">Name</label>
                       """
        )
    }
    
    func testTextField() throws {
        
        let view = TestView {
            TextField(name: "name")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <input type="text" id="name" name="name" class="input type:textfield">
                       """
        )
    }
    
    func testTextEditor() throws {
        
        let view = TestView {
            TextEditor(name: "name") {
                "value"
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <textarea id="name" name="name" class="input type:texteditor" rows="1">value</textarea>
                       """
        )
    }

    func testSlider() throws {
        
        let view = TestView {
            Slider(name: "name")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <input type="range" id="name" name="name" class="input type:slider">
                       """
        )
    }
  
    func testDatePicker() throws {
        
        let view = TestView {
            DatePicker(name: "name")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <input type="date" id="name" name="name" class="input type:datepicker">
                       """
        )
    }
  
    func testSecureField() throws {
        
        let view = TestView {
            SecureField(name: "password")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <input type="password" id="password" name="password" class="input type:securefield">
                       """
        )
    }
    
    func testCheckField() throws {
        
        let view = TestView {
            CheckField(name: "name", value: "value")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <input type="checkbox" id="name" name="name" value="value" class="input type:checkfield">
                       """
        )
    }
    
    func testRadioSelect() throws {
        
        let view = TestView {
            RadioSelect(name: "name", value: "value")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <input type="radio" id="name" name="name" value="value" class="input type:radioselect">
                       """
        )
    }
    
    func testImage() throws {
        
        let view = TestView {
            Image(source: "source")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <div class="image">\
                       <img src="source" role="img">\
                       </div>
                       """
        )
    }
    
    func testList() throws {
        
        let view = TestView {
            List(direction: .vertical) {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <ul class="list direction:vertical"></ul>
                       """
        )
    }
    
    func testListRow() throws {
        
        let view = TestView {
            ListRow {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <li class="list-row"></li>
                       """
        )
    }
    
    func testLink() throws {
        
        let view = TestView {
            Link(destination: "uri") {
                "link"
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <a href="uri" class="link">link</a>
                       """
        )
    }
    
    func testVStack() throws {
        
        let view = TestView {
            VStack {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <div class="vstack alignment:leading"></div>
                       """
        )
    }
    
    func testHStack() throws {
        
        let view = TestView {
            HStack {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <div class="hstack alignment:center"></div>
                       """
        )
    }

    func testZStack() throws {
        
        let view = TestView {
            ZStack {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <div class="zstack"></div>
                       """
        )
    }
    
    
    func testStackColumn() throws {
        
        let view = TestView {
            StackColumn(size: .twelve) {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <div class="stack-column size:12"></div>
                       """
        )
    }
    
    func testText() throws {
       
        let view = TestView {
            Text {
            }
            .fontSize(.large)
            .fontTransformation(.uppercase)
            .foregroundColor(.blue)
            .bold()
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <p class="text size:large transformation:uppercase color:blue weight:bold"></p>
                       """
        )
    }
    
    func testProgressView() throws {
        
        let view = TestView {
            ProgressView(name: "name") {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <progress class="progress"></progress>
                       """
        )
    }
    
    func testSnippet() throws {
        
        let view = TestView {
            Snippet(highlight: .html) {
                """
                <div>
                <h3>headline</h3>
                </div>
                """
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
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
        
        let view = TestView {
            Toggle(name: "name")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <label tabindex="0" class="toggle">\
                       <input type="checkbox" id="name" name="name">\
                       <div class="toggle-slider"></div>\
                       </label>
                       """
        )
    }
}
