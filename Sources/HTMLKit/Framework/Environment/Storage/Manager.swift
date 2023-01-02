import Foundation

/// A type, that manages the environment storage
internal class Manager {
    
    /// The storage of the environment
    internal var storage: [AnyKeyPath: Any]
    
    /// Initiates a manager
    internal init() {
        
        self.storage = [:]
    }
    
    /// Retrieves an item from storage by its path
    internal func retrieve(for path: AnyKeyPath) -> Any? {
        
        if let value = self.storage[path] {
            return value
        }
        
        return nil
    }
    
    /// Adds und updates an item to the storage
    internal func upsert<T>(_ value: T, for path: AnyKeyPath) {
        self.storage[path] = value
    }
}
