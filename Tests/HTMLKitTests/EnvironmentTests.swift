/*
 Abstract:
 The file tests the annotations.
 */

import HTMLKit
import XCTest

final class EnvironmentTests: XCTestCase {
    
    struct Object: Encodable {
        
        var content: String = "GlobalObject"
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
        
        @EnvironmentObject(Object.self) var object
        
        var body: Content {
            ParentView {
                Section{
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
                       <h2>GlobalObject</h2>\
                       </section>\
                       </div>
                       """
        )
    }
}
