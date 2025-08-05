/*
 Abstract:
 The file tests the rendering of the elements.
 */

import HTMLKit
import XCTest

final class SecurityTests: XCTestCase {
    
    struct TestView: View {
        
        @ContentBuilder<Content> var body: Content
    }
    
    var renderer = Renderer(features: [.escaping, .markdown])
    
    func testEncodingAttributeContext() throws {
        
        let attack = "\" onclick=\"alert(1);\""
        
        let view = TestView {
            Paragraph {
            }
            .class(attack)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <p class="&quot; onclick=&quot;alert(1);&quot;"></p>
                       """
        )
    }
    
    func testEncodingHtmlContext() throws {
        
        let attack = "<script></script>"
        
        let view = TestView {
            Paragraph {
                attack
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <p>&lt;script&gt;&lt;/script&gt;</p>
                       """
        )
    }
    
    func testEncodingCommentContext() throws {
        
        let attack = "--> <img src=\"\"> <!--"
        
        let view = TestView {
            Comment(attack)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <!----&gt; &lt;img src=""&gt; &lt;!---->
                       """
        )
    }
    
    func testEncodingEnvironmentValue() throws {
        
        struct Attack {
            let attribute = "\" onclick=\"alert(1);\""
            let content = "<script></script>"
        }
        
        @EnvironmentObject(Attack.self)
        var attack
        
        let view = TestView {
            Article {
                Paragraph {
                    attack.content
                }
                Img()
                    .source(attack.attribute)
            }
            .environment(object: Attack())
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <article>\
                       <p>&lt;script&gt;&lt;/script&gt;</p>\
                       <img src="&quot; onclick=&quot;alert(1);&quot;">\
                       </article>
                       """
        )
    }
    
    func testEncodingMarkdownString() throws {
        
        let attack = "<script></script>"
        
        let view = TestView {
            Paragraph {
                MarkdownString(attack)
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <p>lt;script&gt;&lt;/script&gt;</p>
                       """
        )
    }
    
    func testIgnoringHtmlString() throws {
        
        let html = "<script></script>"
        
        let view = TestView {
            Paragraph {
                HtmlString(html)
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <p><script></script></p>
                       """
        )
    }
}

