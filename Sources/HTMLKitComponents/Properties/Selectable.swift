import HTMLKit

/*
 Abstract:
 The file contains
 */

/// A type that describes a selectable component.
public protocol Selectable: Content {
    
    /// The identifier for the selection
    var name: String? { get set }
    
    /// The selection indicator
    var isSelected: Bool { get set }
    
    /// The selection value
    var value: String { get set }
}

extension Selectable {
    
    internal func selected(_ condition: Bool) -> Self {
        
        var newSelf = self
        newSelf.isSelected = condition
        
        return newSelf
    }
    
    internal func tag(_ name: String) -> Self {
        
        var newSelf = self
        newSelf.name = name
        
        return newSelf
    }
}
