import HTMLKit
import XCTest

final class ConversionTests: XCTestCase {
    
    var directory: URL?
    
    override func setUp() {
        super.setUp()
        
        try! setupConversion()
    }
    
    func testFileConversion() throws {
        
        guard let directory = directory else {
            return XCTFail("No directory.")
        }
        
        guard #available(macOS 11.0, *) else {
            throw XCTSkip("Requires macOS >= 11.0")
        }
        
        XCTAssertNoThrow(try Converter.default.convert(directory: directory, option: .print))
    }
    
    func testStringConversion() throws {
        
        guard #available(macOS 11.0, *) else {
            throw XCTSkip("Requires macOS >= 11.0")
        }
        
        guard let directory = directory else {
            return XCTFail("No directory.")
        }
        
        guard let content = try? String(contentsOf: directory.appendingPathComponent("component.html")) else {
            return XCTFail("No file.")
        }
        
        XCTAssertNoThrow(try Converter.default.convert(string: content))
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
        ("testFileConversion", testFileConversion),
    ]
}
