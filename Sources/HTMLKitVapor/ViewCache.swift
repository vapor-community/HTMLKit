/*
 Abstract:
 The file contains the cache of the Vapor renderer.
 */

import HTMLKit
import Vapor

/// The cache
public class ViewCache {
    
    /// The cache storage
    internal var storage: [String: HTMLKit.Formula]
    
    /// Creates the cache
    internal init() {
        self.storage = [:]
    }
    
    /// Retrieves a formula from the storage
    internal func retrieve(name: String, on loop: EventLoop) -> EventLoopFuture<HTMLKit.Formula?> {
        
        if let cache = self.storage[name] {
            return loop.makeSucceededFuture(cache)
            
        } else {
            return loop.makeSucceededFuture(nil)
        }
    }
    
    /// Sets or updates a formula at the storage
    internal func upsert(name: String, formula: HTMLKit.Formula) {
        self.storage.updateValue(formula, forKey: name)
    }
    
    /// Removes a formula from the storage
    internal func remove(name: String) {
        self.storage.removeValue(forKey: name)
    }
    
    /// Adds a view to the storage
    public func add<T: HTMLKit.AnyLayout>(view: T) {
        
        let formula = HTMLKit.Formula()
        
        try? view.prerender(formula)
        
        self.storage.updateValue(formula, forKey: String(reflecting: T.self))
    }
}
