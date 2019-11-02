

/// The text direction in HTML
public enum HTMLTextDirection: String, HTML {
    case leftToRight = "ltr"
    case rightToLeft = "rtl"
    case auto
}

extension HTMLTextDirection {
    public func render<T>(with manager: HTMLRenderer.ContextManager<T>) throws -> String {
        self.rawValue
    }

    public func prerender<T>(_ formula: HTMLRenderer.Formula<T>) throws {
        formula.add(string: self.rawValue)
    }
}

public protocol GlobalAttributes {

    /// The accesskey attribute specifies a shortcut key to activate/focus an element.
    /// **Note**: The way of accessing the shortcut key is varying in different browsers:
    func accessKey(_ value: HTML) -> Self

    /// Specifies one or more classnames for an element (refers to a class in a style sheet)
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    func `class`(_ value: HTML) -> Self

    func data(for key: String, value: HTML) -> Self

    func aria(for key: String, value: HTML) -> Self

    func style(css: HTML) -> Self

    /// The contenteditable attribute specifies whether the content of an element is editable or not.
    /// Note: When the contenteditable attribute is not set on an element, the element will inherit it from its parent.
    func isEditable(_ value: Conditionable) -> Self

    /// Specifies the text direction for the content in an element
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    func direction(_ value: HTMLTextDirection) -> Self

    /// Specifies the text direction for the content in an element
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    func direction<T>(_ value: TemplateValue<T, HTMLTextDirection>) -> Self

    /// Specifies that an element is not yet, or is no longer, relevant
    ///
    /// - Returns: An attribute node
    func isHidden(_ value: Conditionable) -> Self

    /// Specifies a unique id for an element
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    func id(_ value: HTML) -> Self

    /// Specifies the language of the element's content
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    func lang<T>(_ value: TemplateValue<T, String>) -> Self

    /// Specifies whether the element is to have its spelling and grammar checked or not
    func isSpellchecked(_ value: Conditionable) -> Self

    /// Specifies the tabbing order of an element
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    func tabIndex<T>(_ value: TemplateValue<T, Int>) -> Self

    /// Specifies extra information about an element
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    func title(_ value: HTML) -> Self


    /// ARIA defines semantics that can be applied to elements, with these divided into roles (defining a type of user interface element) and states and properties that are supported by a role.
    /// Authors must assign an ARIA role and the appropriate states and properties to an element during its life-cycle, unless the element already has appropriate ARIA semantics (via use of an appropriate HTML element).
    /// Addition of ARIA semantics only exposes extra information to a browser's accessibility API, and does not affect a page's DOM.
    /// - Parameter text: The role to use
    func role(_ text: HTML) -> Self

    /// The onclick attribute fires on a mouse click on the element.
    func on(click: HTML) -> Self
}

extension GlobalAttributes where Self: AttributeNode {

    public func aria(for key: String, value: HTML) -> Self {
        add(HTMLAttribute(attribute: "aria-" + key, value: value))
    }

    public func accessKey(_ value: HTML) -> Self {
        add(HTMLAttribute(attribute: "accessKey", value: value))
    }

    public func `class`(_ value: HTML) -> Self {
        add(HTMLAttribute(attribute: "class", value: value))
    }

    public func data(for key: String, value: HTML) -> Self {
        add(HTMLAttribute(attribute: "data-" + key, value: value))
    }

    public func isEditable(_ value: Conditionable) -> Self {
        add(HTMLAttribute(attribute: "contenteditable", value: value))
    }

    public func direction<T>(_ value: TemplateValue<T, HTMLTextDirection>) -> Self {
        add(HTMLAttribute(attribute: "dir", value: value))
    }

    public func direction(_ value: HTMLTextDirection) -> Self {
        direction(TemplateValue<Void, HTMLTextDirection>.constant(value))
    }

    public func isHidden(_ value: Conditionable) -> Self {
        add(HTMLAttribute(attribute: "hidden", value: nil, isIncluded: value))
    }

    public func id(_ value: HTML) -> Self {
        add(HTMLAttribute(attribute: "id", value: value))
    }

    public func lang<T>(_ value: TemplateValue<T, String>) -> Self {
        add(HTMLAttribute(attribute: "lang", value: value))
    }

