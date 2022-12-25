//
//  File.swift
//  
//
//  Created by Mattes Mohr on 25.12.22.
//

internal protocol Identifiable {
    
    /// The identifier of the component.
    var id: String? { get set }
}

extension Identifiable {
    
    public func id(_ value: String) -> Self {
        
        var newSelf = self
        newSelf.id = value
        
        return newSelf
    }
}
