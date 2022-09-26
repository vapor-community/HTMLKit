import XCTVapor
import HTMLKit
import HTMLKitVaporProvider

final class ProviderTests: XCTestCase {

    struct TestPage: Page {
        
        var body: AnyContent {
            Document(type: .html5)
            Html {
                Head {
                    Title {
                        "title"
                    }
                }
                Body {
                }
            }
        }
    }
    
    func testEventLoopIntegrationWithViewRenderer() throws {
        
        let app = Application(.testing)
        
        defer { app.shutdown() }
        
        app.views.use(.htmlkit)
        
        app.htmlkit.add(page: TestPage())
        
        app.get("test") { request -> EventLoopFuture<Vapor.View> in
            return request.view.render("TestPage")
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
                            </body>\
                            </html>
                            """
            )
        }
    }
    
    func testEventLoopIntegration() throws {
        
        let app = Application(.testing)
        
        defer { app.shutdown() }
        
        app.htmlkit.add(page: TestPage())
        
        app.get("test") { request -> EventLoopFuture<Vapor.View> in
            return request.htmlkit.render("TestPage")
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
        
        app.htmlkit.add(page: TestPage())
        
        app.get("test") { request async throws -> Vapor.View in
            return try await request.htmlkit.render("TestPage")
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
                            </body>\
                            </html>
                            """
            )
        }
    }
}
