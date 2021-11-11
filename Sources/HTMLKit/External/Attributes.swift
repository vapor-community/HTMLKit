// MARK: aliases

// MARK: attributes

/// The protocol provides
///
///
public protocol GlobalAttributes {

    func accessKey(_ value: Content) -> Self
    
    func `class`(_ value: Content) -> Self

    func data(for key: String, value: Content) -> Self

    func aria(for key: String, value: Content) -> Self

    func data(_ key: String, value: Content) -> Self

    func aria(_ key: String, value: Content) -> Self

    func style(css: Content) -> Self

    func isEditable(_ value: Conditionable) -> Self

    func direction(_ value: DirectionType) -> Self

    func direction(_ value: TemplateValue<DirectionType>) -> Self

    func isHidden(_ value: Conditionable) -> Self

    func id(_ value: Content) -> Self

    func lang(_ value: TemplateValue<String>) -> Self

    func isSpellchecked(_ value: Conditionable) -> Self

    func tabIndex(_ value: TemplateValue<Int>) -> Self

    func title(_ value: Content) -> Self

    func role(_ text: Content) -> Self

    func on(click: Content) -> Self
}

extension GlobalAttributes where Self: HTMLNode {

    public func aria(for key: String, value: Content) -> Self {
        add(.init(attribute: "aria-" + key, value: value))
    }

    public func aria(_ key: String, value: Content) -> Self {
        self.aria(for: key, value: value)
    }

    public func accessKey(_ value: Content) -> Self {
        add(.init(attribute: "accessKey", value: value))
    }

    public func `class`(_ value: Content) -> Self {
        add(.init(attribute: "class", value: value))
    }

    public func data(for key: String, value: Content) -> Self {
        add(.init(attribute: "data-" + key, value: value))
    }

    public func data(_ key: String, value: Content) -> Self {
        self.data(for: key, value: value)
    }

    public func isEditable(_ value: Conditionable) -> Self {
        add(.init(attribute: "contenteditable", value: value))
    }

    public func direction(_ value: TemplateValue<DirectionType>) -> Self {
        add(.init(attribute: "dir", value: value))
    }

    public func direction(_ value: DirectionType) -> Self {
        direction(.constant(value))
    }

    public func isHidden(_ value: Conditionable) -> Self {
        add(.init(attribute: "hidden", value: nil, isIncluded: value))
    }

    public func id(_ value: Content) -> Self {
        add(.init(attribute: "id", value: value))
    }

    public func lang(_ value: TemplateValue<String>) -> Self {
        add(.init(attribute: "lang", value: value))
    }

    public func isSpellchecked(_ value: Conditionable) -> Self {
        add(.init(attribute: "spellcheck", value: value))
    }

    public func tabIndex(_ value: TemplateValue<Int>) -> Self {
        add(.init(attribute: "tabindex", value: value))
    }

    public func title(_ value: Content) -> Self {
        add(.init(attribute: "title", value: value))
    }

    public func role(_ text: Content) -> Self {
        add(.init(attribute: "role", value: text))
    }

    public func style(css: Content) -> Self {
        add(.init(attribute: "style", value: css))
    }

    public func on(click: Content) -> Self {
        add(.init(attribute: "onclick", value: click))
    }
}

/// The protocol provides
///
///
public protocol AcceptAttribute {
    
    func accept(_ value: Content) -> Self
}

extension AcceptAttribute where Self: HTMLNode {
    
    public func accept(_ value: Content) -> Self {
        add(.init(attribute: "accept", value: value))
    }
}

/// The protocol provides
///
///
public protocol ActionAttribute {
    
    func action(_ value: Content) -> Self
}

extension ActionAttribute where Self: HTMLNode {
    
    public func action(_ value: Content) -> Self {
        add(.init(attribute: "action", value: value))
    }
}

/// The protocol provides
///
///
public protocol AlternativeAttribute {
    
    func alternative(_ value: Content) -> Self
}

extension AlternativeAttribute where Self: HTMLNode {
    
    public func alternative(_ value: Content) -> Self {
        add(.init(attribute: "alt", value: value))
    }
}

/// The protocol provides
///
///
public protocol AsyncAttribute {
    
    func async() -> Self
}

extension AsyncAttribute where Self: HTMLNode {
    
    public func async() -> Self {
        add(.init(attribute: "async", value: nil))
    }
}

/// The protocol provides
///
///
public protocol AutoCompleteAttribute {
    
    func autoComplete(_ condition: Conditionable) -> Self
}

extension AutoCompleteAttribute where Self: HTMLNode {
    
