import Lingo

extension Renderer {
    
    /// Manage the different contexts
    /// This will remove the generic type in the render call
    public class ContextManager<Context> {

        /// The different context variables used when rendering
        var contexts: [String: Any]

        /// The lingo object that is needed to use localization
        let lingo: Lingo?

        /// The path to the selected locale to use in localization
        public var locale: String?

        init(rootContext: Context, lingo: Lingo? = nil) {
            self.contexts = ["" : rootContext]
            self.lingo = lingo
            self.locale = nil
        }

        init(contexts: [String: Any], lingo: Lingo? = nil) {
            self.contexts = contexts
            self.lingo = lingo
            self.locale = nil
        }

        /// The value for a `ContextVariable`
        ///
        /// - Returns: The value at the `ContextVariable`
        func value<Value>(for variable: HTMLContext<Value>) throws -> Value {
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

        func set<Value>(_ context: Value, for variable: ContextVariable<Value, Value>) {
            contexts[variable.rootId] = context
        }
    }
}
