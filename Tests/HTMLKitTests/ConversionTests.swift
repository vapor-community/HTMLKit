import HTMLKit
import XCTest

final class ConversionTests: XCTestCase {
    
    var directory: URL?
    var componentPath: URL?
    
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
        
        XCTAssertNoThrow(try Converter.default.convert(directory: directory, option: .print))
        
        guard let componentPath = componentPath else {
            return XCTFail("No component html file to convert to string.")
        }
        let htmlComponent = try String(contentsOf: componentPath, encoding: String.Encoding.utf8)
        XCTAssertNoThrow(try Converter.default.convert(html: htmlComponent))
    }
}

extension ConversionTests {
    
    func setupConversion() throws {
        
        let currentFile = URL(fileURLWithPath: #file).deletingLastPathComponent()
        
        self.directory = currentFile.appendingPathComponent("Conversion")
        
        self.componentPath = self.directory?.appendingPathComponent("component.html")
    }
}

extension ConversionTests {
    
    static var allTests = [
        ("testConversion", testConversion)
    ]
}
