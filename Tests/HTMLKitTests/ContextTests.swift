/*
 Abstract:
 The file tests the annotations.
 */

import HTMLKit
import XCTest

final class ContextTests: XCTestCase {
    
    struct MainContext: ViewModel {

        var category: String
        
        var child: ChildContext
    }
    
    struct ChildContext: ViewModel {

        var headline: String
    }
    
    struct MainView: View {
        
        @Context(MainContext.self)
        var context
        
        var body: Content {
            Heading1 {
                $context.category.value
            }
            ChildView()
        }
    }
    
    struct ChildView: View {
        
        @Context(MainContext.self)
        var context
        
        var body: Content {
            Section{
                Heading2 {
                    $context.child.headline.value
                }
            }
        }
    }
    
    var renderer = Renderer()
    
    func testViewContext() throws {
        
        let context = MainContext(category: "test1", child: .init(headline: "test2"))
        
        renderer.add(view: ChildView())
        
        XCTAssertEqual(renderer.render(view: ChildView(), with: context),
                       """
                       <section>\
                       <h2>test2</h2>\
                       </section>
                       """
        )
    }
    
    func testMainContext() throws {
        
        let context = MainContext(category: "test1", child: .init(headline: "test2"))
        
        renderer.add(view: MainView())
        
        XCTAssertEqual(renderer.render(view: MainView(), with: context),
                       """
                       <h1>test1</h1>\
                       <section>\
                       <h2>test2</h2>\
                       </section>
                       """
        )
    }
}
