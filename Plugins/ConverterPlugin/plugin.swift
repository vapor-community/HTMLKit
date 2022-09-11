import PackagePlugin
import Foundation

@main
struct ConverterPlugin: CommandPlugin {
    
    func performCommand(context: PluginContext, arguments: [String]) async throws {
        
        let tool = try context.tool(named: "ConverterCommand")
        
        var extractor = ArgumentExtractor(arguments)
        
        let sourceArgument = extractor.extractOption(named: "source")
        let targetArgument = extractor.extractOption(named: "target")
        
        var processArguments = [String]()
        
        if !sourceArgument.isEmpty {
            
            processArguments.insert(sourceArgument.first!, at: 0)
        }
        
        if !targetArgument.isEmpty {
            
            processArguments.insert(targetArgument.first!, at: 1)
            processArguments.insert("debug", at: 2)
            
        } else {
            processArguments.insert("print", at: 1)
        }
        
        let process = try Process.run(URL(fileURLWithPath: tool.path.string), arguments: processArguments)
        process.waitUntilExit()
        
        if process.terminationReason == .exit && process.terminationStatus == 0 {
            print("The conversion has finished.")
        }
    }
}
