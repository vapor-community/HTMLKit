/*
 Abstract:
 The file tests the provider.
 */

import XCTVapor
import HTMLKit
import HTMLKitVapor

final class ProviderTests: XCTestCase {
    
    struct TestObject: Vapor.Content {
        
        var greeting: String = "Hello World"
    }
    
    struct TestContext: Vapor.Content {
        
        var greeting: String
    }

    enum TestPage {
        
        struct MainView: HTMLKit.View {
            
            var content: [BodyElement]
            
            init(@ContentBuilder<BodyElement> content: () -> [BodyElement]) {
                
                self.content = content()
            }
            
            var body: HTMLKit.Content {
                Document(.html5)
                Html {
                    Head {
                        Title {
                            "TestPage"
                        }
                    }
                    Body {
                        content
                    }
                }
            }
        }
        
        struct NephewView: HTMLKit.View {
            
            var context: TestContext
            
            var body: HTMLKit.Content {
                MainView {
                    Paragraph {
                        context.greeting
                    }
                }
            }
        }
        
        struct ChildView: HTMLKit.View {
            
            var body: HTMLKit.Content {
                MainView {
                    Paragraph("greeting.world")
                }
            }
        }
        
        struct SipplingView: HTMLKit.View {
            
            @EnvironmentObject(TestObject.self)
            var object
            
            var body: HTMLKit.Content {
                MainView {
                    Paragraph {
                        object.greeting
                    }
                }
            }
        }
        
        struct FriendView: HTMLKit.View {
            
            var body: HTMLKit.Content {
                MainView {
                    Paragraph {
                        MarkdownString("This *substring* is **important**.")
                    }
                }
            }
        }
    }
    
    func testEventLoopIntegration() throws {
        
        let app = Application(.testing)
        
        defer { app.shutdown() }
        
        app.get("test") { request -> EventLoopFuture<Vapor.View> in
            
            let context = TestContext(greeting: "Hello World")
            
            return request.htmlkit.render(TestPage.NephewView(context: context))
        }
        
        try app.test(.GET, "test") { response in
            XCTAssertEqual(response.status, .ok)
            XCTAssertEqual(response.body.string,
                            """
                            <!DOCTYPE html>\
                            <html>\
                            <head>\
                            <title>TestPage</title>\
                            </head>\
                            <body>\
                            <p>Hello World</p>\
                            </body>\
                            </html>
                            """
            )
        }
    }
    
    func testConcurrencyIntegration() throws {
        
        let app = Application(.testing)
        
        defer { app.shutdown() }
        
        app.get("test") { request async throws -> Vapor.View in
            
            let context = TestContext(greeting: "Hello World")
            
            return try await request.htmlkit.render(TestPage.NephewView(context: context))
        }
        
        try app.test(.GET, "test") { response in
            XCTAssertEqual(response.status, .ok)
            XCTAssertEqual(response.body.string,
                            """
                            <!DOCTYPE html>\
                            <html>\
                            <head>\
                            <title>TestPage</title>\
                            </head>\
                            <body>\
                            <p>Hello World</p>\
                            </body>\
                            </html>
                            """
            )
        }
    }
    
    func testLocalizationIntegration() throws {
        
        let currentFile = URL(fileURLWithPath: #file).deletingLastPathComponent()
        
        let currentDirectory = currentFile.appendingPathComponent("Localization")
        
        let app = Application(.testing)
        
        defer { app.shutdown() }
        
        app.htmlkit.localization.set(source: currentDirectory)
        app.htmlkit.localization.set(locale: "fr")
        
        app.get("test") { request async throws -> Vapor.View in
            
            return try await request.htmlkit.render(TestPage.ChildView())
        }
        
        try app.test(.GET, "test") { response in
            XCTAssertEqual(response.status, .ok)
            XCTAssertEqual(response.body.string,
                            """
                            <!DOCTYPE html>\
                            <html>\
                            <head>\
                            <title>TestPage</title>\
                            </head>\
                            <body>\
                            <p>Bonjour le monde</p>\
                            </body>\
                            </html>
                            """
            )
        }
    }
    
    /// Tests the access to environment through provider
    ///
    /// The provider is expected to recieve the environment object and resolve it based on the request.
    func testEnvironmentIntegration() throws {
        
        let app = Application(.testing)
        
        defer { app.shutdown() }
        
        app.htmlkit.environment.upsert(TestObject(), for: \TestObject.self)
        
        app.get("test") { request async throws -> Vapor.View in
            return try await request.htmlkit.render(TestPage.SipplingView())
        }
        
        try app.test(.GET, "test") { response in
            XCTAssertEqual(response.status, .ok)
            XCTAssertEqual(response.body.string,
                            """
                            <!DOCTYPE html>\
                            <html>\
                            <head>\
                            <title>TestPage</title>\
                            </head>\
                            <body>\
                            <p>Hello World</p>\
                            </body>\
                            </html>
                            """
            )
        }
    }
    
    func testMarkdownSupport() throws {
        
        let app = Application(.testing)
        
        defer { app.shutdown() }
        
        app.htmlkit.features = [.markdown]
        
        app.get("test") { request async throws -> Vapor.View in
            return try await request.htmlkit.render(TestPage.FriendView())
        }
        
        try app.test(.GET, "test") { response in
            XCTAssertEqual(response.status, .ok)
            XCTAssertEqual(response.body.string,
                            """
                            <!DOCTYPE html>\
                            <html>\
                            <head>\
                            <title>TestPage</title>\
                            </head>\
                            <body>\
                            <p>This <em>substring</em> is <strong>important</strong>.</p>\
                            </body>\
                            </html>
                            """
            )
        }
    }
}
