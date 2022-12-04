/*
 Abstract:
 The file tests the conditions.
 */

import HTMLKit
import XCTest

final class ConditionsTests: XCTestCase {
    
    struct TestView: View {
        
        @ContentBuilder<Content> var body: Content
    }
    
    var renderer = Renderer()
    
    func testEqualCondition() throws {
        
        let condition: TemplateValue<String> = .constant("test")
        
        let view = TestView {
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
        
        renderer.add(view: view)
        
        XCTAssertEqual(renderer.render(view: view),
                       """
                       <p>true</p>
                       """
        )
    }
    
    func testNotEqualCondition() throws {
        
        let condition: TemplateValue<String> = .constant("test")
        
        let view = TestView {
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
        
        renderer.add(view: view)
        
        XCTAssertEqual(renderer.render(view: view),
                       """
                       <p>true</p>
                       """
        )
    }
    
    func testLessThanCondition() throws {
        
        let condition: TemplateValue<Int> = .constant(10)
        
        let view = TestView {
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
        
        renderer.add(view: view)
        
        XCTAssertEqual(renderer.render(view: view),
                       """
                       <p>true</p>
                       """
        )
    }
    
    func testLessThanOrEqualCondition() throws {
        
        let condition: TemplateValue<Int> = .constant(10)
        
        let view = TestView {
            IF(condition <= 15) {
                Paragraph {
                    "true"
                }
            }
            IF(condition <= 10) {
                Paragraph {
                    "true"
                }
            }
            IF(condition <= 5) {
                Paragraph {
                    "false"
                }
            }
        }
        
        renderer.add(view: view)
        
        XCTAssertEqual(renderer.render(view: view),
                       """
                       <p>true</p>\
                       <p>true</p>
                       """
        )
    }
    
    func testGreaterThanCondition() throws {
        
        let condition: TemplateValue<Int> = .constant(10)
        
        let view = TestView {
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
        
        renderer.add(view: view)
        
        XCTAssertEqual(renderer.render(view: view),
                       """
                       <p>true</p>
                       """
        )
    }
    
    func testGreaterThanOrEqualCondition() throws {
        
        let condition: TemplateValue<Int> = .constant(10)
        
        let view = TestView {
            IF(condition >= 5) {
                Paragraph {
                    "true"
                }
            }
            IF(condition >= 10) {
                Paragraph {
                    "true"
                }
            }
            IF(condition >= 20) {
                Paragraph {
                    "false"
                }
            }
        }
        
        renderer.add(view: view)
        
        XCTAssertEqual(renderer.render(view: view),
                       """
                       <p>true</p>\
                       <p>true</p>
                       """
        )
    }
    
    func testRangeCondition() throws {
        
        let condition: TemplateValue<Int> = .constant(10)
        
        let view = TestView {
            IF(condition ~= 1..<20) {
                Paragraph {
                    "true"
                }
            }
            IF(condition ~= 1..<5) {
                Paragraph {
                    "false"
                }
            }
        }
        
        renderer.add(view: view)
        
        XCTAssertEqual(renderer.render(view: view),
                       """
                       <p>true</p>
                       """
        )
    }
    
    func testClosedRangeCondition() throws {
        
        let condition: TemplateValue<Int> = .constant(10)
        
        let view = TestView {
            IF(condition ~= 1...20) {
                Paragraph {
                    "true"
                }
            }
            IF(condition ~= 1...5) {
                Paragraph {
                    "false"
                }
            }
        }
        
        renderer.add(view: view)
        
        XCTAssertEqual(renderer.render(view: view),
                       """
                       <p>true</p>
                       """
        )
    }
    
    func testAndCondition() throws {
        
        let condition: TemplateValue<Int> = .constant(10)
        
        let view = TestView {
            IF(condition > 5 && condition < 15) {
                Paragraph {
                    "true"
                }
            }
            IF(condition > 10 && condition < 5) {
                Paragraph {
                    "false"
                }
            }
        }
        
        renderer.add(view: view)
        
        XCTAssertEqual(renderer.render(view: view),
                       """
                       <p>true</p>
                       """
        )
    }
    
    func testOrCondition() throws {
        
        let condition: TemplateValue<Int> = .constant(10)
        
        let view = TestView {
            IF(condition > 5 || condition < 15) {
                Paragraph {
                    "true"
                }
            }
            IF(condition > 10 || condition < 5) {
                Paragraph {
                    "false"
                }
            }
        }
        
        renderer.add(view: view)
        
        XCTAssertEqual(renderer.render(view: view),
                       """
                       <p>true</p>
                       """
        )
    }
}