    public func autoComplete(_ condition: Conditionable) -> Self {
        add(.init(attribute: "autocomplete", value: nil, isIncluded: condition))
    }
}

/// The protocol provides
///
///
public protocol AutoFocusAttribute {
    
    func autoFocus() -> Self
}

extension AutoFocusAttribute where Self: HTMLNode {
    
    public func autoFocus() -> Self {
        add(.init(attribute: "autofocus", value: nil))
    }
}

/// The protocol provides
///
///
public protocol AutoPlayAttribute {
    
    func autoPlay() -> Self
}

extension AutoPlayAttribute where Self: HTMLNode {
    
    public func autoPlay() -> Self {
        add(.init(attribute: "autoplay", value: nil))
    }
}

/// The protocol provides
///
///
public protocol CheckedAttribute {
    
    func checked() -> Self
}

extension CheckedAttribute where Self: HTMLNode {
    
    public func checked() -> Self {
        add(.init(attribute: "checked", value: nil))
    }
}

/// The protocol provides
///
///
public protocol CiteAttribute {
    
    func cite(_ text: Content) -> Self
}

extension CiteAttribute where Self: HTMLNode {
    
    public func cite(_ text: Content) -> Self {
        add(.init(attribute: "cite", value: text))
    }
}

/// The protocol provides
///
///
public protocol ColumnsAttribute {
    
    func columns(_ size: Int) -> Self
}

extension ColumnsAttribute where Self: HTMLNode {
    
    public func columns(_ size: Int) -> Self {
        add(.init(attribute: "cols", value: size))
    }
}

/// The protocol provides
///
///
public protocol ColumnSpanAttribute {
    
    func columnSpan(_ size: Int) -> Self
}

extension ColumnSpanAttribute where Self: HTMLNode {
    
    public func columnSpan(_ size: Int) -> Self {
        add(.init(attribute: "colspan", value: size))
    }
}

/// The protocol provides
///
///
public protocol ContentAttribute {
    
    func content(_ value: Content) -> Self
}

extension ContentAttribute where Self: HTMLNode {
    
    public func content(_ value: Content) -> Self {
        add(.init(attribute: "content", value: value))
    }
}

/// The protocol provides
///
///
public protocol ControlsAttribute {
    
    func controls() -> Self
}

extension ControlsAttribute where Self: HTMLNode {
    
    public func controls() -> Self {
        add(.init(attribute: "controls", value: nil))
    }
}

/// The protocol provides
///
///
public protocol CoordinatesAttribute {
    
    func coordinates(_ value: Content) -> Self
}

extension CoordinatesAttribute where Self: HTMLNode {
    
    public func coordinates(_ value: Content) -> Self {
        add(.init(attribute: "coords", value: value))
    }
}

/// The protocol provides
///
///
public protocol DataAttribute {
    
    func data(_ value: Content) -> Self
}

extension DataAttribute where Self: HTMLNode {
    
    public func data(_ value: Content) -> Self {
        add(.init(attribute: "data", value: value))
    }
}

/// The protocol provides
///
///
public protocol DateTimeAttribute {
    
    func dateTime(_ value: Content) -> Self
}

extension DateTimeAttribute where Self: HTMLNode {
    
    public func dateTime(_ value: Content) -> Self {
        add(.init(attribute: "datetime", value: value))
    }
}

/// The protocol provides
///
///
public protocol DefaultAttribute {
    
    func `default`() -> Self
}

extension DefaultAttribute where Self: HTMLNode {
    
    public func `default`() -> Self {
        add(.init(attribute: "default", value: nil))
    }
}

/// The protocol provides
///
///
public protocol DisabledAttribute {
    
    func disabled() -> Self
}

extension DisabledAttribute where Self: HTMLNode {
    
    public func disabled() -> Self {
        add(.init(attribute: "disabled", value: nil))
    }
}

/// The protocol provides
///
///
public protocol DownloadAttribute {
    
    func download() -> Self
}

extension DownloadAttribute where Self: HTMLNode {
    
    public func download() -> Self {
        add(.init(attribute: "download", value: nil))
    }
}

/// The protocol provides
///
///
public protocol EncodingAttribute {
    
    func encoding(_ type: EncodeType) -> Self
}

extension EncodingAttribute where Self: HTMLNode {

    public func encoding(_ type: EncodeType) -> Self {
        add(.init(attribute: "enctype", value: type.rawValue))
    }
}

/// The protocol provides
///
///
public protocol ForAttribute {
    
    func `for`(_ value: Content) -> Self
}

extension ForAttribute where Self: HTMLNode {
    
    public func `for`(_ value: Content) -> Self {
        add(.init(attribute: "for", value: value))
    }
}

