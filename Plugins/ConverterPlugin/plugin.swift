import PackagePlugin
import Foundation

@main
struct ConverterPlugin: CommandPlugin {
    
    func performCommand(context: PluginContext, arguments: [String]) async throws {
        
        let tool = try context.tool(named: "ConvertCommand")
        
        var extractor = ArgumentExtractor(arguments)
        
        let usageArgument = extractor.extractFlag(named: "command-usage")
        
        if usageArgument > 0 {
            
            let explanation = """
            USAGE: convert --output-option <output option> --source-path <source directory> --target-path <target directory>
            
            ARGUMENTS:
                <output option> - file or debug
                <source directory> - The path of directory, wich the html are located.
                <target directory> - The path of directory, where the converted files should be saved.
            """
            
            print(explanation)
            
        } else {
            
            let outputArgument = extractor.extractOption(named: "output-option")
            let sourceArgument = extractor.extractOption(named: "source-path")
            let targetArgument = extractor.extractOption(named: "target-path")
            
            var processArguments = [String]()
            
            if !outputArgument.isEmpty {
                processArguments.insert(outputArgument.first!, at: 0)
                
            } else {
                Diagnostics.error("Missing argument --output-option.")
            }
            
            if !sourceArgument.isEmpty {
                processArguments.insert(sourceArgument.first!, at: 1)
                
            } else {
                Diagnostics.error("Missing argument --source-path.")
            }
            
            if !targetArgument.isEmpty {
                processArguments.insert(targetArgument.first!, at: 2)
            }
            
            print("The conversion starts...")
            
            let process = try Process.run(URL(fileURLWithPath: tool.path.string), arguments: processArguments)
            process.waitUntilExit()
            
            if process.terminationReason == .exit && process.terminationStatus == 0 {
                print("The conversion has finished.")
                
            } else {
                Diagnostics.error("The conversion has failed: \(process.terminationReason)")
            }
        }
    }
}
