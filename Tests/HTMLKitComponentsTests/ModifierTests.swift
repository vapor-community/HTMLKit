import Testing
import HTMLKit
import HTMLKitComponents

@Suite
struct ModifierTests {
    
    struct TestView: View {
        
        @ContentBuilder<Content> var body: Content
    }
    
    let renderer = Renderer()
    
    @Test
    func testBorderColor() throws {
        
        let view = TestView {
            HStack {}.border(.black)
            HStack {}.border(.black, width: .medium)
            HStack {}.border(.black, width: .large, shape: .fullrounded)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <div class="hstack vertical-alignment:center border:black border:small"></div>\
                       <div class="hstack vertical-alignment:center border:black border:medium"></div>\
                       <div class="hstack vertical-alignment:center border:black border:large shape:fullrounded"></div>
                       """
        )
    }
    
    @Test
    func testBackgroundColor() throws {
        
        let view = TestView {
            HStack {}.background(.black)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <div class="hstack vertical-alignment:center background:black"></div>
                       """
        )
    }
    
    @Test
    func testColorScheme() throws {
        
        let view = TestView {
            HStack {}.colorScheme(.dark)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <div class="hstack vertical-alignment:center scheme:dark"></div>
                       """
        )
    }
    
    @Test
    func testFrame() throws {
        
        let view = TestView {
            HStack {}.frame(width: .eleven, height: .minimum)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <div class="hstack vertical-alignment:center height:minimum width:eleven"></div>
                       """
        )
    }
    
    @Test
    func testBoxMargin() throws {
        
        let view = TestView {
            HStack {}.margin(insets: .all, length: .small)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <div class="hstack vertical-alignment:center margin:small"></div>
                       """
        )
    }
    
    @Test
    func testBoxPadding() throws {
        
        let view = TestView {
            HStack {}.padding(insets: .all, length: .large)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <div class="hstack vertical-alignment:center padding:large"></div>
                       """
        )
    }
    
    @Test
    func testViewOpacity() throws {
        
        let view = TestView {
            HStack {}.opacity(.transparent)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <div class="hstack vertical-alignment:center opacity:transparent"></div>
                       """
        )
    }
    
    @Test
    func testHiddenState() throws {
        
        let view = TestView {
            HStack {}.hidden()
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <div class="hstack vertical-alignment:center state:hidden"></div>
                       """
        )
    }
    
    @Test
    func testIndexPosition() throws {
        
        let view = TestView {
            HStack {}.zIndex(.five)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <div class="hstack vertical-alignment:center zindex:five"></div>
                       """
        )
    }
    
    @Test
    func testButtonSize() throws {
        
        let view = TestView {
            Button(role: .button) {}.controlSize(.large)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <button type="button" class="button size:large"></button>
                       """
        )
    }
    
    @Test
    func testButtonStyle() throws {
        
        let view = TestView {
            Button(role: .button) {}.buttonStyle(.primary)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <button type="button" class="button style:primary"></button>
                       """
        )
    }
    
    @Test
    func testDisabledState() throws {
        
        let view = TestView {
            Button(role: .button) {}.disabled()
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <button type="button" class="button state:disabled"></button>
                       """
        )
    }
    
    @Test
    func testTextStyle() throws {
        
        let view = TestView {
            Text {}.textStyle(.code)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <p class="text alignment:leading style:code"></p>
                       """
        )
    }
    
    @Test
    func testFontSize() throws {
        
        let view = TestView {
            Text {}.fontSize(.large)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <p class="text alignment:leading size:large"></p>
                       """
        )
    }
    
    @Test
    func testFontStyle() throws {
        
        let view = TestView {
            Text {}.fontStyle(.italic)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <p class="text alignment:leading style:italic"></p>
                       """
        )
    }
    
    @Test
    func testFontTranformation() throws {
        
        let view = TestView {
            Text {}.textCase(.capitalize)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <p class="text alignment:leading case:capitalize"></p>
                       """
        )
    }
    
    @Test
    func testLineLimit() throws {
        
        let view = TestView {
            Text {}.lineLimit(.one)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <p class="text alignment:leading limit:one"></p>
                       """
        )
    }
    
    @Test
    func testLineSpacing() throws {
        
        let view = TestView {
            Text {}.lineSpacing(.small)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <p class="text alignment:leading height:small"></p>
                       """
        )
    }
    
    @Test
    func testFocusColor() throws {
        
        let view = TestView {
            TextField(name: "textfield").focusColor(.gray)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <input type="text" name="textfield" class="textfield focus:gray">
                       """
        )
    }
    
    @Test
    func testAspectRatio() throws {
        
        let view = TestView {
            Image(source: "source").aspectRatio(.equal, fit: .cover)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <img src="source" class="image aspect:equal fit:cover">
                       """
        )
    }
    
    @Test
    func testClipShape() throws {
        
        let view = TestView {
            Image(source: "source").clipShape(.circle)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <img src="source" class="image shape:circle">
                       """
        )
    }
    
    @Test
    func testCustomCase() throws {
        
        let view = TestView {
            Image(source: "source").clipShape(.custom("rectangle"))
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <img src="source" class="image shape:rectangle">
                       """
        )
    }
    
    @Test
    func testFontFamily() throws {
        
        let view = TestView {
            Text {}.font(.arial)
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <p class="text alignment:leading font:arial"></p>
                       """
        )
    }
}
