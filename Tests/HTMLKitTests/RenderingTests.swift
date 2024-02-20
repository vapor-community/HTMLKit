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
    
    var renderer = Renderer(features: [.markdown])
    
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
    
    func testRenderingItalicMarkdown() throws {
        
        let view = TestView {
            Paragraph {
                MarkdownString("*italic*")
            }
            Paragraph {
                MarkdownString("_italic_")
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <p><em>italic</em></p>\
                       <p><em>italic</em></p>
                       """
        )
    }
    
    func testRenderingBoldMarkdown() throws {
        
        let view = TestView {
            Paragraph {
                MarkdownString("**bold**")
            }
            Paragraph {
                MarkdownString("__bold__")
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <p><strong>bold</strong></p>\
                       <p><strong>bold</strong></p>
                       """
        )
    }
    
    func testRenderingBoldItalicMarkdown() throws {
        
        let view = TestView {
            Paragraph {
                MarkdownString("***bold and italic***")
            }
            Paragraph {
                MarkdownString("___bold and italic___")
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <p><em><strong>bold and italic</strong></em></p>\
                       <p><em><strong>bold and italic</strong></em></p>
                       """
        )
    }
    
    func testRenderingMonospaceMarkdown() throws {
        
        let view = TestView {
            Paragraph {
                MarkdownString("`code`")
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <p><code>code</code></p>
                       """
        )
    }
    
    func testRenderingStrikeThroughMarkdown() throws {
        
        let view = TestView {
            Paragraph {
                MarkdownString("~strikethrough~")
            }
            Paragraph {
                MarkdownString("~~strikethrough~~")
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <p><del>strikethrough</del></p>\
                       <p><del>strikethrough</del></p>
                       """
        )
    }
    
    func testRenderingLinkMarkdown() throws {
        
        let view = TestView {
            Paragraph {
                MarkdownString("[Link](https://www.google.de)")
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <p><a href="https://www.google.de">Link</a></p>
                       """
        )
    }
    
    func testRenderingMarkdownParagraph() throws {
        
        let view = TestView {
            Paragraph {
                MarkdownString("This *substring* is **important**.")
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <p>This <em>substring</em> is <strong>important</strong>.</p>
                       """
        )
    }
    
    func testRenderingNestedMarkdown() throws {
        
        let view = TestView {
            Paragraph {
                MarkdownString {
                    """
                    **This text is _extremely_ important.**
                    """
                }
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <p><strong>This text is <em>extremely</em> important.</strong></p>
                       """
        )
    }
}
