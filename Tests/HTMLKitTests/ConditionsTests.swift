/*
 Abstract:
 The file tests the conditions.
 */

import HTMLKit
import XCTest

final class ConditionsTests: XCTestCase {
    
    struct TestPage: Page {
        
        @ContentBuilder<AnyContent> var body: AnyContent
    }
    
    var renderer = Renderer()
    
    func testEqualCondition() throws {
        
        let condition: TemplateValue<String> = .constant("test")
        
        let page = TestPage {
            IF(condition == "test") {
                Paragraph {
                    "true"
                }
            }
            IF(condition == "test1") {
                Paragraph {
                    "false"
                }
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <p>true</p>
                       """
        )
    }
    
    func testNotEqualCondition() throws {
        
        let condition: TemplateValue<String> = .constant("test")
        
        let page = TestPage {
            IF(condition != "test") {
                Paragraph {
                    "false"
                }
            }
            IF(condition != "test1") {
                Paragraph {
                    "true"
                }
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <p>true</p>
                       """
        )
    }
    
    func testLessThenCondition() throws {
        
        let condition: TemplateValue<Int> = .constant(10)
        
        let page = TestPage {
            IF(condition < 15) {
                Paragraph {
                    "true"
                }
            }
            IF(condition < 5) {
                Paragraph {
                    "false"
                }
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <p>true</p>
                       """
        )
    }
    
    func testGreaterThenCondition() throws {
        
        let condition: TemplateValue<Int> = .constant(10)
        
        let page = TestPage {
            IF(condition > 10) {
                Paragraph {
                    "false"
                }
            }
            IF(condition > 5) {
                Paragraph {
                    "true"
                }
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <p>true</p>
                       """
        )
    }
}

