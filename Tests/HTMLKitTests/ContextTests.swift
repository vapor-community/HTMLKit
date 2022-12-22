/*
 Abstract:
 The file tests the annotations.
 */

import HTMLKit
import XCTest

final class ContextTests: XCTestCase {
    
    struct PageContext {
        
        var category: String
        var viewContext: ViewContext
    }
    
    struct ViewContext {
        
        var headline: String
    }
    
    struct TestPage: Page {
        
        var context: PageContext
        
        var body: AnyContent {
            Heading1 {
                context.category
            }
            TestView(context: context.viewContext)
        }
    }
    
    struct TestView: View {
        
        var context: ViewContext
        
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
        
        let context = ViewContext(headline: "test")
        
        try renderer.add(layout: TestView())
        
        XCTAssertEqual(try renderer.render(layout: TestView.self, with: context),
                       """
                       <section>\
                       <h2>test</h2>\
                       </section>
                       """
        )
    }
    
    func testPageContext() throws {
        
        let context = PageContext(category: "test", viewContext: .init(headline: "test"))
        
        try renderer.add(layout: TestPage())
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self, with: context),
                       """
                       <h1>test</h1>\
                       <section>\
                       <h2>test</h2>\
                       </section>
                       """
        )
    }
}
