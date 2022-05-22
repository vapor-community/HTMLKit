/*
 Abstract:
 The file contains the content definition.
 
 Authors:
 - Mats Moll (https://github.com/matsmoll)
 
 Contributors:
 - Mattes Mohr (https://github.com/mattesmohr)
 
 Note:
 If you about to add something to the file, stick to the official documentation to keep the code consistent.
 */

import Foundation

/// A type that represents any html-content.
public protocol AnyContent {

    var renderWhenLocalizing: Bool { get }
    
    var scripts: AnyContent { get }

    func render<T>(with manager: Renderer.ContextManager<T>) throws -> String

    func prerender(_ formula: Renderer.Formula) throws
}

extension AnyContent {
    
    public var renderWhenLocalizing: Bool { return true }
    
    public var scripts: AnyContent { "" }
    
    public func environment(locale: String) -> EnvironmentModifier {
        return EnvironmentModifier(view: self, locale: locale)
    }

    public func environment(locale: TemplateValue<String>) -> EnvironmentModifier {
        return EnvironmentModifier(view: self, locale: locale)
    }
}

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
