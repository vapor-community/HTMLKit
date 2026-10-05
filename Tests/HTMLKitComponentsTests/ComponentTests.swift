import Testing
import HTMLKit
import HTMLKitComponents

@Suite
struct ComponentTests {
    
    struct TestView: View {
        
        @ContentBuilder<Content> var body: Content
    }
    
    let renderer = Renderer()
    
    @Test
    func testLinkButton() throws {
        
        let view = TestView {
            LinkButton(destination: "uri") {
                "Button"
            }
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <a href="uri" target="_self" class="button" role="button">Button</a>
                       """
        )
    }
    
    @Test
    func testButton() throws {
        
        let view = TestView {
            Button(role: .button) {
                "Button"
            }
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <button type="button" class="button">Button</button>
                       """
        )
    }
    
    @Test
    func testGroup() throws {
        
        let view = TestView {
            Grouping {}
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <div class="grouping"></div>
                       """
        )
    }
    
    @Test
    func testGrid() throws {
        
        let view = TestView {
            Grid {}
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <div class="grid ratio:fit" role="grid"></div>
                       """
        )
    }
    
    @Test
    func testForm() throws {
        
        let view = TestView {
            Form(method: .post, encoding: .multipart) {}
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <form method="post" enctype="multipart/form-data" class="form"></form>
                       """
        )
    }
    
    @Test
    func testFieldLabel() throws {
        
        let view = TestView {
            FieldLabel(for: "name") {
                "Name"
            }
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <label for="name" class="label">Name</label>
                       """
        )
    }
    
    @Test
    func testTextField() throws {
        
        let view = TestView {
            TextField(name: "name")
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <input type="text" name="name" class="textfield">
                       """
        )
    }
    
    @Test
    func testTextEditor() throws {
        
        let view = TestView {
            TextEditor(name: "name") {
                "value"
            }
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <textarea name="name" class="texteditor" rows="3">value</textarea>
                       """
        )
    }

    @Test
    func testSlider() throws {
        
        let view = TestView {
            Slider(name: "name")
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <input type="range" name="name" class="slider">
                       """
        )
    }
  
    @Test
    func testDatePicker() throws {
        
        let view = TestView {
            DatePicker(name: "name")
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <div class="datepicker">\
                       <input type="text" class="datepicker-datefield" name="name">\
                       <div class="datepicker-calendar" role="grid">\
                       <ul class="calendar-navigation">\
                       <li>\
                       <button type="button" value="previous" aria-label="Browse previous">\
                       <svg viewbox="0 0 16 16" xmlns="http://www.w3.org/2000/svg" fill="currentColor" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">\
                       <polyline points="10 2 4 8 10 14"></polyline>\
                       </svg>\
                       </button>\
                       </li>\
                       <li>\
                       <b class="calendar-detail"></b>\
                       </li>\
                       <li>\
                       <button type="button" value="next" aria-label="Browse next">\
                       <svg viewbox="0 0 16 16" xmlns="http://www.w3.org/2000/svg" fill="currentColor" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">\
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
  
    @Test
    func testSecureField() throws {
        
        let view = TestView {
            SecureField(name: "password")
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <input type="password" name="password" class="securefield">
                       """
        )
    }
    
    @Test
    func testCheckField() throws {
        
        let view = TestView {
            Picker(name: "name", selection: "value") {
                CheckField(value: "value") {
                    "Label"
                }
                .tag("name")
            }
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <div class="picker" role="group">\
                       <div class="checkfield">\
                       <input type="checkbox" value="value" checked="checked" class="checkinput" name="name" id="name">\
                       <label for="name">Label</label>\
                       </div>\
                       </div>
                       """
        )
    }
    
    @Test
    func testRadioSelect() throws {
        
        let view = TestView {
            Picker(name: "name", selection: "value") {
                RadioSelect(value: "value") {
                    "Label"
                }
                .tag("name")
            }
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <div class="picker" role="group">\
                       <div class="radioselect">\
                       <input type="radio" value="value" checked="checked" class="radioinput" name="name" id="name">\
                       <label for="name">Label</label>\
                       </div>\
                       </div>
                       """
        )
    }
    
    @Test
    func testSelectField() throws {
        
        let view = TestView {
            SelectField(name: "name", selection: "value") {
                RadioSelect(value: "value") {
                    "Label"
                }
                .tag("name")
            }
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <div class="selectfield">\
                       <input type="text" class="selectfield-textfield" role="combobox">\
                       <div class="selectfield-optionlist" role="listbox">\
                       <div class="radioselect" role="option">\
                       <input type="radio" value="value" checked="checked" class="radioinput" name="name" id="name">\
                       <label for="name">Label</label>\
                       </div>\
                       </div>\
                       </div>
                       """
        )
    }
    
    @Test
    func testFileDialog() throws {
        
        let view = TestView {
            FileDialog(name: "avatar")
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <input type="file" name="avatar" class="filedialog">
                       """
        )
    }
    
    @Test
    func testImage() throws {
        
        let view = TestView {
            Image(source: "source")
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <img src="source" class="image">
                       """
        )
    }
    
    @Test    
    func testList() throws {
        
        let view = TestView {
            List(direction: .vertical) {}
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <ul class="list direction:vertical"></ul>
                       """
        )
    }
    
