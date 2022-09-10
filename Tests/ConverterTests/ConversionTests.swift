import Converter
import XCTest

final class ConversionTests: XCTestCase {
    
    var directory: URL?
    
    override func setUp() {
        super.setUp()
        
        try! setupConversion()
    }
    
    func testFileConversion() throws {
        
#if os(Linux)
        throw XCTSkip("Requires macOS >= 11.0")
#else
        guard let directory = directory else {
            return XCTFail("No directory.")
        }
        
        XCTAssertNoThrow(try Converter.default.convert(directory: directory, option: .debug))
#endif
    }
    
    func testStringConversion() throws {
        
#if os(Linux)
        throw XCTSkip("Requires macOS >= 11.0")
#else
        guard let directory = directory else {
            return XCTFail("No directory.")
        }
        
        guard let content = try? String(contentsOf: directory.appendingPathComponent("component.html")) else {
            return XCTFail("No file.")
        }
        
        XCTAssertNoThrow(try Converter.default.convert(string: content))
#endif
    }
}

extension ConversionTests {
    
    func setupConversion() throws {
        
        let currentFile = URL(fileURLWithPath: #file).deletingLastPathComponent()
        
        self.directory = currentFile.appendingPathComponent("Conversion")
    }
}
