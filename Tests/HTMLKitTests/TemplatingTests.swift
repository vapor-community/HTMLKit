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
        
        struct MainView: View {
            
            var body: Content {
                Document(.html5)
                Html {
                    Head {
                        Title {
                            "Test"
                        }
                    }
                    Body {
                        ChildView()
                    }
                }
            }
        }
        
        struct ChildView: View {
            
            @TemplateValue(String.self)
            var context
            
            var body: Content {
                Heading1 {
                    context
                }
                Heading2 {
                    context
                }
            }
        }
        
        renderer.add(view: MainView())
        
        XCTAssertEqual(renderer.render(view: MainView(), with: "Hello World!"),
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
        
        struct MainView: View {
            
            var content: [Content]
            
            init(@ContentBuilder<Content> content: () -> [Content]) {
                self.content = content()
            }
            
            var body: Content {
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
        
        struct ChildView: View {
            
            @TemplateValue(String.self)
            var context
            
            var body: Content {
                MainView {
                    Heading1 {
                        context
                    }
                    Heading2 {
                        context
                    }
                }
            }
        }
        
        renderer.add(view: ChildView())
        
        XCTAssertEqual(renderer.render(view: ChildView(), with: "Hello World!"),
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
