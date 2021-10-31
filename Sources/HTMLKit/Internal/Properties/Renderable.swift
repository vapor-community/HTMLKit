/// A protocol that handles and renders HTMLKit templates
public protocol Renderable: AnyObject {
    
    /// Renders a `HTMLTemplate` formula
    ///
    ///     try renderer.render(raw: WelcomeView.self, with: WelcomeView.Context(...))
    ///
    /// - Parameters:
    ///   - type: The view type to render
    ///   - context: The needed context to render the view with
    /// - Returns: Returns a rendered view in a raw `String`
    /// - Throws: If the formula do not exists, or if the rendering process fails
    func render<T: HTMLTemplate>(raw type: T.Type, with context: T.Context) throws -> String

    /// Renders a `HTMLPage` formula
    ///
    ///     try renderer.render(raw: WelcomeView.self)
    ///
    /// - Parameter type: The view type to render
    /// - Returns: Returns a rendered view in a raw `String`
    /// - Throws: If the formula do not exists, or if the rendering process fails
    func render<T: HTMLPage>(raw type: T.Type) throws -> String
    
    /// Adds a forumla to the renderer
    ///
    ///     try renderer.add(view: WelcomeView())
    ///
    /// - Parameter view: The view type to add
    /// - Throws: If the pre-rendering process fails for some reason
    func add<T: HTMLTemplate>(view: T) throws
    
    /// Adds a forumla to the renderer
    ///
    ///     try renderer.add(view: WelcomeView())
    ///
    /// - Parameter view: The view type to add
    /// - Throws: If the pre-rendering process fails for some reason
    func add<T: HTMLPage>(view: T) throws
    
    /// Registers a localization directory to the renderer
    ///
    ///     try renderer.registerLocalization() // Using default values
    ///     try renderer.registerLocalization(atPath: "Localization", defaultLocale: "nb")
    ///
    /// - Parameters:
    ///   - path: A relative path to the localization folder. This is by *default* set to "Resource/Localization"
    ///   - defaultLocale: The default locale to use. This is by *default* set to "en"
    /// - Throws: If there is an error registrating the lingo
    func registerLocalization(atPath path: String, defaultLocale: String) throws
}
