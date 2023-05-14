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
        
        // ...with a dollar sign first
        
        let dollarsigned = """
        var $keyword = 'value';
        """
        
        XCTAssertEqual(minifier.minify(js: dollarsigned), "var $keyword='value';")
        
        // ...with a underscore sign first
        
        let underscored = """
        var _keyword = 'value';
        """
        
        XCTAssertEqual(minifier.minify(js: underscored), "var _keyword='value';")
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
    
    // Tests minifing string concatenation
    func testMinifyStringConcatenation() throws {
        
        // ...with single quotes
        
        let singlequoted = """
        var literal = 'firstname' + ' ' + 'lastname';
        """
        
        XCTAssertEqual(minifier.minify(js: singlequoted), "var literal='firstname'+' '+'lastname';")
        
        // ...with double quotes
        
        let doublequoted = """
        var literal = 'attribute="' + value + '"';
        """
        
        XCTAssertEqual(minifier.minify(js: doublequoted), "var literal='attribute=\"'+value+'\"';")
    }
    
    // Tests minifing a
    func testMinifyStatements() {
        
        // ...foreach statement
        
        let foreach = """
        for (var child of children) {
        }
        """
        
        XCTAssertEqual(minifier.minify(js: foreach), "for(var child of children){}")
        
        // ...if elseif else statement
        
        let elseif = """
        if (condition) {
        } else if (condition) {
        } else {
        }
        """
        
        XCTAssertEqual(minifier.minify(js: elseif), "if(condition){}else if(condition){}else{}")
        
        // ...switch case statement
        
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
    
    func testMinfiyFunctionPattern() {
        
        let document = """
        function greeting(parameter) {
        }
        """
        
        XCTAssertEqual(minifier.minify(js: document), "function greeting(parameter){}")
    }
    
    func testMinfifyConstructorPattern() {
        
        let document = """
        Constructor.prototype.function = function (callback) {
        }
        """
        
        XCTAssertEqual(minifier.minify(js: document), "Constructor.prototype.function=function(callback){}")
    }
    
    func testMinifyClassPattern() {
        
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
        
        XCTAssertEqual(minifier.minify(js: document), "function(){var property='value';};")
    }
}
