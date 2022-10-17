import HTMLKit
import Vapor

public class VaporCache {
    
    private var cache: [String: HTMLKit.Renderer.Formula]
    
    public var count: Int {
        return self.cache.keys.count
    }
    
    public init() {
        self.cache = .init()
    }
    
    public func retrieve(name: String, on loop: EventLoop) -> EventLoopFuture<HTMLKit.Renderer.Formula?> {
        
        if let cache = self.cache[name] {
            return loop.makeSucceededFuture(cache)
            
        } else {
            return loop.makeSucceededFuture(nil)
        }
    }
    
    public func upsert(name: String, formula: HTMLKit.Renderer.Formula) {
        self.cache.updateValue(formula, forKey: name)
    }
    
    public func remove(name: String) {
        self.cache.removeValue(forKey: name)
    }
}