    public func isSpellchecked(_ value: Conditionable) -> Self {
        add(HTMLAttribute(attribute: "spellcheck", value: value))
    }

    public func tabIndex<T>(_ value: TemplateValue<T, Int>) -> Self {
        add(HTMLAttribute(attribute: "tabindex", value: value))
    }

    public func title(_ value: HTML) -> Self {
        add(HTMLAttribute(attribute: "title", value: value))
    }

    public func role(_ text: HTML) -> Self {
        add(HTMLAttribute(attribute: "role", value: text))
    }

    public func style(css: HTML) -> Self {
        add(HTMLAttribute(attribute: "style", value: css))
    }

    public func on(click: HTML) -> Self {
        add(HTMLAttribute(attribute: "onclick", value: click))
    }
}

public protocol TypableAttribute {
    /// Specifies the type of element
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    func type<T>(_ value: TemplateValue<T, String>) -> Self
    func type(_ value: String) -> Self
}

extension TypableAttribute where Self: AttributeNode {
    public func type<T>(_ value: TemplateValue<T, String>) -> Self {
        add(HTMLAttribute(attribute: "type", value: value))
    }

    public func type(_ value: String) -> Self {
        self.type(RootValue<String>.constant(value))
    }
}

public protocol SizableAttribute {
    func height(_ height: Int) -> Self
    func width(_ width: Int) -> Self
}

extension SizableAttribute where Self: AttributeNode {
    public func height(_ height: Int) -> Self {
        add(HTMLAttribute(attribute: "height", value: height))
    }

    public func width(_ width: Int) -> Self {
        add(HTMLAttribute(attribute: "width", value: width))
    }
}

public protocol ValueableAttribute {
    func max(value: HTML) -> Self
    func min(value: HTML) -> Self
    func value(_ value: HTML) -> Self
}

extension ValueableAttribute where Self: AttributeNode {

    public func max(value: HTML) -> Self {
        add(HTMLAttribute(attribute: "max", value: value))
    }

    public func min(value: HTML) -> Self {
        add(HTMLAttribute(attribute: "min", value: value))
    }

    public func value(_ value: HTML) -> Self {
        add(HTMLAttribute(attribute: "value", value: value))
    }
}

public protocol LabelAttribute {
    func label(_ value: HTML) -> Self
}

extension LabelAttribute where Self: AttributeNode {
    public func label(_ value: HTML) -> Self {
        add(HTMLAttribute(attribute: "label", value: value))
    }
}

public protocol HyperlinkReferenceAttribute {

    /// Specifies the URL of the page the link goes to
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    func href(_ value: HTML) -> Self
}

extension HyperlinkReferenceAttribute where Self: AttributeNode {
    public func href(_ value: HTML) -> Self {
        add(HTMLAttribute(attribute: "href", value: value))
    }
}

public protocol RelationshipAttribute {

    /// Specifies the relationship between the current document and the linked document
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    func relationship(_ value: RelationshipTypes) -> Self

    associatedtype RelationshipTypes: RawRepresentable where RelationshipTypes.RawValue == String
}

extension RelationshipAttribute where Self: AttributeNode {
    public func relationship(_ value: RelationshipTypes) -> Self {
        add(HTMLAttribute(attribute: "rel", value: value.rawValue))
    }
}

public protocol FormInputCompanianAttributes {
    /// Specifies which form element(s) a label/calculation is bound to
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    func `for`(_ value: HTML) -> Self
}

extension FormInputCompanianAttributes where Self: AttributeNode {
    public func `for`(_ value: HTML) -> Self {
        add(HTMLAttribute(attribute: "for", value: value))
    }
}

public protocol RequierdAttribute {
    func required() -> Self
}

extension RequierdAttribute where Self: AttributeNode {
    public func required() -> Self {
        self.add(HTMLAttribute(attribute: "required", value: nil))
    }
}

public protocol PlaceholderAttribute {
    func placeholder(_ text: HTML) -> Self
}

extension PlaceholderAttribute where Self: AttributeNode {
    public func placeholder(_ text: HTML) -> Self {
        self.add(.init(attribute: "placeholder", value: text))
    }
}

extension PlaceholderAttribute {
    public func placeholder(localized key: String) -> Self {
        self.placeholder(Localized(key: key))
    }
}

