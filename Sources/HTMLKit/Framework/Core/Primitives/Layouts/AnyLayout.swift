//
//  File.swift
//  
//
//  Created by Mattes Mohr on 17.05.22.
//

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
