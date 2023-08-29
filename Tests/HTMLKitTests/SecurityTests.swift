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
    
    var renderer = Renderer()
    
    func testEncodingAttributeContext() throws {
        
        let variable = "\" onclick=\"alert(1);\""
        
        let view = TestView {
            Paragraph {
            }
            .class(variable)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <p class="&quot; onclick=&quot;alert(1);&quot;"></p>
                       """
        )
    }
    
    func testEncodingHtmlContext() throws {
        
        let variable = "<script></script>"
        
        let view = TestView {
            Paragraph {
                variable
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <p>&lt;script&gt;&lt;/script&gt;</p>
                       """
        )
    }
    
    func testEncodingEnvironmentValue() throws {
        
        struct Variable {
            let value = "<script></script>"
        }
        
        @EnvironmentObject(Variable.self)
        var variable
        
        let view = TestView {
            Article {
                Paragraph {
                    variable.value
                }
            }
            .environment(object: Variable())
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <article><p>&lt;script&gt;&lt;/script&gt;</p></article>
                       """
        )
    }
}

