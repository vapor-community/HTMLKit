import PackagePlugin
import Foundation

@main
struct ConverterPlugin: CommandPlugin {
    
    func performCommand(context: PluginContext, arguments: [String]) async throws {
        
        let outputOptions = ["debug", "file"]
        
        let tool = try context.tool(named: "ConvertCommand")
        
        var extractor = ArgumentExtractor(arguments)
        
        let usageArgument = extractor.extractFlag(named: "command-usage")
        
        if usageArgument > 0 {
            
            let explanation = """
            USAGE: convert --output-option <option> --source-path <path> --target-path <path>
            
            ARGUMENTS:
                <output option> - file or debug
                <source path> - The path, where the html files are located.
                <target path> - The path, where the converted files should be saved into.
            """
            
            print(explanation)
            
        } else {
            
            let outputArgument = extractor.extractOption(named: "output-option")
            let sourceArgument = extractor.extractOption(named: "source-path")
            let targetArgument = extractor.extractOption(named: "target-path")
            
            var processArguments = [String]()
            
            if let output = outputArgument.first {
                
                if !outputOptions.contains(output) {
                    Diagnostics.error("Invalid output option. Choose 'file' or 'debug' instead.")
                }
                
                processArguments.insert(output, at: 0)
                
            } else {
                Diagnostics.error("Missing argument --output-option.")
            }
            
            if let source = sourceArgument.first {
                processArguments.insert(source, at: 1)
                
            } else {
                Diagnostics.error("Missing argument --source-path.")
            }
            
            if let target = targetArgument.first {
                processArguments.insert(target, at: 2)
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
