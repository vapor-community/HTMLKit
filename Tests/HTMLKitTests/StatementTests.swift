import HTMLKit
import Testing
import Foundation

@Suite
struct StatementTests {
    
    struct TestView: View {
        
        @ContentBuilder<Content> var body: Content
    }
    
    var renderer = Renderer()
    
    @Test
    func testIfCondition() throws {
        
        let valid: Bool = true
        
        let view = TestView {
            if(valid) {
                Paragraph {
                    "true"
                }
            } else {
                Paragraph {
                    "false"
                }
            }
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <p>true</p>
                       """
        )
    }
    
    @Test
    func testElseCondition() throws {
        
        let valid: Bool = false
        
        let view = TestView {
            if(valid) {
                Paragraph {
                    "true"
                }
            } else {
                Paragraph {
                    "false"
                }
            }
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <p>false</p>
                       """
        )
    }
    
    @Test
    func testLoopStatement() throws {
        
        let planets: [String] = ["Neptun", "Jupiter"]
        
        let view = TestView {
            for planet in planets {
                Paragraph {
                    planet
                }
            }
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <p>Neptun</p>\
                       <p>Jupiter</p>
                       """
        )
    }
    
    @Test
    func testOptional() throws {
        
        let name: String? = "Mattes"
        
        let view = TestView {
            if let name = name {
                Paragraph {
                    name
                }
            }
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <p>Mattes</p>
                       """
        )
    }
    
    @Test
    func testOptionalBeforeElement() throws {
        
        let name: String? = "Tony"
        
        let view = TestView {
            if let name = name {
                Paragraph {
                    name
                }
            }
            Division {
            }
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <p>Tony</p>\
                       <div></div>
                       """
        )
    }
    
    @Test
    func testOptionalAfterElement() throws {
        
        let name: String? = "Tony"
        
        let view = TestView {
            Division {
            }
            if let name = name {
                Paragraph {
                    name
                }
            }
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <div></div>\
                       <p>Tony</p>
                       """
        )
    }
    
    @Test
    func testOptionalWithExpectedResult() throws {
        
        let name: String? = "Tony"
        
        let view = TestView {
            Body {
                if let name = name {
                    Paragraph {
                        name
                    }
                }
            }
        }
        
        #expect(try renderer.render(view: view) ==
                       """
                       <body>\
                       <p>Tony</p>\
                       </body>
                       """
        )
    }
}