/// The protocol provides
///
///
public protocol FormAttribute {
    
    func form(_ value: Content) -> Self
}

extension FormAttribute where Self: HTMLNode {
    
    public func form(_ value: Content) -> Self {
        add(.init(attribute: "form", value: value))
    }
}

/// The protocol provides
///
///
public protocol FormActionAttribute {
    
    func formAction(_ value: Content) -> Self
}

extension FormActionAttribute where Self: HTMLNode {
    
    public func formAction(_ value: Content) -> Self {
        add(.init(attribute: "formaction", value: value))
    }
}

/// The protocol provides
///
///
public protocol HeaderAttribute {
    
    func header(_ value: Content) -> Self
}

extension HeaderAttribute where Self: HTMLNode {
    
    public func header(_ value: Content) -> Self {
        add(.init(attribute: "header", value: value))
    }
}

/// The protocol provides
///
///
public protocol HeightAttribute {
    
    func height(_ height: Int) -> Self
}

extension HeightAttribute where Self: HTMLNode {
    
    public func height(_ height: Int) -> Self {
        add(.init(attribute: "height", value: height))
    }
}

/// The protocol provides
///
///
public protocol HighAttribute {
    
    func high(_ height: Int) -> Self
}

extension HighAttribute where Self: HTMLNode {
    
    public func high(_ height: Int) -> Self {
        add(.init(attribute: "high", value: height))
    }
}

/// The protocol provides
///
///
public protocol ReferenceAttribute {
    
    func reference(_ value: Content) -> Self
}

extension ReferenceAttribute where Self: HTMLNode {
    
    public func reference(_ value: Content) -> Self {
        add(.init(attribute: "href", value: value))
    }
}

/// The protocol provides
///
///
public protocol ReferenceLanguageAttribute {
    
    func referenceLanguage(_ type: LanguageType) -> Self
}

extension ReferenceLanguageAttribute where Self: HTMLNode {

    public func referenceLanguage(_ type: LanguageType) -> Self {
        add(.init(attribute: "hreflang", value: type.rawValue))
    }
}

/// The protocol provides
///
///
public protocol KindAttribute {
    
    func kind(_ text: Content) -> Self
}

extension KindAttribute where Self: HTMLNode {
    
    public func kind(_ text: Content) -> Self {
        add(.init(attribute: "kind", value: text))
    }
}

/// The protocol provides
///
///
public protocol LabelAttribute {
    
    func label(_ value: Content) -> Self
}

extension LabelAttribute where Self: HTMLNode {
    
    public func label(_ value: Content) -> Self {
        add(.init(attribute: "label", value: value))
    }
}

/// The protocol provides
///
///
public protocol ListAttribute {
    
    func list(_ value: Content) -> Self
}

extension ListAttribute where Self: HTMLNode {
    
    public func list(_ value: Content) -> Self {
        add(.init(attribute: "list", value: value))
    }
}

/// The protocol provides
///
///
public protocol LoopAttribute {
    
    func loop() -> Self
}

extension LoopAttribute where Self: HTMLNode {
    
    public func loop() -> Self {
        add(.init(attribute: "loop", value: nil))
    }
}

/// The protocol provides
///
///
public protocol MaximumValueAttribute {
    
    func maximumValue(value: Content) -> Self
}

extension MaximumValueAttribute where Self: HTMLNode {

    public func maximumValue(value: Content) -> Self {
        add(.init(attribute: "max", value: value))
    }
}

/// The protocol provides
///
///
public protocol MaximumLengthAttribute {
    
    func maximumLength(value: Content) -> Self
}

extension MaximumLengthAttribute where Self: HTMLNode {

    public func maximumLength(value: Content) -> Self {
        add(.init(attribute: "maxlength", value: value))
    }
}

/// The protocol provides
///
///
public protocol MediaAttribute {
    
    func media(value: Content) -> Self
}

extension MediaAttribute where Self: HTMLNode {

    public func media(value: Content) -> Self {
        add(.init(attribute: "media", value: value))
    }
}

/// The protocol provides
///
///
public protocol MethodAttribute {
    
    func method(_ method: MethodType) -> Self
}

extension MethodAttribute where Self: HTMLNode {

    public func method(_ method: MethodType) -> Self {
        add(.init(attribute: "method", value: method.rawValue))
    }
}

/// The protocol provides
///
///
public protocol MinimumValueAttribute {
    
    func minimumValue(value: Content) -> Self
}

extension MinimumValueAttribute where Self: HTMLNode {

    public func minimumValue(value: Content) -> Self {
        add(.init(attribute: "min", value: value))
    }
}

