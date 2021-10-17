// MARK: aliases

// MARK: attributes

/// The protocol provides
///
///
public protocol GlobalAttributes {

    func accessKey(_ value: HTMLContent) -> Self
    
    func `class`(_ value: HTMLContent) -> Self

    func data(for key: String, value: HTMLContent) -> Self

    func aria(for key: String, value: HTMLContent) -> Self

    func data(_ key: String, value: HTMLContent) -> Self

    func aria(_ key: String, value: HTMLContent) -> Self

    func style(css: HTMLContent) -> Self

    func isEditable(_ value: Conditionable) -> Self

    func direction(_ value: HTMLTextDirection) -> Self

    func direction(_ value: TemplateValue<HTMLTextDirection>) -> Self

    func isHidden(_ value: Conditionable) -> Self

    func id(_ value: HTMLContent) -> Self

    func lang(_ value: TemplateValue<String>) -> Self

    func isSpellchecked(_ value: Conditionable) -> Self

    func tabIndex(_ value: TemplateValue<Int>) -> Self

    func title(_ value: HTMLContent) -> Self

    func role(_ text: HTMLContent) -> Self

    func on(click: HTMLContent) -> Self
}

extension GlobalAttributes where Self: AttributeNode {

    public func aria(for key: String, value: HTMLContent) -> Self {
        add(HTMLAttribute(attribute: "aria-" + key, value: value))
    }

    public func aria(_ key: String, value: HTMLContent) -> Self {
        self.aria(for: key, value: value)
    }

    public func accessKey(_ value: HTMLContent) -> Self {
        add(HTMLAttribute(attribute: "accessKey", value: value))
    }

    public func `class`(_ value: HTMLContent) -> Self {
        add(HTMLAttribute(attribute: "class", value: value))
    }

    public func data(for key: String, value: HTMLContent) -> Self {
        add(HTMLAttribute(attribute: "data-" + key, value: value))
    }

