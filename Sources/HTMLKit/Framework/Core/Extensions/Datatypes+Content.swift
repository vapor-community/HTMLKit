/*
 Abstract:
 The file contains extensions for some data types.
 */

import Foundation

extension Array: Content {}

extension String: Content {}

extension Int: Content {}

extension Float: Content {}

extension Double: Content {}

extension Bool: Content {}

extension Bool: Conditionable {}

extension Sequence {
    
    @available(*, deprecated, message: "The method will be removed entirely.")
    public func htmlForEach(@ContentBuilder<Content> content: (TemplateValue<Element>) -> Content) -> Content {
        ForEach(in: .constant(self), content: content)
    }
}
