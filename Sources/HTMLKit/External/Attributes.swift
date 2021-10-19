// MARK: aliases

// MARK: attributes

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

    func data(_ key: String, value: HTML) -> Self

    func aria(_ key: String, value: HTML) -> Self

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
    func direction(_ value: TemplateValue<HTMLTextDirection>) -> Self

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
    func lang(_ value: TemplateValue<String>) -> Self

    /// Specifies whether the element is to have its spelling and grammar checked or not
    func isSpellchecked(_ value: Conditionable) -> Self

    /// Specifies the tabbing order of an element
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    func tabIndex(_ value: TemplateValue<Int>) -> Self

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

    public func aria(_ key: String, value: HTML) -> Self {
        self.aria(for: key, value: value)
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

    public func data(_ key: String, value: HTML) -> Self {
        self.data(for: key, value: value)
    }

    public func isEditable(_ value: Conditionable) -> Self {
        add(HTMLAttribute(attribute: "contenteditable", value: value))
    }

    public func direction(_ value: TemplateValue<HTMLTextDirection>) -> Self {
        add(HTMLAttribute(attribute: "dir", value: value))
    }

    public func direction(_ value: HTMLTextDirection) -> Self {
        direction(.constant(value))
    }

    public func isHidden(_ value: Conditionable) -> Self {
        add(HTMLAttribute(attribute: "hidden", value: nil, isIncluded: value))
    }

    public func id(_ value: HTML) -> Self {
        add(HTMLAttribute(attribute: "id", value: value))
    }

    public func lang(_ value: TemplateValue<String>) -> Self {
        add(HTMLAttribute(attribute: "lang", value: value))
    }

    public func isSpellchecked(_ value: Conditionable) -> Self {
        add(HTMLAttribute(attribute: "spellcheck", value: value))
    }

    public func tabIndex(_ value: TemplateValue<Int>) -> Self {
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
    func type(_ value: TemplateValue<String>) -> Self
}

extension TypableAttribute where Self: AttributeNode {
    public func type(_ value: TemplateValue<String>) -> Self {
        return add(HTMLAttribute(attribute: "type", value: value))
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

public protocol FormInputCompanionAttributes {
    /// Specifies which form element(s) a label/calculation is bound to
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    func `for`(_ value: HTML) -> Self
}

extension FormInputCompanionAttributes where Self: AttributeNode {
    public func `for`(_ value: HTML) -> Self {
        add(HTMLAttribute(attribute: "for", value: value))
    }
}

public protocol RequiredAttribute {
    func required() -> Self
}

extension RequiredAttribute where Self: AttributeNode {
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

    /// Specifies the name of the element
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    func name(_ value: TemplateValue<String>) -> Self
}

extension NameableAttribute where Self: AttributeNode {
    public func name(_ value: NameType) -> Self {
        add(HTMLAttribute(attribute: "name", value: value.rawValue))
    }

    public func name(_ value: TemplateValue<String>) -> Self {
        add(HTMLAttribute(attribute: "name", value: value))
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

public protocol PatternAttribute {
    func pattern(regex: String) -> Self
}

extension AttributeNode where Self: PatternAttribute {
    public func pattern(regex: String) -> Self {
        self.add(HTMLAttribute(attribute: "pattern", value: regex))
    }
}

public protocol LengthAttribute {
    func minLength(_ length: Int) -> Self
    func maxLength(_ length: Int) -> Self
}

extension AttributeNode where Self: LengthAttribute {
    public func minLength(_ length: Int) -> Self {
        self.add(HTMLAttribute(attribute: "minlength", value: length))
    }

    public func maxLength(_ length: Int) -> Self {
        self.add(HTMLAttribute(attribute: "maxlength", value: length))
    }
}

public protocol FormableAttributes {
    func action(_ value: HTML) -> Self
    func method(_ method: FormMethodTypes) -> Self
    func encodeType(_ type: FormEncodeTypes) -> Self
    func isAutocomplete(_ condition: Conditionable) -> Self
}

extension FormableAttributes where Self: AttributeNode {
    public func action(_ value: HTML) -> Self {
        add(.init(attribute: "action", value: value))
    }

    public func method(_ method: FormMethodTypes) -> Self {
        add(.init(attribute: "method", value: method.rawValue))
    }

    public func encodeType(_ type: FormEncodeTypes) -> Self {
        add(.init(attribute: "enctype", value: type.rawValue))
    }

    public func isAutocomplete(_ condition: Conditionable) -> Self {
        add(.init(attribute: "autocomplete", value: IF(condition) { "on" }.else { "off" }))
    }
}
