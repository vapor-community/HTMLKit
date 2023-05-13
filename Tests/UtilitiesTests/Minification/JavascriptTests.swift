import XCTest
import Minifier

final class JavascriptTests: XCTestCase {
    
    let minifier = Minifier(compression: [.stripComments, .removeWhitespaces])
    
    // Tests stripping
    func testStripComments() throws {
        
        // ...multi line comments
        
        let multiline = """
        /* comment */
                            
        function ()
        """
        
        XCTAssertEqual(minifier.minify(js: multiline), "function()")
        
        // ...single line comments
        
        let singleline = """
        // comment
        
        function ()
        """
        
        XCTAssertEqual(minifier.minify(js: singleline), "function()")
    }
    
    // Tests minifing a declaration
    func testMinifyDeclaration() throws {
        
        // ...with single quotes
        
        let varkeyword = """
        var name = 'value';
        """
        
        XCTAssertEqual(minifier.minify(js: varkeyword), "var name='value';")
        
        // ...with the keyword const
        
        let constkeyword = """
        const name = 'value';
        """
        
        XCTAssertEqual(minifier.minify(js: constkeyword), "const name='value';")
        
        // ...with the keyword let
        
        let letkeyword = """
        let name = 'value';
        """
        
        XCTAssertEqual(minifier.minify(js: letkeyword), "let name='value';")
    }
    
    // Tests minifing a
    func testMinifyLiterals() throws {
        
        // ...template literal
        
        let templateliteral = """
        var literal = `text`;
        """
        
        XCTAssertEqual(minifier.minify(js: templateliteral), "var literal=`text`;")
        
        // ...string literal
        
        let stringliteral = """
        var literal = 'text';
        """
        
        XCTAssertEqual(minifier.minify(js: stringliteral), "var literal='text';")
        
        // ...numeric literal
        
        let numericliteral = """
        var literal = 100;
        """
        
        XCTAssertEqual(minifier.minify(js: numericliteral), "var literal=100;")
    }
    
    // Tests minifing a
    func testMinifyStringConcatenate() throws {
        
        // ...by operator
        
        let singlequoted = """
        var literal = 'firstname' + ' ' + 'lastname';
        """
        
        XCTAssertEqual(minifier.minify(js: singlequoted), "var literal='firstname'+' '+'lastname';")
        
        // ...by operator
        
        let doublequoted = """
        var literal = 'attribute="' + value + '"';
        """
        
        XCTAssertEqual(minifier.minify(js: doublequoted), "var literal='attribute=\"'+value+'\"';")
    }
    
    func testMinfiyFunctionPattern() {
        
        // ...property with a variable as value
        
        let document = """
        function greeting(parameter) {
        }
        """
        
        XCTAssertEqual(minifier.minify(js: document), "function greeting(parameter){}")
    }
    
    func testMinifyStatements() {
        
        // ...property with a variable as value
        
        let foreach = """
        for (var child of children) {
        }
        """
        
        XCTAssertEqual(minifier.minify(js: foreach), "for(var child of children){}")
        
        let elseif = """
        if (condition) {
        } else if (condition) {
        } else {
        }
        """
        
        XCTAssertEqual(minifier.minify(js: elseif), "if(condition){}else if(condition){}else{}")
        
        let switchcase = """
        switch(condition) {
        case x:
        break;
        default:
        }
        """
        
        XCTAssertEqual(minifier.minify(js: switchcase), "switch(condition){case x:break;default:}"
        )
    }
    
    
    func testMinfifyConstructorPattern() {
        
        // ...property with a variable as value
        
        let document = """
        Constructor.prototype.function = function (callback) {
        }
        """
        
        XCTAssertEqual(minifier.minify(js: document), "Constructor.prototype.function=function(callback){}")
    }
    
    func testMinifyClassPattern() {
        
        // ...property with a variable as value
        
        let document = """
        class ClassName {
                        
            /*
            The class constructor
            */
            constructor (callback) {
            
                this.spell = spell;
            }
                            
            cast () {
                alert();
            }
        }
        """
    
        XCTAssertEqual(minifier.minify(js: document), "class ClassName{constructor(callback){this.spell=spell;}cast(){alert();}}")
    }
    
    // Tests minifing a
    func testMinifyDocument() throws {
        
        let document = """
        /* comment */
                        
        function () {
            var property = 'value';
        };
        """
        
        // ...property with a variable as value
        XCTAssertEqual(minifier.minify(js: document), "function(){var property='value';};")
    }
}
