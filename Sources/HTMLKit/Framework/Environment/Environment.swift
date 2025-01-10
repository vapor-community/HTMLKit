import Foundation

/// A class that represents the environment
///
/// The environment provides storage for various settings used by the renderer
@_documentation(visibility: internal)
public final class Environment {
    
    /// An enumeration of possible rendering errors.
    public enum Errors: Error {
        
        /// Indicates a casting error.
        case unableToCastEnvironmentValue
        
        /// Indicates a wrong environment key.
        case unindendedEnvironmentKey
        
        /// Indicates a missing environment object.
        case environmentObjectNotFound
        
        /// Indicates a missing environment value.
        case environmentValueNotFound

        /// A brief error description.
        public var description: String {
            
            switch self {
            case .unableToCastEnvironmentValue:
                return "Unable to cast the environment value."
                
            case .unindendedEnvironmentKey:
                return "The environment key is not indended."
                
            case .environmentValueNotFound:
                return "Unable to retrieve environment value."
                
            case .environmentObjectNotFound:
                return "Unable to retrieve environment object."
            }
        }
    }
    
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
    
    /// Resolves an environment value
    ///
    /// - Parameter value: The environment value to resolve
    ///
    /// - Returns: The resolved environment value
    internal func resolve(value: EnvironmentValue) throws -> Any {
        
        guard let parent = retrieve(for: value.parentPath) else {
            throw Errors.environmentObjectNotFound
        }

        guard let value = parent[keyPath: value.valuePath] else {
            throw Errors.environmentValueNotFound
        }
        
        return value
    }
    
    /// Evaluates an environment value
    ///
    /// - Parameter value: The value to evaluate
    ///
    /// - Returns: The result of evaluation
    internal func evaluate(value: EnvironmentValue) throws -> Bool {
        
        guard let boolValue = try resolve(value: value) as? Bool else {
            throw Errors.unableToCastEnvironmentValue
        }
        
        return boolValue
    }
    
    /// Evaluates an environment relation
    ///
    /// - Parameter relation: The relation to evaluate
    ///
    /// - Returns: The result of the evaluation
    internal func evaluate(relation: Relation) throws -> Bool {
        
        switch relation.term {
        case .conjunction:
            
            var result = true
            
            switch relation.lhs {
            case .optional(let optional):
                result = try evaluate(optional: optional)
                
            case .condition(let condition):
                result = try evaluate(condition: condition)
                
            case .relation(let relation):
                result = try evaluate(relation: relation)
                
            case .negation(let negation):
                result = try evaluate(negation: negation)
                
            case .value(let value):
                result = try evaluate(value: value)
            }
            
            if !result {
                // Bail early if the first result already is false
                return result
            }
            
            switch relation.rhs {
            case .optional(let optional):
                result = try evaluate(optional: optional)
                
            case .condition(let condition):
                result = try evaluate(condition: condition)
                
            case .relation(let relation):
                result = try evaluate(relation: relation)
                
            case .negation(let negation):
                result = try evaluate(negation: negation)
                
            case .value(let value):
                result = try evaluate(value: value)
            }
            
            return result
            
        case .disjunction:
            
            var result = false
            
            switch relation.lhs {
            case .optional(let optional):
                result = try evaluate(optional: optional)
                
            case .condition(let condition):
                result = try evaluate(condition: condition)
                
            case .relation(let relation):
                result = try evaluate(relation: relation)
                
            case .negation(let negation):
                result = try evaluate(negation: negation)
                
            case .value(let value):
                result = try evaluate(value: value)
            }
            
            if result {
                // Bail early if the first result is already true
                return result
            }
            
            switch relation.rhs {
            case .optional(let optional):
                result = try evaluate(optional: optional)
                
            case .condition(let condition):
                result = try evaluate(condition: condition)
                
            case .relation(let relation):
                result = try evaluate(relation: relation)
                
            case .negation(let negation):
                result = try evaluate(negation: negation)
                
            case .value(let value):
                result = try evaluate(value: value)
            }
            
            return result
        }
    }
    
    /// Evaluates an environment condition
    ///
    /// - Parameter condition: The condition to evaluate
    ///
    /// - Returns: The result of the evaluation
    internal func evaluate(condition: Condition) throws -> Bool {
        
        let value = try resolve(value: condition.lhs)
        
        switch condition.comparison {
        case .equal:
            return condition.rhs.equal(value)
            
        case .greater:
            return condition.rhs.greater(value)
            
        case .unequal:
            return condition.rhs.unequal(value)
            
        case .less:
            return condition.rhs.less(value)
        }
    }
    
    /// Evaluates an environment negation
    ///
    /// - Parameter negation: The negation to evaluate
    ///
    /// - Returns: The result of the evaluation
    internal func evaluate(negation: Negation) throws -> Bool {
        return try !evaluate(value: negation.value)
    }
    
    /// Evaluates an environment optional
    ///
    /// - Parameter optional: The optional to evaluate
    ///
    /// - Returns: The result of the evaluation
    internal func evaluate(optional: EnvironmentValue) throws -> Bool {
        
        guard let optionalValue = try resolve(value: optional) as? Nullable else {
            throw Errors.unableToCastEnvironmentValue
        }
        
        if !optionalValue.isNull {
            return true
        }
        
        return false
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
    public static func when(_ condition: EnvironmentValue, @ContentBuilder<Content> content: () -> [Content]) -> Statement {
        return Statement(compound: .value(condition), first: content(), second: [])
    }
    
    /// Evaluates one condition
    ///
    /// - Parameters:
    ///   - condition: The condition to evaluate
    ///   - content: The content for the true statement
    ///
    /// - Returns: A environment condition
    public static func when(_ condition: Conditional, @ContentBuilder<Content> content: () -> [Content]) -> Statement {
        return Statement(compound: condition, first: content(), second: [])
    }
    
    /// Unwraps a optional environment value
    ///
    /// - Parameters:
    ///   - value: The optional value to unwrap
    ///   - content: The content for some statement
    ///
    /// - Returns: A environment statement
    public static func unwrap(_ value: EnvironmentValue, @ContentBuilder<Content> content: (EnvironmentValue) -> [Content]) -> Statement {
        return Statement(compound: .optional(value), first: content(value), second: [])
    }
    
    /// Unwraps a optional environment value
    ///
    /// - Parameters:
    ///   - value: The optional value to unwrap
    ///   - content: The content for some statement
    ///   - then: The content for none statement
    ///
    /// - Returns: A environment statement
    public static func unwrap(_ value: EnvironmentValue, @ContentBuilder<Content> content: (EnvironmentValue) -> [Content], @ContentBuilder<Content> then: () -> [Content]) -> Statement {
        return Statement(compound: .optional(value), first: content(value), second: then())
    }
    
    /// Evaluates one condition
    ///
    /// - Parameters:
    ///   - condition: The condition to evaluate
    ///   - content: The content for the true statement
    ///   - then: The content for the false statement
    ///
    /// - Returns: A environment condition
    public static func when(_ condition: Conditional, @ContentBuilder<Content> content: () -> [Content], @ContentBuilder<Content> then: () -> [Content]) -> Statement {
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
