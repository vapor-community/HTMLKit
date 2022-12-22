/*
 Abstract:
 The file contains the default definition of the content. It defines which properties and methods a content should come with.
 */

import Foundation

/// A type that represents any html-content.
public protocol AnyContent {}

public func + (lhs: AnyContent, rhs: AnyContent) -> AnyContent {
    var output: Array<AnyContent> = []

    if let list = lhs as? Array<AnyContent> {
        output.append(contentsOf: list)
    } else {
        output.append(lhs)
    }

    if let list = rhs as? Array<AnyContent> {
        output.append(list)
    } else {
        output.append(rhs)
    }
    return output
}

public func +=(lhs: inout AnyContent, rhs: AnyContent) {
    lhs = lhs + rhs
}
