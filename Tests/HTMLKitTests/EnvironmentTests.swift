/*
 Abstract:
 The file tests the annotations.
 */

import HTMLKit
import XCTest

final class EnvironmentTests: XCTestCase {
    
    struct Object: Encodable {
        
        var title: String = "Welcome to WWDC"
        var name: String = "Mattes!"
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
                        object.title + " " + object.name
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
                       <h2>Welcome to WWDC Mattes!</h2>\
                       </section>\
                       </div>
                       """
        )
    }
}
