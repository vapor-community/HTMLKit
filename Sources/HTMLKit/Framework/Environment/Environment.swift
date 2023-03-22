import Foundation

/// A type that represents the environment
public class Environment {
    
    /// The storage of the environment
    private var storage: [AnyKeyPath: Any]
    
    /// Initiates a manager
    public init() {
        
        self.storage = [:]
    }
    
    /// The current  time zone of the environment
    public var timeZone: TimeZone?
    
    /// The current calender of the environment
    public var calendar: Calendar?
    
    /// The current local of the environment
    public var locale: Locale?
    
    /// The current color scheme of the environment
    public var colorScheme: String?
    
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
