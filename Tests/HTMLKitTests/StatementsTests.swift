/*
 Abstract:
 The file tests the statements.
 */

import HTMLKit
import XCTest

final class StatementsTests: XCTestCase {
    
    struct TestPage: Page {
        
        @ContentBuilder<AnyContent> var body: AnyContent
    }
    
    var renderer = Renderer()
    
    func testIfStatement() throws {
        
        let isValid: TemplateValue<Bool> = .constant(true)
        
        let page = TestPage {
            IF(isValid) {
                Paragraph {
                    "true"
                }
            }.else {
                Paragraph {
                    "false"
                }
            }
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <p>true</p>
                       """
        )
    }
    
    func testElseStatement() throws {
        
        let isValid: TemplateValue<Bool> = .constant(false)
        
        let page = TestPage {
            IF(isValid) {
                Paragraph {
                    "true"
                }
            }.else {
                Paragraph {
                    "false"
                }
            }
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <p>false</p>
                       """
        )
    }
    
    func testElseIfStatement() throws {
        
        let age: TemplateValue<Int> = .constant(16)
        
        let page = TestPage {
            IF(age > 20) {
                Paragraph {
                    "Adult"
                }
            }.elseIf(age > 10 && age < 20) {
                Paragraph {
                    "Teenager"
                }
            }.else {
                Paragraph {
                    "Child"
                }
            }
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <p>Teenager</p>
                       """
        )
    }
    
    func testForEachLoop() throws {
        
        let items: TemplateValue<[String]> = .constant(["item1", "item2"])
        
        let page = TestPage {
            ForEach(in: items) { item in
                Paragraph {
                    item
                }
            }
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <p>item1</p>\
                       <p>item2</p>
                       """
        )
    }
    
    func testUnwrap() throws {
        
        let item: TemplateValue<String?> = .constant("unwrapped")
        
        let page = TestPage {
            Unwrap(item) { item in
                Paragraph {
                    item
                }
            }
        }
        
        renderer.add(layout: page)
        
        XCTAssertEqual(renderer.render(layout: page),
                       """
                       <p>unwrapped</p>
                       """
        )
    }
}
