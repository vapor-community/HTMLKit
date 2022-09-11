import Foundation
import Converter

@main
@available(macOS 11.0, *)
struct ConvertCommand {
    
    var sourceDirectory: String
    var targetDirectory: String?
    var output: String
    
    func run() throws {
        
        try Converter.default.convert(directory: URL(fileURLWithPath: sourceDirectory),
                                      option: .debug)
    }
    
    static func main() throws {
            
        if CommandLine.arguments.count < 4 {
            
            let command = ConvertCommand(sourceDirectory: CommandLine.arguments[1],
                                         output: CommandLine.arguments[2])
            try command.run()
            
        } else {
            
            let command = ConvertCommand(sourceDirectory: CommandLine.arguments[1],
                                         targetDirectory: CommandLine.arguments[2],
                                         output: CommandLine.arguments[3])
            try command.run()
        }
    }
}
