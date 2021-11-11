import Foundation

/// The protocol defines
///
///
public protocol Content {

    var renderWhenLocalizing: Bool { get }

    func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String

    func prerender(_ formula: HTMLRenderer.Formula) throws

    var scripts: Content { get }
}

extension Content {
    
    public var renderWhenLocalizing: Bool { return true }
    
    public var scripts: Content { "" }
    
    public func environment(locale: String) -> EnvironmentModifier {
        return EnvironmentModifier(view: self, locale: locale)
    }

    public func environment(locale: TemplateValue<String>) -> EnvironmentModifier {
        return EnvironmentModifier(view: self, locale: locale)
    }
}

/// The function is for
///
///
public func + (lhs: Content, rhs: Content) -> Content {
    var output: Array<Content> = []

    if let list = lhs as? Array<Content> {
        output.append(contentsOf: list)
    } else {
        output.append(lhs)
    }

    if let list = rhs as? Array<Content> {
        output.append(list)
    } else {
        output.append(rhs)
    }
    return output
}

/// The function is for
///
///
public func +=(lhs: inout Content, rhs: Content) {
    lhs = lhs + rhs
}
