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
            Grouping {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <div class="grouping"></div>
                       """
        )
    }
    
    func testGrid() throws {
        
        let view = TestView {
            Grid {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <div class="grid ratio:fit"></div>
                       """
        )
    }
    
    func testForm() throws {
        
        let view = TestView {
            Form(method: .post, encoding: .multipart) {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <form method="post" enctype="multipart/form-data" class="form"></form>
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
                       <input type="text" name="name" class="textfield">
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
                       <textarea name="name" class="texteditor" rows="3">value</textarea>
                       """
        )
    }

    func testSlider() throws {
        
        let view = TestView {
            Slider(name: "name")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <input type="range" name="name" class="slider">
                       """
        )
    }
  
    func testDatePicker() throws {
        
        let view = TestView {
            DatePicker(name: "name")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <div class="datepicker">\
                       <input type="text" class="datepicker-datefield" name="name">\
                       <div class="datepicker-calendar">\
                       <ul class="calendar-navigation">\
                       <li>\
                       <button type="button" value="previous">\
                       <svg viewbox="0 0 16 16" xmlns="http://www.w3.org/2000/svg" fill="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">\
                       <polyline points="10 2 4 8 10 14"></polyline>\
                       </svg>\
                       </button>\
                       </li>\
                       <li>\
                       <b class="calendar-detail"></b>\
                       </li>\
                       <li>\
                       <button type="button" value="next">\
                       <svg viewbox="0 0 16 16" xmlns="http://www.w3.org/2000/svg" fill="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">\
                       <polyline points="6 2 12 8 6 14"></polyline>\
                       </svg>\
                       </button>\
                       </li>\
                       </ul>\
                       <ul class="calendar-week">\
                       <li>Sun</li>\
                       <li>Mon</li>\
                       <li>Tue</li>\
                       <li>Wed</li>\
                       <li>Thu</li>\
                       <li>Fri</li>\
                       <li>Sat</li>\
                       </ul>\
                       <ul class="calendar-days"></ul>\
                       </div>\
                       </div>
                       """
        )
    }
  
    func testSecureField() throws {
        
        let view = TestView {
            SecureField(name: "password")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <input type="password" name="password" class="securefield">
                       """
        )
    }
    
    func testCheckField() throws {
        
        let view = TestView {
            Picker(name: "name", selection: "value") {
                CheckField(value: "value") {
                    "Label"
                }
                .tag("name")
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <div class="picker">\
                       <div class="checkfield">\
                       <input type="checkbox" value="value" checked="checked" class="checkinput" name="name" id="name">\
                       <label for="name">Label</label>\
                       </div>\
                       </div>
                       """
        )
    }
    
    func testRadioSelect() throws {
        
        let view = TestView {
            Picker(name: "name", selection: "value") {
                RadioSelect(value: "value") {
                    "Label"
                }
                .tag("name")
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <div class="picker">\
                       <div class="radioselect">\
                       <input type="radio" value="value" checked="checked" class="radioinput" name="name" id="name">\
                       <label for="name">Label</label>\
                       </div>\
                       </div>
                       """
        )
    }
    
    func testSelectField() throws {
        
        let view = TestView {
            SelectField(name: "name", selection: "value") {
                RadioSelect(value: "value") {
                    "Label"
                }
                .tag("name")
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <div class="selectfield">\
                       <input type="text" class="selectfield-textfield">\
                       <div class="selectfield-optionlist">\
                       <div class="radioselect">\
                       <input type="radio" value="value" checked="checked" class="radioinput" name="name" id="name">\
                       <label for="name">Label</label>\
                       </div>\
                       </div>\
                       </div>
                       """
        )
    }
    
    func testFileDialog() throws {
        
        let view = TestView {
            FileDialog(name: "avatar")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <input type="file" name="avatar" class="filedialog">
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
            List(direction: .vertical) {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <ul class="list direction:vertical"></ul>
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
            VStack {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <div class="vstack horizontal-alignment:leading"></div>
                       """
        )
    }
    
    func testHStack() throws {
        
        let view = TestView {
            HStack {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <div class="hstack vertical-alignment:center"></div>
                       """
        )
    }

    func testZStack() throws {
        
        let view = TestView {
            ZStack {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <div class="zstack"></div>
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
                       <p class="text alignment:leading">Text</p>
                       """
        )
    }
    
    func testProgress() throws {
        
        let view = TestView {
            Progress(value: 50, total: 100) {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <svg xmlns="https://www.w3.org/2000/svg" class="progress">\
                       <path class="mark">100.0</path>\
                       <path class="mark">50.0</path>\
                       </svg>
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
                       <pre class="snippet highlight:html">\
                       <p>&lt;div&gt;</p>\
                       <p>&lt;h3&gt;headline&lt;/h3&gt;</p>\
                       <p>&lt;/div&gt;</p>\
                       </pre>
                       """
        )
    }
    
    func testCard() throws {
        
        let view = TestView {
            Card {}
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
                Slide {}
                    .tag("slide")
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <div class="carousel">\
                       <div class="carousel-content">\
                       <div class="slide" id="slide"></div>\
                       </div>\
                       <div class="carousel-indication">\
                       <a class="indicator" href="#slide"></a>\
                       </div>\
                       </div>
                       """
        )
    }
    
    func testDropdown() throws {
        
        let view = TestView {
            Dropdown {} label: {}

        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <div class="dropdown">\
                       <div class="dropdown-label"></div>\
                       <div class="dropdown-content"></div>\
                       </div>
                       """
        )
    }
    
    func testModal() throws {
        
        let view = TestView {
            Modal {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <dialog class="modal"></dialog>
                       """
        )
    }
    
    func testScrollView() throws {
        
        let view = TestView {
            Scroll(showIndicators: false) {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <div class="scroll indicators:false"></div>
                       """
        )
    }
    
    func testSymbol() throws {
        
        let view = TestView {
            Symbol(system: .folder)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <svg viewbox="0 0 20 16" class="symbol">\
                       <path d="M2,12L2,4C2,2.896 2.896,2 4,2L6.923,2C6.966,2 7.009,2.006 7.05,2.017C7.062,2.021 7.074,2.025 7.086,2.031C7.255,2.117 9,3 9,3L16,3C17.104,3 18,3.896 18,5L18,12C18,13.104 17.104,14 16,14L4,14C2.896,14 2,13.104 2,12ZM16.5,6L16.5,5C16.5,4.724 16.276,4.5 16,4.5L9.084,4.5C9.039,4.5 8.75,4.512 8.616,4.506C8.566,4.495 8.518,4.478 8.473,4.454C8.106,4.267 6.644,3.505 6.644,3.505L4,3.5C3.724,3.5 3.5,3.724 3.5,4L3.5,6L16.5,6ZM3.5,7.5L3.5,12C3.5,12.276 3.724,12.5 4,12.5L16,12.5C16.276,12.5 16.5,12.276 16.5,12L16.5,7.5L3.5,7.5Z"></path>\
                       </svg>
                       """
        )
    }
    
    
    func testNavigation() throws {
        
        let view = TestView {
            HTMLKitComponents.Navigation {}
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <nav class="navigation"></nav>
                       """
        )
    }
    
    func testDisclosure() throws {
        
        let view = TestView {
            Disclosure("Label") {
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <div class="disclosure">\
                       <div class="disclosure-head">\
                       <p class="disclosure-label">Label</p>\
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
    
    func testVideo() throws {
        
        let view = TestView {
            Video(source: "")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <video src="" controls="controls" class="video"></video>
                       """
        )
    }
}
