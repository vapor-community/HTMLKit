import HTMLKit
import XCTest

final class ConversionTests: XCTestCase {
    
    var converter = Converter()
    var directory: URL?
    
    override func setUp() {
        super.setUp()
        
        try! setupConversion()
    }
    
    func testConversion() throws {
        
        guard let directory = directory else {
            return XCTFail("No directory.")
        }
        
        guard #available(macOS 11.0, *) else {
            throw XCTSkip("Requires macOS >= 11.0")
        }
        
        XCTAssertNoThrow(try converter.convert(directory: directory, option: .print))
    }
}

extension ConversionTests {
    
    func setupConversion() throws {
        
        let currentFile = URL(fileURLWithPath: #file).deletingLastPathComponent()
        
        self.directory = currentFile.appendingPathComponent("Conversion")
    }
}

extension ConversionTests {
    
    static var allTests = [
        ("testConversion", testConversion)
    ]
}
