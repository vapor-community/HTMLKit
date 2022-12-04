/*
 Abstract:
 The file tests the templating.
 */

import HTMLKit
import XCTest
import OrderedCollections

final class TemplatingTests: XCTestCase {
    
    var renderer = Renderer()
    
    func testEmbeding() throws {
        
        struct TestPage: Page {
            
            var body: AnyContent {
                Document(.html5)
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
        
        renderer.add(layout: TestPage())
        
        XCTAssertEqual(renderer.render(layout: TestPage(), with: "Hello World!"),
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
            
            var content: [AnyContent]
            
            init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
                self.content = content()
            }
            
            var body: AnyContent {
                Document(.html5)
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
        
        renderer.add(layout: TestView())
        
        XCTAssertEqual(renderer.render(layout: TestView(), with: "Hello World!"),
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
}
