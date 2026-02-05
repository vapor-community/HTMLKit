import HTMLKit

/// A type that describes a selectable component.
internal protocol Selectable: Content {
    
    /// The identifier for the selection
    var name: String? { get set }
    
    /// The selection indicator
    var isSelected: Bool { get set }
    
    /// The selection value
    var value: String { get set }
}

extension Selectable {
    
    internal func selected(_ condition: Bool) -> Self {
        
        var copy = self
        copy.isSelected = condition
        
        return copy
    }
    
    internal func tag(_ name: String) -> Self {
        
        var copy = self
        copy.name = name
        
        return copy
    }
}
