import Foundation

/// A class that represents the environment
///
/// The environment provides storage for various settings used by the renderer
public class Environment {
    
    /// The storage of the environment
    private var storage: [AnyKeyPath: Any]
    
    /// Initializes the environment
    public init() {
        
        self.storage = [:]
    }
    
    /// The current time zone of the environment
    public var timeZone: TimeZone?
    
    /// The current calendar of the environment
    public var calendar: Calendar?
    
    /// The current locale of the environment
    public var locale: Locale?
    
    /// The current color scheme of the environment
    public var colorScheme: String?
    
    /// Retrieves a value from environment for a given key path
    ///
    /// - Parameter path: The key path used to look up the value
    ///
    /// - Returns: The value
    public func retrieve(for path: AnyKeyPath) -> Any? {
        
        if let value = self.storage[path] {
            return value
        }
        
        return nil
    }
    
    /// Inserts or updates a value in the environment for the given key path
    ///
    /// - Parameters:
    ///   - value: The value to be stored or updated
    ///   - path: The key path that identifies where the value is stored
    public func upsert<T>(_ value: T, for path: AnyKeyPath) {
        self.storage[path] = value
    }
}
