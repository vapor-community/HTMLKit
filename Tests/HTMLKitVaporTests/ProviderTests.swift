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
                    Paragraph("hello.world")
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
    
    func testEventLoopIntegration() async throws {
        
        let app = try await Application.make(.testing)
        
        app.get("test") { request -> EventLoopFuture<Vapor.View> in
            
            let context = TestContext(greeting: "Hello World")
            
            return request.htmlkit.render(TestPage.NephewView(context: context))
        }
        
        try await app.test(.GET, "test") { response async in
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
        
        try await app.asyncShutdown()
    }
    
    func testConcurrencyIntegration() async throws {
        
        let app = try await Application.make(.testing)
        
        app.get("test") { request async throws -> Vapor.View in
            
            let context = TestContext(greeting: "Hello World")
            
            return try await request.htmlkit.render(TestPage.NephewView(context: context))
        }
        
        try await app.test(.GET, "test") { response async in
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
        
        try await app.asyncShutdown()
    }

    /// Tests the setup of localization through Vapor.
    func testLocalizationIntegration() async throws {
        
        guard let source = Bundle.module.url(forResource: "Localization", withExtension: nil) else {
            return
        }
        
        let app = try await Application.make(.testing)
        
        app.htmlkit.localization.set(source: source)
        app.htmlkit.localization.set(locale: "fr")
        
        app.get("test") { request async throws -> Vapor.View in
            
            return try await request.htmlkit.render(TestPage.ChildView())
        }
        
        try await app.test(.GET, "test") { response async in
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
        
        try await app.asyncShutdown()
    }
    
    /// Tests the behavior when localization is not properly configured
    ///
    /// Localization is considered improperly configured when one or both of the essential factors are missing.
    /// In such case the renderer is expected to skip the localization and directly return the fallback string literal.
    func testLocalizationFallback() async throws {
        
        let app = try await Application.make(.testing)
        
        app.get("test") { request async throws -> Vapor.View in
            
            return try await request.htmlkit.render(TestPage.ChildView())
        }
        
        try await app.test(.GET, "test") { response async in
            XCTAssertEqual(response.status, .ok)
            XCTAssertEqual(response.body.string,
                            """
                            <!DOCTYPE html>\
                            <html>\
                            <head>\
                            <title>TestPage</title>\
                            </head>\
                            <body>\
                            <p>hello.world</p>\
                            </body>\
                            </html>
                            """
            )
        }
        
        try await app.asyncShutdown()
    }
    
    /// Tests the localization behavior based on the accept language of the client.
    ///
    /// The environment locale is expected to be changed according to the language given by the provider.
    /// The renderer is expected to localize correctly the content based on the updated environment locale.
    func testLocalizationByAcceptingHeaders() async throws {
        
        guard let source = Bundle.module.url(forResource: "Localization", withExtension: nil) else {
            return
        }
        
        let app = try await Application.make(.testing)
        
        app.htmlkit.localization.set(source: source)
        app.htmlkit.localization.set(locale: "en-GB")
        
        app.get("test") { request async throws -> Vapor.View in
            
            return try await request.htmlkit.render(TestPage.ChildView())
        }
        
        try await app.test(.GET, "test", headers: ["accept-language": "fr"]) { response async in
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
        
        try await app.asyncShutdown()
    }
    
    /// Tests the localization behavior when the preferred language is unknown.
    ///
    /// A language is considered unknown if the locale couldn't be found (e.g. typo) or isn't set up in the first place.
    /// In such a case, the renderer is expected to fall back to the default locale.
    func testUnknownPreferredLanguage() async throws {
        
        guard let source = Bundle.module.url(forResource: "Localization", withExtension: nil) else {
            return
        }
        
        let app = try await Application.make(.testing)
        
        app.htmlkit.localization.set(source: source)
        app.htmlkit.localization.set(locale: "en-GB")
        
        app.get("test") { request async throws -> Vapor.View in
            return try await request.htmlkit.render(TestPage.ChildView())
        }
        
        try await app.test(.GET, "test", headers: ["accept-language": "en-US"]) { response async in
            
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
        
        try await app.asyncShutdown()
    }
    
    /// Tests the access to environment through provider.
    ///
    /// The provider is expected to recieve the environment object and resolve it based on the request.
    func testEnvironmentIntegration() async throws {
        
        let app = try await Application.make(.testing)
        
        app.htmlkit.environment.upsert(TestObject(), for: \TestObject.self)
        
        app.get("test") { request async throws -> Vapor.View in
            return try await request.htmlkit.render(TestPage.SipplingView())
        }
        
        try await app.test(.GET, "test") { response async in
            
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
        
        try await app.asyncShutdown()
    }
    
    /// Tests the markdown support.
    func testMarkdownSupport() async throws {
        
        let app = try await Application.make(.testing)
        
        app.htmlkit.features = [.markdown, .escaping]
        
        app.get("test") { request async throws -> Vapor.View in
            return try await request.htmlkit.render(TestPage.FriendView())
        }
        
        try await app.test(.GET, "test") { response async in
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
        
        try await app.asyncShutdown()
    }
    
    /// Tests the error reporting to Vapor for issues that may occur during environment access.
    ///
    /// The error is expected to be classified as an internal server error and includes a error message.
    func testEnvironmentErrorReporting() async throws {
        
        struct TestObject {
            
            let firstName = "Jane"
        }
        
        struct UnknownObject: HTMLKit.View {
            
            @EnvironmentObject(TestObject.self)
            var object
            
            var body: HTMLKit.Content {
                Paragraph {
                    Environment.check(object.firstName) {
                        "True"
                    }
                }
            }
        }
        
        struct WrongCast: HTMLKit.View {
            
            @EnvironmentObject(TestObject.self)
            var object
            
            var body: HTMLKit.Content {
                Paragraph {
                    Environment.check(object.firstName) {
                        "True"
                    }
                }
                .environment(object: TestObject())
            }
        }
        
        let app = try await Application.make(.testing)
        
        app.get("unknownobject") { request async throws -> Vapor.View in
            return try await request.htmlkit.render(UnknownObject())
        }
        
        app.get("wrongcast") { request async throws -> Vapor.View in
            return try await request.htmlkit.render(WrongCast())
        }
        
        try await app.test(.GET, "unknownobject") { response async throws in
            
            XCTAssertEqual(response.status, .internalServerError)
            
            let abort = try response.content.decode(AbortResponse.self)
            
            XCTAssertEqual(abort.reason, "Unable to retrieve environment object.")
        }
        
        try await app.test(.GET, "wrongcast") { response async throws in
            
            XCTAssertEqual(response.status, .internalServerError)
            
            let abort = try response.content.decode(AbortResponse.self)
            
            XCTAssertEqual(abort.reason, "Unable to cast the environment value.")
        }
        
        try await app.asyncShutdown()
    }
}
