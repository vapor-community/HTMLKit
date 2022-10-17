import XCTVapor
import HTMLKit
import HTMLKitVaporProvider

final class ProviderTests: XCTestCase {
    
    struct TestContext: Vapor.Content {
        let greeting: String
    }

    struct TestView: HTMLKit.View {
        
        @TemplateValue(TestContext.self)
        var context
        
        var body: AnyContent {
            Document(type: .html5)
            Html {
                Head {
                    Title {
                        "title"
                    }
                }
                Body {
                    Paragraph {
                        context.greeting
                    }
                }
            }
        }
    }
    
    func testEventLoopIntegrationWithViewRenderer() throws {
        
        let app = Application(.testing)
        
        defer { app.shutdown() }
        
        app.views.use(.htmlkit)
        
        app.htmlkit.add(view: TestView())
        
        app.get("test") { request -> EventLoopFuture<Vapor.View> in
            return request.view.render("TestView", TestContext(greeting: "hello world"))
        }
        
        try app.test(.GET, "test") { response in
            XCTAssertEqual(response.status, .ok)
            XCTAssertEqual(response.body.string,
                            """
                            <!DOCTYPE html>\
                            <html>\
                            <head>\
                            <title>title</title>\
                            </head>\
                            <body>\
                            <p>\
                            hello world\
                            </p>\
                            </body>\
                            </html>
                            """
            )
        }
    }
    
    func testEventLoopIntegration() throws {
        
        let app = Application(.testing)
        
        defer { app.shutdown() }
        
        app.htmlkit.add(view: TestView())
        
        app.get("test") { request -> EventLoopFuture<Vapor.View> in
            return request.htmlkit.render("TestView", TestContext(greeting: "hello world"))
        }
        
        try app.test(.GET, "test") { response in
            XCTAssertEqual(response.status, .ok)
            XCTAssertEqual(response.body.string,
                            """
                            <!DOCTYPE html>\
                            <html>\
                            <head>\
                            <title>title</title>\
                            </head>\
                            <body>\
                            <p>\
                            hello world\
                            </p>\
                            </body>\
                            </html>
                            """
            )
        }
    }
    
    @available(macOS 12, *)
    func testConcurrencyIntegration() throws {
        
        let app = Application(.testing)
        
        defer { app.shutdown() }
        
        app.htmlkit.add(view: TestView())
        
        app.get("test") { request async throws -> Vapor.View in
            return try await request.htmlkit.render("TestView", TestContext(greeting: "hello world"))
        }
        
        try app.test(.GET, "test") { response in
            XCTAssertEqual(response.status, .ok)
            XCTAssertEqual(response.body.string,
                            """
                            <!DOCTYPE html>\
                            <html>\
                            <head>\
                            <title>title</title>\
                            </head>\
                            <body>\
                            <p>\
                            hello world\
                            </p>\
                            </body>\
                            </html>
                            """
            )
        }
    }
}
