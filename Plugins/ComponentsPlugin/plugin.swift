import PackagePlugin
import Foundation

@main
struct ConverterPlugin: CommandPlugin {
    
    func performCommand(context: PluginContext, arguments: [String]) async throws {
        
        let tool = try context.tool(named: "DeployCommand")
        
        var extractor = ArgumentExtractor(arguments)
        
        let usageArgument = extractor.extractFlag(named: "command-usage")
        
        if usageArgument > 0 {
            
            let explanation = """
            USAGE: deploy
            """
            
            print(explanation)
            
        } else {

            var processArguments = [String]()
            
            if let dependency = try context.dependency(named: "HTMLKit") {
                
                if let target = try? dependency.package.targets(named: ["HTMLKitComponents"]).first {
                    processArguments.insert(target.directory.string, at: 0)
                    
                } else {
                    Diagnostics.error("Missing package.")
                }
                
            } else {
                Diagnostics.error("Missing package.")
            }
            
            processArguments.insert(context.package.directory.string, at: 1)
            
            print("The deploy starts...")
            
            let process = try Process.run(URL(fileURLWithPath: tool.path.string), arguments: processArguments)
            process.waitUntilExit()
            
            if process.terminationReason == .exit && process.terminationStatus == 0 {
                print("The deploy has finished.")
                
            } else {
                Diagnostics.error("The deploy has failed: \(process.terminationReason)")
            }
            
        }
    }
}

extension PluginContext {
    
    public func dependency(named: String) throws -> PackageDependency? {
        
        for dependency in self.package.dependencies {
            
            if dependency.package.displayName == named {
                return dependency
            }
        }
        
        return nil
    }
}
