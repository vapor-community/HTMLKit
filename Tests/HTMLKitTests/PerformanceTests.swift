import HTMLKit
import XCTest

final class PerformanceTests: XCTestCase {
    
    struct TestPage: HTMLPage {
        
        var content: HTMLContent
        
        var body: HTMLContent {
            content
        }
        
        init(@HTMLBuilder builder: () -> HTMLContent) {
            content = builder()
        }
    }
    
    var renderer = HTMLRenderer()
    
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
}

extension PerformanceTests {
    
    static var allTests = [
        ("testPerformanceRenderingWhenUsingDefault", testPerformanceRenderingWhenUsingDefault),
        ("testPerformanceRenderingWhenUsingTypealiases", testPerformanceRenderingWhenUsingTypealiases)
    ]
}

