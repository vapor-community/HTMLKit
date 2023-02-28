/*
 Abstract:
 The file contains the configuration for the environment.
 */

import Foundation
import HTMLKit

/// The environment
final public class Environment {
    
    /// The storage manager
    internal var manager: Manager
    
    /// Initiates a environment
    public init() {
        
        self.manager = Manager()
    }
    
    /// Adds an encodable object to the storage
    public func add<T>(object: T) where T: Encodable {
        manager.upsert(object, for: \T.self)
    }
}
