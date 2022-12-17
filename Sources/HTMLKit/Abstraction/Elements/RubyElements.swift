/*
 Abstract:
 The file contains the ruby elements. The html-element 'ruby' only allows these elements to be its descendants.
 
 Note:
 If you about to add something to the file, stick to the official documentation to keep the code consistent.
 */

import OrderedCollections

/// The alias for the element RubyText.
///
/// Rt is the official tag and can be used instead of RubyText.
///
/// ```html
/// <rt></rt>
/// ```
public typealias Rt = RubyText

/// The alias for the element RubyPronunciation.
///
/// Rp is the official tag and can be used instead of RubyPronunciation.
///
/// ```html
/// <rp></rp>
/// ```
public typealias Rp = RubyPronunciation

/// The element marks the ruby text component of a ruby annotation.
///
/// ```html
/// <rt></rt>
/// ```
public struct RubyText: ContentElement {

    internal var name: String { "rt" }

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

/// The element represents nothing.
///
/// ```html
/// <rp></rp>
/// ```
public struct RubyPronunciation: ContentElement {

    internal var name: String { "rp" }

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
