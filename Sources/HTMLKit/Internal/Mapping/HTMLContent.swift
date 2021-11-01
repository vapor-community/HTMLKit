import Foundation

/// The protocol defines
///
///
public protocol HTMLContent {

    var renderWhenLocalizing: Bool { get }

    func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String

    func prerender(_ formula: HTMLRenderer.Formula) throws

    var scripts: HTMLContent { get }
}

extension HTMLContent {
    
    public var renderWhenLocalizing: Bool { return true }
    
    public var scripts: HTMLContent { "" }
    
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
public func + (lhs: HTMLContent, rhs: HTMLContent) -> HTMLContent {
    var output: Array<HTMLContent> = []

    if let list = lhs as? Array<HTMLContent> {
        output.append(contentsOf: list)
    } else {
        output.append(lhs)
    }

    if let list = rhs as? Array<HTMLContent> {
        output.append(list)
    } else {
        output.append(rhs)
    }
    return output
}

/// The function is for
///
///
public func +=(lhs: inout HTMLContent, rhs: HTMLContent) {
    lhs = lhs + rhs
}
