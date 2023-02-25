import Foundation

/// A type, that manages the environment storage
public class Manager {
    
    /// The storage of the environment
    private var storage: [AnyKeyPath: Any]
    
    /// Initiates a manager
    public init() {
        
        self.storage = [:]
    }
    
    /// Retrieves an item from storage by its path
    public func retrieve(for path: AnyKeyPath) -> Any? {
        
        if let value = self.storage[path] {
            return value
        }
        
        return nil
    }
    
    /// Adds und updates an item to the storage
    public func upsert<T>(_ value: T, for path: AnyKeyPath) {
        self.storage[path] = value
    }
}
