/*
 Abstract:
 The file contains the basic html-elements. These elements should be used at first in an html-document.
 
 Note:
 If you about to add something to the file, stick to the official documentation to keep the code consistent.
 */

import OrderedCollections

/// The element represents a comment output.
///
/// ```html
/// <!-- -->
/// ```
public struct Comment: CommentElement {
    
    internal var content: String
    
    public init(_ content: String) {
        self.content = content
    }
}

/// The element represents the document type.
///
/// ```html
/// <!DOCTYPE html>
/// ```
public struct Document: DocumentElement {
    
    internal var content: String
    
    public init(_ value: Values.Doctype) {
        self.content = value.rawValue
    }
}

extension Document {
    
    // MARK: Deprecations
    
    @available(*, deprecated, message: "Use Document(_ value: Values.Doctype) instead.")
    public init(type: Values.Doctype) {
        self.content = type.rawValue
    }
}

/// The element represents the document's root element.
///
/// ```html
/// <html></html>
/// ```
public struct Html: ContentElement {

    internal var name: String { "html" }

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
