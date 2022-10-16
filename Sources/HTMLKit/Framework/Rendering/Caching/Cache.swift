public class Cache {
    
    private var stack: [ObjectIdentifier: Formula]
    
    public var count: Int {
        return self.stack.keys.count
    }
    
    public init() {
        self.stack = [:]
    }
    
    public func retrieve(identifier: ObjectIdentifier) -> Formula? {
        return self.stack[identifier] ?? nil
    }
    
    public func upsert(formula: Formula, for identifier: ObjectIdentifier) {
        self.stack.updateValue(formula, forKey: identifier)
    }
    
    public func remove(identifier: ObjectIdentifier) {
        self.stack.removeValue(forKey: identifier)
    }
}
