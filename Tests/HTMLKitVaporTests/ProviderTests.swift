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
    
    enum Visitor {
        
        struct TestView: HTMLKit.View {
            
            var body: AnyContent {
                Document(.html5)
                Html {
                    Head {
                        Title {
                            "Visitor.TestView"
                        }
                    }
                    Body {
                        Paragraph("Hallo Welt")
                    }
                }
            }
        }
    }

    enum User {
        
        struct TestView: HTMLKit.View {
            
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
                            "Hello World"
                        }
                    }
                }
            }
        }
    }
    
    enum Admin {
        
        struct TestView: HTMLKit.View {
            
            var context: TestContext
            
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
        
        app.get("test") { request -> EventLoopFuture<Vapor.View> in
            return request.htmlkit.render(User.TestView())
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
                            <p>Hello World</p>\
                            </body>\
                            </html>
                            """
            )
        }
    }
    
    func testEventLoopIntegration() throws {
        
        let app = Application(.testing)
        
        defer { app.shutdown() }
        
        app.get("test") { request -> EventLoopFuture<Vapor.View> in
            
            let context = TestContext(greeting: "Hello World")
            
            return request.htmlkit.render(Admin.TestView(context: context))
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
                            <p>Hello World</p>\
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
        
        app.get("test") { request async throws -> Vapor.View in
            return try await request.htmlkit.render(User.TestView())
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
                            <p>Hello World</p>\
                            </body>\
                            </html>
                            """
            )
        }
    }
    
    @available(macOS 12, *)
    func testConcurrencyIntegrationWithLocalization() throws {
        
        let currentFile = URL(fileURLWithPath: #file).deletingLastPathComponent()
        
        let currentDirectory = currentFile.appendingPathComponent("Localization")
        
        let app = Application(.testing)
        
        defer { app.shutdown() }
        
        app.htmlkit.lingo.set(directory: currentDirectory)
        app.htmlkit.lingo.set(locale: .french)
        
        app.get("test") { request async throws -> Vapor.View in
            return try await request.htmlkit.render(Visitor.TestView())
        }
        
        try app.test(.GET, "test") { response in
            XCTAssertEqual(response.status, .ok)
            XCTAssertEqual(response.body.string,
                            """
                            <!DOCTYPE html>\
                            <html>\
                            <head>\
                            <title>Visitor.TestView</title>\
                            </head>\
                            <body>\
                            <p>Bonjour le monde</p>\
                            </body>\
                            </html>
                            """
            )
        }
    }
}
