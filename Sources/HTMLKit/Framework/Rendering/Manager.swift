/*
 Abstract:
 The file contains the context manager.
 */

import Foundation
import Lingo

/// A type, that manages the contexts
internal class Manager {
    
    /// The storage of the contexts
    internal var storage: [String: Encodable]
    
    /// Initiates a manager
    internal init() {
        
        self.storage = [:]
    }
    
    /// Retrieves a context by its name
    internal func retrieve(for name: String) -> (any Encodable)? {
        
        if let context = self.storage[name] {
            return context
        }
        
        return nil
    }
    
    /// Adds the context to the manager
    internal func add(context: some Encodable) {
        
        let name = String(reflecting: type(of: context))
        
        self.storage[name] = context
    }
}
