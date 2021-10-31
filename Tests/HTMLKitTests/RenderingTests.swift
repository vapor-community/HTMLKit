import HTMLKit
import XCTest

final class RenderingTests: XCTestCase {
    
    struct TestPage: HTMLPage {
        
        var content: HTMLContent
        
        var body: HTMLContent {
            content
        }
        
        init(@HTMLBuilder builder: () -> HTMLContent) {
            content = builder()
        }
    }
    
    var renderer = HTMLRenderer()
    
    func testRenderingDocument() throws {
        
        let view = TestPage {
            Document(type: .html5) {
                Body {
                    Paragraph {
                        "text"
                    }
                }
            }
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
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
        
        let view = TestPage {
            Division {
                Paragraph {
                    "text"
                }
            }
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <div>\
                       <p>text</p>\
                       </div>
                       """
        )
    }
    
    func testRenderingEmptyTag() throws {
        
        let view = TestPage {
            Input()
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <input>
                       """
        )
    }
    
    func testRenderingAttributes() throws {
        
        let view = TestPage {
            Paragraph {
                "text"
            }
            .role("role")
            .class("class")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <p role="role" class="class">text</p>
                       """
        )
    }
    
    func testNesting() throws {
        
        let view = TestPage {
            Division {
                Paragraph {
                    "text"
                }
            }
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <div>\
                       <p>text</p>\
                       </div>
                       """
        )
    }
    
    func testEscaping() throws {
        
        let view = TestPage {
            Paragraph {
                "text"
            }
            .role("role")
            .class("cl'ass")
        }
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <p role="role" class="cl'ass">text</p>
                       """
        )
    }
}

extension RenderingTests {
    
    static var allTests = [
        ("testRenderingDocument", testRenderingDocument),
        ("testRenderingContentTag", testRenderingContentTag),
        ("testRenderingEmptyTag", testRenderingEmptyTag),
        ("testRenderingAttributes", testRenderingAttributes),
        ("testNesting", testNesting),
        ("testEscaping", testEscaping)
    ]
}
