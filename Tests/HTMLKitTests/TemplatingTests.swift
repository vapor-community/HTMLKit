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
        
        struct ParentView: View {
            
            var context: String
            
            var body: AnyContent {
                Document(.html5)
                Html {
                    Head {
                        Title {
                            "Test"
                        }
                    }
                    Body {
                        ChildView(context: context)
                    }
                }
            }
        }
        
        struct ChildView: View {
            
            var context: String
            
            var body: AnyContent {
                Heading1 {
                    context
                }
                Heading2 {
                    context
                }
            }
        }
        
        XCTAssertEqual(renderer.render(view: ParentView(context: "Hello World!")),
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
        
        struct ParentView: View {
            
            var content: [BodyElement]
            
            init(@ContentBuilder<BodyElement> content: () -> [BodyElement]) {
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
        
        struct ChildView: View {
            
            var context: String
            
            var body: AnyContent {
                ParentView {
                    Heading1 {
                        context
                    }
                    Heading2 {
                        context
                    }
                }
            }
        }
        
        XCTAssertEqual(renderer.render(view: ChildView(context: "Hello World!")),
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
        
        struct ParentView: View {
            
            var content: [BodyElement]
            
            init(@ContentBuilder<BodyElement> content: () -> [BodyElement]) {
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
                        Script {
                        }
                        Script {
                        }
                    }
                }
            }
        }
        
        struct ChildView: View {
            
            var context: String
            
            var body: AnyContent {
                ParentView {
                    Heading1 {
                        context
                    }
                    Heading2 {
                        context
                    }
                }
            }
        }
        
        XCTAssertEqual(renderer.render(view: ChildView(context: "Hello World!")),
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
