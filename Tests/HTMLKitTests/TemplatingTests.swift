import HTMLKit
import XCTest
import OrderedCollections

final class TemplatingTests: XCTestCase {
    
    var renderer = Renderer()
    
    func testEmbeding() throws {
        
        struct TestPage: Page {
            
            var body: AnyContent {
                Document(type: .html5)
                Html {
                    Head {
                        Title {
                            "Test"
                        }
                    }
                    Body {
                        TestView(context: "Hello World!")
                    }
                }
            }
        }
        
        struct TestView: View {
            
            var context: TemplateValue<String>
            
            var body: AnyContent {
                Heading1 {
                    context
                }
                Heading2 {
                    context
                }
            }
        }
        
        let view = TestPage()
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestPage.self),
                       """
                       <!DOCTYPE html>\
                       <html>\
                       <head>\
                       <title>Test</title>\
                       </head>\
                       <body>\
                       <h1>Hello World!</h1>\
                       <h2>Hello World!</h2>\
                       </body>\
                       </html>
                       """
        )
    }
    
    func testExtending() throws {
        
        struct TestPage: Page {
            
            var content: [BodyElement]
            
            init(@ContentBuilder<BodyElement> content: () -> [BodyElement]) {
                self.content = content()
            }
            
            var body: AnyContent {
                Document(type: .html5)
                Html {
                    Head {
                        Title {
                            "Test"
                        }
                    }
                    Body {
                        content
                    }
                }
            }
        }
        
        struct TestView: View {
            
            var context: TemplateValue<String>
            
            var body: AnyContent {
                TestPage {
                    Heading1 {
                        context
                    }
                    Heading2 {
                        context
                    }
                }
            }
        }
        
        let view = TestView(context: "Hello World!")
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestView.self, with: "Hello World!"),
                       """
                       <!DOCTYPE html>\
                       <html>\
                       <head>\
                       <title>Test</title>\
                       </head>\
                       <body>\
                       <h1>Hello World!</h1>\
                       <h2>Hello World!</h2>\
                       </body>\
                       </html>
                       """
        )
    }
    
    func testExtendingWithSingles() throws {
        
        struct TestPage: Page {
            
            var content: [BodyElement]
            
            init(@ContentBuilder<BodyElement> content: () -> [BodyElement]) {
                self.content = content()
            }
            
            var body: AnyContent {
                Document(type: .html5)
                Html {
                    Head {
                        Title {
                            "Test"
                        }
                    }
                    Body {
                        content
                        Script {
                        }
                        Script {
                        }
                    }
                }
            }
        }
        
        struct TestView: View {
            
            var context: TemplateValue<String>
            
            var body: AnyContent {
                TestPage {
                    Heading1 {
                        context
                    }
                    Heading2 {
                        context
                    }
                }
            }
        }
        
        let view = TestView(context: "Hello World!")
        
        try renderer.add(view: view)
        
        XCTAssertEqual(try renderer.render(raw: TestView.self, with: "Hello World!"),
                       """
                       <!DOCTYPE html>\
                       <html>\
                       <head>\
                       <title>Test</title>\
                       </head>\
                       <body>\
                       <h1>Hello World!</h1>\
                       <h2>Hello World!</h2>\
                       <script></script>\
                       <script></script>\
                       </body>\
                       </html>
                       """
        )
    }
}

extension TemplatingTests {
    
    static var allTests = [
        ("testEmbeding", testEmbeding),
        ("testExtending", testExtending),
        ("testExtendingWithSingles", testExtendingWithSingles)
    ]
}

