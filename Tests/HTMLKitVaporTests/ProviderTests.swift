/*
 Abstract:
 The file tests the provider.
 */

import XCTVapor
import HTMLKit
import HTMLKitVapor

final class ProviderTests: XCTestCase {
    
    struct TestContext: Vapor.Content, ViewModel {
        
        let greeting: String
    }

    struct HomePage: HTMLKit.Page {
       
        var views: [HTMLKit.View] = [IndexView(), CreateView(), EditView()]
        
        struct IndexView: HTMLKit.View {
            
            var body: HTMLKit.Content {
                Document(.html5)
                Html {
                    Head {
                        Title {
                            "HomePage.IndexView"
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
        
        struct CreateView: HTMLKit.View {
            
            @Context(TestContext.self)
            var context
            
            var body: HTMLKit.Content {
                Document(.html5)
                Html {
                    Head {
                        Title {
                            "HomePage.CreateView"
                        }
                    }
                    Body {
                        Paragraph {
                            $context.greeting.value
                        }
                    }
                }
            }
        }
        
        struct EditView: HTMLKit.View {
            
            var body: HTMLKit.Content {
                Document(.html5)
                Html {
                    Head {
                        Title {
                            "HomePage.EditView"
                        }
                    }
                    Body {
                        Paragraph("Hallo Welt")
                    }
                }
            }
        }
    }
    
    func testEventLoopIntegrationWithViewRenderer() throws {
        
        let app = Application(.testing)
        
        defer { app.shutdown() }
        
        app.views.use(.htmlkit)
        
        app.htmlkit.views.add(page: HomePage())
        
        app.get("test") { request -> EventLoopFuture<Vapor.View> in
            return request.view.render(HomePage.IndexView.name)
        }
        
        try app.test(.GET, "test") { response in
            XCTAssertEqual(response.status, .ok)
            XCTAssertEqual(response.body.string,
                            """
                            <!DOCTYPE html>\
                            <html>\
                            <head>\
                            <title>HomePage.IndexView</title>\
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
        
        app.htmlkit.views.add(page: HomePage())
        
        app.get("test") { request -> EventLoopFuture<Vapor.View> in
            return request.htmlkit.render(HomePage.CreateView.name, TestContext(greeting: "Hello World"))
        }
        
        try app.test(.GET, "test") { response in
            XCTAssertEqual(response.status, .ok)
            XCTAssertEqual(response.body.string,
                            """
                            <!DOCTYPE html>\
                            <html>\
                            <head>\
                            <title>HomePage.CreateView</title>\
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
        
        app.htmlkit.views.add(page: HomePage())
        
        app.get("test") { request async throws -> Vapor.View in
            return try await request.htmlkit.render(HomePage.IndexView.name)
        }
        
        try app.test(.GET, "test") { response in
            XCTAssertEqual(response.status, .ok)
            XCTAssertEqual(response.body.string,
                            """
                            <!DOCTYPE html>\
                            <html>\
                            <head>\
                            <title>HomePage.IndexView</title>\
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
        
        app.views.use(.htmlkit)
        
        app.htmlkit.views.add(page: HomePage())
        
        app.htmlkit.lingo.set(directory: currentDirectory)
        app.htmlkit.lingo.set(locale: .french)
        
        app.get("test") { request async throws -> Vapor.View in
            return try await request.view.render(HomePage.EditView.name)
        }
        
        try app.test(.GET, "test") { response in
            XCTAssertEqual(response.status, .ok)
            XCTAssertEqual(response.body.string,
                            """
                            <!DOCTYPE html>\
                            <html>\
                            <head>\
                            <title>HomePage.EditView</title>\
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

