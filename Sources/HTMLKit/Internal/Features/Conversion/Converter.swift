/*
 Abstract:
 The file contains the converter.
 
 Authors:
 - Mats Moll (https://github.com/matsmoll)
 
 Contributors:
 - Mattes Mohr (https://github.com/mattesmohr)
 
 Note:
 If you about to add something to the file, stick to the official documentation to keep the code consistent.
 */

import Foundation

#if canImport(FoundationXML)
import FoundationXML
#endif

@available(macOS 11.0, *)
public class Converter {
    
    public enum FileExtension: String {
        case html
        case leaf
    }
    
    public enum ConverterOutput: String {
        case print
        case file
    }
    
    public enum ConverterError: Error {
        case rootNotFound
    }
    
    public static let `default` = Converter()

    private init() {}
    
    public func convert(string: String) throws -> String {
        
        let document = try XMLDocument(xmlString: string, options: [.documentIncludeContentTypeDeclaration])
        
        guard let root = document.rootElement() else {
            throw ConverterError.rootNotFound
        }
        
        return try Parser.shared.parse(node: root)
    }
    
    public func convert(file: URL, option: ConverterOutput) throws {
        
        let result = try convert(string: String(contentsOf: file))
        
        switch option {
        case .print:
            print(result)
        case .file:
            print(result)
        }
    }
    
    public func convert(directory: URL, fileExtension: FileExtension = .html, option: ConverterOutput) throws {
        
        if let enumerator = FileManager.default.enumerator(at: directory, includingPropertiesForKeys: nil, options: [.skipsHiddenFiles]) {
            
            for case let path as URL in enumerator {
                
                if !path.hasDirectoryPath {

                    if path.pathExtension != fileExtension.rawValue {
                        enumerator.skipDescendants()
                        
                    } else {
                        try convert(file: path, option: option)
                    }
                }
            }
        }
    }
}
