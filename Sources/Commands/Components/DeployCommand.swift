import Foundation
import Minifier

@main
internal struct DeployCommand {
    
    internal enum BundleOption {
        
        case minified
        case detailed
    }
    
    private static var sourcePath: String {
        return CommandLine.arguments[1]
    }
    
    private static var targetPath: String {
        return CommandLine.arguments[2]
    }
    
    private static let manager = FileManager.default
    
    internal static func main() throws {
        
        if !manager.fileExists(atPath: sourcePath) {
            print("No valid source path.")
            
            exit(1)
            
        } else {
            
            try bundle(css: sourcePath + "/Resources/css/", to: targetPath + "/htmlkit/", with: "all.css")
            
            try bundle(js: sourcePath + "/Resources/js/components/", to: targetPath + "/htmlkit/", with: "all.js")
            
            try bundle(js: sourcePath + "/Resources/js/interactions/", to: targetPath + "/htmlkit/", with: "query.js")
            
            exit(0)
        }
    }
    
    /// Iterates through the directory and collects data to create a single file
    private static func bundle(css source: String, to target: String, with filename: String, option: BundleOption = .minified) throws {
        
        let template = """
        @charset "utf-8";
        /* Copyright (c) 2019 - 2023 Vapor Community - Licensed under MIT (https://github.com/vapor-community/HTMLKit/blob/main/LICENSE) */
        """
        
        if !manager.fileExists(atPath: target) {
            try manager.createDirectory(atPath: target, withIntermediateDirectories: true)
        }
        
        if !manager.fileExists(atPath: target + filename) {
            manager.createFile(atPath: target + filename, contents: template.data(using: .utf8))
        }
        
        if let enumerator = manager.enumerator(at: URL(fileURLWithPath: source), includingPropertiesForKeys: nil, options: [.skipsHiddenFiles]) {
            
            for case let path as URL in enumerator {
                
                if !path.hasDirectoryPath {
                    
                    if !path.isFileURL {
                        enumerator.skipDescendants()
                        
                    } else {
                        
                        if let handle = FileHandle(forWritingAtPath: target + filename) {
                         
                            handle.seekToEndOfFile()
                                    
                            if case .minified = option {
                                
                                let minifier = Minifier(compression: [.stripComments, .removeWhitespaces])
                                
                                if let data = minifier.minify(css: try String(contentsOf: path)).data(using: .utf8) {
                                    handle.write(data)
                                }
                                
                            } else {
                                handle.write(try Data(contentsOf: path))
                            }
                                  
                            handle.closeFile()
                        }
                    }
                }
            }
        }
    }
    
    /// Iterates through the directory and collects data to create a single file
    private static func bundle(js source: String, to target: String, with filename: String, option: BundleOption = .minified) throws {
        
        let template = """
        /* Copyright (c) 2019 - 2023 Vapor Community - Licensed under MIT (https://github.com/vapor-community/HTMLKit/blob/main/LICENSE) */
        """
        
        if !manager.fileExists(atPath: target) {
            try manager.createDirectory(atPath: target, withIntermediateDirectories: true)
        }
        
        if !manager.fileExists(atPath: target + filename) {
            manager.createFile(atPath: target + filename, contents: template.data(using: .utf8))
        }
        
        if let enumerator = manager.enumerator(at: URL(fileURLWithPath: source), includingPropertiesForKeys: nil, options: [.skipsHiddenFiles]) {
            
            for case let path as URL in enumerator {
                
                if !path.hasDirectoryPath {
                    
                    if !path.isFileURL {
                        enumerator.skipDescendants()
                        
                    } else {
                        
                        if let handle = FileHandle(forWritingAtPath: target + filename) {
                         
                            handle.seekToEndOfFile()
                            
                            if case .minified = option {
                                
                                let minifier = Minifier(compression: [.stripComments, .removeWhitespaces])
                                
                                if let data = minifier.minify(js: try String(contentsOf: path)).data(using: .utf8) {
                                    handle.write(data)
                                }
                                
                            } else {
                                handle.write(try Data(contentsOf: path))
                            }
                                  
                            handle.closeFile()
                        }
                    }
                }
            }
        }
    }
}
