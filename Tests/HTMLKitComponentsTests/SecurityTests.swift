import HTMLKit
import HTMLKitComponents
import Testing

@Suite
struct SecurityTests {
    
    struct TestView: View {
        
        @ContentBuilder<Content> var body: Content
    }
    
    var renderer = Renderer()
    
    @Test
    func testEncodingAttributeContext() throws {
        
        let attack = "\" onclick=\"alert(1);\""
        
        let view = TestView {
            Button(role: .button) {
                "Show"
            }
            .tag(attack)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <button type="button" class="button" id="&quot; onclick=&quot;alert(1);&quot;">Show</button>
                       """
        )
    }
    
    @Test
    func testEncodingActionContext() throws {
        
        let attack = "'</script><script> var test = '<b>attack</b>';"
        
        let view = TestView {
            Button(role: .button) {
                "Show"
            }
            .tag("sender")
            .onClick { button in
                button.show(attack)
            }
            
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <button type="button" class="button" id="sender">Show</button>\
                       <script>\
                       $('#sender').onClick(function(){$('#' var test = '&lt;b&gt;attack&lt;/b&gt;';').show();});\
                       </script>
                       """
        )
    }
    
    @Test
    func testEncodingCssContext() throws {
        
        let attack = "test\" style=\"property: unsafe\""
        
        let view = TestView {
            Text {
                "Text"
            }
            .background(.custom(attack))
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <p class="text alignment:leading background:test&quot; style=&quot;property: unsafe&quot;">Text</p>
                       """
        )
    }
}

