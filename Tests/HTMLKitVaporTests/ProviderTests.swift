/*
 Abstract:
 The file tests the provider.
 */

import XCTVapor
import HTMLKit
import HTMLKitVapor

final class ProviderTests: XCTestCase {
    
    struct TestContext: Vapor.Content {
        let greeting: String
    }

    enum User {
        
        struct TestView: HTMLKit.View {
            
            @TemplateValue(TestContext.self)
            var context
            
            var body: AnyContent {
                Document(.html5)
                Html {
                    Head {
                        Title {
                            "User.TestView"
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
    }
    
    enum Admin {
        
        struct TestView: HTMLKit.View {
            
            @TemplateValue(TestContext.self)
            var context
            
            var body: AnyContent {
                Document(.html5)
                Html {
                    Head {
                        Title {
                            "Admin.TestView"
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
    }
    
    func testEventLoopIntegrationWithViewRenderer() throws {
        
        let app = Application(.testing)
        
        defer { app.shutdown() }
        
        app.views.use(.htmlkit)
        
        app.htmlkit.add(layout: User.TestView())
        app.htmlkit.add(layout: Admin.TestView())
        
        app.get("test") { request -> EventLoopFuture<Vapor.View> in
            return request.view.render("HTMLKitVaporTests.ProviderTests.User.TestView", TestContext(greeting: "hello world"))
        }
        
        try app.test(.GET, "test") { response in
            XCTAssertEqual(response.status, .ok)
            XCTAssertEqual(response.body.string,
                            """
                            <!DOCTYPE html>\
                            <html>\
                            <head>\
                            <title>User.TestView</title>\
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
        
        app.htmlkit.add(layout: User.TestView())
        app.htmlkit.add(layout: Admin.TestView())
        
        app.get("test") { request -> EventLoopFuture<Vapor.View> in
            return request.htmlkit.render("HTMLKitVaporTests.ProviderTests.Admin.TestView", TestContext(greeting: "hello world"))
        }
        
        try app.test(.GET, "test") { response in
            XCTAssertEqual(response.status, .ok)
            XCTAssertEqual(response.body.string,
                            """
                            <!DOCTYPE html>\
                            <html>\
                            <head>\
                            <title>Admin.TestView</title>\
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
        
        app.htmlkit.add(layout: User.TestView())
        app.htmlkit.add(layout: Admin.TestView())
        
        app.get("test") { request async throws -> Vapor.View in
            return try await request.htmlkit.render("HTMLKitVaporTests.ProviderTests.User.TestView", TestContext(greeting: "hello world"))
        }
        
        try app.test(.GET, "test") { response in
            XCTAssertEqual(response.status, .ok)
            XCTAssertEqual(response.body.string,
                            """
                            <!DOCTYPE html>\
                            <html>\
                            <head>\
                            <title>User.TestView</title>\
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
