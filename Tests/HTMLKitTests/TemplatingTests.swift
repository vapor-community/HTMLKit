import HTMLKit
import Testing

@Suite
struct TemplatingTests {
    
    var renderer = Renderer()
    
    @Test
    func testPartialEmbedding() throws {
        
        struct ParentView: View {
            
            var context: String
            
            var body: Content {
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
            
            var body: Content {
                Heading1 {
                    context
                }
                Heading2 {
                    context
                }
            }
        }
        
        #expect(try renderer.render(view: ParentView(context: "Hello World!")) ==
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
    
    @Test
    func testViewExtending() throws {
        
        struct ParentView: View {
            
            var content: [BodyElement]
            
            init(@ContentBuilder<BodyElement> content: () -> [BodyElement]) {
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
            
            var context: String
            
            var body: Content {
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
        
        #expect(try renderer.render(view: ChildView(context: "Hello World!")) ==
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
    
    @Test
    func testExtendingWithSingles() throws {
        
        struct ParentView: View {
            
            var content: [BodyElement]
            
            init(@ContentBuilder<BodyElement> content: () -> [BodyElement]) {
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
            
            var body: Content {
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
        
        #expect(try renderer.render(view: ChildView(context: "Hello World!")) ==
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
