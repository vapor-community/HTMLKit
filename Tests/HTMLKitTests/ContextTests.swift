/*
 Abstract:
 The file tests the annotations.
 */

import HTMLKit
import XCTest

final class ContextTests: XCTestCase {
    
    struct PageContext: Codable {
        
        var category: String
        var viewContext: ViewContext
    }
    
    struct ViewContext: Codable {
        
        var headline: String
    }
    
    struct TestPage: Page {
        
        @TemplateValue(PageContext.self)
        var context
        
        var body: AnyContent {
            Heading1 {
                context.category
            }
            TestView(context: context.viewContext)
        }
    }
    
    struct TestView: View {
        
        @TemplateValue(ViewContext.self)
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
        
        let context = ViewContext(headline: "test")
        
        renderer.add(layout: TestView())
        
        XCTAssertEqual(renderer.render(layout: TestView(), with: context),
                       """
                       <section>\
                       <h2>test</h2>\
                       </section>
                       """
        )
    }
    
    func testPageContext() throws {
        
        let context = PageContext(category: "test", viewContext: .init(headline: "test"))
        
        renderer.add(layout: TestPage())
        
        XCTAssertEqual(renderer.render(layout: TestPage(), with: context),
                       """
                       <h1>test</h1>\
                       <section>\
                       <h2>test</h2>\
                       </section>
                       """
        )
    }
}
