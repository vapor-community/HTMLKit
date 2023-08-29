/*
 Abstract:
 The file tests the rendering.
 */

import HTMLKit
import XCTest

final class RenderingTests: XCTestCase {
    
    struct TestView: View {
        
        @ContentBuilder<Content> var body: Content
    }
    
    var renderer = Renderer()
    
    func testRenderingDocument() throws {
        
        let view = TestView {
            Document(.html5)
            Html {
                Body {
                    Paragraph {
                        "text"
                    }
                }
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
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
        
        let view = TestView {
            Division {
                Paragraph {
                    "text"
                }
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <div>\
                       <p>text</p>\
                       </div>
                       """
        )
    }
    
    func testRenderingEmptyTag() throws {
        
        let view = TestView {
            Input()
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <input>
                       """
        )
    }
    
    func testRenderingCommentTag() throws {
        
        let view = TestView {
            Comment("text")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <!--text-->
                       """
        )
        
    }
    
    func testRenderingAttributes() throws {
        
        let view = TestView {
            Paragraph {
                "text"
            }
            .class("class")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <p class="class">text</p>
                       """
        )
    }
    
    
    func testRenderingAttributesWithUnterscore() throws {
        
        let view = TestView {
            Paragraph {
                "text"
            }
            .class("cl_ass")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <p class="cl_ass">text</p>
                       """
        )
    }
    
    func testRenderingAttributesWithHyphens() throws {
        
        let view = TestView {
            Paragraph {
                "text"
            }
            .class("cl-ass")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <p class="cl-ass">text</p>
                       """
        )
    }
    
    func testNesting() throws {
        
        let view = TestView {
            Division {
                Paragraph {
                    "text"
                }
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <div>\
                       <p>text</p>\
                       </div>
                       """
        )
    }
    
    func testModified() throws {
        
        let isModified: Bool = true
        
        let view = TestView {
            Division {
            }
            .class("unmodified")
            .modify(if: isModified) {
                $0.class("modified")
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <div class="modified"></div>
                       """
        )
    }
    
    func testUnmodified() throws {
        
        let isModified: Bool = false
        
        let view = TestView {
            Division {
            }
            .class("unmodified")
            .modify(if: isModified) {
                $0.class("modified")
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <div class="unmodified"></div>
                       """
        )
    }
    
    func testModifiedAndUnwrapped() throws {
        
        let passcode: String? = "test"
        
        let view = TestView {
            Input()
                .modify(unwrap: passcode) {
                    $0.placeholder($1)
                }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <input placeholder="test">
                       """
        )
    }
    
    func testRenderingCustomProperty() throws {
        
        let view = TestView {
            Division {
                Paragraph {
                    "text"
                }
            }
            .custom(key: "key", value: "value")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <div key="value">\
                       <p>text</p>\
                       </div>
                       """
        )
    }
}
