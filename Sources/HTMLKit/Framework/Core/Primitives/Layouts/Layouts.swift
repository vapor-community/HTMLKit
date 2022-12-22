/*
 Abstract:
 The file contains the default definition of different types of layouts.
 */

/// A type that defines a view layout.
public protocol View: GlobalElement {
    
    /// The content of the page.
    @ContentBuilder<AnyContent> var body: AnyContent { get }
}
