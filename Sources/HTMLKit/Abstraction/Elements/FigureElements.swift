/*
 Abstract:
 The file contains the figure elements. The html-element 'figure' only allows these elements to be its descendants.
 
 Note:
 If you about to add something to the file, stick to the official documentation to keep the code consistent.
 */

import OrderedCollections

/// The alias for the element FigureCaption.
///
/// Figcaption is the official tag and can be used instead of FigureCaption.
///
/// ```html
/// <figcaption></figcaption>
/// ```
public typealias Figcaption = FigureCaption

/// The element is used to label a figure.
///
/// ```html
/// <figcaption></figcaption>
/// ```
public struct FigureCaption: ContentElement {

    internal var name: String { "figcaption" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [Content]

    public init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [Content]) {
        self.attributes = attributes
        self.content = content
    }
}
