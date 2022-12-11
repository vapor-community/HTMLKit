/*
 Abstract:
 The file contains the default definition of the content. It defines which properties and methods a content should come with.
 */

import Foundation

/// A type that represents any html-content.
public protocol Content {
}

public func +(lhs: Content, rhs: Content) -> Content {
    
    var output: [Content] = []

    if let list = lhs as? [Content] {
        output.append(contentsOf: list)
        
    } else {
        output.append(lhs)
    }

    if let list = rhs as? [Content] {
        output.append(list)
        
    } else {
        output.append(rhs)
    }
    
    return output
}

public func +=(lhs: inout Content, rhs: Content) {
    lhs = lhs + rhs
}