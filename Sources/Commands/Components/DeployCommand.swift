import Foundation

@main
internal struct DeployCommand {
    
    private static var sourcePath: String {
        return CommandLine.arguments[1]
    }
    
    private static var targetPath: String {
        return CommandLine.arguments[2]
    }
    
    internal static func main() throws {
        
        if !FileManager.default.fileExists(atPath: sourcePath) {
            print("No valid source path.")
            
            exit(1)
            
        } else {
            
            let resourcesDirectory = URL(fileURLWithPath: sourcePath)
                .appendingPathComponent("Resources", isDirectory: true)
            
            let distributionFile = URL(fileURLWithPath: targetPath)
                .appendingPathComponent("Public", isDirectory: true)
                .appendingPathComponent("HtmlKit", isDirectory: true)
                .appendingPathComponent("css")
                .appendingPathComponent("all")
                .appendingPathExtension("css")
            
            if let enumerator = FileManager.default.enumerator(at: resourcesDirectory, includingPropertiesForKeys: nil, options: [.skipsHiddenFiles]) {
                
                for case let path as URL in enumerator {
                    
                    if !path.hasDirectoryPath {
                        
                        if !path.isFileURL {
                            enumerator.skipDescendants()
                            
                        } else {
                            
                            let data = try Data(contentsOf: path)
                            
                            if let handle = try? FileHandle(forWritingTo: distributionFile) {
                                
                                handle.seekToEndOfFile()
                                
                                handle.write(data)
                                
                                handle.closeFile()
                                
                            } else {
                                try data.write(to: distributionFile)
                            }
                        }
                    }
                }
            }
            
            exit(0)
        }
    }
}
