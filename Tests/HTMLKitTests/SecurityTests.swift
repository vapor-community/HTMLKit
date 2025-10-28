import HTMLKit
import XCTest

final class SecurityTests: XCTestCase {
    
    struct TestView: View {
        
        @ContentBuilder<Content> var body: Content
    }
    
    var renderer = Renderer(features: [.escaping, .markdown])
    
    /// Tests the escaping within an html context.
    /// 
    /// The renderer is expected to encode unsafe characters into html entities.
    func testEncodingHtmlContext() throws {
        
        let view = TestView {
            
            /// Within the element body
            Paragraph {
                "<script></script>"
            }
            
            /// Within the attribute value
            Paragraph {
            }
            .class("\" onclick=\"alert(1);\"")
            
            ///  Within a comment body
            Comment("--> <img src=\"\"> <!--")
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <p>&lt;script&gt;&lt;/script&gt;</p>\
                       <p class="&quot; onclick=&quot;alert(1);&quot;"></p>\
                       <!----&gt; &lt;img src=""&gt; &lt;!---->
                       """
        )
    }
    
    /// Tests the escaping within a environment context.
    /// 
    /// The renderer is expected to proceed as in an html context.
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
    
    /// Tests the escaping within a markdown context.
    /// 
    /// The renderer is expected to proceed as in an html context.
    func testEncodingMarkdownString() throws {

        let view = TestView {
            Paragraph {
                MarkdownString("<script></script>")
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <p>lt;script&gt;&lt;/script&gt;</p>
                       """
        )
    }
    
    /// Tests the renderers behaviour of a desired unescaped string.
    ///
    /// The renderer is expected to emit the string as-is.
    func testIgnoringHtmlString() throws {
        
        let view = TestView {
            Paragraph {
                HtmlString("<script></script>")
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <p><script></script></p>
                       """
        )
    }
    
    /// Tests the escaping within a javascript context.
    /// 
    /// The renderer is expected to remove unwanted tags and to encode only string literals.
    func testEscapingJsContext() throws {
        
        let view = TestView {
            // Literal with single quotes
            Script { 
                "</script><script> var test = '<b>attack</b>';" 
            }
            // Literal with double quotes
            Script {
                "</script><script> var test = \"<b>attack</b>\";" 
            }
            // Literal with backticks
            Script {
                "</script><script> var test = `<b>attack</b>`;" 
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <script> var test = '\\u003Cb\\u003Eattack\\u003C/b\\u003E';</script>\
                       <script> var test = \"\\u003Cb\\u003Eattack\\u003C/b\\u003E\";</script>\
                       <script> var test = `\\u003Cb\\u003Eattack\\u003C/b\\u003E`;</script>
                       """
        )
    }

    /// Tests the escaping within a css context.
    /// 
    /// The renderer is expected to remove unwanted tags and to encode only string literals.
    func testEscapingCssContext() throws {
        
        let view = TestView {
            // Literal with single quotes
            Style { 
                "</style><style> p { content: '<b>attack</b>'; }" 
            }
            // Literal with double quotes
            Style {
                "</style><style> p { content: \"<b>attack</b>\"; }" 
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <style> p { content: '\\00003Cb\\00003Eattack\\00003C/b\\00003E'; }</style>\
                       <style> p { content: \"\\00003Cb\\00003Eattack\\00003C/b\\00003E\"; }</style>
                       """
        )
    }
}

