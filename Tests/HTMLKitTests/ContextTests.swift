/*
 Abstract:
 The file tests the annotations.
 */

import HTMLKit
import XCTest

final class ContextTests: XCTestCase {
    
    struct MainContext: Codable {
        
        var category: String
        var viewContext: ChildContext
    }
    
    struct ChildContext: Codable {
        
        var headline: String
    }
    
    struct MainView: View {
        
        @TemplateValue(MainContext.self)
        var context
        
        var body: AnyContent {
            Heading1 {
                context.category
            }
            ChildView(context: context.viewContext)
        }
    }
    
    struct ChildView: View {
        
        @TemplateValue(ChildContext.self)
        var context
        
        var body: AnyContent {
            Section{
                Heading2 {
                    context.headline
                }
            }
        }
    }
    
    var renderer = Renderer()
    
    func testViewContext() throws {
        
        let context = ChildContext(headline: "test")
        
        renderer.add(view: ChildView())
        
        XCTAssertEqual(renderer.render(view: ChildView(), with: context),
                       """
                       <section>\
                       <h2>test</h2>\
                       </section>
                       """
        )
    }
    
    func testMainContext() throws {
        
        let context = MainContext(category: "test", viewContext: .init(headline: "test"))
        
        renderer.add(view: MainView())
        
        XCTAssertEqual(renderer.render(view: MainView(), with: context),
                       """
                       <h1>test</h1>\
                       <section>\
                       <h2>test</h2>\
                       </section>
                       """
        )
    }
}
