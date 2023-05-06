import XCTest
import Minifier

final class JavascriptTests: XCTestCase {
    
    // Tests minifing a declaration
    func testMinifyDeclaration() throws {
        
        // ...with single quotes
        XCTAssertEqual(Minifier(compression: [.stripComments, .removeWhitespaces]).minify(js: "var name = 'value';"), "var name='value';")
        
        // ...with double quotes
        XCTAssertEqual(Minifier(compression: [.stripComments, .removeWhitespaces]).minify(js: "var name = \"value\";"), "var name='value';")
        
        // ...with the keyword const
        XCTAssertEqual(Minifier(compression: [.stripComments, .removeWhitespaces]).minify(js: "const name = 'value';"), "const name='value';")
        
        // ...with the keyword let
        XCTAssertEqual(Minifier(compression: [.stripComments, .removeWhitespaces]).minify(js: "let name = 'value';"), "let name='value';")
    }
    
    // Tests minifing a
    func testMinifyDocument() throws {
        
        let document =  """
                        /* comment */
                        
                        function () {
                        
                            var property = 'value';
                        };
                        """
        
        // ...property with a variable as value
        XCTAssertEqual(Minifier(compression: [.stripComments, .removeWhitespaces]).minify(js: document),
                        """
                        function(){var property='value';};
                        """
        )
    }
}
