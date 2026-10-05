import Testing
import HTMLKit
import HTMLKitComponents

@Suite
struct InteractionTests {
 
    struct TestView: View {
        
        @ContentBuilder<Content> var body: Content
    }
    
    let renderer = Renderer()
    
    @Test
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
        
        #expect(try renderer.render(view: view) ==
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
    
    @Test
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
        
        #expect(try renderer.render(view: view) ==
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
    
    @Test
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
        
        #expect(try renderer.render(view: view) ==
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
    
    @Test
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
        
        #expect(try renderer.render(view: view) ==
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
    
    @Test
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
        
        #expect(try renderer.render(view: view) ==
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
    
    @Test
    func testOnSubmit() throws {
        
        let view = TestView {
            Form(method: .post) {
            }
            .tag("sender")
            .onSubmit { action in
                action.validate("test", [Validator(field: "testfield", rule: .value)])
            }
        }
        
        #expect(try renderer.render(view: view) ==
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
