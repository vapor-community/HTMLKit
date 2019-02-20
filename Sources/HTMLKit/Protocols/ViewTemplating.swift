
/// A template that can fill take views as placeholders
/// For instance, a base template that will render a navigation bar,
/// but need a other class to set the content view to render.
/// In leaf this is the #get(...) and #set(...)
public protocol ViewTemplating: ContextualTemplate {
    associatedtype ViewContext

    /// Builds the view
    ///
    /// - Parameter context: The view context to render with
    /// - Returns: a view that conforms to `Mappable`
    static func build(with context: ViewContext) -> Mappable
}
