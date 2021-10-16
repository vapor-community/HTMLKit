import Foundation

public protocol HTMLContent {

    /// A value indicating if the template should render when it is used as localization info
    var renderWhenLocalizing: Bool { get }

    /// Renders a compiled template to an HTML document
    ///
    /// - Parameter manager: A manager that contains the context
    /// - Returns: An HTML document
    /// - Throws: If the HTML can not be rendered for some reason
    func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String

    /// Brews a mappable object in to a formula
    ///
    ///     formula.add(string: "<\(name)/>")   // A constant string
    ///     formula.add(self)                   // Not able to be predetermand
    ///
    /// - Parameter formula: The formula to brew in to
    /// - Throws: If there occured some error
    func prerender(_ formula: HTMLRenderer.Formula) throws

    /// The script needed to render the underlying HTML
    var scripts: HTMLContent { get }
}

extension HTMLContent {
    public var renderWhenLocalizing: Bool { return true }
    public var scripts: HTMLContent { "" }
}

/// Concats two values
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

/// Concats second value to the first one
public func +=(lhs: inout HTMLContent, rhs: HTMLContent) {
    lhs = lhs + rhs
}
