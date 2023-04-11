import XCTest
import HTMLKit
import HTMLKitComponents

final class ComponentTests: XCTestCase {
    
    struct TestView: View {
        
        @ContentBuilder<Content> var body: Content
    }
    
    let renderer = Renderer()
    
    func testLinkButton() throws {
        
        let view = TestView {
            LinkButton(destination: "uri") {
                "Button"
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <a href="uri" target="_self" class="button" role="button">Button</a>
                       """
        )
    }
    
    func testButton() throws {
        
        let view = TestView {
            Button(role: .button) {
                "Button"
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <button type="button" class="button">Button</button>
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
    
    func testGrid() throws {
        
        let view = TestView {
            Grid {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <ul class="grid ratio:50"></ul>
                       """
        )
    }
    
    func testGridItem() throws {
        
        let view = TestView {
            GridItem {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <li class="grid-item"></li>
                       """
        )
    }
    
    func testForm() throws {
        
        let view = TestView {
            Form(method: .post) {
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
                       <input type="text" id="name" name="name" class="textfield">
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
                       <textarea id="name" name="name" class="texteditor" rows="1">value</textarea>
                       """
        )
    }

    func testSlider() throws {
        
        let view = TestView {
            Slider(name: "name")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <input type="range" id="name" name="name" class="slider">
                       """
        )
    }
  
    func testDatePicker() throws {
        
        let view = TestView {
            DatePicker(name: "name")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <input type="date" id="name" name="name" class="datepicker">
                       """
        )
    }
  
    func testSecureField() throws {
        
        let view = TestView {
            SecureField(name: "password")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <input type="password" id="password" name="password" class="securefield">
                       """
        )
    }
    
    func testCheckField() throws {
        
        let view = TestView {
            CheckField(name: "name", value: "value")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <input type="checkbox" id="name" name="name" value="value" class="checkfield">
                       """
        )
    }
    
    func testRadioSelect() throws {
        
        let view = TestView {
            RadioSelect(name: "name", value: "value")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <input type="radio" id="name" name="name" value="value" class="radioselect">
                       """
        )
    }
    
    func testSelectField() throws {
        
        let view = TestView {
            SelectField(name: "name") {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <div class="selectfield">\
                       <input type="text" id="name" name="name" class="selectfield-textfield">\
                       <div class="selectfield-optionlist"></div>\
                       </div>
                       """
        )
    }
    
    func testImage() throws {
        
        let view = TestView {
            Image(source: "source")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <img src="source" role="img" class="image">
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
                "Link"
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <a href="uri" target="_self" class="link">Link</a>
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
                "Text"
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <p class="text">Text</p>
                       """
        )
    }
    
    func testProgress() throws {
        
        let view = TestView {
            Progress(maximum: 100, value: 10) {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <progress value="10.0" max="100.0" class="progress"></progress>
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
    
    func testCard() throws {
        
        let view = TestView {
            Card {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <div class="card">\
                       <div class="card-header"></div>\
                       <div class="card-body"></div>\
                       </div>
                       """
        )
    }
    
    func testCarousel() throws {
        
        let view = TestView {
            Carousel {
            } indication: {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <div class="carousel">\
                       <div class="carousel-content"></div>\
                       <div class="carousel-indication"></div>\
                       </div>
                       """
        )
    }
    
    func testSlide() throws {
        
        let view = TestView {
            Slide(source: "#") {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <div class="slide">\
                       <div class="slide-thumbnail">\
                       <img src="#">\
                       </div>\
                       <div class="slide-caption"></div>\
                       </div>
                       """
        )
    }
    
    func testIndicator() throws {
        
        let view = TestView {
            Indicator(for: "example")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <a class="indicator" href="#example"></a>
                       """
        )
    }
    
    func testDropdown() throws {
        
        let view = TestView {
            Dropdown {
            } label: {
            }

        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <div class="dropdown" tabindex="1">\
                       <div class="dropdown-label">\
                       </div>\
                       <div class="dropdown-content"></div>\
                       </div>
                       """
        )
    }
    
    func testModal() throws {
        
        let view = TestView {
            Modal {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <dialog class="modal"></dialog>
                       """
        )
    }
    
    func testScrollView() throws {
        
        let view = TestView {
            ScrollView(direction: .horizontal) {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <div class="scrollview direction:horizontal"></div>
                       """
        )
    }
    
    func testSymbol() throws {
        
        let view = TestView {
            Symbol(system: "folder")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <svg viewbox="0 0 20 16" fill="currentColor" class="symbol">\
                       <path d="M2,12L2,4C2,2.896 2.896,2 4,2L6.923,2C6.966,2 7.009,2.006 7.05,2.017C7.062,2.021 7.074,2.025 7.086,2.031C7.255,2.117 9,3 9,3L16,3C17.104,3 18,3.896 18,5L18,12C18,13.104 17.104,14 16,14L4,14C2.896,14 2,13.104 2,12ZM16.5,6L16.5,5C16.5,4.724 16.276,4.5 16,4.5L9.084,4.5C9.039,4.5 8.75,4.512 8.616,4.506C8.566,4.495 8.518,4.478 8.473,4.454C8.106,4.267 6.644,3.505 6.644,3.505L4,3.5C3.724,3.5 3.5,3.724 3.5,4L3.5,6L16.5,6ZM3.5,7.5L3.5,12C3.5,12.276 3.724,12.5 4,12.5L16,12.5C16.276,12.5 16.5,12.276 16.5,12L16.5,7.5L3.5,7.5Z"></path>\
                       </svg>
                       """
        )
    }
}
