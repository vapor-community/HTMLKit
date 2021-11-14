import HTMLKit
import XCTest

final class ContextTests: XCTestCase {
    
    struct TestModel {
        
        var headline: String
        var subtitle: String
    }
    
    struct TestPage: Page {
        
        var body: Content {
            TestView(context: .constant(TestModel(headline: "test", subtitle: "test")))
        }
    }
    
    struct TestView: View {
        
        var context: TemplateValue<TestModel>
        
        var body: Content {
            Section{
                Heading1 {
                    context.headline
                }
                Heading2 {
                    context.subtitle
                }
            }
        }
    }
    
    var renderer = Renderer()
    
    func testViewContext() throws {
        
        let model = TestModel(headline: "test", subtitle: "test")
        
        let view = TestView(context: .constant(model))
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestView.self, with: model),
                       """
                       <section>\
                       <h1>test</h1>\
                       <h2>test</h2>\
                       </section>
                       """
        )
    }
    
    func testPageContext() throws {
        
        let page = TestPage()
        
        try renderer.add(view: page)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <section>\
                       <h1>test</h1>\
                       <h2>test</h2>\
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