/// The protocol provides
///
///
public protocol MinimumLengthAttribute {
    
    func minimumLength(value: Content) -> Self
}

extension MinimumLengthAttribute where Self: HTMLNode {

    public func minimumLength(value: Content) -> Self {
        add(.init(attribute: "minlength", value: value))
    }
}

/// The protocol provides
///
///
public protocol MultipleAttribute {
    
    func multiple() -> Self
}

extension MultipleAttribute where Self: HTMLNode {
    
    public func multiple() -> Self {
        add(.init(attribute: "multiple", value: nil))
    }
}

/// The protocol provides
///
///
public protocol MutedAttribute {
    
    func muted() -> Self
}

extension MutedAttribute where Self: HTMLNode {
    
    public func muted() -> Self {
        add(.init(attribute: "muted", value: nil))
    }
}

/// The protocol provides
///
///
public protocol NameAttribute {

    func name(_ value: NameType) -> Self
}

extension NameAttribute where Self: HTMLNode {
    
    public func name(_ value: NameType) -> Self {
        add(.init(attribute: "name", value: value.rawValue))
    }
}

/// The protocol provides
///
///
public protocol OpenAttribute {
    
    func isOpen(_ condition: Conditionable) -> Self
}

extension OpenAttribute where Self: HTMLNode {
    
    public func isOpen(_ condition: Conditionable) -> Self {
        add(.init(attribute: "open", value: nil, isIncluded: condition))
    }
}

/// The protocol provides
///
///
public protocol OptimumAttribute {
    
    func optimum(_ value: Content) -> Self
}

extension OptimumAttribute where Self: HTMLNode {
    
    public func optimum(_ value: Content) -> Self {
        add(.init(attribute: "optimum", value: value))
    }
}

/// The protocol provides
///
///
public protocol PatternAttribute {
    
    func pattern(_ regex: String) -> Self
}

extension PatternAttribute where Self: HTMLNode {
    
    public func pattern(_ regex: String) -> Self {
        add(.init(attribute: "pattern", value: regex))
    }
}

/// The protocol provides
///
///
public protocol PingAttribute {
    
    func ping(_ value: Content) -> Self
}

extension PingAttribute where Self: HTMLNode {

    public func ping(_ value: Content) -> Self {
        add(.init(attribute: "ping", value: value))
    }
}

/// The protocol provides
///
///
public protocol PlaceholderAttribute {
    
    func placeholder(_ text: Content) -> Self
}

extension PlaceholderAttribute where Self: HTMLNode {
    
