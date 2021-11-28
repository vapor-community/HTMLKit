import HTMLKit
import XCTest

final class ContextTests: XCTestCase {
    
    struct PageContext {
        
        var category: String
        var isOnline: Bool
    }
    
    struct ViewContext {
        
        var headline: String
        var subtitle: String
    }
    
    struct TestPage: Page {
        
        @ContentBuilder var body: AnyContent
    }
    
    struct TestView: View {
        
        var context: TemplateValue<ViewContext>
        
        var body: AnyContent {
            Section{
                Heading2 {
                    context.headline
                }
                Heading3 {
                    context.subtitle
                }
            }
        }
    }
    
    var renderer = Renderer()
    
    func testViewContext() throws {
        
        let context = ViewContext(headline: "test", subtitle: "test")
        
        let view = TestView(context: .constant(context))
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestView.self, with: context),
                       """
                       <section>\
                       <h2>test</h2>\
                       <h3>test</h3>\
                       </section>
                       """
        )
    }
    
    func testPageContext() throws {
        
        let context = PageContext(category: "test", isOnline: false)
        
        let page = TestPage {
            Heading1 {
                context.category
            }
            TestView(context: .constant(ViewContext(headline: "test", subtitle: "test")))
        }
        
        try renderer.add(view: page)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <h1>test</h1>\
                       <section>\
                       <h2>test</h2>\
                       <h3>test</h3>\
                       </section>
                       """
        )
    }
}

extension ContextTests {
    
    static var allTests = [
        ("testViewContext", testViewContext),
        ("testPageContext", testPageContext)
    ]
}
