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
    
    internal func mutate(id: String) -> Self {
        
        var newSelf = self
        newSelf.id = id
        
        return newSelf
    }
}
