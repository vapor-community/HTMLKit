/*
 Abstract:
 The file contains the list elements. The html-element 'ol' or 'ul' only allows these elements to be its descendants.

 Note:
 If you about to add something to the file, stick to the official documentation to keep the code consistent.
 */

import OrderedCollections

/// The alias for the element ListItem.
///
/// Li is the official tag and can be used instead of ListItem.
///
/// ```html
/// <li></li>
/// ```
public typealias Li = ListItem

/// The element represents a item of a list.
///
/// ```html
/// <li></li>
/// ```
public struct ListItem: ContentElement {

    internal var name: String { "li" }

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

extension ListItem: ValueAttribute {
    
    public func value(_ value: String) -> ListItem {
        return mutate(value: value)
    }
    
    public func value(_ value: Property<String>) -> ListItem {
        return mutate(value: value)
    }
}
