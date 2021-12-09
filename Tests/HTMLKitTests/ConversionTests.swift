import HTMLKit
import XCTest

final class ConversionTests: XCTestCase {
    
    var converter = Converter()
    var currentDirectory: URL?
    
    override func setUp() {
        super.setUp()
        
        try! setupConversion()
    }
    
    func testConvertingDirectory() throws {
        
        guard let directory = currentDirectory else {
            return XCTFail()
        }
        
        XCTAssertNoThrow(try converter.convert(directory: directory, option: .print))
    }
    
    func testConvertingFile() throws {
        
        guard let directory = currentDirectory else {
            return XCTFail()
        }
        
        let file = directory
            .appendingPathComponent("index")
            .appendingPathExtension("html")
        
        XCTAssertNoThrow(try converter.convert(file: file, option: .print))
    }
}

extension ConversionTests {
    
    func setupConversion() throws {
        
        let currentFile = URL(fileURLWithPath: #file).deletingLastPathComponent()
        
        self.currentDirectory = currentFile.appendingPathComponent("Conversion")
    }
}

extension ConversionTests {
    
    static var allTests = [
        ("testConvertingDirectory", testConvertingDirectory),
        ("testConvertingFile", testConvertingFile),
    ]
}
