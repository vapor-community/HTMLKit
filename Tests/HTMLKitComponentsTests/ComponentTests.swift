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
                       <a href="uri" class="button" role="button">Button</a>
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
    
    func testSelectField() throws {
        
        let view = TestView {
            SelectField(name: "name") {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <select id="name" name="name" class="input type:selectfield">\
                       </select>
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
                "Link"
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <a href="uri" class="link">Link</a>
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
                       </div>\
                       <script>\
                       new Carousel();\
                       </script>
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
                       <svg width="16" height="16" viewbox="0 0 16 16" fill="currentColor" class="symbol">\
                       <rect id="Folder_16x16" x="0" y="0" width="16" height="16" style="fill:none;"></rect>\
                       <clipPath id="_clip1">\
                       <rect id="Folder_16x16" x="0" y="0" width="16" height="16"></rect>\
                       </clipPath>\
                       <g clip-path="url(#_clip1)">\
                       <path d="M16,5L16,13C16,13.552 15.552,14 15,14L1,14C0.448,14 0,13.552 0,13L0,3C0,2.448 0.448,2 1,2L6.586,2C6.851,2 7.105,2.105 7.293,2.293L9,4L15,4C15.265,4 15.52,4.105 15.707,4.293C15.895,4.48 16,4.735 16,5ZM1.5,3.5L1.5,12.5L14.5,12.5L14.5,5.5L9,5.5C8.602,5.5 8.221,5.342 7.939,5.061L6.379,3.5L1.5,3.5Z">\
                       </path>\
                       </g>\
                       </svg>
                       """
        )
    }
}
