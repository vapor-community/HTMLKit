import HTMLKit
import HTMLKitComponents
import XCTest

final class SecurityTests: XCTestCase {
    
    struct TestView: View {
        
        @ContentBuilder<Content> var body: Content
    }
    
    var renderer = Renderer()
    
    func testEncodingAttributeContext() throws {
        
        let attack = "\" onclick=\"alert(1);\""
        
        let view = TestView {
            Button(role: .button) {
                "Show"
            }
            .tag(attack)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <button type="button" class="button" id="&quot; onclick=&quot;alert(1);&quot;">Show</button>
                       """
        )
    }
    
    func testEncodingActionContext() throws {
        
        let attack = "test').appendTo(''); $('#test"
        
        let view = TestView {
            Button(role: .button) {
                "Show"
            }
            .tag("sender")
            .onClick { button in
                button.show(attack)
            }
            
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <button type="button" class="button" id="sender">Show</button>\
                       <script>\
                       $('#sender').onClick(function(){\
                       $('#test&apos;).appendTo(&apos;&apos;); $(&apos;#test').show();\
                       });\
                       </script>
                       """
        )
    }
    
    func testEncodingCssContext() throws {
        
        let attack = "test\" style=\"property: unsafe\""
        
        let view = TestView {
            Text {
                "Text"
            }
            .backgroundColor(.custom(attack))
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <p class="text alignment:leading background:test&quot; style=&quot;property: unsafe&quot;">Text</p>
                       """
        )
    }
}

