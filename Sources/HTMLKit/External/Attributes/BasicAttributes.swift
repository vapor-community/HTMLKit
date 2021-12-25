/// ## Description
/// The file contains the basic attribute handlers.
///
/// ## Note
/// If you about to add something to the file, stick to the official documentation to keep the code consistent.
///
/// ## Authors
/// Mats Moll: https://github.com/matsmoll
/// Mattes Mohr: https://github.com/mattesmohr

import OrderedCollections

/// ## Description
/// The alias combines the global attributes.
///
/// ## References
/// https://html.spec.whatwg.org/#global-attributes
///
public typealias GlobalAttributes = AccessKeyAttribute & AutocapitalizeAttribute & AutofocusAttribute & ClassAttribute & EditAttribute & DirectionAttribute & DragAttribute & EnterKeyHintAttribute & HiddenAttribute & InputModeAttribute & IsAttribute & ItemIdAttribute & ItemPropertyAttribute & ItemReferenceAttribute & ItemScopeAttribute & ItemTypeAttribute & IdentifierAttribute & LanguageAttribute & NonceAttribute & RoleAttribute & SpellCheckAttribute & StyleAttribute & TabulatorAttribute & TitleAttribute & TranslateAttribute & CustomAttribute

/// ## Description
/// The protocol provides the element with the accesskey handler.
///
/// ## References
/// https://html.spec.whatwg.org/#the-accesskey-attribute
///
public protocol AccessKeyAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func accessKey(_ value: String) -> Self
}

extension AccessKeyAttribute {
    
    internal var key: String { "accesskey" }
}

extension AccessKeyAttribute where Self: ContentNode {
    
