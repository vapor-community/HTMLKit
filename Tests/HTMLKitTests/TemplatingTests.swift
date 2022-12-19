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
        
        struct ChildContext: ViewModel {
            
            var greeting: String = "Hallo"
        }
        
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
            
            @Context(ChildContext.self)
            var context
            
            var body: Content {
                Heading1 {
                    $context.greeting.value
                }
                Heading2 {
                    $context.greeting.value
                }
            }
        }
        
        renderer.add(view: MainView())
        
        XCTAssertEqual(renderer.render(view: MainView(), with: ChildContext(greeting: "Hello World!")),
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
        
        struct ChildContext: ViewModel {
            
            var greeting: String
        }
        
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
            
            @Context(ChildContext.self)
            var context
            
            var body: Content {
                MainView {
                    Heading1 {
                        $context.greeting.value
                    }
                    Heading2 {
                        $context.greeting.value
                    }
                }
            }
        }
        
        renderer.add(view: ChildView())
        
        XCTAssertEqual(renderer.render(view: ChildView(), with: ChildContext(greeting: "Hello World!")),
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
