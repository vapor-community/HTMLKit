import Foundation
import Lingo

public class ContextManager<Context> {
    
    public enum Errors: LocalizedError {
        
        case unableToRetrieveValue
        case unableToCastVariable

        public var errorDescription: String? {
            
            switch self {
            case .unableToRetrieveValue:
                return "Unable to retrieve the wanted value in the context"
                
            case .unableToCastVariable:
                return "Unable to cast value when retrieving variable"
            }
        }
        
        public var failureReason: String? {
            return self.errorDescription ?? ""
        }

        public var recoverySuggestion: String? {
            
            switch self {
            default:
                return nil
            }
        }
    }

    public let lingo: Lingo?
    public var locale: String?
    public var contexts: [String: Any]
    
    @available(*, deprecated, message: "Use init(context:, lingo:) instead.")
    public init(rootContext: Context, lingo: Lingo? = nil) {
        
        self.contexts = ["": rootContext]
        self.lingo = lingo
        self.locale = nil
    }
    
    public init(context: Context, lingo: Lingo? = nil) {
        
        self.contexts = ["": context]
        self.lingo = lingo
        self.locale = nil
    }

    public init(contexts: [String: Any], lingo: Lingo? = nil) {
        
        self.contexts = contexts
        self.lingo = lingo
        self.locale = nil
    }

    public func value<T>(for variable: HTMLContext<T>) throws -> T {
        
        if let context = contexts[variable.rootId] {
            
            if let value = context[keyPath: variable.keyPath] as? T {
                return value
                
            } else {
                throw Errors.unableToCastVariable
            }
            
        } else {
            throw Errors.unableToRetrieveValue
        }
    }

    public func set<T>(_ context: T, for variable: HTMLContext<T>) {
        self.contexts[variable.rootId] = context
    }
}