    @Test
    func testLink() throws {
        
        let view = TestView {
            Link(destination: "uri") {
                "Link"
            }
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <a href="uri" target="_self" class="link">Link</a>
                       """
        )
    }
    
    @Test
    func testVStack() throws {
        
        let view = TestView {
            VStack {}
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <div class="vstack horizontal-alignment:leading"></div>
                       """
        )
    }
    
    @Test
    func testHStack() throws {
        
        let view = TestView {
            HStack {}
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <div class="hstack vertical-alignment:center"></div>
                       """
        )
    }

    @Test
    func testZStack() throws {
        
        let view = TestView {
            ZStack {}
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <div class="zstack"></div>
                       """
        )
    }
    
    @Test
    func testText() throws {
       
        let view = TestView {
            Text {
                "Text"
            }
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <p class="text alignment:leading">Text</p>
                       """
        )
    }
    
    @Test
    func testProgress() throws {
        
        let view = TestView {
            Progress(value: 50, total: 100) {}
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <svg xmlns="http://www.w3.org/2000/svg" class="progress" role="progressbar" aria-valuenow="50.0" aria-valuemax="100.0">\
                       <path class="mark">100.0</path>\
                       <path class="mark">50.0</path>\
                       </svg>
                       """
        )
    }
    
    @Test
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
        
        #expect(try renderer.render(view: view) ==
                       """
                       <pre class="snippet highlight:html">\
                       <p>&lt;div&gt;</p>\
                       <p>&lt;h3&gt;headline&lt;/h3&gt;</p>\
                       <p>&lt;/div&gt;</p>\
                       </pre>
                       """
        )
    }
    
    @Test
    func testCard() throws {
        
        let view = TestView {
            Card {}
            Card {} header: {}
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <div class="card">\
                       <div class="card-body"></div>\
                       </div>\
                       <div class="card">\
                       <div class="card-header"></div>\
                       <div class="card-body"></div>\
                       </div>
                       """
        )
    }
    
    @Test
    func testCarousel() throws {
        
        let view = TestView {
            Carousel {
                Slide {}
                    .tag("slide")
            }
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <div class="carousel">\
                       <div class="carousel-content">\
                       <div class="slide" role="tabpanel" id="slide"></div>\
                       </div>\
                       <div class="carousel-indication" role="tablist">\
                       <a class="indicator" href="#slide" role="tab"></a>\
                       </div>\
                       </div>
                       """
        )
    }
    
    @Test
    func testDropdown() throws {
        
        let view = TestView {
            Dropdown {} label: {}

        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <div class="dropdown">\
                       <div class="dropdown-label"></div>\
                       <div class="dropdown-content" role="menu"></div>\
                       </div>
                       """
        )
    }
    
    @Test
    func testModal() throws {
        
        let view = TestView {
            Modal {}
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <dialog class="modal"></dialog>
                       """
        )
    }
    
    @Test
    func testScrollView() throws {
        
        let view = TestView {
            Scroll() {}
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <div class="scroll indicators:true"></div>
                       """
        )
    }
    
    @Test
    func testSymbol() throws {
        
        let view = TestView {
            Symbol(system: .folder)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <svg viewbox="0 0 20 16" class="symbol" role="img">\
                       <path d="M2,12L2,4C2,2.896 2.896,2 4,2L6.923,2C6.966,2 7.009,2.006 7.05,2.017C7.062,2.021 7.074,2.025 7.086,2.031C7.255,2.117 9,3 9,3L16,3C17.104,3 18,3.896 18,5L18,12C18,13.104 17.104,14 16,14L4,14C2.896,14 2,13.104 2,12ZM16.5,6L16.5,5C16.5,4.724 16.276,4.5 16,4.5L9.084,4.5C9.039,4.5 8.75,4.512 8.616,4.506C8.566,4.495 8.518,4.478 8.473,4.454C8.106,4.267 6.644,3.505 6.644,3.505L4,3.5C3.724,3.5 3.5,3.724 3.5,4L3.5,6L16.5,6ZM3.5,7.5L3.5,12C3.5,12.276 3.724,12.5 4,12.5L16,12.5C16.276,12.5 16.5,12.276 16.5,12L16.5,7.5L3.5,7.5Z"></path>\
                       </svg>
                       """
        )
    }
    
    @Test
    func testNavigation() throws {
        
        let view = TestView {
            HTMLKitComponents.Navigation {}
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <nav class="navigation"></nav>
                       """
        )
    }
    
    @Test
    func testDisclosure() throws {
        
        let view = TestView {
            Disclosure {
            } label: {
            }
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <details class="disclosure" name="disclosure">\
                       <summary class="disclosure-head">\
                       <div class="disclosure-label"></div>\
                       <svg viewbox="0 0 20 16" width="20" height="16" xmlns="http://www.w3.org/2000/svg" class="disclosure-triangle" aria-hidden="true">\
                       <path d="M7.28,2.241C6.987,1.957 6.987,1.497 7.28,1.213C7.573,0.929 8.048,0.929 8.341,1.213L14.811,7.486C15.103,7.77 15.103,8.23 14.811,8.514L8.28,14.787C7.987,15.071 7.512,15.071 7.22,14.787C6.927,14.503 6.927,14.043 7.22,13.759L13.22,8L7.28,2.241Z">\
                       </path>\
                       </svg>\
                       </summary>\
                       <div class="disclosure-body">\
                       </div>\
                       </details>
                       """
        )
    }
    
    @Test
    func testVideo() throws {
        
        let view = TestView {
            Video(source: "")
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <video src="" controls="controls" class="video"></video>
                       """
        )
    }
}
