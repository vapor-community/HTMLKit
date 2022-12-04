/*
 Abstract:
 The file contains the context manager.
 */

import Foundation
import Lingo

/// A struct managing the contexts
internal class Manager {
    
    /// The different contexts of the views
    internal var contexts: [String: Any]
    
    /// Initiates a manager
    internal init() {
        
        self.contexts = [:]
    }

    /// Retrieves a value for the variable
    internal func retrieve<T>(for variable: HTMLContext<T>) throws -> T? {
        
        if let context = self.contexts[variable.rootId] {
            
            if let value = context[keyPath: variable.keyPath] as? T {
                return value
                
            } else {
                return nil
            }
        }
        
        return nil
    }
    
    /// Adds the context to the manager
    internal func add(context: some Encodable) {
        
        let name = String(reflecting: type(of: context))
        
        self.contexts[name] = context
    }
}
