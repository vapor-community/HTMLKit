import Lingo

extension Renderer {
    
    public class ContextManager<Context> {

        public let lingo: Lingo?
        public var locale: String?
        public var contexts: [String: Any]

        public init(rootContext: Context, lingo: Lingo? = nil) {
            
            self.contexts = ["" : rootContext]
            self.lingo = lingo
            self.locale = nil
        }

        public init(contexts: [String: Any], lingo: Lingo? = nil) {
            
            self.contexts = contexts
            self.lingo = lingo
            self.locale = nil
        }

        public func value<Value>(for variable: HTMLContext<Value>) throws -> Value {
            
            if let variableContext = contexts[variable.rootId] {
                
                if let value = variableContext[keyPath: variable.keyPath] as? Value {
                    return value
                    
                } else {
                    throw Errors.unableToCastVariable
                }
                
            } else {
                throw Errors.unableToRetriveValue
            }
        }

        public func set<Value>(_ context: Value, for variable: ContextVariable<Value, Value>) {
            self.contexts[variable.rootId] = context
        }
    }
}
