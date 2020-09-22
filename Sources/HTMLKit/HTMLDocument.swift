
public struct Document: HTMLPage, AttributeNode {

    public enum Types: String {
        case html5 = "html"

        /// This DTD contains all HTML elements and attributes, but does NOT INCLUDE presentational or deprecated elements (like font). Framesets are not allowed.
        case html4Strict = #"HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd""#

        /// This DTD contains all HTML elements and attributes, INCLUDING presentational and deprecated elements (like font). Framesets are not allowed.
        case html4Transitional = #"HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd""#

        /// This DTD is equal to HTML 4.01 Transitional, but allows the use of frameset content.
        case html4Frameset = #"HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd""#

        /// This DTD contains all HTML elements and attributes, but does NOT INCLUDE presentational or deprecated elements (like font). Framesets are not allowed. The markup must also be written as well-formed XML.
        case xhtmlStrict = #"html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd""#

        /// This DTD contains all HTML elements and attributes, INCLUDING presentational and deprecated elements (like font). Framesets are not allowed. The markup must also be written as well-formed XML.
        case xhtmlTransitional = #"html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd""#

        /// This DTD is equal to XHTML 1.0 Transitional, but allows the use of frameset content.
        case xhtmlFrameset = #"html PUBLIC "-//W3C//DTD XHTML 1.0 Frameset//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd""#

        /// This DTD is equal to XHTML 1.0 Strict, but allows you to add modules (for example to provide Ruby support for East-Asian languages).
        case xhtml = #"html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd""#
    }

    let type: Types
    let content: HTML

    public var attributes: [HTMLAttribute]

    public init(type: Types, @HTMLBuilder content: () -> HTML) {
        self.type = type
        self.content = content()
        self.attributes = []
    }

    init(type: Types, content: HTML, attributes: [HTMLAttribute]) {
        self.type = type
        self.content = content
        self.attributes = attributes
    }

    public var body: HTML {
        [
            "<!DOCTYPE \(type.rawValue)>",
            HTMLNode { content }.add(attributes: attributes)
        ]
    }

    public func copy(with attributes: [HTMLAttribute]) -> Document {
        Document(type: type, content: content, attributes: attributes)
    }
}
