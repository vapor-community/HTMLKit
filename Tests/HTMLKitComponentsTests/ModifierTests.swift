import XCTest
import HTMLKit
import HTMLKitComponents

final class ModifierTests: XCTestCase {
    
    struct TestView: View {
        
        @ContentBuilder<Content> var body: Content
    }
    
    let renderer = Renderer()
    
    func testBorderColor() throws {
        
        let view = TestView {
            HStack {}.border(.black)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <div class="hstack vertical-alignment:center border:black border:small"></div>
                       """
        )
    }
    
    func testBackgroundColor() throws {
        
        let view = TestView {
            HStack {}.backgroundColor(.black)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <div class="hstack vertical-alignment:center background:black"></div>
                       """
        )
    }
    
    func testBorderShape() throws {
        
        let view = TestView {
            HStack {}.borderShape(.fullrounded)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <div class="hstack vertical-alignment:center shape:fullrounded"></div>
                       """
        )
    }
    
    func testColorScheme() throws {
        
        let view = TestView {
            HStack {}.colorScheme(.dark)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <div class="hstack vertical-alignment:center scheme:dark"></div>
                       """
        )
    }
    
    func testFrame() throws {
        
        let view = TestView {
            HStack {}.frame(width: .eleven, height: .minimum)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <div class="hstack vertical-alignment:center height:minimum width:eleven"></div>
                       """
        )
    }
    
    func testBoxMargin() throws {
        
        let view = TestView {
            HStack {}.margin(insets: .all, length: .small)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <div class="hstack vertical-alignment:center margin:small"></div>
                       """
        )
    }
    
    func testBoxPadding() throws {
        
        let view = TestView {
            HStack {}.padding(insets: .all, length: .large)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <div class="hstack vertical-alignment:center padding:large"></div>
                       """
        )
    }
    
    func testViewOpacity() throws {
        
        let view = TestView {
            HStack {}.opacity(.transparent)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <div class="hstack vertical-alignment:center opacity:transparent"></div>
                       """
        )
    }
    
    func testHiddenState() throws {
        
        let view = TestView {
            HStack {}.hidden()
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <div class="hstack vertical-alignment:center state:hidden"></div>
                       """
        )
    }
    
    func testIndexPosition() throws {
        
        let view = TestView {
            HStack {}.zIndex(.five)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <div class="hstack vertical-alignment:center zindex:five"></div>
                       """
        )
    }
    
    func testButtonSize() throws {
        
        let view = TestView {
            Button(role: .button) {}.controlSize(.large)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <button type="button" class="button size:large"></button>
                       """
        )
    }
    
    func testButtonStyle() throws {
        
        let view = TestView {
            Button(role: .button) {}.buttonStyle(.primary)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <button type="button" class="button style:primary"></button>
                       """
        )
    }
    
    func testDisabledState() throws {
        
        let view = TestView {
            Button(role: .button) {}.disabled()
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <button type="button" class="button state:disabled"></button>
                       """
        )
    }
    
    func testTextStyle() throws {
        
        let view = TestView {
            Text {}.textStyle(.code)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <p class="text alignment:leading style:code"></p>
                       """
        )
    }
    
    func testFontSize() throws {
        
        let view = TestView {
            Text {}.fontSize(.large)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <p class="text alignment:leading size:large"></p>
                       """
        )
    }
    
    func testFontStyle() throws {
        
        let view = TestView {
            Text {}.fontStyle(.italic)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <p class="text alignment:leading style:italic"></p>
                       """
        )
    }
    
    func testFontTranformation() throws {
        
        let view = TestView {
            Text {}.textCase(.capitalize)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <p class="text alignment:leading case:capitalize"></p>
                       """
        )
    }
    
    func testLineLimit() throws {
        
        let view = TestView {
            Text {}.lineLimit(.one)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <p class="text alignment:leading limit:one"></p>
                       """
        )
    }
    
    func testLineSpacing() throws {
        
        let view = TestView {
            Text {}.lineSpacing(.small)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <p class="text alignment:leading height:small"></p>
                       """
        )
    }
    
    func testFocusColor() throws {
        
        let view = TestView {
            TextField(name: "textfield").focusColor(.gray)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <input type="text" name="textfield" class="textfield focus:gray">
                       """
        )
    }
    
    func testAspectRatio() throws {
        
        let view = TestView {
            Image(source: "source").aspectRatio(.equal, fit: .cover)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <img src="source" role="img" class="image aspect:equal fit:cover">
                       """
        )
    }
    
    func testClipShape() throws {
        
        let view = TestView {
            Image(source: "source").clipShape(.circle)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <img src="source" role="img" class="image shape:circle">
                       """
        )
    }
    
    func testCustomCase() throws {
        
        let view = TestView {
            Image(source: "source").clipShape(.custom("rectangle"))
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <img src="source" role="img" class="image shape:rectangle">
                       """
        )
    }
    
    func testFontFamily() throws {
        
        let view = TestView {
            Text {}.font(.arial)
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <p class="text alignment:leading font:arial"></p>
                       """
        )
    }
}