    internal func mutate(accesskey value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension AccessKeyAttribute where Self: EmptyNode {
    
    internal func mutate(accesskey value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the accept handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-input-accept
///
public protocol AcceptAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func accept(_ value: String) -> Self
}

extension AcceptAttribute {
    
    internal var key: String { "accept" }
}

extension AcceptAttribute where Self: ContentNode {
    
    internal func mutate(accept value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension AcceptAttribute where Self: EmptyNode {
    
    internal func mutate(accept value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the action handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-input-alt
///
public protocol ActionAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func action(_ value: String) -> Self
}

extension ActionAttribute {
    
    internal var key: String { "action" }
}

extension ActionAttribute where Self: ContentNode {
    
    internal func mutate(action value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension ActionAttribute where Self: EmptyNode {
    
    internal func mutate(action value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the alternate handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-input-alt
///
public protocol AlternateAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func alternate(_ value: String) -> Self
}

extension AlternateAttribute {
    
    internal var key: String { "alt" }
}

extension AlternateAttribute where Self: ContentNode {
    
    internal func mutate(alternate value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension AlternateAttribute where Self: EmptyNode {
    
    internal func mutate(alternate value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the asynchronously handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-autocapitalize
///
public protocol AsynchronouslyAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func asynchronously() -> Self
}

extension AsynchronouslyAttribute {
    
    internal var key: String { "async" }
}

extension AsynchronouslyAttribute where Self: ContentNode {
    
    internal func mutate(async value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension AsynchronouslyAttribute where Self: EmptyNode {
    
    internal func mutate(async value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the autocapitalize handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-autocapitalize
///
public protocol AutocapitalizeAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func autocapitalize(_ type: Capitalization) -> Self
}

extension AutocapitalizeAttribute {
    
    internal var key: String { "autocapitalize" }
}

extension AutocapitalizeAttribute where Self: ContentNode {
    
    internal func mutate(autocapitalize value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension AutocapitalizeAttribute where Self: EmptyNode {
    
    internal func mutate(autocapitalize value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the autocomplete handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-fe-autocomplete
///
public protocol AutocompleteAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func hasCompletion(_ condition: Bool) -> Self
}

extension AutocompleteAttribute {
    
    internal var key: String { "autocomplete" }
}

extension AutocompleteAttribute where Self: ContentNode {
    
    internal func mutate(autocomplete value: Bool) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension AutocompleteAttribute where Self: EmptyNode {
    
    internal func mutate(autocomplete value: Bool) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the autofocus handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-fe-autofocus
///
public protocol AutofocusAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func autofocus() -> Self
}

extension AutofocusAttribute {
    
    internal var key: String { "autofocus" }
}

extension AutofocusAttribute where Self: ContentNode {
    
    internal func mutate(autofocus value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension AutofocusAttribute where Self: EmptyNode {
    
    internal func mutate(autofocus value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the autoplay handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-input-checked
///
public protocol AutoplayAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func autoplay() -> Self
}

extension AutoplayAttribute {
    
    internal var key: String { "autoplay" }
}

extension AutoplayAttribute where Self: ContentNode {
    
    internal func mutate(autoplay value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension AutoplayAttribute where Self: EmptyNode {
    
    internal func mutate(autoplay value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the charset handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-meta-charset
///
public protocol CharsetAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func charset(_ value: Charset) -> Self
}

extension CharsetAttribute {
    
    internal var key: String { "charset" }
}

extension CharsetAttribute where Self: ContentNode {
    
    internal func mutate(charset value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension CharsetAttribute where Self: EmptyNode {
    
    internal func mutate(charset value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the checked handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-input-checked
///
public protocol CheckedAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func checked() -> Self
}

extension CheckedAttribute {
    
    internal var key: String { "checked" }
}

extension CheckedAttribute where Self: ContentNode {
    
    internal func mutate(checked value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension CheckedAttribute where Self: EmptyNode {
    
    internal func mutate(checked value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the cite handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-tdth-colspan
///
public protocol CiteAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func cite(_ value: String) -> Self
}

extension CiteAttribute {
    
    internal var key: String { "cite" }
}

extension CiteAttribute where Self: ContentNode {
    
    internal func mutate(cite value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension CiteAttribute where Self: EmptyNode {
    
    internal func mutate(cite value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the class handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-tdth-colspan
///
public protocol ClassAttribute: AnyAttribute{
    
    /// The func adds
    ///
    ///
    func `class`(_ value: String) -> Self
}

extension ClassAttribute {
    
    internal var key: String { "class" }
}

extension ClassAttribute where Self: ContentNode {
    
    internal func mutate(class value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension ClassAttribute where Self: EmptyNode {
    
    internal func mutate(class value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the columns handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-tdth-colspan
///
public protocol ColumnsAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func columns(_ size: Int) -> Self
}

extension ColumnsAttribute {
    
    internal var key: String { "cols" }
}

extension ColumnsAttribute where Self: ContentNode {
    
    internal func mutate(cols value: Int) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension ColumnsAttribute where Self: EmptyNode {
    
    internal func mutate(cols value: Int) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the columnspan handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-tdth-colspan
///
public protocol ColumnSpanAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func columnSpan(_ size: Int) -> Self
}

extension ColumnSpanAttribute {
    
    internal var key: String { "colspan" }
}

extension ColumnSpanAttribute where Self: ContentNode {
    
    internal func mutate(colspan value: Int) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension ColumnSpanAttribute where Self: EmptyNode {
    
    internal func mutate(colspan value: Int) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the content handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-contenteditable
///
public protocol ContentAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func content(_ value: String) -> Self
    
    /// The func adds
    ///
    ///
    func content(_ value: TemplateValue<String>) -> Self
}

extension ContentAttribute {
    
    internal var key: String { "content" }
}

extension ContentAttribute where Self: ContentNode {
    
    internal func mutate(content value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension ContentAttribute where Self: EmptyNode {
    
    internal func mutate(content value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the iseditable handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-contenteditable
///
public protocol EditAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func isEditable(_ condition: Bool) -> Self
}

extension EditAttribute {
    
    internal var key: String { "contenteditable" }
}

extension EditAttribute where Self: ContentNode {
    
    internal func mutate(contenteditable value: Bool) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension EditAttribute where Self: EmptyNode {
    
    internal func mutate(contenteditable value: Bool) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the controls handler.
///
/// ## References
/// https://html.spec.whatwg.org/#the-accesskey-attribute
///
public protocol ControlsAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func controls() -> Self
}

extension ControlsAttribute {
    
    internal var key: String { "controls" }
}

extension ControlsAttribute where Self: ContentNode {
    
    internal func mutate(controls value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension ControlsAttribute where Self: EmptyNode {
    
    internal func mutate(controls value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the coordinates handler.
///
/// ## References
/// https://html.spec.whatwg.org/#the-accesskey-attribute
///
public protocol CoordinatesAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func coordinates(_ value: String) -> Self
}

extension CoordinatesAttribute {
    
    internal var key: String { "coords" }
}

extension CoordinatesAttribute where Self: ContentNode {
    
    internal func mutate(coords value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension CoordinatesAttribute where Self: EmptyNode {
    
    internal func mutate(coords value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the date handler.
///
/// ## References
/// https://html.spec.whatwg.org/#the-accesskey-attribute
///
public protocol DataAttribute: AnyAttribute{
    
    /// The func adds
    ///
    ///
    func data(_ value: String) -> Self
}

extension DataAttribute {
    
    internal var key: String { "data" }
}

extension DataAttribute where Self: ContentNode {
    
    internal func mutate(data value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension DataAttribute where Self: EmptyNode {
    
    internal func mutate(data value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the datetime handler.
///
/// ## References
/// https://html.spec.whatwg.org/#the-accesskey-attribute
///
public protocol DateTimeAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func dateTime(_ value: String) -> Self
}

extension DateTimeAttribute {
    
    internal var key: String { "datetime" }
}

extension DateTimeAttribute where Self: ContentNode {
    
    internal func mutate(datetime value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension DateTimeAttribute where Self: EmptyNode {
    
    internal func mutate(datetime value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the default handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-track-default
///
public protocol DefaultAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func `default`() -> Self
}

extension DefaultAttribute {
    
    internal var key: String { "default" }
}

extension DefaultAttribute where Self: ContentNode {
    
    internal func mutate(default value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension DefaultAttribute where Self: EmptyNode {
    
    internal func mutate(default value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the defer handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-script-defer
///
public protocol DeferAttribute: AnyAttribute {
    
    /// The handler defers the script execution.
    ///
    ///
    func `defer`() -> Self
}

extension DeferAttribute {
    
    internal var key: String { "defer" }
}

extension DeferAttribute where Self: ContentNode {
    
    internal func mutate(defer value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension DeferAttribute where Self: EmptyNode {
    
    internal func mutate(defer value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the direction handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-dir
///
public protocol DirectionAttribute: AnyAttribute {

    /// The handler specifies the element's text directionality.
    ///
    ///
    func direction(_ type: Direction) -> Self
}

extension DirectionAttribute {

    internal var key: String { "dir" }
}

extension DirectionAttribute where Self: ContentNode {
    
    internal func mutate(dir value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension DirectionAttribute where Self: EmptyNode {
    
    internal func mutate(dir value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the disabled handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-fe-disabled
///
public protocol DisabledAttribute: AnyAttribute {
    
    /// The handler disables the element.
    ///
    ///
    func disabled() -> Self
}

extension DisabledAttribute {
    
    internal var key: String { "disabled" }
}

extension DisabledAttribute where Self: ContentNode {
    
    internal func mutate(disabled value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension DisabledAttribute where Self: EmptyNode {
    
    internal func mutate(disabled value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the download handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-hyperlink-download
///
public protocol DownloadAttribute: AnyAttribute {
    
    /// The handler indicates that the link is used for downloading a source.
    ///
    ///
    func download() -> Self
}

extension DownloadAttribute {
    
    internal var key: String { "download" }
}

extension DownloadAttribute where Self: ContentNode {
    
    internal func mutate(download value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension DownloadAttribute where Self: EmptyNode {
    
    internal func mutate(download value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the isdraggable handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-draggable
///
public protocol DragAttribute: AnyAttribute {
 
    /// The handler sets if the element is draggable.
    ///
    ///
    func isDraggable(_ condition: Bool) -> Self
}

extension DragAttribute {
    
    internal var key: String { "draggable" }
}

extension DragAttribute where Self: ContentNode {
    
    internal func mutate(draggable value: Bool) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension DragAttribute where Self: EmptyNode {
    
    internal func mutate(draggable value: Bool) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the encoding handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-fs-enctype
///
public protocol EncodingAttribute: AnyAttribute {
    
    /// The handler specifies encoding type to use for form submission.
    ///
    ///
    func encoding(_ type: Encoding) -> Self
}

extension EncodingAttribute {
    
    internal var key: String { "enctype" }
}

extension EncodingAttribute where Self: ContentNode {
    
    internal func mutate(enctype value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension EncodingAttribute where Self: EmptyNode {
    
    internal func mutate(enctype value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the enterkeyhint handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-enterkeyhint
///
public protocol EnterKeyHintAttribute: AnyAttribute {
    
    /// The handler specifies what action label to present for the enter key on virtual keyboards.
    ///
    ///
    func enterKeyHint(_ type: Hint) -> Self
}

extension EnterKeyHintAttribute {
    
    internal var key: String { "enterkeyhint" }
}

extension EnterKeyHintAttribute where Self: ContentNode {
    
    internal func mutate(enterkeyhint value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension EnterKeyHintAttribute where Self: EmptyNode {
    
    internal func mutate(enterkeyhint value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the for handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-label-for
///
public protocol ForAttribute: AnyAttribute {
    
    /// The handler specifies the form control with wich the caption is be associated.
    ///
    ///
    func `for`(_ value: String) -> Self
}

extension ForAttribute {
    
    internal var key: String { "for" }
}

extension ForAttribute where Self: ContentNode {
    
    internal func mutate(for value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension ForAttribute where Self: EmptyNode {
    
    internal func mutate(for value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the form handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-fae-form
///
public protocol FormAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func form(_ value: String) -> Self
}

extension FormAttribute {
    
    internal var key: String { "form" }
}

extension FormAttribute where Self: ContentNode {
    
    internal func mutate(form value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension FormAttribute where Self: EmptyNode {
    
    internal func mutate(form value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the formaction handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-fs-formaction
///
public protocol FormActionAttribute: AnyAttribute {
    
    /// The handler sets the url to use for form submission.
    ///
    ///
    func formAction(_ value: String) -> Self
}

extension FormActionAttribute {
    
    internal var key: String { "formaction" }
}

extension FormActionAttribute where Self: ContentNode {
    
    internal func mutate(formaction value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension FormActionAttribute where Self: EmptyNode {
    
    internal func mutate(formaction value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the http-equiv handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-meta-http-equiv
///
public protocol EquivalentAttribute: AnyAttribute {
    
    /// The handler specifiies the header cells for the element.
    ///
    ///
    func equivalent(_ value: Equivalent) -> Self
}

extension EquivalentAttribute {
    
    internal var key: String { "http-equiv" }
}

extension HeaderAttribute where Self: ContentNode {
    
    internal func mutate(httpequiv value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension EquivalentAttribute where Self: EmptyNode {
    
    internal func mutate(httpequiv value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the headers handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-tdth-headers
///
public protocol HeaderAttribute: AnyAttribute {
    
    /// The handler specifiies the header cells for the element.
    ///
    ///
    func headers(_ value: String) -> Self
}

extension HeaderAttribute {
    
    internal var key: String { "headers" }
}

extension HeaderAttribute where Self: ContentNode {
    
    internal func mutate(headers value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension HeaderAttribute where Self: EmptyNode {
    
    internal func mutate(headers value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the height handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-dim-height
///
public protocol HeightAttribute: AnyAttribute {
    
    /// The handler sets the height of the element.
    ///
    ///
    func height(_ size: Int) -> Self
}

extension HeightAttribute {
    
    internal var key: String { "height" }
}

extension HeightAttribute where Self: ContentNode {
    
    internal func mutate(height value: Int) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension HeightAttribute where Self: EmptyNode {
    
    internal func mutate(height value: Int) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with hidden handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-hidden)
///
public protocol HiddenAttribute: AnyAttribute {
 
    /// The func adds
    ///
    ///
    func hidden() -> Self
}

extension HiddenAttribute {

    internal var key: String { "hidden" }
}

extension HiddenAttribute where Self: ContentNode {
    
    internal func mutate(hidden value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension HiddenAttribute where Self: EmptyNode {
    
    internal func mutate(hidden value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with high handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-meter-high)
///
public protocol HighAttribute: AnyAttribute {
    
    /// The handler sets the range of the value.
    ///
    ///
    func high(_ size: Int) -> Self
}

extension HighAttribute {
    
    internal var key: String { "high" }
}

extension HighAttribute where Self: ContentNode {
    
    internal func mutate(high value: Int) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension HighAttribute where Self: EmptyNode {
    
    internal func mutate(high value: Int) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with reference handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-hyperlink-href)
///
public protocol ReferenceAttribute: AnyAttribute {
    
    /// The handler gives the adress of the link.
    ///
    ///
    func reference(_ value: String) -> Self
    
    /// The handler gives the adress of the link.
    ///
    ///
    func reference(_ value: TemplateValue<String>) -> Self
}

extension ReferenceAttribute {
    
    internal var key: String { "href" }
}

extension ReferenceAttribute where Self: ContentNode {
    
    internal func mutate(href value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension ReferenceAttribute where Self: EmptyNode {
    
    internal func mutate(href value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the language reference handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-hyperlink-hreflang
///
public protocol ReferenceLanguageAttribute: AnyAttribute {
    
    /// The handler gives the language of the linked resource.
    ///
    ///
    func referenceLanguage(_ type: Language) -> Self
}

extension ReferenceLanguageAttribute {

    internal var key: String { "hreflang" }
}

extension ReferenceLanguageAttribute where Self: ContentNode {
    
    internal func mutate(hreflang value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension ReferenceLanguageAttribute where Self: EmptyNode {
    
    internal func mutate(hreflang value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the id handler.
///
/// ## References
/// https://html.spec.whatwg.org/#the-id-attribute
///
public protocol IdentifierAttribute: AnyAttribute {
 
    /// The handler specifies its element's unique identifier.
    ///
    ///
    func id(_ value: String) -> Self
    
    /// The handler specifies its element's unique identifier.
    ///
    ///
    func id(_ value: TemplateValue<String>) -> Self
}

extension IdentifierAttribute {
    
    internal var key: String { "id" }
}

extension IdentifierAttribute where Self: ContentNode {
    
    internal func mutate(id value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension IdentifierAttribute where Self: EmptyNode {
    
    internal func mutate(id value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the ismap handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-img-ismap
///
public protocol IsMapAttribute: AnyAttribute {
 
    /// The func adds
    ///
    ///
    func isMap() -> Self
}

extension IsMapAttribute {
    
    internal var key: String { "ismap" }
}

extension IsMapAttribute where Self: ContentNode {
    
    internal func mutate(ismap value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension IsMapAttribute where Self: EmptyNode {
    
    internal func mutate(ismap value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the inputmode handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-inputmode
///
public protocol InputModeAttribute: AnyAttribute {
 
    /// The func adds
    ///
    ///
    func inputMode(_ value: String) -> Self
}

extension InputModeAttribute {
    
    internal var key: String { "inputmode" }
}

extension InputModeAttribute where Self: ContentNode {
    
    internal func mutate(inputmode value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension InputModeAttribute where Self: EmptyNode {
    
    internal func mutate(inputmode value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the inputmode handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-is
///
public protocol IsAttribute: AnyAttribute {
 
    /// The func adds
    ///
    ///
    func `is`(_ value: String) -> Self
}

extension IsAttribute {
    
    internal var key: String { "is" }
}

extension IsAttribute where Self: ContentNode {
    
    internal func mutate(is value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension IsAttribute where Self: EmptyNode {
    
    internal func mutate(is value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the itemid handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-itemid
///
public protocol ItemIdAttribute: AnyAttribute {
 
    /// The func adds
    ///
    ///
    func itemId(_ value: String) -> Self
}

extension ItemIdAttribute {
    
    internal var key: String { "itemid" }
}

extension ItemIdAttribute where Self: ContentNode {
    
    internal func mutate(itemid value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension ItemIdAttribute where Self: EmptyNode {
    
    internal func mutate(itemid value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the itemproperty handler.
///
/// ## References
/// https://html.spec.whatwg.org/#names:-the-itemprop-attribute
///
public protocol ItemPropertyAttribute: AnyAttribute {
 
    /// The func adds
    ///
    ///
    func itemProperty(_ value: String) -> Self
}

extension ItemPropertyAttribute {
    
    internal var key: String { "itemprop" }
}

extension ItemPropertyAttribute where Self: ContentNode {
    
    internal func mutate(itemprop value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension ItemPropertyAttribute where Self: EmptyNode {
    
    internal func mutate(itemprop value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the itemreference handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-itemref
///
public protocol ItemReferenceAttribute: AnyAttribute {
 
    /// The func adds
    ///
    ///
    func itemReference(_ value: String) -> Self
}

extension ItemReferenceAttribute {
    
    internal var key: String { "itemref" }
}

extension ItemReferenceAttribute where Self: ContentNode {
    
    internal func mutate(itemref value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension ItemReferenceAttribute where Self: EmptyNode {
    
    internal func mutate(itemref value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the itemscope handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-itemscope
///
public protocol ItemScopeAttribute: AnyAttribute {
 
    /// The func adds
    ///
    ///
    func itemScope(_ value: String) -> Self
}

extension ItemScopeAttribute {
    
    internal var key: String { "itemscope" }
}

extension ItemScopeAttribute where Self: ContentNode {
    
    internal func mutate(itemscope value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension ItemScopeAttribute where Self: EmptyNode {
    
    internal func mutate(itemscope value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the itemtype handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-itemtype
///
public protocol ItemTypeAttribute: AnyAttribute {
 
    /// The func adds
    ///
    ///
    func itemType(_ value: String) -> Self
}

extension ItemTypeAttribute {
    
    internal var key: String { "itemtype" }
}

extension ItemTypeAttribute where Self: ContentNode {
    
    internal func mutate(itemtype value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension ItemTypeAttribute where Self: EmptyNode {
    
    internal func mutate(itemtype value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the kind handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-track-kind
///
public protocol KindAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func kind(_ value: String) -> Self
}

extension KindAttribute {
    
    internal var key: String { "kind" }
}

extension KindAttribute where Self: ContentNode {
    
    internal func mutate(kind value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension KindAttribute where Self: EmptyNode {
    
    internal func mutate(kind value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the label handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-track-label
///
public protocol LabelAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func label(_ value: String) -> Self
}

extension LabelAttribute {
    
    internal var key: String { "label" }
}

extension LabelAttribute where Self: ContentNode {
    
    internal func mutate(label value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension LabelAttribute where Self: EmptyNode {
    
    internal func mutate(label value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the language handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-lang
///
public protocol LanguageAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func language(_ type: Language) -> Self
}

extension LanguageAttribute {
    
    internal var key: String { "lang" }
}

extension LanguageAttribute where Self: ContentNode {
    
    internal func mutate(lang value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension LanguageAttribute where Self: EmptyNode {
    
    internal func mutate(lang value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the list handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-input-list
///
public protocol ListAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func list(_ value: String) -> Self
}

extension ListAttribute {
    
    internal var key: String { "list" }
}

extension ListAttribute where Self: ContentNode {
    
    internal func mutate(list value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension ListAttribute where Self: EmptyNode {
    
    internal func mutate(list value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the loop handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-media-loop
///
public protocol LoopAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func loop() -> Self
}

extension LoopAttribute {
    
    internal var key: String { "loop" }
}

extension LoopAttribute where Self: ContentNode {
    
    internal func mutate(loop value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension LoopAttribute where Self: EmptyNode {
    
    internal func mutate(loop value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the low handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-meter-low
///
public protocol LowAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func low(_ size: Int) -> Self
}

extension LowAttribute {
    
    internal var key: String { "low" }
}

extension LowAttribute where Self: ContentNode {
    
    internal func mutate(low value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension LowAttribute where Self: EmptyNode {
    
    internal func mutate(low value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the maximumvalue handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-input-max
/// https://html.spec.whatwg.org/#attr-meter-max
///
public protocol MaximumValueAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func maximum(_ value: String) -> Self
}

extension MaximumValueAttribute {

    internal var key: String { "max" }
}

extension MaximumValueAttribute where Self: ContentNode {
    
    internal func mutate(max value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension MaximumValueAttribute where Self: EmptyNode {
    
    internal func mutate(max value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the maximumlength handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-input-maxlength
///
public protocol MaximumLengthAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func maximum(length value: String) -> Self
}

extension MaximumLengthAttribute {

    internal var key: String { "maxlength" }
}

extension MaximumLengthAttribute where Self: ContentNode {
    
    internal func mutate(maxlength value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension MaximumLengthAttribute where Self: EmptyNode {
    
    internal func mutate(maxlength value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the media handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-link-media
///
public protocol MediaAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func media(_ value: String) -> Self
}

extension MediaAttribute {

    internal var key: String { "media" }
}

extension MediaAttribute where Self: ContentNode {
    
    internal func mutate(media value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension MediaAttribute where Self: EmptyNode {
    
    internal func mutate(media value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the method handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-fs-method
///
public protocol MethodAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func method(_ type: Method) -> Self
}

extension MethodAttribute {

    internal var key: String { "method" }
}

extension MethodAttribute where Self: ContentNode {
    
    internal func mutate(method value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension MethodAttribute where Self: EmptyNode {
    
    internal func mutate(method value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the minimumvalue handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-input-min
///
public protocol MinimumValueAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func minimum(_ value: String) -> Self
}

extension MinimumValueAttribute {

    internal var key: String { "min" }
}

extension MinimumValueAttribute where Self: ContentNode {
    
    internal func mutate(min value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension MinimumValueAttribute where Self: EmptyNode {
    
    internal func mutate(min value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the minimumlength handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-input-minlength
///
public protocol MinimumLengthAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func minimum(length value: String) -> Self
}

extension MinimumLengthAttribute {

    internal var key: String { "minlength" }
}

extension MinimumLengthAttribute where Self: ContentNode {
    
    internal func mutate(minlength value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension MinimumLengthAttribute where Self: EmptyNode {
    
    internal func mutate(minlength value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the multiple handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-input-multiple
///
public protocol MultipleAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func multiple() -> Self
}

extension MultipleAttribute {
    
    internal var key: String { "multiple" }
}

extension MultipleAttribute where Self: ContentNode {
    
    internal func mutate(multiple value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension MultipleAttribute where Self: EmptyNode {
    
    internal func mutate(multiple value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the muted handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-media-muted
///
public protocol MutedAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func muted() -> Self
}

extension MutedAttribute {
    
    internal var key: String { "muted" }
}

extension MutedAttribute where Self: ContentNode {
    
    internal func mutate(muted value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension MutedAttribute where Self: EmptyNode {
    
    internal func mutate(muted value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the name handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-form-name
///
public protocol NameAttribute: AnyAttribute {

    associatedtype NameValue
    
    /// The func adds
    ///
    ///
    func name(_ value: NameValue) -> Self
    
    /// The func adds
    ///
    ///
    func name(_ value: TemplateValue<NameValue>) -> Self
}

extension NameAttribute {
    
    internal var key: String { "name" }
}

extension NameAttribute where Self: ContentNode {
    
    internal func mutate(name value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension NameAttribute where Self: EmptyNode {
    
    internal func mutate(name value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the nonce handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-nonce
///
public protocol NonceAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func nonce(_ value: String) -> Self
}

extension NonceAttribute {
    
    internal var key: String { "nonce" }
}

extension NonceAttribute where Self: ContentNode {
    
    internal func mutate(nonce value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension NonceAttribute where Self: EmptyNode {
    
    internal func mutate(nonce value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the novalidate handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-fs-novalidate
///
public protocol NoValidateAttribute: AnyAttribute {

    /// The func adds
    ///
    ///
    func novalidate() -> Self
}

extension NoValidateAttribute {
    
    internal var key: String { "novalidate" }
}

extension NoValidateAttribute where Self: ContentNode {
    
    internal func mutate(novalidate value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension NoValidateAttribute where Self: EmptyNode {
    
    internal func mutate(novalidate value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the open handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-details-open
///
public protocol OpenAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func isOpen(_ condition: Bool) -> Self
}

extension OpenAttribute {
    
    internal var key: String { "open" }
}

extension OpenAttribute where Self: ContentNode {
    
    internal func mutate(open value: Bool) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension OpenAttribute where Self: EmptyNode {
    
    internal func mutate(open value: Bool) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the optimum handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-meter-optimum
///
public protocol OptimumAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func optimum(_ value: Float) -> Self
}

extension OptimumAttribute {
    
    internal var key: String { "optimum" }
}

extension OptimumAttribute where Self: ContentNode {
    
    internal func mutate(optimum value: Float) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension OptimumAttribute where Self: EmptyNode {
    
    internal func mutate(optimum value: Float) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the pattern handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-input-pattern
///
public protocol PatternAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func pattern(_ regex: String) -> Self
}

extension PatternAttribute {
    
    internal var key: String { "pattern" }
}

extension PatternAttribute where Self: ContentNode {
    
    internal func mutate(pattern value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension PatternAttribute where Self: EmptyNode {
    
    internal func mutate(pattern value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the part handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-input-pattern
///
public protocol PartAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func part(_ value: String) -> Self
}

extension PartAttribute {
    
    internal var key: String { "part" }
}

extension PartAttribute where Self: ContentNode {
    
    internal func mutate(part value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension PartAttribute where Self: EmptyNode {
    
    internal func mutate(part value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the ping handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-input-pattern
///
public protocol PingAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func ping(_ value: String) -> Self
}

extension PingAttribute {

    internal var key: String { "ping" }
}

extension PingAttribute where Self: ContentNode {
    
    internal func mutate(ping value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension PingAttribute where Self: EmptyNode {
    
    internal func mutate(ping value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the placeholder handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-input-placeholder
///
public protocol PlaceholderAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func placeholder(_ value: String) -> Self
    
    /// The func adds
    ///
    ///
    func placeholder(_ value: TemplateValue<String>) -> Self
}

extension PlaceholderAttribute {
    
    internal var key: String { "placeholder" }
}

extension PlaceholderAttribute where Self: ContentNode {
    
    internal func mutate(placeholder value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension PlaceholderAttribute where Self: EmptyNode {
    
    internal func mutate(placeholder value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the poster handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-video-poster
///
public protocol PosterAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func poster(_ value: String) -> Self
}

extension PosterAttribute {

    internal var key: String { "poster" }
}

extension PosterAttribute where Self: ContentNode {
    
    internal func mutate(poster value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension PosterAttribute where Self: EmptyNode {
    
    internal func mutate(poster value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the preload handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-media-preload
///
public protocol PreloadAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func preload(_ value: String) -> Self
}

extension PreloadAttribute {
    
    internal var key: String { "preload" }
}

extension PreloadAttribute where Self: ContentNode {
    
    internal func mutate(preload value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension PreloadAttribute where Self: EmptyNode {
    
    internal func mutate(preload value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the readonly handler.
///
/// ## References
/// https://html.spec.whatwg.org/#the-readonly-attribute
///
public protocol ReadyOnlyAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func readonly() -> Self
}

extension ReadyOnlyAttribute {
    
    internal var key: String { "readonly" }
}

extension ReadyOnlyAttribute where Self: ContentNode {
    
    internal func mutate(readonly value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension ReadyOnlyAttribute where Self: EmptyNode {
    
    internal func mutate(readonly value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the referrerpolicy handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-hyperlink-referrerpolicy
///
public protocol ReferrerPolicyAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func referrerPolicy(_ type: Policy) -> Self
}

extension ReferrerPolicyAttribute {

    internal var key: String { "referrerpolicy" }
}

extension ReferrerPolicyAttribute where Self: ContentNode {
    
    internal func mutate(referrerpolicy value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension ReferrerPolicyAttribute where Self: EmptyNode {
    
    internal func mutate(referrerpolicy value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the relationship handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-link-rel
///
public protocol RelationshipAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func relationship(_ type: Relation) -> Self
}

extension RelationshipAttribute {
    
    internal var key: String { "rel" }
}

extension RelationshipAttribute where Self: ContentNode {
    
    internal func mutate(rel value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension RelationshipAttribute where Self: EmptyNode {
    
    internal func mutate(rel value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the required handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-input-required
///
public protocol RequiredAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func required() -> Self
}

extension RequiredAttribute {
    
    internal var key: String { "required" }
}

extension RequiredAttribute where Self: ContentNode {
    
    internal func mutate(required value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension RequiredAttribute where Self: EmptyNode {
    
    internal func mutate(required value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the reversed handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol ReversedAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func reversed() -> Self
}

extension ReversedAttribute {
    
    internal var key: String { "reversed" }
}

extension ReversedAttribute where Self: ContentNode {
    
    internal func mutate(reversed value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension ReversedAttribute where Self: EmptyNode {
    
    internal func mutate(reversed value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the role handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol RoleAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func role(_ value: String) -> Self
}

extension RoleAttribute {
    
    internal var key: String { "role" }
}

extension RoleAttribute where Self: ContentNode {
    
    internal func mutate(role value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension RoleAttribute where Self: EmptyNode {
    
    internal func mutate(role value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the rows handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol RowsAttribute: AnyAttribute {
    
    /// The func adss
    ///
    ///
    func rows(_ size: Int) -> Self
}

extension RowsAttribute {

    internal var key: String { "rows" }
}

extension RowsAttribute where Self: ContentNode {
    
    internal func mutate(rows value: Int) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension RowsAttribute where Self: EmptyNode {
    
    internal func mutate(rows value: Int) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the rowspan handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-tdth-rowspan
///
public protocol RowSpanAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func rowSpan(_ size: Int) -> Self
}

extension RowSpanAttribute {

    internal var key: String { "rowspan" }
}

extension RowSpanAttribute where Self: ContentNode {
    
    internal func mutate(rowspan value: Int) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension RowSpanAttribute where Self: EmptyNode {
    
    internal func mutate(rowspan value: Int) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the sandbox handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-iframe-sandbox
///
public protocol SandboxAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func sandbox() -> Self
}

extension SandboxAttribute {
    
    internal var key: String { "sandbox" }
}

extension SandboxAttribute where Self: ContentNode {
    
    internal func mutate(sandbox value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension SandboxAttribute where Self: EmptyNode {
    
    internal func mutate(sandbox value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the scope handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-th-scope
///
public protocol ScopeAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func scope(_ value: String) -> Self
}

extension ScopeAttribute {

    internal var key: String { "scope" }
}

extension ScopeAttribute where Self: ContentNode {
    
    internal func mutate(scope value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension ScopeAttribute where Self: EmptyNode {
    
    internal func mutate(scope value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the shape handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-area-shape
///
public protocol ShapeAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func shape(_ type: Shape) -> Self
}

extension ShapeAttribute {

    internal var key: String { "shape" }
}

extension ShapeAttribute where Self: ContentNode {
    
    internal func mutate(shape value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension ShapeAttribute where Self: EmptyNode {
    
    internal func mutate(shape value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the size handler.
///
/// ## References
/// https://html.spec.whatwg.org/#the-size-attribute
///
public protocol SizeAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func size(_ size: Int) -> Self
}

extension SizeAttribute {

    internal var key: String { "size" }
}

extension SizeAttribute where Self: ContentNode {
    
    internal func mutate(size value: Int) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension SizeAttribute where Self: EmptyNode {
    
    internal func mutate(size value: Int) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the sizes handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol SizesAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func sizes(_ size: Int) -> Self
}

extension SizesAttribute {

    internal var key: String { "sizes" }
}

extension SizesAttribute where Self: ContentNode {
    
    internal func mutate(sizes value: Int) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension SizesAttribute where Self: EmptyNode {
    
    internal func mutate(sizes value: Int) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the slot handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-slot
///
public protocol SlotAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func slot(_ value: String) -> Self
}

extension SlotAttribute {
    
    internal var key: String { "slot" }
}

extension SlotAttribute where Self: ContentNode {
    
    internal func mutate(slot value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension SlotAttribute where Self: EmptyNode {
    
    internal func mutate(slot value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the span handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-colgroup-span
/// https://html.spec.whatwg.org/#attr-col-span
///
public protocol SpanAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func span(_ size: Int) -> Self
}

extension SpanAttribute {

    internal var key: String { "span" }
}

extension SpanAttribute where Self: ContentNode {
    
    internal func mutate(span value: Int) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension SpanAttribute where Self: EmptyNode {
    
    internal func mutate(span value: Int) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the hasspellcheck handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-spellcheck
///
public protocol SpellCheckAttribute: AnyAttribute {
 
    /// The func adds
    ///
    ///
    func hasSpellCheck(_ condition: Bool) -> Self
}

extension SpellCheckAttribute {
    
    internal var key: String { "spellcheck" }
}

extension SpellCheckAttribute where Self: ContentNode {
    
    internal func mutate(spellcheck value: Bool) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension SpellCheckAttribute where Self: EmptyNode {
    
    internal func mutate(spellcheck value: Bool) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the source handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-input-src
///
public protocol SourceAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func source(_ value: String) -> Self
}

extension SourceAttribute {
    
    internal var key: String { "src" }
}

extension SourceAttribute where Self: ContentNode {
    
    internal func mutate(source value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension SourceAttribute where Self: EmptyNode {
    
    internal func mutate(source value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the start handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-start
///
public protocol StartAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func start(_ size: Int) -> Self
}

extension StartAttribute {
    
    internal var key: String { "start" }
}

extension StartAttribute where Self: ContentNode {
    
    internal func mutate(start value: Int) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension StartAttribute where Self: EmptyNode {
    
    internal func mutate(start value: Int) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the step handler.
///
/// ## References
/// https://html.spec.whatwg.org/#the-step-attribute
///
public protocol StepAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func step(_ size: Int) -> Self
}

extension StepAttribute {

    internal var key: String { "step" }
}

extension StepAttribute where Self: ContentNode {
    
    internal func mutate(step value: Int) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension StepAttribute where Self: EmptyNode {
    
    internal func mutate(step value: Int) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the style handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-style
///
public protocol StyleAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func style(_ value: String) -> Self
}

extension StyleAttribute {
    
    internal var key: String { "style" }
}

extension StyleAttribute where Self: ContentNode {
    
    internal func mutate(style value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension StyleAttribute where Self: EmptyNode {
    
    internal func mutate(style value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the tabindex handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-tabindex
///
public protocol TabulatorAttribute: AnyAttribute {
 
    /// The func adds
    ///
    ///
    func tabIndex(_ value: String) -> Self
}

extension TabulatorAttribute {
    
    internal var key: String { "tabindex" }
}

extension TabulatorAttribute where Self: ContentNode {
    
    internal func mutate(tabindex value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension TabulatorAttribute where Self: EmptyNode {
    
    internal func mutate(tabindex value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the target handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-base-target
///
public protocol TargetAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func target(_ type: Target) -> Self
}

extension TargetAttribute {
    
    internal var key: String { "target" }
}

extension TargetAttribute where Self: ContentNode {
    
    internal func mutate(target value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension TargetAttribute where Self: EmptyNode {
    
    internal func mutate(target value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the title handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-title
///
public protocol TitleAttribute: AnyAttribute {
 
    /// The func adds
    ///
    ///
    func title(_ value: String) -> Self
}

extension TitleAttribute {
    
    internal var key: String { "title" }
}

extension TitleAttribute where Self: ContentNode {
    
    internal func mutate(title value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension TitleAttribute where Self: EmptyNode {
    
    internal func mutate(title value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the translate handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-translate
///
public protocol TranslateAttribute: AnyAttribute {
 
    /// The func adds
    ///
    ///
    func translate(_ value: String) -> Self
}

extension TranslateAttribute {
    
    internal var key: String { "translate" }
}

extension TranslateAttribute where Self: ContentNode {
    
    internal func mutate(translate value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension TranslateAttribute where Self: EmptyNode {
    
    internal func mutate(translate value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the type handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-link-type
///
public protocol TypeAttribute: AnyAttribute {

    associatedtype TypeValue
    
    /// The func adds
    ///
    ///
    func type(_ value: TypeValue) -> Self
}

extension TypeAttribute {
    
    internal var key: String { "type" }
}

extension TypeAttribute where Self: ContentNode {
    
    internal func mutate(type value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension TypeAttribute where Self: EmptyNode {
    
    internal func mutate(type value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the value handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-input-value
///
public protocol ValueAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func value(_ value: String) -> Self
    
    /// The func adds
    ///
    ///
    func value(_ value: TemplateValue<String>) -> Self
}

extension ValueAttribute {

    internal var key: String { "value" }
}

extension ValueAttribute where Self: ContentNode {
    
    internal func mutate(value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension ValueAttribute where Self: EmptyNode {
    
    internal func mutate(value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the width handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-dim-width
///
public protocol WidthAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func width(_ size: Int) -> Self
}

extension WidthAttribute {

    internal var key: String { "width" }
}

extension WidthAttribute where Self: ContentNode {
    
    internal func mutate(width value: Int) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension WidthAttribute where Self: EmptyNode {
    
    internal func mutate(width value: Int) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the wrap handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-textarea-wrap
///
public protocol WrapAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func wrap(_ type: Wrapping) -> Self
}

extension WrapAttribute {

    internal var key: String { "wrap" }
}

extension WrapAttribute where Self: ContentNode {
    
    internal func mutate(wrap value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension WrapAttribute where Self: EmptyNode {
    
    internal func mutate(wrap value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the property handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol PropertyAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func property(_ type: Graphs) -> Self
}

extension PropertyAttribute {
    
    internal var key: String { "property" }
}

extension PropertyAttribute where Self: ContentNode {
    
    internal func mutate(property value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension PropertyAttribute where Self: EmptyNode {
    
    internal func mutate(property value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}


/// ## Description
/// The protocol provides the element with the property handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol CustomAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func custom(key: String, value: Any) -> Self
}

extension CustomAttribute where Self: ContentNode {
    
    internal func mutate(key: String, value: Any) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension CustomAttribute where Self: EmptyNode {
    
    internal func mutate(key: String, value: Any) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}
