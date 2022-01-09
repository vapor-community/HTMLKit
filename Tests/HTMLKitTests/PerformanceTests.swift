import HTMLKit
import XCTest

final class PerformanceTests: XCTestCase {
    
    struct TestPage: Page {
    
        @ContentBuilder<AnyContent> var body: AnyContent
    }
    
    var renderer = Renderer()
    
    func testPerformanceRenderingWhenUsingDefault() throws {
        
        let view = TestPage {
            Html {
                Body {
                    Header {
                        Heading1 {
                            "Performance Test"
                        }
                    }
                    Main {
                        Article {
                            Heading3 {
                                "Test"
                            }
                        }
                    }
                }
            }
        }
        
        try renderer.add(view: view)
        
        measure {
            _ = try! renderer.render(raw: TestPage.self)
        }
    }
    
    func testPerformanceRenderingWhenUsingTypealiases() throws {
        
        let view = TestPage {
            Html {
                Body {
                    Header {
                        H1 {
                            "Performance Test"
                        }
                    }
                    Main {
                        Article {
                            H3 {
                                "Test"
                            }
                        }
                    }
                }
            }
        }
        
        try renderer.add(view: view)
        
        measure {
            _ = try! renderer.render(raw: TestPage.self)
        }
    }
    
    func testPerformanceWithAttributes() throws {
        
        let view = TestPage {
            Html {
                Body {
                    Header {
                        Heading1 {
                            "Performance Test"
                        }
                        .id("test")
                        .class("class")
                        .role(.heading)
                    }
                    Main {
                        Article {
                            Heading3 {
                                "Test"
                            }
                            .id("test")
                            .class("class")
                            .role(.heading)
                        }
                    }
                    .id("test")
                    .class("class")
                    .role(.main)
                }
            }
        }
        
        try renderer.add(view: view)
        
        measure {
            _ = try! renderer.render(raw: TestPage.self)
        }
    }
    
    func testPerformanceWithoutAttributes() throws {
        
        let view = TestPage {
            Html {
                Body {
                    Header {
                        Heading1 {
                            "Performance Test"
                        }
                    }
                    Main {
                        Article {
                            Heading3 {
                                "Test"
                            }
                        }
                    }
                }
            }
        }
        
        try renderer.add(view: view)
        
        measure {
            _ = try! renderer.render(raw: TestPage.self)
        }
    }
}

extension PerformanceTests {
    
    static var allTests = [
        ("testPerformanceRenderingWhenUsingDefault", testPerformanceRenderingWhenUsingDefault),
        ("testPerformanceRenderingWhenUsingTypealiases", testPerformanceRenderingWhenUsingTypealiases),
        ("testPerformanceWithAttributes", testPerformanceWithAttributes),
        ("testPerformanceWithoutAttributes", testPerformanceWithoutAttributes)
    ]
}

