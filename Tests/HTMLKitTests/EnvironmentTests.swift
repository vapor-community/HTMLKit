import HTMLKit
import XCTest

final class EnvironmentTests: XCTestCase {
    
    var renderer = Renderer()
    
    /// Tests the environment access through the environment object
    ///
    /// The renderer is expected to evaluate the placeholder and renderer the resulting value.
    func testEnvironmentAccess() throws {
        
        struct FamilyObject: ViewModel {
            
            let name: String = "Doe"
            let father: FatherObject = FatherObject()
        }
        
        struct FatherObject: ViewModel {
            
            let avatar: String = "john_doe.jpeg"
            let name: String = "John"
        }
        
        struct ParentView: View {
            
            let content: [Content]
            
            init(@ContentBuilder<Content> content: () -> [Content]) {
                self.content = content()
            }
            
            var body: Content {
                Division {
                    content
                }
                .environment(object: FamilyObject())
            }
        }
        
        struct ChildView: View {
            
            @EnvironmentObject(FamilyObject.self)
            var object
            
            var body: Content {
                ParentView {
                    Section{
                        Image()
                            .source(object.father.avatar)
                        Heading1 {
                            object.name
                        }
                        Paragraph {
                            object.father.name + " " + object.name
                        }
                    }
                }
            }
        }
        
        XCTAssertEqual(try renderer.render(view: ChildView()),
                       """
                       <div>\
                       <section>\
                       <img src="john_doe.jpeg">\
                       <h1>Doe</h1>\
                       <p>John Doe</p>\
                       </section>\
                       </div>
                       """
        )
    }
}
