/*
 Abstract:
 The file contains the cache of the Vapor renderer.
 */

import HTMLKit
import Vapor

/// The cache
public class VaporCache {
    
    /// The cache storage
    private var storage: [String: HTMLKit.Formula]
    
    /// The amount of storing keys
    public var count: Int {
        return self.storage.keys.count
    }
    
    /// Creates the cache
    public init() {
        self.storage = [:]
    }
    
    /// Retrieves a formula from the storage
    public func retrieve(name: String, on loop: EventLoop) -> EventLoopFuture<HTMLKit.Formula?> {
        
        if let cache = self.storage[name] {
            return loop.makeSucceededFuture(cache)
            
        } else {
            return loop.makeSucceededFuture(nil)
        }
    }
    
    /// Sets or updates a formula at the storage
    public func upsert(name: String, formula: HTMLKit.Formula) {
        self.storage.updateValue(formula, forKey: name)
    }
    
    /// Removes a formula from the storage
    public func remove(name: String) {
        self.storage.removeValue(forKey: name)
    }
}
