import Foundation

#if canImport(FoundationXML)
    import FoundationXML
#endif

@available(macOS 11.0, *)
public class Converter {
    
    public enum ConverterError: Error {
        case rootNotFound
        case emptyFile
    }
    
    public static let `default` = Converter()

    private init() {}
    
    private func convert(content: String) throws -> String {
        
        let document = try XMLDocument(xmlString: content, options: [.documentIncludeContentTypeDeclaration])
        
        guard let root = document.rootElement() else {
            throw ConverterError.rootNotFound
        }
        
        return try Parser.shared.parse(node: root)
    }
    
    public func convert(source path: URL) throws {
        
        if !path.hasDirectoryPath {
            
            let content = try String(contentsOf: path)
            
            if content.count > 1 {
                print(try convert(content: content))
                
            } else {
                throw ConverterError.emptyFile
            }
            
        } else {
            
            if let enumerator = FileManager.default.enumerator(at: path, includingPropertiesForKeys: nil, options: [.skipsHiddenFiles]) {
                
                for case let path as URL in enumerator {
                    
                    if !path.hasDirectoryPath {
                        
                        if !path.isFileURL {
                            enumerator.skipDescendants()
                            
                        } else {
                            
                            let content = try String(contentsOf: path)
                            
                            if content.count > 1 {
                                print(try convert(content: content))
                                
                            } else {
                                throw ConverterError.emptyFile
                            }
                        }
                    }
                }
            }
        }
    }
    
    public func convert(source path: URL, target: URL) throws {
        
        if !path.hasDirectoryPath {
            
            let content = try String(contentsOf: path)
            
            if content.count > 1 {
                
                let result = try convert(content: content)
                
                try result.write(to: target, atomically: true, encoding: .utf8)
                
            } else {
                throw ConverterError.emptyFile
            }
            
        } else {
         
            if let enumerator = FileManager.default.enumerator(at: path, includingPropertiesForKeys: nil, options: [.skipsHiddenFiles]) {
                
                for case let path as URL in enumerator {
                    
                    if !path.hasDirectoryPath {

                        if !path.isFileURL {
                            enumerator.skipDescendants()
                            
                        } else {
                            
                            let content = try String(contentsOf: path)
                            
                            if content.count > 1 {
                                
                                let result = try convert(content: content)
                                
                                try result.write(to: target, atomically: true, encoding: .utf8)
                                
                            } else {
                                throw ConverterError.emptyFile
                            }
                        }
                    }
                }
            }
        }
    }
}
