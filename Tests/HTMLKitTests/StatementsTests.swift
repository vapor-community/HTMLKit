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
    
    func testIfStatementWithConstantValue() throws {
        
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
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <p>true</p>
                       """
        )
    }
    
    func testIfStatementWithVariableValue() throws {
        
        struct TestContext {
            var isValid: Bool
        }
        
        @TemplateValue(TestContext.self)
        var item
        
        let page = TestPage {
            IF(item.isValid) {
                Paragraph {
                    "true"
                }
            }.else {
                Paragraph {
                    "false"
                }
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self, with: TestContext(isValid: true)),
                       """
                       <p>true</p>
                       """
        )
    }
    
    func testElseStatementWithConstantValue() throws {
        
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
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <p>false</p>
                       """
        )
    }
    
    func testElseStatementWithVariableValue() throws {
        
        struct TestContext {
            var isValid: Bool
        }
        
        @TemplateValue(TestContext.self)
        var item
        
        let page = TestPage {
            IF(item.isValid) {
                Paragraph {
                    "true"
                }
            }.else {
                Paragraph {
                    "false"
                }
            }
        }
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self, with: TestContext(isValid: false)),
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
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
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
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
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
        
        try renderer.add(layout: page)
        
        XCTAssertEqual(try renderer.render(layout: TestPage.self),
                       """
                       <p>unwrapped</p>
                       """
        )
    }
}
