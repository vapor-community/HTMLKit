import XCTest
import Minifier

final class UtilitiesTests: XCTestCase {
    
    func testSelector() throws {
        
        let css =   """
                    .test {}
                    """
        
        XCTAssertEqual(Minifier().minify(css: css), ".test{}")
    }
    
    func testDeclaration() throws {
        
        let css =   """
                    var test = "test";
                    """
        
        XCTAssertEqual(Minifier().minify(js: css), "var test='test';")
    }
}