public protocol MediaSourceableAttribute {
    /// Specifies the URL of the media file
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    func source(_ link: HTML) -> Self
}

extension MediaSourceableAttribute where Self: AttributeNode {
    public func source(_ link: HTML) -> Self {
        add(HTMLAttribute(attribute: "src", value: link))
    }
}

public protocol NameableAttribute {

    associatedtype NameType: RawRepresentable where NameType.RawValue == String

    /// Specifies the name of the element
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    func name(_ value: NameType) -> Self
}

extension NameableAttribute where Self: AttributeNode {
    public func name(_ value: NameType) -> Self {
        add(HTMLAttribute(attribute: "name", value: value.rawValue))
    }
}

extension String: RawRepresentable {
    public typealias RawValue = String

    public var rawValue: String { self }

    public init?(rawValue: String) {
        self = rawValue
    }
}

public protocol ContentableAttribute {
    /// Gives the value associated with the http-equiv or name attribute
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    func content(_ value: HTML) -> Self
}

extension ContentableAttribute where Self: AttributeNode {
    public func content(_ value: HTML) -> Self {
        add(HTMLAttribute(attribute: "content", value: value))
    }
}

public protocol OpenableAttribute {
    /// Specifies that the dialog element is active and that the user can interact with it
    /// - Parameter condition: The condition if open is added
    func isOpen(_ condition: Conditionable) -> Self
}

extension OpenableAttribute where Self: AttributeNode {
    public func isOpen(_ condition: Conditionable) -> Self {
        add(HTMLAttribute(attribute: "open", value: nil, isIncluded: condition))
    }
}

public enum TargetTypes: String {
    /// The response is displayed in a new window or tab
    case blank

    /// The response is displayed in the same frame (this is default)
    case `self`

    /// The response is displayed in the parent frame
    case parent

    /// The response is displayed in the full body of the window
    case top
}

public protocol TargetableAttribute {
    /// The target attribute specifies a name or a keyword that indicates where to display the response that is received after submitting the form.
    /// The target attribute defines a name of, or keyword for, a browsing context (e.g. tab, window, or inline frame).
    /// - Parameter type: The target to add
    func target(_ type: TargetTypes) -> Self
}

extension TargetableAttribute where Self: AttributeNode {
    public func target(_ type: TargetTypes) -> Self {
        add(HTMLAttribute(attribute: "target", value: type.rawValue))
    }
}

