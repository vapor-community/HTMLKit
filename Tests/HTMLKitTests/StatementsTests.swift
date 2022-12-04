/*
 Abstract:
 The file tests the statements.
 */

import HTMLKit
import XCTest

final class StatementsTests: XCTestCase {
    
    struct TestView: View {
        
        @ContentBuilder<AnyContent> var body: AnyContent
    }
    
    var renderer = Renderer()
    
    func testIfStatementWithConstantValue() throws {
        
        let isValid: TemplateValue<Bool> = .constant(true)
        
        let view = TestView {
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
        
        renderer.add(view: view)
        
        XCTAssertEqual(renderer.render(view: view),
                       """
                       <p>true</p>
                       """
        )
    }
    
    func testIfStatementWithVariableValue() throws {
        
        struct TestContext: Codable {
            var isValid: Bool
        }
        
        @TemplateValue(TestContext.self)
        var item
        
        let view = TestView {
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
        
        renderer.add(view: view)
        
        XCTAssertEqual(renderer.render(view: view, with: TestContext(isValid: true)),
                       """
                       <p>true</p>
                       """
        )
    }
    
    func testElseStatementWithConstantValue() throws {
        
        let isValid: TemplateValue<Bool> = .constant(false)
        
        let view = TestView {
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
        
        renderer.add(view: view)
        
        XCTAssertEqual(renderer.render(view: view),
                       """
                       <p>false</p>
                       """
        )
    }
    
    func testElseStatementWithVariableValue() throws {
        
        struct TestContext: Codable {
            var isValid: Bool
        }
        
        @TemplateValue(TestContext.self)
        var item
        
        let view = TestView {
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
        
        renderer.add(view: view)
        
        XCTAssertEqual(renderer.render(view: view, with: TestContext(isValid: false)),
                       """
                       <p>false</p>
                       """
        )
    }
    
    func testElseIfStatement() throws {
        
        let age: TemplateValue<Int> = .constant(16)
        
        let view = TestView {
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
        
        renderer.add(view: view)
        
        XCTAssertEqual(renderer.render(view: view),
                       """
                       <p>Teenager</p>
                       """
        )
    }
    
    func testForEachLoop() throws {
        
        let items: TemplateValue<[String]> = .constant(["item1", "item2"])
        
        let view = TestView {
            ForEach(in: items) { item in
                Paragraph {
                    item
                }
            }
        }
        
        renderer.add(view: view)
        
        XCTAssertEqual(renderer.render(view: view),
                       """
                       <p>item1</p>\
                       <p>item2</p>
                       """
        )
    }
    
    func testUnwrap() throws {
        
        let item: TemplateValue<String?> = .constant("unwrapped")
        
        let view = TestView {
            Unwrap(item) { item in
                Paragraph {
                    item
                }
            }
        }
        
        renderer.add(view: view)
        
        XCTAssertEqual(renderer.render(view: view),
                       """
                       <p>unwrapped</p>
                       """
        )
    }
}
