import Foundation

/// A class that represents the environment
///
/// The environment provides storage for various settings used by the renderer
public final class Environment {
    
    /// The storage of the environment
    private var storage: [AnyKeyPath: Any]
    
    /// Initializes the environment
    public init() {
        
        self.storage = [:]
    }
    
    /// The current time zone of the environment
    public var timeZone: TimeZone? {
        
        get {
            retrieve(for: \EnvironmentKeys.timeZone) as? TimeZone
        }
    }
    
    /// The current calendar of the environment
    public var calendar: Calendar? {
        
        get {
            retrieve(for: \EnvironmentKeys.calendar) as? Calendar
        }
    }
    
    /// The current locale of the environment
    public var locale: Locale? {
        
        get {
            retrieve(for: \EnvironmentKeys.locale) as? Locale
        }
    }
    
    /// The current color scheme of the environment
    public var colorScheme: String? {
        
        get {
            retrieve(for: \EnvironmentKeys.colorScheme) as? String
        }
    }
    
    /// Retrieves a value from environment for a given key path
    ///
    /// - Parameter path: The key path used to look up the value
    ///
    /// - Returns: The value
    public func retrieve(for path: AnyKeyPath) -> Any? {
        return storage[path]
    }
    
    /// Inserts or updates a value in the environment for the given key path
    ///
    /// - Parameters:
    ///   - value: The value to be stored or updated
    ///   - path: The key path that identifies where the value is stored
    public func upsert<T>(_ value: T, for path: AnyKeyPath) {
        storage[path] = value
    }
}

extension Environment {
    
    /// Evaluates one condition
    ///
    /// - Parameters:
    ///   - condition: The condition to evaluate
    ///   - content: The content for the true statement
    ///
    /// - Returns: A environment condition
    public static func when(_ condition: Conditionable, @ContentBuilder<Content> content: () -> [Content]) -> Statement {
        return Statement(compound: condition, first: content(), second: [])
    }
    
    /// Evaluates one condition
    ///
    /// - Parameters:
    ///   - condition: The condition to evaluate
    ///   - content: The content for the true statement
    ///   - then: The content for the false statement
    ///
    /// - Returns: A environment condition
    public static func when(_ condition: Conditionable, @ContentBuilder<Content> content: () -> [Content], @ContentBuilder<Content> then: () -> [Content]) -> Statement {
        return Statement(compound: condition, first: content(), second: then())
    }
    
    /// Iterates through a sequence of values
    ///
    /// - Parameters:
    ///   - sequence: The sequence to iterate over
    ///   - content: The content for the iteration
    ///
    /// - Returns: A environment condition
    public static func loop(_ sequence: EnvironmentValue, @ContentBuilder<Content> content: (EnvironmentValue) -> [Content]) -> Sequence {
        return Sequence(value: sequence, content: content(sequence))
    }
}
