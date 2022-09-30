import HTMLKit
import XCTest

final class RenderingTests: XCTestCase {
    
    struct TestPage: Page {
        
        @ContentBuilder<AnyContent> var body: AnyContent
    }
    
    var renderer = Renderer()
    
    func testRenderingDocument() throws {
        
        let page = TestPage {
            Document(.html5)
            Html {
                Body {
                    Paragraph {
                        "text"
                    }
                }
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <!DOCTYPE html>\
                       <html>\
                       <body>\
                       <p>text</p>\
                       </body>\
                       </html>
                       """
        )
    }
    
    func testRenderingContentTag() throws {
        
        let page = TestPage {
            Division {
                Paragraph {
                    "text"
                }
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <div>\
                       <p>text</p>\
                       </div>
                       """
        )
    }
    
    func testRenderingEmptyTag() throws {
        
        let page = TestPage {
            Input()
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <input>
                       """
        )
    }
    
    func testRenderingCommentTag() throws {
        
        let page = TestPage {
            Comment("text")
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <!--text-->
                       """
        )
        
    }
    
    func testRenderingAttributes() throws {
        
        let page = TestPage {
            Paragraph {
                "text"
            }
            .class("class")
        } 
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <p class="class">text</p>
                       """
        )
    }
    
    
    func testRenderingAttributesWithUnterscore() throws {
        
        let page = TestPage {
            Paragraph {
                "text"
            }
            .class("cl_ass")
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <p class="cl_ass">text</p>
                       """
        )
    }
    
    func testRenderingAttributesWithHyphens() throws {
        
        let page = TestPage {
            Paragraph {
                "text"
            }
            .class("cl-ass")
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <p class="cl-ass">text</p>
                       """
        )
    }
    
    func testNesting() throws {
        
        let page = TestPage {
            Division {
                Paragraph {
                    "text"
                }
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <div>\
                       <p>text</p>\
                       </div>
                       """
        )
    }
    
    func testEscaping() throws {
        
        let page = TestPage {
            Paragraph {
                "text"
            }
            .class("cl'ass")
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <p class="cl'ass">text</p>
                       """
        )
    }
    
    func testModified() throws {
        
        let isModified: Bool = true
        
        let page = TestPage {
            Division {
            }
            .class("unmodified")
            .modify(if: isModified) {
                $0.class("modified")
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <div class="modified"></div>
                       """
        )
    }
    
    func testUnmodified() throws {
        
        let isModified: Bool = false
        
        let page = TestPage {
            Division {
            }
            .class("unmodified")
            .modify(if: isModified) {
                $0.class("modified")
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <div class="unmodified"></div>
                       """
        )
    }
    
    func testModifiedAndUnwrapped() throws {
        
        let passcode: TemplateValue<String?> = .constant("test")
        
        let page = TestPage {
            Input()
                .modify(unwrap: passcode) {
                    $0.placeholder($1)
                }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <input placeholder="test">
                       """
        )
    }
    
    func testRenderingCustomProperty() throws {
        
        let page = TestPage {
            Division {
                Paragraph {
                    "text"
                }
            }
            .custom(key: "key", value: "value")
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <div key="value">\
                       <p>text</p>\
                       </div>
                       """
        )
    }
}
