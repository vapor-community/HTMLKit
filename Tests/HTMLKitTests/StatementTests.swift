import HTMLKit
import XCTest

import Foundation

final class StatementTests: XCTestCase {
    
    struct TestView: View {
        
        @ContentBuilder<Content> var body: Content
    }
    
    var renderer = Renderer()
    
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
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <p>true</p>
                       """
        )
    }
    
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
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <p>false</p>
                       """
        )
    }
    
    func testLoopStatement() throws {
        
        let planets: [String] = ["Neptun", "Jupiter"]
        
        let view = TestView {
            for planet in planets {
                Paragraph {
                    planet
                }
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <p>Neptun</p>\
                       <p>Jupiter</p>
                       """
        )
    }
    
    func testOptional() throws {
        
        let name: String? = "Mattes"
        
        let view = TestView {
            if let name = name {
                Paragraph {
                    name
                }
            }
        }
        
        XCTAssertEqual(try renderer.render(view: view),
                       """
                       <p>Mattes</p>
                       """
        )
    }
}
