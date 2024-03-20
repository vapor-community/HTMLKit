import PackagePlugin
import Foundation

@main
struct ComponentsPlugin: CommandPlugin {
    
    func performCommand(context: PluginContext, arguments: [String]) async throws {
        
        let tool = try context.tool(named: "DeployCommand")
        
        var extractor = ArgumentExtractor(arguments)
        
        let usageArgument = extractor.extractFlag(named: "command-usage")
        
        if usageArgument > 0 {
            
            let explanation = """
            USAGE: deploy --target-path <path>
            
            ARGUMENTS:
            <target path> - The destination directory where the files should be saved.
            """
            
            print(explanation)
            
        } else {

            let targetArgument = extractor.extractOption(named: "target-path")
            
            var processArguments = [String]()
            
            if let dependency = try context.dependency(named: "HTMLKit") {
                
                if let target = try dependency.package.targets(named: ["HTMLKitComponents"]).first {
                    processArguments.insert(target.directory.string, at: 0)
                    
                } else {
                    Diagnostics.error("The target 'HTMLKitComponents' could not be found.")
                }
                
            } else {
                Diagnostics.error("The target 'HTMLKit' could not be found.")
            }
            
            if let target = targetArgument.first {
                processArguments.insert(target, at: 1)
                
            } else {
                
                if try context.dependency(named: "vapor") != nil {
                    processArguments.insert(context.package.directory.appending(subpath: "Public").string, at: 1)
                    
                } else {
                    Diagnostics.error("Missing argument --target-path.")
                }
            }
            
            print("The deployment starts...")
            
            let process = try Process.run(URL(fileURLWithPath: tool.path.string), arguments: processArguments)
            process.waitUntilExit()
            
            if process.terminationReason == .exit && process.terminationStatus == 0 {
                print("The deployment has finished.")
                
            } else {
                Diagnostics.error("The deployment has failed: \(process.terminationReason)")
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
