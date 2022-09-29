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
                        TestView()
                    }
                }
            }
        }
        
        struct TestView: View {
            
            @TemplateValue(String.self)
            var context
            
            var body: AnyContent {
                Heading1 {
                    context
                }
                Heading2 {
                    context
                }
            }
        }
        
        try renderer.add(layout: TestPage())
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self, with: "Hello World!"),
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
            
            @TemplateValue(String.self)
            var context
            
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
        
        try renderer.add(layout: TestView())
        
        XCTAssertEqual(try renderer.render(layout: TestView.self, with: "Hello World!"),
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
            
            @TemplateValue(String.self)
            var context
            
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

        try renderer.add(layout: TestView())
        
        XCTAssertEqual(try renderer.render(layout: TestView.self, with: "Hello World!"),
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
