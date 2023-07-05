/*
 Abstract:
 The file tests the annotations.
 */

import HTMLKit
import XCTest

final class EnvironmentTests: XCTestCase {
    
    struct Object: Encodable {
        
        var content: String = "Welcome to WWDC 2023!"
        var image: String = "wwdc.jpeg"
    }
    
    struct ParentView: View {
        
        var content: [Content]
        
        init(@ContentBuilder<Content> content: () -> [Content]) {
            self.content = content()
        }
        
        var body: Content {
            Division {
                content
            }
            .environment(object: Object())
        }
    }
    
    struct ChildView: View {
        
        @EnvironmentObject(Object.self)
        var object
        
        var body: Content {
            ParentView {
                Section{
                    Image()
                        .source(object.image)
                    Heading2 {
                        object.content
                    }
                }
            }
        }
    }
    
    var renderer = Renderer()
    
    func testEnvironment() throws {
        
        XCTAssertEqual(try renderer.render(view: ChildView()),
                       """
                       <div>\
                       <section>\
                       <img src="wwdc.jpeg">\
                       <h2>Welcome to WWDC 2023!</h2>\
                       </section>\
                       </div>
                       """
        )
    }
}
