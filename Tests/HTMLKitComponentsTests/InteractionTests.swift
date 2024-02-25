import XCTest
import HTMLKit
import HTMLKitComponents

final class InteractionTests: XCTestCase {
 
    struct TestView: View {
        
        @ContentBuilder<Content> var body: Content
    }
    
    let renderer = Renderer()
    
    func testOnClick() throws {
        
        let view = TestView {
            Text {
                "Example"
            }
            .tag("sender")
            .onClick { action in
                action.show("reciever")
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <p class="text alignment:leading" id="sender">Example</p>\
                       <script>\
                       $('#sender').onClick(function(){\
                       $('#reciever').show();\
                       });\
                       </script>
                       """
        )
    }
    
    func testOnTap() throws {
        
        let view = TestView {
            Text {
                "Example"
            }
            .tag("sender")
            .onTap { action in
                action.hide("reciever")
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <p class="text alignment:leading" id="sender">Example</p>\
                       <script>\
                       $('#sender').onTapGesture(function(){\
                       $('#reciever').hide();\
                       });\
                       </script>
                       """
        )
    }
    
    func testOnHover() throws {
        
        let view = TestView {
            Text {
                "Example"
            }
            .tag("sender")
            .onHover { action in
                action.open("reciever")
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <p class="text alignment:leading" id="sender">Example</p>\
                       <script>\
                       $('#sender').onHover(function(){\
                       $('#reciever').open();\
                       });\
                       </script>
                       """
        )
    }
    
    func testOnLeave() throws {
        
        let view = TestView {
            Text {
                "Example"
            }
            .tag("sender")
            .onLeave { action in
                action.close("reciever")
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <p class="text alignment:leading" id="sender">Example</p>\
                       <script>\
                       $('#sender').onLeave(function(){\
                       $('#reciever').close();\
                       });\
                       </script>
                       """
        )
    }
    
    func testOnPress() throws {
        
        let view = TestView {
            Text {
                "Example"
            }
            .tag("sender")
            .onPress { action in
                action.animate("reciever")
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <p class="text alignment:leading" id="sender">Example</p>\
                       <script>\
                       $('#sender').onLongPressGesture(function(){\
                       $('#reciever').animate();\
                       });\
                       </script>
                       """
        )
    }
    
    func testOnSubmit() throws {
        
        let view = TestView {
            Form(method: .post) {
            }
            .tag("sender")
            .onSubmit { action in
                action.validate("test", [Validator(field: "testfield", rule: .value)])
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <form method="post" enctype="application/x-www-form-urlencoded" class="form" id="sender">\
                       </form>\
                       <script>\
                       $('#sender').onSubmit(function(){\
                       event.preventDefault();\
                       $('#test').validate('[{"field":"testfield","rule":"value"}]');},true);\
                       </script>
                       """
        )
    }
}