    public func data(_ key: String, value: HTMLContent) -> Self {
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

    public func id(_ value: HTMLContent) -> Self {
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

    public func title(_ value: HTMLContent) -> Self {
        add(HTMLAttribute(attribute: "title", value: value))
    }

    public func role(_ text: HTMLContent) -> Self {
        add(HTMLAttribute(attribute: "role", value: text))
    }

    public func style(css: HTMLContent) -> Self {
        add(HTMLAttribute(attribute: "style", value: css))
    }

    public func on(click: HTMLContent) -> Self {
        add(HTMLAttribute(attribute: "onclick", value: click))
    }
}

/// The protocol provides
///
///
public protocol TypableAttribute {

    func type(_ value: TemplateValue<String>) -> Self
}

extension TypableAttribute where Self: AttributeNode {
    public func type(_ value: TemplateValue<String>) -> Self {
        return add(HTMLAttribute(attribute: "type", value: value))
    }
}

/// The protocol provides
///
///
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

/// The protocol provides
///
///
public protocol ValueableAttribute {
    func max(value: HTMLContent) -> Self
    func min(value: HTMLContent) -> Self
    func value(_ value: HTMLContent) -> Self
}

extension ValueableAttribute where Self: AttributeNode {

    public func max(value: HTMLContent) -> Self {
        add(HTMLAttribute(attribute: "max", value: value))
    }

    public func min(value: HTMLContent) -> Self {
        add(HTMLAttribute(attribute: "min", value: value))
    }

    public func value(_ value: HTMLContent) -> Self {
        add(HTMLAttribute(attribute: "value", value: value))
    }
}

/// The protocol provides
///
///
public protocol LabelAttribute {
    func label(_ value: HTMLContent) -> Self
}

extension LabelAttribute where Self: AttributeNode {
    public func label(_ value: HTMLContent) -> Self {
        add(HTMLAttribute(attribute: "label", value: value))
    }
}

/// The protocol provides
///
///
public protocol HyperlinkReferenceAttribute {
    func href(_ value: HTMLContent) -> Self
}

extension HyperlinkReferenceAttribute where Self: AttributeNode {
    public func href(_ value: HTMLContent) -> Self {
        add(HTMLAttribute(attribute: "href", value: value))
    }
}

/// The protocol provides
///
///
public protocol RelationshipAttribute {
    func relationship(_ value: RelationshipTypes) -> Self

    associatedtype RelationshipTypes: RawRepresentable where RelationshipTypes.RawValue == String
}

extension RelationshipAttribute where Self: AttributeNode {
    public func relationship(_ value: RelationshipTypes) -> Self {
        add(HTMLAttribute(attribute: "rel", value: value.rawValue))
    }
}

/// The protocol provides
///
///
public protocol FormInputCompanionAttributes {
    func `for`(_ value: HTMLContent) -> Self
}

extension FormInputCompanionAttributes where Self: AttributeNode {
    public func `for`(_ value: HTMLContent) -> Self {
        add(HTMLAttribute(attribute: "for", value: value))
    }
}

/// The protocol provides
///
///
public protocol RequiredAttribute {
    func required() -> Self
}

extension RequiredAttribute where Self: AttributeNode {
    public func required() -> Self {
        self.add(HTMLAttribute(attribute: "required", value: nil))
    }
}

/// The protocol provides
///
///
public protocol PlaceholderAttribute {
    func placeholder(_ text: HTMLContent) -> Self
}

extension PlaceholderAttribute where Self: AttributeNode {
    public func placeholder(_ text: HTMLContent) -> Self {
        self.add(.init(attribute: "placeholder", value: text))
    }
}

extension PlaceholderAttribute {
    public func placeholder(localized key: String) -> Self {
        self.placeholder(Localized(key: key))
    }
}

/// The protocol provides
///
///
public protocol MediaSourceableAttribute {
    func source(_ link: HTMLContent) -> Self
}

extension MediaSourceableAttribute where Self: AttributeNode {
    public func source(_ link: HTMLContent) -> Self {
        add(HTMLAttribute(attribute: "src", value: link))
    }
}

/// The protocol provides
///
///
public protocol NameableAttribute {

    associatedtype NameType: RawRepresentable where NameType.RawValue == String

    func name(_ value: NameType) -> Self

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

/// The protocol provides
///
///
public protocol ContentableAttribute {
    func content(_ value: HTMLContent) -> Self
}

extension ContentableAttribute where Self: AttributeNode {
    public func content(_ value: HTMLContent) -> Self {
        add(HTMLAttribute(attribute: "content", value: value))
    }
}

/// The protocol provides
///
///
public protocol OpenableAttribute {
    func isOpen(_ condition: Conditionable) -> Self
}

extension OpenableAttribute where Self: AttributeNode {
    public func isOpen(_ condition: Conditionable) -> Self {
        add(HTMLAttribute(attribute: "open", value: nil, isIncluded: condition))
    }
}

/// The protocol provides
///
///
public protocol TargetableAttribute {
    func target(_ type: TargetTypes) -> Self
}

extension TargetableAttribute where Self: AttributeNode {
    public func target(_ type: TargetTypes) -> Self {
        add(HTMLAttribute(attribute: "target", value: type.rawValue))
    }
}

/// The protocol provides
///
///
public protocol PatternAttribute {
    func pattern(regex: String) -> Self
}

extension AttributeNode where Self: PatternAttribute {
    public func pattern(regex: String) -> Self {
        self.add(HTMLAttribute(attribute: "pattern", value: regex))
    }
}

/// The protocol provides
///
///
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

/// The protocol provides
///
/// 
public protocol FormableAttributes {
    func action(_ value: HTMLContent) -> Self
    func method(_ method: FormMethodTypes) -> Self
    func encodeType(_ type: FormEncodeTypes) -> Self
    func isAutocomplete(_ condition: Conditionable) -> Self
}

extension FormableAttributes where Self: AttributeNode {
    public func action(_ value: HTMLContent) -> Self {
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
