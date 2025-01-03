import HTMLKit
import XCTest

final class EnvironmentTests: XCTestCase {
    
    var renderer = Renderer()
    
    /// Tests the environment access through the environment object
    ///
    /// The renderer is expected to evaluate the placeholder and renderer the resulting value.
    func testEnvironmentAccess() throws {
        
        struct FamilyObject: ViewModel {
            
            let name: String = "Doe"
            let father: FatherObject = FatherObject()
        }
        
        struct FatherObject: ViewModel {
            
            let avatar: String = "john_doe.jpeg"
            let name: String = "John"
        }
        
        struct ParentView: View {
            
            let content: [Content]
            
            init(@ContentBuilder<Content> content: () -> [Content]) {
                self.content = content()
            }
            
            var body: Content {
                Division {
                    content
                }
                .environment(object: FamilyObject())
            }
        }
        
        struct ChildView: View {
            
            @EnvironmentObject(FamilyObject.self)
            var object
            
            var body: Content {
                ParentView {
                    Section{
                        Image()
                            .source(object.father.avatar)
                        Heading1 {
                            object.name
                        }
                        Paragraph {
                            object.father.name + " " + object.name
                        }
                    }
                }
            }
        }
        
        XCTAssertEqual(try renderer.render(view: ChildView()),
                       """
                       <div>\
                       <section>\
                       <img src="john_doe.jpeg">\
                       <h1>Doe</h1>\
                       <p>John Doe</p>\
                       </section>\
                       </div>
                       """
        )
    }
    
    /// Tests condtion evaluation for the environment
    ///
    /// The renderer is expected to evaluated the condition correctly and renderer the right statement based on the condition.
    func testEnvironmentCondition() throws {
        
        struct TestObject: ViewModel {
            
            let firstName: String = "Jane"
            let lastName: String = "Doe"
            let age: Int = 40
        }
        
        struct TestView: View {
            
            @EnvironmentObject(TestObject.self)
            var object
            
            var body: Content {
                Paragraph {

                    // Should return false
                    Environment.when(object.firstName == "John") {
                        "True"
                    } then: {
                        "False"
                    }

                    // The counter test, should return true
                    Environment.when(object.firstName == "Jane") {
                        "True"
                    }

                    // Should return true
                    Environment.when(object.firstName != "John") {
                        "True"
                    }
                    
                    // The counter test, should return false
                    Environment.when(object.firstName != "Jane") {
                        "True"
                    } then: {
                        "False"
                    }

                    // Should return false
                    Environment.when(object.age > 41) {
                        "True"
                    } then: {
                        "False"
                    }

                    // The counter test, should return true
                    Environment.when(object.age > 39) {
                        "True"
                    }
                    
                    // Should return true
                    Environment.when(object.age < 41) {
                        "True"
                    }

                    // The counter test, should return false
                    Environment.when(object.age < 39) {
                        "True"
                    } then: {
                        "False"
                    }
                }
                .environment(object: TestObject())
            }
        }
        
        XCTAssertEqual(try renderer.render(view: TestView()),
                       """
                       <p>FalseTrueTrueFalseFalseTrueTrueFalse</p>
                       """
        )
    }
    
    /// Tests the evaluation of a statement with a conjunctional relation
    func testConditionConjuction() throws {
        
        struct TestObject: ViewModel {
            
            let firstName: String = "Jane"
            let lastName: String = "Doe"
            let age: Int = 40
        }
        
        struct TestView: View {
            
            @EnvironmentObject(TestObject.self)
            var object
            
            var body: Content {
                Paragraph {
                    
                    // The relation is true, cause both conditions are true
                    Environment.when(object.age > 39 && object.age < 41) {
                        "True"
                    } then: {
                        "False"
                    }
                    
                    // The relation is false, cause both conditions are false
                    Environment.when(object.age < 39 && object.age > 41) {
                        "True"
                    } then: {
                        "False"
                    }
                    
                    // The relation is false, cause the first condition is false
                    Environment.when(object.age > 41 && object.age > 39) {
                        "True"
                    } then: {
                        "False"
                    }
                    
                    // The relation is false, cause the second condition is false
                    Environment.when(object.age > 39 && object.age > 41) {
                        "True"
                    } then: {
                        "False"
                    }
                }
                .environment(object: TestObject())
            }
        }
        
        XCTAssertEqual(try renderer.render(view: TestView()),
                       """
                       <p>TrueFalseFalseFalse</p>
                       """
        )
    }
    
    /// Tests the evaluation of a statement with a disjunctional relation
    func testConditionDisjunction() throws {
        
        struct TestObject: ViewModel {
            
            let firstName: String = "Jane"
            let lastName: String = "Doe"
            let age: Int = 40
        }
        
        struct TestView: View {
            
            @EnvironmentObject(TestObject.self)
            var object
            
            var body: Content {
                Paragraph {
                    
                    // The relation is true, cause the second condition is true
                    Environment.when(object.age > 41 || object.age == 40) {
                        "True"
                    } then: {
                        "False"
                    }
                    
                    // The relation is true, cause the first condition is true
                    Environment.when(object.age == 40 || object.age > 41) {
                        "True"
                    } then: {
                        "False"
                    }
                    
                    // The relation is false, cause all conditions are false
                    Environment.when(object.age == 50 || object.age > 41) {
                        "True"
                    } then: {
                        "False"
                    }
                }
                .environment(object: TestObject())
            }
        }
        
        XCTAssertEqual(try renderer.render(view: TestView()),
                       """
                       <p>TrueTrueFalse</p>
                       """
        )
    }
    
    /// Tests the evaluation of various relation combinations
    func testConditionConjunctionAndDisjunction() throws {
        
        struct TestObject: ViewModel {
            
            let firstName = "Jane"
            let lastName = "Doe"
            let age = 40
        }
        
        struct TestView: View {
            
            @EnvironmentObject(TestObject.self)
            var object
            
            var body: Content {
                Paragraph {
                    
                    // The statement is true, cause the first relation is true
                    Environment.when(object.age == 40 || object.age > 41 && object.age < 39) {
                        "True"
                    } then: {
                        "False"
                    }
                    
                    // The statement is true, cause the second relation is true
                    Environment.when(object.age == 50 || object.age < 41 && object.age > 39) {
                        "True"
                    } then: {
                        "False"
                    }
                }
                .environment(object: TestObject())
            }
        }
        
        XCTAssertEqual(try renderer.render(view: TestView()),
                       """
                       <p>TrueTrue</p>
                       """
        )
    }
}
