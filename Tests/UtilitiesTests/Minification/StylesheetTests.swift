import XCTest
import Minifier

final class StylesheetTests: XCTestCase {
    
    // Tests minifing a
    func testMinifySelector() throws {
        
        // ...class selector
        XCTAssertEqual(Minifier(compression: [.stripComments, .removeWhitespaces]).minify(css: ".selector {}"), ".selector{}")
        
        // ...id selector
        XCTAssertEqual(Minifier(compression: [.stripComments, .removeWhitespaces]).minify(css: "#selector {}"), "#selector{}")
        
        // ...element selector
        XCTAssertEqual(Minifier(compression: [.stripComments, .removeWhitespaces]).minify(css: "selector {}"), "selector{}")
        
        // ...root selector
        XCTAssertEqual(Minifier(compression: [.stripComments, .removeWhitespaces]).minify(css: ":selector {}"), ":selector{}")
    }
    
    // Tests minifing a
    func testMinifyCombinators() throws {
        
        // ...descendant combinator
        XCTAssertEqual(Minifier(compression: [.stripComments, .removeWhitespaces]).minify(css: ".selector .selector {}"), ".selector .selector{}")
    }
    
    // Tests minifing a
    func testMinifyProperties() throws {
        
        // ...custom property
        XCTAssertEqual(Minifier(compression: [.stripComments, .removeWhitespaces]).minify(css: "{--property: value;}"), "{--property:value;}")
    }
    
    // Tests minifing a whole document
    func testMinifyDocument() throws {
        
        let document =  """
                        /* comment */
                        
                        .selector {
                        
                            property: value;
                        }
                        """
        
        XCTAssertEqual(Minifier(compression: [.stripComments, .removeWhitespaces]).minify(css: document), ".selector{property:value;}")
    }
}