//extension AttributeNode {
//
//    // MARK: - Non HTML standard
//
//    public func dataToggle(_ toggle: View) -> Self {
//        add(HTMLAttribute(attribute: "data-toggle", value: toggle))
//    }
//
//    public func dataTarget(_ target: View) -> Self {
//        add(HTMLAttribute(attribute: "data-target", value: target))
//    }
//
//    public func role(_ text: View) -> Self {
//        add(HTMLAttribute(attribute: "role", value: text))
//    }
//
//    public func ariaHaspopup(_ text: View) -> Self {
//        add(HTMLAttribute(attribute: "aria-haspopup", value: text))
//    }
//
//    public func ariaExpanded(_ text: View) -> Self {
//        add(HTMLAttribute(attribute: "aria-expanded", value: text))
//    }
//
//    public func ariaValuenow(_ text: View) -> Self {
//        add(HTMLAttribute(attribute: "aria-valuenow", value: text))
//    }
//
//    public func ariaValuemin(_ text: View) -> Self {
//        add(HTMLAttribute(attribute: "aria-valuemin", value: text))
//    }
//
//    public func ariaValuemax(_ text: View) -> Self {
//        add(HTMLAttribute(attribute: "aria-valuemax", value: text))
//    }
//
//    public func dataDismiss(_ text: View) -> Self {
//        add(HTMLAttribute(attribute: "data-dismiss", value: text))
//    }
//
//    public func ariaLabel(_ text: View) -> Self {
//        add(HTMLAttribute(attribute: "aria-label", value: text))
//    }
//
//    public func ariaLabelledBy(_ text: View) -> Self {
//        add(HTMLAttribute(attribute: "aria-labelledby", value: text))
//    }
//
//    public func ariaHidden(_ text: View) -> Self {
//        add(HTMLAttribute(attribute: "aria-hidden", value: text))
//    }
//
//    // MARK: - HTML Standard
//
//    /// Specifies an alternate text when the original element fails to display
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func alt(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "alt", value: value))
//    }
//
//    /// Specifies the types of files that the server accepts (only for type="file")
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func accept(_ text: View) -> Self {
//        add(HTMLAttribute(attribute: "accept", value: text))
//    }
//
//    /// Specifies the character encodings that are to be used for the form submission
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func acceptCharset(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "accept-charset", value: value))
//    }
//
//    /// Specifies a shortcut key to activate/focus an element
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func accesskey(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "accesskey", value: value))
//    }
//
//    /// Specifies where to send the form-data when a form is submitted
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func action(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "action", value: value))
//    }
//
//    /// Specifies that the script is executed asynchronously (only for external scripts)
//    ///
//    /// - Returns: An attribute node
//    public func async() -> Self {
//        add(HTMLAttribute(attribute: "async", value: nil))
//    }
//
//    /// Specifies whether the <form> or the <input> element should have autocomplete enabled
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func autocomplete(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "autocomplete", value: value))
//    }
//
//    /// Specifies that the element should automatically get focus when the page loads
//    ///
//    /// - Returns: An attribute node
//    public func autofocus() -> Self {
//        add(HTMLAttribute(attribute: "autofocus", value: nil))
//    }
//
//    /// Specifies that the audio/video will start playing as soon as it is ready
//    ///
//    /// - Returns: An attribute node
//    public func autoplay() -> Self {
//        add(HTMLAttribute(attribute: "autoplay", value: nil))
//    }
//
//    /// Specifies the character encoding
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func charset(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "charset", value: value))
//    }
//
//    /// Specifies that an <input> element should be pre-selected when the page loads (for type="checkbox" or type="radio")
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func checked() -> Self {
//        add(HTMLAttribute(attribute: "checked", value: nil))
//    }
//
//    /// Specifies a URL which explains the quote/deleted/inserted text
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func cite(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "cite", value: value))
//    }
//
//    /// Specifies one or more classnames for an element (refers to a class in a style sheet)
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func `class`(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "class", value: value))
//    }
//
//    /// Specifies the visible width of a text area
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func cols(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "cols", value: value))
//    }
//
//    /// Specifies the number of columns a table cell should span
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func colspan(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "colspan", value: value))
//    }
//
//    /// Gives the value associated with the http-equiv or name attribute
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func content(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "content", value: value))
//    }
//
//    /// Specifies whether the content of an element is editable or not
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func contenteditable(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "contenteditable", value: value))
//    }
//
//    /// Specifies that audio/video controls should be displayed (such as a play/pause button etc)
//    ///
//    /// - Returns: An attribute node
//    public func controls() -> Self {
//        add(HTMLAttribute(attribute: "controls", value: nil))
//    }
//
//    /// Specifies the coordinates of the area
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func coords(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "coords", value: value))
//    }
//
//    /// Specifies the URL of the resource to be used by the object
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func data(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "data", value: value))
//    }
//
//    /// Specifies the date and time
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func datetime(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "datetime", value: value))
//    }
//
//    /// Specifies that the track is to be enabled if the user's preferences do not indicate that another track would be more appropriate
//    ///
//    /// - Returns: An attribute node
//    public func `default`() -> Self {
//        add(HTMLAttribute(attribute: "default", value: nil))
//    }
//
//    /// Specifies that the script is executed when the page has finished parsing (only for external scripts)
//    ///
//    /// - Returns: An attribute node
//    public func `defer`() -> Self {
//        add(HTMLAttribute(attribute: "defer", value: nil))
//    }
//
//    /// Specifies the text direction for the content in an element
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func dir(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "dir", value: value))
//    }
//
//    /// Specifies that the text direction will be submitted
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func dirname(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "dirname", value: value))
//    }
//
//    /// Specifies that the specified element/group of elements should be disabled
//    ///
//    /// - Returns: An attribute node
//    public func disable() -> Self {
//        add(HTMLAttribute(attribute: "disable", value: nil))
//    }
//
//    /// Specifies that the target will be downloaded when a user clicks on the hyperlink
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func download() -> Self {
//        add(HTMLAttribute(attribute: "download", value: nil))
//    }
//
//    /// Specifies whether an element is draggable or not
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func draggable(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "draggable", value: value))
//    }
//
//    /// Specifies whether the dragged data is copied, moved, or linked, when dropped
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func dropzone(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "dropzone", value: value))
//    }
//
//    /// Specifies how the form-data should be encoded when submitting it to the server (only for method="post")
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func enctype(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "enctype", value: value))
//    }
//
//    /// Specifies which form element(s) a label/calculation is bound to
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func `for`(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "for", value: value))
//    }
//
//    /// Specifies the name of the form the element belongs to
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func form(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "form", value: value))
//    }
//
//    /// Specifies where to send the form-data when a form is submitted. Only for type="submit"
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func formaction(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "formaction", value: value))
//    }
//
//    /// Specifies one or more headers cells a cell is related to
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func headers(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "headers", value: value))
//    }
//
//    /// Specifies the height of the element
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func height(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "height", value: value))
//    }
//
//    /// Specifies that an element is not yet, or is no longer, relevant
//    ///
//    /// - Returns: An attribute node
//    public func hidden() -> Self {
//        add(HTMLAttribute(attribute: "hidden", value: nil))
//    }
//
//    /// Specifies the width of the element
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func width(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "width", value: value))
//    }
//
//    /// Specifies the range that is considered to be a high value
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func high(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "high", value: value))
//    }
//
//    /// Specifies the URL of the page the link goes to
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func href(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "href", value: value))
//    }
//
//    /// Specifies the language of the linked document
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func hreflang(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "hreflang", value: value))
//    }
//
//    /// Provides an HTTP header for the information/value of the content attribute
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func httpEquiv(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "http-equiv", value: value))
//    }
//
//    /// Specifies a unique id for an element
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func id(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "id", value: value))
//    }
//
//    /// Specifies an image as a server-side image-map
//    ///
//    /// - Returns: An attribute node
//    public func ismap() -> Self {
//        add(HTMLAttribute(attribute: "ismap", value: nil))
//    }
//
//    /// Specifies the kind of text track
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func kind(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "kind", value: value))
//    }
//
//    /// Specifies the title of the text track
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func label(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "label", value: value))
//    }
//
//    /// Specifies the language of the element's content
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func lang(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "lang", value: value))
//    }
//
//    /// Refers to a <datalist> element that contains pre-defined options for an <input> element
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func list(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "list", value: value))
//    }
//
//    /// Specifies that the audio/video will start over again, every time it is finished
//    ///
//    /// - Returns: An attribute node
//    public func loop() -> Self {
//        add(HTMLAttribute(attribute: "loop", value: nil))
//    }
//
//    /// Specifies the range that is considered to be a low value
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func low(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "low", value: value))
//    }
//
//    /// Specifies the maximum value
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func max(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "max", value: value))
//    }
//
//    /// Specifies the maximum number of characters allowed in an element
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func maxlength(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "maxlength", value: value))
//    }
//
//    /// Specifies what media/device the linked document is optimized for
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func media(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "media", value: value))
//    }
//
//    /// Specifies the HTTP method to use when sending form-data
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func method(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "method", value: value))
//    }
//
//    /// Specifies the HTTP method to use when sending form-data
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func method(_ value: HTMLAttribute.Method) -> Self {
//        add(HTMLAttribute(attribute: "method", value: value.rawValue))
//    }
//
//    //    /// Specifies a minimum value
//    //    ///
//    //    /// - Parameter value: The value of the attribute
//    //    /// - Returns: An attribute node
//    //    public func min<Root>(_ value: TemplateVariable<Root, Int>) -> Self where Root: ContextualTemplate {
//    //        add(HTMLAttribute(attribute: "min", value: value))
//    //        return self
//    //    }
//
//    /// Specifies a minimum value
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func min(_ value: Int) -> Self {
//        add(HTMLAttribute(attribute: "min", value: value))
//    }
//
//    /// Specifies that a user can enter more than one value
//    ///
//    /// - Returns: An attribute node
//    public func multiple() -> Self {
//        add(HTMLAttribute(attribute: "multiple", value: nil))
//    }
//
//    /// Specifies that the audio output of the video should be muted
//    ///
//    /// - Returns: An attribute node
//    public func muted() -> Self {
//        add(HTMLAttribute(attribute: "muted", value: nil))
//    }
//
//    /// Specifies the name of the element
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func name(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "name", value: value))
//    }
//
//    /// Specifies that the form should not be validated when submitted
//    ///
//    /// - Returns: An attribute node
//    public func novalidate() -> Self {
//        add(HTMLAttribute(attribute: "novalidate", value: nil))
//    }
//
//    /// Script to be run on abort
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func onabort(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "onabort", value: value))
//    }
//
//    /// Script to be run after the document is printed
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func onafterprint(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "onafterprint", value: value))
//    }
//
//    /// Script to be run before the document is printed
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func onbeforeprint(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "onbeforeprint", value: value))
//    }
//
//    /// Script to be run when the document is about to be unloaded
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func onbeforeunload(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "onbeforeload", value: value))
//    }
//
//    /// Script to be run when the element loses focus
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func onblur(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "onblur", value: value))
//    }
//
//    /// Script to be run when a file is ready to start playing (when it has buffered enough to begin)
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func oncanplay(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "oncanplay", value: value))
//    }
//
//    /// Script to be run when a file can be played all the way to the end without pausing for buffering
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func oncanplaythrough(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "oncanplaythrough", value: value))
//    }
//
//    /// Script to be run when the value of the element is changed
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func onchange(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "onchange", value: value))
//    }
//
//    /// Script to be run when the element is being clicked
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func onclick(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "onclick", value: value))
//    }
//
//    /// Script to be run when a context menu is triggered
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func oncontextmenu(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "oncontextmenu", value: value))
//    }
//
//    /// Script to be run when the content of the element is being copied
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func oncopy(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "oncopy", value: value))
//    }
//
//    /// Script to be run when the cue changes in a <track> element
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func oncuechange(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "oncuechange", value: value))
//    }
//
//    /// Script to be run when the content of the element is being cut
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func oncut(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "oncut", value: value))
//    }
//
//    /// Script to be run when the element is being double-clicked
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func ondblclick(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "ondblclick", value: value))
//    }
//
//    /// Script to be run when the element is being dragged
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func ondrag(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "ondrag", value: value))
//    }
//
//    /// Script to be run at the end of a drag operation
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func ondragend(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "ondragend", value: value))
//    }
//
//    /// Script to be run when an element has been dragged to a valid drop target
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func ondragenter(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "ondragenter", value: value))
//    }
//
//    /// Script to be run when an element leaves a valid drop target
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func ondragleave(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "ondragleave", value: value))
//    }
//
//    /// Script to be run when an element is being dragged over a valid drop target
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func ondragover(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "ondragover", value: value))
//    }
//
//    /// Script to be run at the start of a drag operation
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func ondragstart(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "ondragstart", value: value))
//    }
//
//    /// Script to be run when dragged element is being dropped
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func ondrop(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "ondrop", value: value))
//    }
//
//    /// Script to be run when the length of the media changes
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func ondurationchange(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "ondurationchange", value: value))
//    }
//
//    /// Script to be run when something bad happens and the file is suddenly unavailable (like unexpectedly disconnects)
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func onemptied(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "onemptied", value: value))
//    }
//
//    /// Script to be run when the media has reach the end (a useful event for messages like "thanks for listening")
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func onended(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "onended", value: value))
//    }
//
//    /// Script to be run when an error occurs
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func onerror(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "onerror", value: value))
//    }
//
//    /// Script to be run when the element gets focus
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func onfocus(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "onfocus", value: value))
//    }
//
//    /// Script to be run when there has been changes to the anchor part of the a URL
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func onhashchange(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "onhashchange", value: value))
//    }
//
//    /// Script to be run when the element gets user input
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func oninput(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "oninput", value: value))
//    }
//
//    /// Script to be run when the element is invalid
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func oninvalid(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "oninvalid", value: value))
//    }
//
//    /// Script to be run when the element is finished loading
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func onload(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "onload", value: value))
//    }
//
//    /// Specifies that the details should be visible (open) to the user
//    ///
//    /// - Returns: An attribute node
//    public func open() -> Self {
//        add(HTMLAttribute(attribute: "open", value: nil))
//    }
//
//    /// Specifies a regular expression that an <input> element's value is checked against
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func pattern(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "pattern", value: value))
//    }
//
//    /// Specifies what value is the optimal value for the gauge
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func optimum(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "optimum", value: value))
//    }
//
//    /// Specifies a short hint that describes the expected value of the element
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func placeholder(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "placeholder", value: value))
//    }
//
//    /// Specifies an image to be shown while the video is downloading, or until the user hits the play button
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func poster(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "poster", value: value))
//    }
//
//    /// Specifies if and how the author thinks the audio/video should be loaded when the page loads
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func preload(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "preload", value: value))
//    }
//
//    /// Specifies that the element is read-only
//    public func readonly() -> Self {
//        add(HTMLAttribute(attribute: "readonly", value: nil))
//    }
//
//    /// Specifies the relationship between the current document and the linked document
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func rel(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "rel", value: value))
//    }
//
//    /// Specifies that the element must be filled out before submitting the form
//    public func `required`() -> Self {
//        add(HTMLAttribute(attribute: "required", value: nil))
//    }
//
//    /// Specifies that the list order should be descending (9,8,7...)
//    public func reversed() -> Self {
//        add(HTMLAttribute(attribute: "reversed", value: nil))
//    }
//
//    /// Specifies the visible number of lines in a text area
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func rows(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "rows", value: value))
//    }
//
//    /// Specifies the number of rows a table cell should span
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func rowspan(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "rowspan", value: value))
//    }
//
//    /// Enables an extra set of restrictions for the content in an <iframe>
//    public func sandbox() -> Self {
//        add(HTMLAttribute(attribute: "sandbox", value: nil))
//    }
//
//    /// Specifies whether a header cell is a header for a column, row, or group of columns or rows
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func scope(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "scope", value: value))
//    }
//
//    /// Specifies that an option should be pre-selected when the page loads
//    public func selected() -> Self {
//        add(HTMLAttribute(attribute: "selected", value: nil))
//    }
//
//    /// Specifies the shape of the area
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func shape(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "shape", value: value))
//    }
//
//    /// Specifies the width, in characters (for <input>) or specifies the number of visible options (for <select>)
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func size(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "size", value: value))
//    }
//
//    /// Specifies the size of the linked resource
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func sizes(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "sizes", value: value))
//    }
//
//    /// Specifies the number of columns to span
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func span(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "span", value: value))
//    }
//
//    /// Specifies whether the element is to have its spelling and grammar checked or not
//    public func spellcheck() -> Self {
//        add(HTMLAttribute(attribute: "spellcheck", value: nil))
//    }
//
//    /// Specifies the URL of the media file
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func src(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "src", value: value))
//    }
//
//    /// Specifies the HTML content of the page to show in the <iframe>
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func srcdoc(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "srcdoc", value: value))
//    }
//
//    /// Specifies the language of the track text data (required if kind="subtitles")
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func srclang(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "srclang", value: value))
//    }
//
//    /// Specifies the URL of the image to use in different situations
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func srcset(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "srcset", value: value))
//    }
//
//    /// Specifies the start value of an ordered list
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func start(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "start", value: value))
//    }
//
//    /// Specifies the legal number intervals for an input field
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func step(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "step", value: value))
//    }
//
//    /// Specifies an inline CSS style for an element
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func style(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "style", value: value))
//    }
//
//    /// Specifies the tabbing order of an element
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func tabindex(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "tabindex", value: value))
//    }
//
//    /// Specifies the target for where to open the linked document or where to submit the form
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func target(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "target", value: value))
//    }
//
//    /// Specifies extra information about an element
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func title(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "title", value: value))
//    }
//
//    /// Specifies whether the content of an element should be translated or not
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func translate(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "translate", value: value))
//    }
//
//    /// Specifies the type of element
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func type(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "type", value: value))
//    }
//
//    /// Specifies an image as a client-side image-map
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func usemap(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "usemap", value: value))
//    }
//
//    /// Specifies the value of the element
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func value(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "value", value: value))
//    }
//
//    /// Specifies how the text in a text area is to be wrapped when submitted in a form
//    ///
//    /// - Parameter value: The value of the attribute
//    /// - Returns: An attribute node
//    public func wrap(_ value: View) -> Self {
//        add(HTMLAttribute(attribute: "wrap", value: value))
//    }
//}
