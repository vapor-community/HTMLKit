import Foundation

@main
internal struct DeployCommand {
    
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
            
            try compose(source: sourcePath + "/Resources/css/", to: targetPath + "/htmlkit/", with: "all.css")
            
            try compose(source: sourcePath + "/Resources/js/", to: targetPath + "/htmlkit/", with: "all.js")
            
            exit(0)
        }
    }
    
    /// Iterates through the directory and collects data to create a single file
    private static func compose(source: String, to target: String, with filename: String) throws {
        
        if !manager.fileExists(atPath: target) {
            try manager.createDirectory(atPath: target, withIntermediateDirectories: true)
        }
        
        if !manager.fileExists(atPath: target + filename) {
            manager.createFile(atPath: target + filename, contents: nil)
        }
        
        if let enumerator = manager.enumerator(at: URL(fileURLWithPath: source), includingPropertiesForKeys: nil, options: [.skipsHiddenFiles]) {
            
            for case let path as URL in enumerator {
                
                if !path.hasDirectoryPath {
                    
                    if !path.isFileURL {
                        enumerator.skipDescendants()
                        
                    } else {
                        
                        if let handle = FileHandle(forWritingAtPath: target + filename) {
                         
                            handle.seekToEndOfFile()
                                    
                            handle.write(try Data(contentsOf: path))
                                  
                            handle.closeFile()
                        }
                    }
                }
            }
        }
    }
}