    public func placeholder(_ text: Content) -> Self {
        add(.init(attribute: "placeholder", value: text))
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
public protocol PosterAttribute {
    
    func poster(value: Content) -> Self
}

extension PosterAttribute where Self: HTMLNode {

    public func poster(value: Content) -> Self {
        add(.init(attribute: "poster", value: value))
    }
}

/// The protocol provides
///
///
public protocol ReadyOnlyAttribute {
    
    func readonly() -> Self
}

extension ReadyOnlyAttribute where Self: HTMLNode {
    
    public func readonly() -> Self {
        add(.init(attribute: "readonly", value: nil))
    }
}

/// The protocol provides
///
///
public protocol ReferrerPolicyAttribute {
    
    func referrerPolicy(_ type: PolicyType) -> Self
}

extension ReferrerPolicyAttribute where Self: HTMLNode {

    public func referrerPolicy(_ type: PolicyType) -> Self {
        add(.init(attribute: "referrerpolicy", value: type.rawValue))
    }
}

/// The protocol provides
///
///
public protocol RelationshipAttribute {
    
    func relationship(_ value: RelationshipType) -> Self
}

extension RelationshipAttribute where Self: HTMLNode {
    
    public func relationship(_ value: RelationshipType) -> Self {
        add(.init(attribute: "rel", value: value.rawValue))
    }
}

/// The protocol provides
///
///
public protocol RequiredAttribute {
    
    func required() -> Self
}

extension RequiredAttribute where Self: HTMLNode {
    
    public func required() -> Self {
        add(.init(attribute: "required", value: nil))
    }
}

/// The protocol provides
///
///
public protocol ReversedAttribute {
    
    func reversed() -> Self
}

extension ReversedAttribute where Self: HTMLNode {
    
    public func reversed() -> Self {
        add(.init(attribute: "reversed", value: nil))
    }
}

/// The protocol provides
///
///
public protocol RowsAttribute {
    
    func rows(_ size: Int) -> Self
}

extension RowsAttribute where Self: HTMLNode {

    public func rows(_ size: Int) -> Self {
        add(.init(attribute: "rows", value: size))
    }
}

/// The protocol provides
///
///
public protocol RowSpanAttribute {
    
    func rowSpan(_ size: Int) -> Self
}

extension RowSpanAttribute where Self: HTMLNode {

    public func rowSpan(_ size: Int) -> Self {
        add(.init(attribute: "rowspan", value: size))
    }
}

/// The protocol provides
///
///
public protocol SandboxAttribute {
    
    func sandbox() -> Self
}

extension SandboxAttribute where Self: HTMLNode {
    
    public func sandbox() -> Self {
        add(.init(attribute: "sandbox", value: nil))
    }
}

/// The protocol provides
///
///
public protocol ScopeAttribute {
    
    func scope(_ text: Content) -> Self
}

extension ScopeAttribute where Self: HTMLNode {

    public func scope(_ text: Content) -> Self {
        add(.init(attribute: "scope", value: text))
    }
}

/// The protocol provides
///
///
public protocol ShapeAttribute {
    
    func shape(_ type: ShapeType) -> Self
}

extension ShapeAttribute where Self: HTMLNode {

    public func shape(_ type: ShapeType) -> Self {
        add(.init(attribute: "shape", value: type.rawValue))
    }
}

/// The protocol provides
///
///
public protocol SizeAttribute {
    
    func size(_ size: Int) -> Self
}

extension SizeAttribute where Self: HTMLNode {

    public func size(_ size: Int) -> Self {
        add(.init(attribute: "size", value: size))
    }
}

/// The protocol provides
///
///
public protocol SizesAttribute {
    
    func sizes(_ size: Int) -> Self
}

extension SizesAttribute where Self: HTMLNode {

    public func sizes(_ size: Int) -> Self {
        add(.init(attribute: "sizes", value: size))
    }
}

/// The protocol provides
///
///
public protocol SpanAttribute {
    
    func span(_ size: Int) -> Self
}

extension SpanAttribute where Self: HTMLNode {

    public func span(_ size: Int) -> Self {
        add(.init(attribute: "span", value: size))
    }
}

/// The protocol provides
///
///
public protocol SourceAttribute {
    
    func source(_ link: Content) -> Self
}

extension SourceAttribute where Self: HTMLNode {
    
    public func source(_ link: Content) -> Self {
        add(.init(attribute: "src", value: link))
    }
}

/// The protocol provides
///
///
public protocol StartAttribute {
    
    func start(_ size: Int) -> Self
}

extension StartAttribute where Self: HTMLNode {

    public func start(_ size: Int) -> Self {
        add(.init(attribute: "start", value: size))
    }
}

/// The protocol provides
///
///
public protocol StepAttribute {
    
    func step(_ size: Int) -> Self
}

extension StepAttribute where Self: HTMLNode {

    public func step(_ size: Int) -> Self {
        add(.init(attribute: "step", value: size))
    }
}

/// The protocol provides
///
///
public protocol TargetAttribute {
    
    func target(_ type: TargetType) -> Self
}

extension TargetAttribute where Self: HTMLNode {
    
    public func target(_ type: TargetType) -> Self {
        add(.init(attribute: "target", value: type.rawValue))
    }
}

/// The protocol provides
///
///
public protocol TypeAttribute {

    func type(_ value: TemplateValue<String>) -> Self
}

extension TypeAttribute where Self: HTMLNode {
    
    public func type(_ value: TemplateValue<String>) -> Self {
        add(.init(attribute: "type", value: value))
    }
}

/// The protocol provides
///
///
public protocol ValueAttribute {
    
    func value(_ text: Content) -> Self
}

extension ValueAttribute where Self: HTMLNode {

    public func value(_ text: Content) -> Self {
        add(.init(attribute: "value", value: text))
    }
}

/// The protocol provides
///
///
public protocol WidthAttribute {
    
    func width(_ width: Int) -> Self
}

extension WidthAttribute where Self: HTMLNode {

    public func width(_ width: Int) -> Self {
        add(.init(attribute: "width", value: width))
    }
}

/// The protocol provides
///
///
public protocol WrapAttribute {
    
    func wrap(_ type: WrapType) -> Self
}

extension WrapAttribute where Self: HTMLNode {

    public func wrap(_ type: WrapType) -> Self {
        add(.init(attribute: "wrap", value: type.rawValue))
    }
}

public protocol PropertyAttribute {
    
    func property(_ type: OpenGraphType) -> Self
}

extension PropertyAttribute where Self: HTMLNode {
    
    public func property(_ type: OpenGraphType) -> Self {
        add(.init(attribute: "property", value: type.rawValue))
    }
}
