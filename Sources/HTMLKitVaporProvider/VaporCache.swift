import HTMLKit

public class VaporCache {
    
    private var cache: [String: HTMLKit.Renderer.Formula]
    
    public var count: Int {
        return self.cache.keys.count
    }
    
    public init() {
        self.cache = .init()
    }
    
    public func get(name: String) -> HTMLKit.Renderer.Formula? {
        return self.cache[name] ?? nil
    }
    
    public func upsert(name: String, formula: HTMLKit.Renderer.Formula) {
        self.cache[name] = formula
    }
    
    public func remove(name: String) {
        self.cache.removeValue(forKey: name)
    }
}
