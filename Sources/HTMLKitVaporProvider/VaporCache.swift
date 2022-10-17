/*
 Abstract:
 The file contains the cache of the Vapor renderer.
 */

import HTMLKit
import Vapor

public class VaporCache {
    
    private var storage: [String: HTMLKit.Formula]
    
    public var count: Int {
        return self.storage.keys.count
    }
    
    public init() {
        self.storage = [:]
    }
    
    public func retrieve(name: String, on loop: EventLoop) -> EventLoopFuture<HTMLKit.Formula?> {
        
        if let cache = self.storage[name] {
            return loop.makeSucceededFuture(cache)
            
        } else {
            return loop.makeSucceededFuture(nil)
        }
    }
    
    public func upsert(name: String, formula: HTMLKit.Formula) {
        self.storage.updateValue(formula, forKey: name)
    }
    
    public func remove(name: String) {
        self.storage.removeValue(forKey: name)
    }
}
