/*
 Abstract:
 The file contains the cache. The cache stacks the formulas of the renderer.
 */

internal class Cache {
    
    private var stack: [String: Formula]
    
    internal var count: Int {
        return self.stack.keys.count
    }
    
    internal init() {
        self.stack = [:]
    }
    
    internal func retrieve(key: String) -> Formula? {
        return self.stack[key] ?? nil
    }
    
    internal func upsert(formula: Formula, for key: String) {
        self.stack.updateValue(formula, forKey: key)
    }
    
    internal func remove(key: String) {
        self.stack.removeValue(forKey: key)
    }
}
