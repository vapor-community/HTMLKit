/*
 Abstract:
 The file tests the annotations.
 */

import HTMLKit
import XCTest

final class ContextTests: XCTestCase {
    
    struct ParentContext {
        
        var category: String
        var viewContext: ChildContext
    }
    
    struct ChildContext {
        
        var headline: String
    }
    
    struct ParentView: View {
        
        var context: ParentContext
        
        var body: AnyContent {
            Heading1 {
                context.category
            }
            ChildView(context: context.viewContext)
        }
    }
    
    struct ChildView: View {
        
        var context: ChildContext
        
        var body: AnyContent {
            Section{
                Heading2 {
                    context.headline
                }
            }
        }
    }
    
    var renderer = Renderer()
    
    func testChildView() throws {
        
        let context = ChildContext(headline: "test")
        
        XCTAssertEqual(try renderer.render(view: ChildView(context: context)),
                       """
                       <section>\
                       <h2>test</h2>\
                       </section>
                       """
        )
    }
    
    func testPageContext() throws {
        
        let context = ParentContext(category: "test", viewContext: .init(headline: "test"))
        
        XCTAssertEqual(try renderer.render(view: ParentView(context: context)),
                       """
                       <h1>test</h1>\
                       <section>\
                       <h2>test</h2>\
                       </section>
                       """
        )
    }
}
