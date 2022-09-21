import Foundation
import HTMLKitConverter

@main
@available(macOS 11.0, *)
internal struct ConvertCommand {
    
    private static var outputOption: String {
        return CommandLine.arguments[1]
    }
    
    private static var sourcePath: String {
        return CommandLine.arguments[2]
    }
    
    private static var targetPath: String? {
        
        if CommandLine.arguments.count < 4 {
            return nil
        }
        
        return CommandLine.arguments[3]
    }
    
    internal static func main() throws {
        
        if !FileManager.default.fileExists(atPath: sourcePath) {
            print("No valid source path.")
            
            exit(1)
            
        } else {
            
            let url = URL(fileURLWithPath: sourcePath)
            
            switch outputOption {
            case "file":
                
                if let targetPath = self.targetPath {
                    try Converter.default.convert(source: url, target: URL(fileURLWithPath: targetPath))
                    
                    exit(0)
                    
                } else {
                    print("Unkown target path.")
                    
                    exit(1)
                }
                
            case "debug":
                
                if targetPath != nil {
                    print("Wrong output option.")
                    
                    exit(1)
                    
                } else {
                    try Converter.default.convert(source: url)
                    
                    exit(0)
                }
                
            default:
                break
                
            }
        }
    }
}
