/*
 Abstract:
 The file contains the default definition of a layout. It defines which properties and methods a layout should come with.
 */

import Foundation

public protocol AnyLayout: AnyContent {
    
    /// The content of the page.
    @ContentBuilder<AnyContent> var body: AnyContent { get }
}

extension AnyLayout {
    
    public func render<T>(with manager: ContextManager<T>) throws -> String {
        try body.render(with: manager)
    }

    public func prerender(_ formula: Formula) throws {
        try body.prerender(formula)
    }

    public var scripts: AnyContent { body.scripts }
}
