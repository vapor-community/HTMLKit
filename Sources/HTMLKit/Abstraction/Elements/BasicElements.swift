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
public struct Comment: CommentNode, GlobalElement {
    
    public var content: String
    
    public init(_ content: String) {
        self.content = content
    }
}

/// The element represents the document type.
///
/// ```html
/// <!DOCTYPE html>
/// ```
public struct Document: DocumentNode, BasicElement {
    
    public var content: String
    
    public init(_ value: Values.Doctype) {
        self.content = value.rawValue
    }
}

/// The element represents the document's root element.
///
/// ```html
/// <html></html>
/// ```
public struct Html: ContentNode, BasicElement {

    internal var name: String { "html" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [HtmlElement]

    public init(@ContentBuilder<HtmlElement> content: () -> [HtmlElement]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [HtmlElement]) {
        self.attributes = attributes
        self.content = content
    }
    
    public func modify(if condition: Bool, element: (Html) -> Html) -> Html {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (Html, T) -> Html) -> Html {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}
