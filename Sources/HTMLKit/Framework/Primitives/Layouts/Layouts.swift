/// A type that defines a view layout.
public protocol View: GlobalElement {
    
    /// The content of the page.
    @ContentBuilder<Content> var body: Content { get }
}
