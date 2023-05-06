import XCTest
import CSSMinifier

final class UtilitiesTests: XCTestCase {
    
    func testSelector() throws {
        
        let css =   """
                    .test {}
                    """
        
        XCTAssertEqual(Minifier().minify(css), ".test{}")
    }
}
