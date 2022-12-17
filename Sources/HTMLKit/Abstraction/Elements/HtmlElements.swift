/*
 Abstract:
 The file contains the html elements. The html-element 'html' only allows these elements to be its descendants.

 Note:
 If you about to add something to the file, stick to the official documentation to keep the code consistent.
 */

import OrderedCollections

/// The element contains the information about the document's content.
///
/// ```html
/// <head></head>
/// ```
public struct Head: ContentElement {

    internal var name: String { "head" }

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

/// The element contains the document's content.
///
/// ```html
/// <body></body>
/// ```
public struct Body: ContentElement, Element {

    internal var name: String { "body" }

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

extension Body: WindowEventAttribute {
    
    public func on(event: Events.Window, _ value: String) -> Body {
        return mutate(key: event.rawValue, value: value)
    }
}
