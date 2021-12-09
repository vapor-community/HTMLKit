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
        
        try converter.convert(directory: directory, option: .file)
    }
    
    func testConvertingFile() throws {
        
        guard let directory = currentDirectory else {
            return XCTFail()
        }
        
        let file = directory
            .appendingPathComponent("index")
            .appendingPathExtension("html")
        
        try converter.convert(file: file, option: .file)
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
