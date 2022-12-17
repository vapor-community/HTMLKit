/*
 Abstract:
 The file contains the protocols for the basic html-attributes.
 
 Note:
 If you about to add something to the file, stick to the official documentation to keep the code consistent.
 */

import OrderedCollections

/// The alias combines the global attributes of the basic attributes.
public typealias GlobalAttributes = AccessKeyAttribute & AutocapitalizeAttribute & AutofocusAttribute & ClassAttribute & EditAttribute & DirectionAttribute & DragAttribute & EnterKeyHintAttribute & HiddenAttribute & InputModeAttribute & IsAttribute & ItemIdAttribute & ItemPropertyAttribute & ItemReferenceAttribute & ItemScopeAttribute & ItemTypeAttribute & IdentifierAttribute & LanguageAttribute & NonceAttribute & RoleAttribute & SpellCheckAttribute & StyleAttribute & TabulatorAttribute & TitleAttribute & TranslateAttribute

/// The protocol provides the element with the accesskey handler.
public protocol AccessKeyAttribute: Attribute {
    
    /// The function represents the html-attribute 'accesskey'.
    ///
    /// ```html
    /// <tag accesskey="" />
    /// ```
    ///
    /// - Parameters:
    ///    - value:
    func accessKey(_ value: Character) -> Self
    
    /// The function represents the html-attribute 'accesskey'.
    ///
    /// ```html
    /// <tag accesskey="" />
    /// ```
    ///
    /// - Parameters:
    ///    - value:
    func accessKey(_ value: Property<Character>) -> Self
}

extension AccessKeyAttribute where Self: ContentElement {
    
    internal func mutate(accesskey value: Character) -> Self {
        return self.mutate(key: "accesskey", value: value)
    }
    
    internal func mutate(accesskey value: Property<Character>) -> Self {
        return self.mutate(key: "accesskey", value: value)
    }
}

extension AccessKeyAttribute where Self: EmptyElement {
    
    internal func mutate(accesskey value: Character) -> Self {
        return self.mutate(key: "accesskey", value: value)
    }
    
    internal func mutate(accesskey value: Property<Character>) -> Self {
        return self.mutate(key: "accesskey", value: value)
    }
}

/// The protocol provides the element with the accept handler.
public protocol AcceptAttribute: Attribute {
    
    /// The function represents the html-attribute 'accept'.
    ///
    /// ```html
    /// <tag accept="" />
    /// ```
    func accept(_ value: String) -> Self
    
    /// The function represents the html-attribute 'accept'.
    ///
    /// ```html
    /// <tag accept="" />
    /// ```
    func accept(_ value: Property<String>) -> Self
}

extension AcceptAttribute where Self: ContentElement {
    
    internal func mutate(accept value: String) -> Self {
        return self.mutate(key: "accept", value: value)
    }
    
    internal func mutate(accept value: Property<String>) -> Self {
        return self.mutate(key: "accept", value: value)
    }
}

extension AcceptAttribute where Self: EmptyElement {
    
    internal func mutate(accept value: String) -> Self {
        return self.mutate(key: "accept", value: value)
    }
    
    internal func mutate(accept value: Property<String>) -> Self {
        return self.mutate(key: "accept", value: value)
    }
}

/// The protocol provides the element with the action handler.
public protocol ActionAttribute: Attribute {
    
    /// The function represents the html-attribute 'action'.
    ///
    /// ```html
    /// <tag action="" />
    /// ```
    func action(_ value: String) -> Self
    
    /// The function represents the html-attribute 'action'.
    ///
    /// ```html
    /// <tag action="" />
    /// ```
    func action(_ value: Property<String>) -> Self
}

extension ActionAttribute where Self: ContentElement {
    
    internal func mutate(action value: String) -> Self {
        return self.mutate(key: "action", value: value)
    }
    
    internal func mutate(action value: Property<String>) -> Self {
        return self.mutate(key: "action", value: value)
    }
}

extension ActionAttribute where Self: EmptyElement {
    
    internal func mutate(action value: String) -> Self {
        return self.mutate(key: "action", value: value)
    }
    
    internal func mutate(action value: Property<String>) -> Self {
        return self.mutate(key: "action", value: value)
    }
}

/// The protocol provides the element with the alternate handler.
public protocol AlternateAttribute: Attribute {
    
    /// The function represents the html-attribute 'alt'.
    ///
    /// ```html
    /// <tag alt="" />
    /// ```
    func alternate(_ value: String) -> Self
    
    /// The function represents the html-attribute 'alt'.
    ///
    /// ```html
    /// <tag alt="" />
    /// ```
    func alternate(_ value: Property<String>) -> Self
}

extension AlternateAttribute where Self: ContentElement {
    
    internal func mutate(alternate value: String) -> Self {
        return self.mutate(key: "alt", value: value)
    }
    
    internal func mutate(alternate value: Property<String>) -> Self {
        return self.mutate(key: "alt", value: value)
    }
}

extension AlternateAttribute where Self: EmptyElement {
    
    internal func mutate(alternate value: String) -> Self {
        return self.mutate(key: "alt", value: value)
    }
    
    internal func mutate(alternate value: Property<String>) -> Self {
        return self.mutate(key: "alt", value: value)
    }
}

/// The protocol provides the element with the asynchronously handler.
public protocol AsynchronouslyAttribute: Attribute {
    
    /// The function represents the html-attribute 'async'.
    ///
    /// ```html
    /// <tag async="" />
    /// ```
    func asynchronously() -> Self
}

extension AsynchronouslyAttribute where Self: ContentElement {
    
    internal func mutate(async value: String) -> Self {
        return self.mutate(key: "async", value: value)
    }
}

extension AsynchronouslyAttribute where Self: EmptyElement {
    
    internal func mutate(async value: String) -> Self {
        return self.mutate(key: "async", value: value)
    }
}

/// The protocol provides the element with the autocapitalize handler.
public protocol AutocapitalizeAttribute: Attribute {
    
    /// The function represents the html-attribute 'autocapitalize'.
    ///
    /// ```html
    /// <tag autocapitalize="" />
    /// ```
    func autocapitalize(_ value: Values.Capitalization) -> Self
}

extension AutocapitalizeAttribute where Self: ContentElement {
    
    internal func mutate(autocapitalize value: String) -> Self {
        return self.mutate(key: "autocapitalize", value: value)
    }
}

extension AutocapitalizeAttribute where Self: EmptyElement {
    
    internal func mutate(autocapitalize value: String) -> Self {
        return self.mutate(key: "autocapitalize", value: value)
    }
}

/// The protocol provides the element with the autocomplete handler.
public protocol AutocompleteAttribute: Attribute {
    
    /// The function represents the html-attribute 'autocomplete'.
    ///
    /// ```html
    /// <tag autocomplete="" />
    /// ```
    func hasCompletion(_ value: Bool) -> Self
    
    /// The function represents the html-attribute 'autocomplete'.
    ///
    /// ```html
    /// <tag autocomplete="" />
    /// ```
    func hasCompletion(_ value: Property<Bool>) -> Self
}

extension AutocompleteAttribute where Self: ContentElement {
    
    internal func mutate(autocomplete value: Bool) -> Self {
        return self.mutate(key: "autocomplete", value: value)
    }
    
    internal func mutate(autocomplete value: Property<Bool>) -> Self {
        return self.mutate(key: "autocomplete", value: value)
    }
}

extension AutocompleteAttribute where Self: EmptyElement {
    
    internal func mutate(autocomplete value: Bool) -> Self {
        return self.mutate(key: "autocomplete", value: value)
    }
    
    internal func mutate(autocomplete value: Property<Bool>) -> Self {
        return self.mutate(key: "autocomplete", value: value)
    }
}

/// The protocol provides the element with the autofocus handler.
public protocol AutofocusAttribute: Attribute {
    
    /// The function represents the html-attribute 'autofocus'.
    ///
    /// ```html
    /// <tag autofocus />
    /// ```
    func autofocus() -> Self
}

extension AutofocusAttribute where Self: ContentElement {
    
    internal func mutate(autofocus value: String) -> Self {
        return self.mutate(key: "autofocus", value: value)
    }
}

extension AutofocusAttribute where Self: EmptyElement {
    
    internal func mutate(autofocus value: String) -> Self {
        return self.mutate(key: "autofocus", value: value)
    }
}

/// The protocol provides the element with the autoplay handler.
public protocol AutoplayAttribute: Attribute {
    
    /// The function represents the html-attribute 'autoplay'.
    ///
    /// ```html
    /// <tag autoplay />
    /// ```
    func autoplay() -> Self
}

extension AutoplayAttribute where Self: ContentElement {
    
    internal func mutate(autoplay value: String) -> Self {
        return self.mutate(key: "autoplay", value: value)
    }
}

extension AutoplayAttribute where Self: EmptyElement {
    
    internal func mutate(autoplay value: String) -> Self {
        return self.mutate(key: "autoplay", value: value)
    }
}

/// The protocol provides the element with the charset handler.
public protocol CharsetAttribute: Attribute {
    
    /// The function represents the html-attribute 'charset'.
    ///
    /// ```html
    /// <tag charset="" />
    /// ```
    func charset(_ value: Values.Charset) -> Self
}

extension CharsetAttribute where Self: ContentElement {
    
    internal func mutate(charset value: String) -> Self {
        return self.mutate(key: "charset", value: value)
    }
}

extension CharsetAttribute where Self: EmptyElement {
    
    internal func mutate(charset value: String) -> Self {
        return self.mutate(key: "charset", value: value)
    }
}

/// The protocol provides the element with the checked handler.
public protocol CheckedAttribute: Attribute {
    
    /// The function represents the html-attribute 'checked'.
    ///
    /// ```html
    /// <tag checked />
    /// ```
    func checked() -> Self
}

extension CheckedAttribute where Self: ContentElement {
    
    internal func mutate(checked value: String) -> Self {
        return self.mutate(key: "checked", value: value)
    }
}

extension CheckedAttribute where Self: EmptyElement {
    
    internal func mutate(checked value: String) -> Self {
        return self.mutate(key: "checked", value: value)
    }
}

/// The protocol provides the element with the cite handler.
public protocol CiteAttribute: Attribute {
    
    /// The function represents the html-attribute 'cite'.
    ///
    /// ```html
    /// <tag cite="" />
    /// ```
    func cite(_ value: String) -> Self
    
    /// The function represents the html-attribute 'cite'.
    ///
    /// ```html
    /// <tag cite="" />
    /// ```
    func cite(_ value: Property<String>) -> Self
}

extension CiteAttribute where Self: ContentElement {
    
    internal func mutate(cite value: String) -> Self {
        return self.mutate(key: "cite", value: value)
    }
    
    internal func mutate(cite value: Property<String>) -> Self {
        return self.mutate(key: "cite", value: value)
    }
}

extension CiteAttribute where Self: EmptyElement {
    
    internal func mutate(cite value: String) -> Self {
        return self.mutate(key: "cite", value: value)
    }
    
    internal func mutate(cite value: Property<String>) -> Self {
        return self.mutate(key: "cite", value: value)
    }
}

/// The protocol provides the element with the class handler.
public protocol ClassAttribute: Attribute{
    
    /// The function represents the html-attribute 'class'.
    ///
    /// ```html
    /// <tag class="" />
    /// ```
    func `class`(_ value: String) -> Self
    
    /// The function represents the html-attribute 'class'.
    ///
    /// ```html
    /// <tag class="" />
    /// ```
    func `class`(_ value: Property<String>) -> Self
}

extension ClassAttribute where Self: ContentElement {
    
    internal func mutate(class value: String) -> Self {
        return self.mutate(key: "class", value: value)
    }
    
    internal func mutate(class value: Property<String>) -> Self {
        return self.mutate(key: "class", value: value)
    }
}

extension ClassAttribute where Self: EmptyElement {
    
    internal func mutate(class value: String) -> Self {
        return self.mutate(key: "class", value: value)
    }
    
    internal func mutate(class value: Property<String>) -> Self {
        return self.mutate(key: "class", value: value)
    }
}

/// The protocol provides the element with the columns handler.
public protocol ColumnsAttribute: Attribute {
    
    /// The function represents the html-attribute 'cols'.
    ///
    /// ```html
    /// <tag cols="" />
    /// ```
    func columns(_ size: Int) -> Self
    
    /// The function represents the html-attribute 'cols'.
    ///
    /// ```html
    /// <tag cols="" />
    /// ```
    func columns(_ size: Property<Int>) -> Self
}

extension ColumnsAttribute where Self: ContentElement {
    
    internal func mutate(cols value: Int) -> Self {
        return self.mutate(key: "cols", value: value)
    }
    
    internal func mutate(cols value: Property<Int>) -> Self {
        return self.mutate(key: "cols", value: value)
    }
}

extension ColumnsAttribute where Self: EmptyElement {
    
    internal func mutate(cols value: Int) -> Self {
        return self.mutate(key: "cols", value: value)
    }
    
    internal func mutate(cols value: Property<Int>) -> Self {
        return self.mutate(key: "cols", value: value)
    }
}

/// The protocol provides the element with the columnspan handler.
public protocol ColumnSpanAttribute: Attribute {
    
    /// The function represents the html-attribute 'colspan'.
    ///
    /// ```html
    /// <tag colspan="" />
    /// ```
    func columnSpan(_ size: Int) -> Self
    
    /// The function represents the html-attribute 'colspan'.
    ///
    /// ```html
    /// <tag colspan="" />
    /// ```
    func columnSpan(_ size: Property<Int>) -> Self
}

extension ColumnSpanAttribute where Self: ContentElement {
    
    internal func mutate(colspan value: Int) -> Self {
        return self.mutate(key: "colspan", value: value)
    }
    
    internal func mutate(colspan value: Property<Int>) -> Self {
        return self.mutate(key: "colspan", value: value)
    }
}

extension ColumnSpanAttribute where Self: EmptyElement {
    
    internal func mutate(colspan value: Int) -> Self {
        return self.mutate(key: "colspan", value: value)
    }
    
    internal func mutate(colspan value: Property<Int>) -> Self {
        return self.mutate(key: "colspan", value: value)
    }
}

/// The protocol provides the element with the content handler.
public protocol ContentAttribute: Attribute {
    
    /// The function represents the html-attribute 'content'.
    ///
    /// ```html
    /// <tag content="" />
    /// ```
    func content(_ value: String) -> Self
    
    /// The function represents the html-attribute 'content'.
    ///
    /// ```html
    /// <tag content="" />
    /// ```
    func content(_ value: Property<String>) -> Self
}

extension ContentAttribute where Self: ContentElement {
    
    internal func mutate(content value: String) -> Self {
        return self.mutate(key: "content", value: value)
    }
    
    internal func mutate(content value: Property<String>) -> Self {
        return self.mutate(key: "content", value: value)
    }
}

extension ContentAttribute where Self: EmptyElement {
    
    internal func mutate(content value: String) -> Self {
        return self.mutate(key: "content", value: value)
    }
    
    internal func mutate(content value: Property<String>) -> Self {
        return self.mutate(key: "content", value: value)
    }
}

/// The protocol provides the element with the iseditable handler.
public protocol EditAttribute: Attribute {
    
    /// The function represents the html-attribute 'contenteditable'.
    ///
    /// ```html
    /// <tag contenteditable />
    /// ```
    func isEditable(_ value: Bool) -> Self
    
    /// The function represents the html-attribute 'contenteditable'.
    ///
    /// ```html
    /// <tag contenteditable />
    /// ```
    func isEditable(_ value: Property<Bool>) -> Self
}

extension EditAttribute where Self: ContentElement {
    
    internal func mutate(contenteditable value: Bool) -> Self {
        return self.mutate(key: "contenteditable", value: value)
    }
    
    internal func mutate(contenteditable value: Property<Bool>) -> Self {
        return self.mutate(key: "contenteditable", value: value)
    }
}

extension EditAttribute where Self: EmptyElement {
    
    internal func mutate(contenteditable value: Bool) -> Self {
        return self.mutate(key: "contenteditable", value: value)
    }
    
    internal func mutate(contenteditable value: Property<Bool>) -> Self {
        return self.mutate(key: "contenteditable", value: value)
    }
}

/// The protocol provides the element with the controls handler.
public protocol ControlsAttribute: Attribute {
    
    /// The function represents the html-attribute 'controls'.
    ///
    /// ```html
    /// <tag controls />
    /// ```
    func controls() -> Self
}

extension ControlsAttribute where Self: ContentElement {
    
    internal func mutate(controls value: String) -> Self {
        return self.mutate(key: "controls", value: value)
    }
}

extension ControlsAttribute where Self: EmptyElement {
    
    internal func mutate(controls value: String) -> Self {
        return self.mutate(key: "controls", value: value)
    }
}

/// The protocol provides the element with the coordinates handler.
public protocol CoordinatesAttribute: Attribute {
    
    /// The function represents the html-attribute 'coordinates'.
    ///
    /// ```html
    /// <tag coordinates="" />
    /// ```
    func coordinates(_ value: String) -> Self
    
    /// The function represents the html-attribute 'coordinates'.
    ///
    /// ```html
    /// <tag coordinates="" />
    /// ```
    func coordinates(_ value: Property<String>) -> Self
}

extension CoordinatesAttribute where Self: ContentElement {
    
    internal func mutate(coords value: String) -> Self {
        return self.mutate(key: "coords", value: value)
    }
    
    internal func mutate(coords value: Property<String>) -> Self {
        return self.mutate(key: "coords", value: value)
    }
}

extension CoordinatesAttribute where Self: EmptyElement {
    
    internal func mutate(coords value: String) -> Self {
        return self.mutate(key: "coords", value: value)
    }
    
    internal func mutate(coords value: Property<String>) -> Self {
        return self.mutate(key: "coords", value: value)
    }
}

/// The protocol provides the element with the date handler.
public protocol DataAttribute: Attribute{
    
    /// The function represents the html-attribute 'data'.
    ///
    /// ```html
    /// <tag data="" />
    /// ```
    func data(_ value: String) -> Self
    
    /// The function represents the html-attribute 'data'.
    ///
    /// ```html
    /// <tag data="" />
    /// ```
    func data(_ value: Property<String>) -> Self
}

extension DataAttribute where Self: ContentElement {
    
    internal func mutate(data value: String) -> Self {
        return self.mutate(key: "data", value: value)
    }
    
    internal func mutate(data value: Property<String>) -> Self {
        return self.mutate(key: "data", value: value)
    }
}

extension DataAttribute where Self: EmptyElement {
    
    internal func mutate(data value: String) -> Self {
        return self.mutate(key: "data", value: value)
    }
    
    internal func mutate(data value: Property<String>) -> Self {
        return self.mutate(key: "data", value: value)
    }
}

/// The protocol provides the element with the datetime handler.
public protocol DateTimeAttribute: Attribute {
    
    /// The function represents the html-attribute 'datetime'.
    ///
    /// ```html
    /// <tag datetime="" />
    /// ```
    func dateTime(_ value: String) -> Self
    
    /// The function represents the html-attribute 'datetime'.
    ///
    /// ```html
    /// <tag datetime="" />
    /// ```
    func dateTime(_ value: Property<String>) -> Self
}

extension DateTimeAttribute where Self: ContentElement {
    
    internal func mutate(datetime value: String) -> Self {
        return self.mutate(key: "datetime", value: value)
    }
    
    internal func mutate(datetime value: Property<String>) -> Self {
        return self.mutate(key: "datetime", value: value)
    }
}

extension DateTimeAttribute where Self: EmptyElement {
    
    internal func mutate(datetime value: String) -> Self {
        return self.mutate(key: "datetime", value: value)
    }
    
    internal func mutate(datetime value: Property<String>) -> Self {
        return self.mutate(key: "datetime", value: value)
    }
}

/// The protocol provides the element with the default handler.
public protocol DefaultAttribute: Attribute {
    
    /// The function represents the html-attribute 'default'.
    ///
    /// ```html
    /// <tag default />
    /// ```
    func `default`() -> Self
}

extension DefaultAttribute where Self: ContentElement {
    
    internal func mutate(default value: String) -> Self {
        return self.mutate(key: "default", value: value)
    }
}

extension DefaultAttribute where Self: EmptyElement {
    
    internal func mutate(default value: String) -> Self {
        return self.mutate(key: "default", value: value)
    }
}

/// The protocol provides the element with the defer handler.
public protocol DeferAttribute: Attribute {
    
    /// The function represents the html-attribute 'defer'.
    ///
    /// ```html
    /// <tag defer />
    /// ```
    func `defer`() -> Self
}

extension DeferAttribute where Self: ContentElement {
    
    internal func mutate(defer value: String) -> Self {
        return self.mutate(key: "defer", value: value)
    }
}

extension DeferAttribute where Self: EmptyElement {
    
    internal func mutate(defer value: String) -> Self {
        return self.mutate(key: "defer", value: value)
    }
}

/// The protocol provides the element with the direction handler.
public protocol DirectionAttribute: Attribute {

    /// The function represents the html-attribute 'dir'.
    ///
    /// It specifies the element's text directionality.
    ///
    /// ```html
    /// <tag dir="" />
    /// ```
    func direction(_ value: Values.Direction) -> Self
}

extension DirectionAttribute where Self: ContentElement {
    
    internal func mutate(dir value: String) -> Self {
        return self.mutate(key: "dir", value: value)
    }
}

extension DirectionAttribute where Self: EmptyElement {
    
    internal func mutate(dir value: String) -> Self {
        return self.mutate(key: "dir", value: value)
    }
}

/// The protocol provides the element with the disabled handler
public protocol DisabledAttribute: Attribute {
    
    /// The function represents the html-attribute 'disabled'.
    ///
    /// ```html
    /// <tag disabled />
    /// ```
    func disabled() -> Self
}

extension DisabledAttribute where Self: ContentElement {
    
    internal func mutate(disabled value: String) -> Self {
        return self.mutate(key: "disabled", value: value)
    }
}

extension DisabledAttribute where Self: EmptyElement {
    
    internal func mutate(disabled value: String) -> Self {
        return self.mutate(key: "disabled", value: value)
    }
}

/// The protocol provides the element with the download handler.
public protocol DownloadAttribute: Attribute {
    
    /// The function represents the html-attribute 'download'.
    ///
    /// ```html
    /// <tag download />
    /// ```
    func download() -> Self
}

extension DownloadAttribute where Self: ContentElement {
    
    internal func mutate(download value: String) -> Self {
        return self.mutate(key: "download", value: value)
    }
}

extension DownloadAttribute where Self: EmptyElement {
    
    internal func mutate(download value: String) -> Self {
        return self.mutate(key: "download", value: value)
    }
}

/// The protocol provides the element with the isdraggable handler.
public protocol DragAttribute: Attribute {
 
    /// The function represents the html-attribute 'draggable'.
    ///
    /// ```html
    /// <tag draggable />
    /// ```
    func isDraggable(_ value: Bool) -> Self
    
    /// The function represents the html-attribute 'draggable'.
    ///
    /// ```html
    /// <tag draggable />
    /// ```
    func isDraggable(_ value: Property<String>) -> Self
}

extension DragAttribute where Self: ContentElement {
    
    internal func mutate(draggable value: Bool) -> Self {
        return self.mutate(key: "draggable", value: value)
    }
    
    internal func mutate(draggable value: Property<String>) -> Self {
        return self.mutate(key: "draggable", value: value)
    }
}

extension DragAttribute where Self: EmptyElement {
    
    internal func mutate(draggable value: Bool) -> Self {
        return self.mutate(key: "draggable", value: value)
    }
    
    internal func mutate(draggable value: Property<String>) -> Self {
        return self.mutate(key: "draggable", value: value)
    }
}

/// The protocol provides the element with the encoding handler.
public protocol EncodingAttribute: Attribute {
    
    /// The function represents the html-attribute 'enctype'.
    ///
    /// It specifies encoding type to use for form submission.
    ///
    /// ```html
    /// <tag enctype="" />
    /// ```
    func encoding(_ value: Values.Encoding) -> Self
}

extension EncodingAttribute where Self: ContentElement {
    
    internal func mutate(enctype value: String) -> Self {
        return self.mutate(key: "enctype", value: value)
    }
}

extension EncodingAttribute where Self: EmptyElement {
    
    internal func mutate(enctype value: String) -> Self {
        return self.mutate(key: "enctype", value: value)
    }
}

/// The protocol provides the element with the enterkeyhint handler.
public protocol EnterKeyHintAttribute: Attribute {
    
    /// The function represents the html-attribute 'enterkeyhint'.
    ///
    /// It specifies what action label to present for the enter key on virtual keyboards.
    ///
    /// ```html
    /// <tag enterkeyhint="" />
    /// ```
    func enterKeyHint(_ value: Values.Hint) -> Self
}

extension EnterKeyHintAttribute where Self: ContentElement {
    
    internal func mutate(enterkeyhint value: String) -> Self {
        return self.mutate(key: "enterkeyhint", value: value)
    }
}

extension EnterKeyHintAttribute where Self: EmptyElement {
    
    internal func mutate(enterkeyhint value: String) -> Self {
        return self.mutate(key: "enterkeyhint", value: value)
    }
}

/// The protocol provides the element with the for handler.
public protocol ForAttribute: Attribute {
    
    /// The function represents the html-attribute 'for'.
    ///
    /// It specifies the form control with wich the caption is be associated.
    ///
    /// ```html
    /// <tag for="" />
    /// ```
    func `for`(_ value: String) -> Self
    
    /// The function represents the html-attribute 'for'.
    ///
    /// It specifies the form control with wich the caption is be associated.
    ///
    /// ```html
    /// <tag for="" />
    /// ```
    func `for`(_ value: Property<String>) -> Self
}

extension ForAttribute where Self: ContentElement {
    
    internal func mutate(for value: String) -> Self {
        return self.mutate(key: "for", value: value)
    }
    
    internal func mutate(for value: Property<String>) -> Self {
        return self.mutate(key: "for", value: value)
    }
}

extension ForAttribute where Self: EmptyElement {
    
    internal func mutate(for value: String) -> Self {
        return self.mutate(key: "for", value: value)
    }
    
    internal func mutate(for value: Property<String>) -> Self {
        return self.mutate(key: "for", value: value)
    }
}

/// The protocol provides the element with the form handler.
public protocol FormAttribute: Attribute {
    
    /// The function represents the html-attribute 'form'.
    ///
    /// ```html
    /// <tag form="" />
    /// ```
    func form(_ value: String) -> Self
    
    /// The function represents the html-attribute 'form'.
    ///
    /// ```html
    /// <tag form="" />
    /// ```
    func form(_ value: Property<String>) -> Self
}

extension FormAttribute where Self: ContentElement {
    
    internal func mutate(form value: String) -> Self {
        return self.mutate(key: "form", value: value)
    }
    
    internal func mutate(form value: Property<String>) -> Self {
        return self.mutate(key: "form", value: value)
    }
}

extension FormAttribute where Self: EmptyElement {
    
    internal func mutate(form value: String) -> Self {
        return self.mutate(key: "form", value: value)
    }
    
    internal func mutate(form value: Property<String>) -> Self {
        return self.mutate(key: "form", value: value)
    }
}

/// The protocol provides the element with the formaction handler.
public protocol FormActionAttribute: Attribute {
    
    /// The function represents the html-attribute 'formaction'.
    ///
    /// It sets the url to use for form submissions
    ///
    /// ```html
    /// <tag formaction="" />
    /// ```
    func formAction(_ value: String) -> Self
    
    /// The function represents the html-attribute 'formaction'.
    ///
    /// It sets the url to use for form submissions
    ///
    /// ```html
    /// <tag formaction="" />
    /// ```
    func formAction(_ value: Property<String>) -> Self
}

extension FormActionAttribute where Self: ContentElement {
    
    internal func mutate(formaction value: String) -> Self {
        return self.mutate(key: "formaction", value: value)
    }
    
    internal func mutate(formaction value: Property<String>) -> Self {
        return self.mutate(key: "formaction", value: value)
    }
}

extension FormActionAttribute where Self: EmptyElement {
    
    internal func mutate(formaction value: String) -> Self {
        return self.mutate(key: "formaction", value: value)
    }
    
    internal func mutate(formaction value: Property<String>) -> Self {
        return self.mutate(key: "formaction", value: value)
    }
}

/// The protocol provides the element with the http-equiv handler.
public protocol EquivalentAttribute: Attribute {
    
    /// The function represents the html-attribute 'http-equiv'.
    ///
    /// It specifiies the header cells for the element.
    ///
    /// ```html
    /// <tag http-equiv="" />
    /// ```
    func equivalent(_ value: Values.Equivalent) -> Self
}

extension HeaderAttribute where Self: ContentElement {
    
    internal func mutate(httpequiv value: String) -> Self {
        return self.mutate(key: "http-equiv", value: value)
    }
}

extension EquivalentAttribute where Self: EmptyElement {
    
    internal func mutate(httpequiv value: String) -> Self {
        return self.mutate(key: "http-equiv", value: value)
    }
}

/// The protocol provides the element with the headers handler.
public protocol HeaderAttribute: Attribute {
    
    /// The function represents the html-attribute 'headers'.
    ///
    /// It specifiies the header cells for the element.
    ///
    /// ```html
    /// <tag headers="" />
    /// ```
    func headers(_ value: String) -> Self
    
    /// The function represents the html-attribute 'headers'.
    ///
    /// It specifiies the header cells for the element.
    ///
    /// ```html
    /// <tag headers="" />
    /// ```
    func headers(_ value: Property<String>) -> Self
}

extension HeaderAttribute where Self: ContentElement {
    
    internal func mutate(headers value: String) -> Self {
        return self.mutate(key: "headers", value: value)
    }
    
    internal func mutate(headers value: Property<String>) -> Self {
        return self.mutate(key: "headers", value: value)
    }
}

extension HeaderAttribute where Self: EmptyElement {
    
    internal func mutate(headers value: String) -> Self {
        return self.mutate(key: "headers", value: value)
    }
    
    internal func mutate(headers value: Property<String>) -> Self {
        return self.mutate(key: "headers", value: value)
    }
}

/// The protocol provides the element with the height handler.
public protocol HeightAttribute: Attribute {
    
    /// The function represents the html-attribute 'height'.
    ///
    /// It sets the height of the element.
    ///
    /// ```html
    /// <tag height="" />
    /// ```
    func height(_ size: Int) -> Self
    
    /// The function represents the html-attribute 'height'.
    ///
    /// It sets the height of the element.
    ///
    /// ```html
    /// <tag height="" />
    /// ```
    func height(_ size: Property<Int>) -> Self
}

extension HeightAttribute where Self: ContentElement {
    
    internal func mutate(height value: Int) -> Self {
        return self.mutate(key: "height", value: value)
    }
    
    internal func mutate(height value: Property<Int>) -> Self {
        return self.mutate(key: "height", value: value)
    }
}

extension HeightAttribute where Self: EmptyElement {
    
    internal func mutate(height value: Int) -> Self {
        return self.mutate(key: "height", value: value)
    }
    
    internal func mutate(height value: Property<Int>) -> Self {
        return self.mutate(key: "height", value: value)
    }
}

/// The protocol provides the element with hidden handler.
public protocol HiddenAttribute: Attribute {
 
    /// The function represents the html-attribute 'hidden'.
    ///
    /// ```html
    /// <tag hidden />
    /// ```
    func hidden() -> Self
}

extension HiddenAttribute where Self: ContentElement {
    
    internal func mutate(hidden value: String) -> Self {
        return self.mutate(key: "hidden", value: value)
    }
}

extension HiddenAttribute where Self: EmptyElement {
    
    internal func mutate(hidden value: String) -> Self {
        return self.mutate(key: "hidden", value: value)
    }
}

/// The protocol provides the element with high handler.
public protocol HighAttribute: Attribute {
    
    /// The function represents the html-attribute 'high'.
    ///
    /// It sets the range of the value.
    ///
    /// ```html
    /// <tag high="" />
    /// ```
    func high(_ value: Float) -> Self
    
    /// The function represents the html-attribute 'high'.
    ///
    /// It sets the range of the value.
    ///
    /// ```html
    /// <tag high="" />
    /// ```
    func high(_ value: Property<Float>) -> Self
}

extension HighAttribute where Self: ContentElement {
    
    internal func mutate(high value: Float) -> Self {
        return self.mutate(key: "high", value: value)
    }
    
    internal func mutate(high value: Property<Float>) -> Self {
        return self.mutate(key: "high", value: value)
    }
}

extension HighAttribute where Self: EmptyElement {
    
    internal func mutate(high value: Float) -> Self {
        return self.mutate(key: "high", value: value)
    }
    
    internal func mutate(high value: Property<Float>) -> Self {
        return self.mutate(key: "high", value: value)
    }
}

/// The protocol provides the element with reference handler.
public protocol ReferenceAttribute: Attribute {
    
    /// The function represents the html-attribute 'href'.
    ///
    /// It gives the adress of the link.
    ///
    /// ```html
    /// <tag href="" />
    /// ```
    func reference(_ value: String) -> Self
    
    /// The function represents the html-attribute 'href'.
    ///
    /// It gives the adress of the link.
    ///
    /// ```html
    /// <tag href="" />
    /// ```
    func reference(_ value: Property<String>) -> Self
}

extension ReferenceAttribute where Self: ContentElement {
    
    internal func mutate(href value: String) -> Self {
        return self.mutate(key: "href", value: value)
    }
    
    internal func mutate(href value: Property<String>) -> Self {
        return self.mutate(key: "href", value: value)
    }
}

extension ReferenceAttribute where Self: EmptyElement {
    
    internal func mutate(href value: String) -> Self {
        return self.mutate(key: "href", value: value)
    }
    
    internal func mutate(href value: Property<String>) -> Self {
        return self.mutate(key: "href", value: value)
    }
}

/// The protocol provides the element with the language reference handler.
public protocol ReferenceLanguageAttribute: Attribute {
    
    /// The function represents the html-attribute 'hreflang'.
    ///
    /// It gives the language of the linked resource.
    ///
    /// ```html
    /// <tag hreflang="" />
    /// ```
    func referenceLanguage(_ value: Values.Language) -> Self
}

extension ReferenceLanguageAttribute where Self: ContentElement {
    
    internal func mutate(hreflang value: String) -> Self {
        return self.mutate(key: "hreflang", value: value)
    }
}

extension ReferenceLanguageAttribute where Self: EmptyElement {
    
    internal func mutate(hreflang value: String) -> Self {
        return self.mutate(key: "hreflang", value: value)
    }
}

/// The protocol provides the element with the id handler.
public protocol IdentifierAttribute: Attribute {
 
    /// The function represents the html-attribute 'id'.
    ///
    /// It specifies its element's unique identifier.
    ///
    /// ```html
    /// <tag id="" />
    /// ```
    func id(_ value: String) -> Self
    
    /// The function represents the html-attribute 'id'.
    ///
    /// It specifies its element's unique identifier.
    ///
    /// ```html
    /// <tag id="" />
    /// ```
    func id(_ value: Property<String>) -> Self
}

extension IdentifierAttribute where Self: ContentElement {
    
    internal func mutate(id value: String) -> Self {
        return self.mutate(key: "id", value: value)
    }
    
    internal func mutate(id value: Property<String>) -> Self {
        return self.mutate(key: "id", value: value)
    }
}

extension IdentifierAttribute where Self: EmptyElement {
    
    internal func mutate(id value: String) -> Self {
        return self.mutate(key: "id", value: value)
    }
    
    internal func mutate(id value: Property<String>) -> Self {
        return self.mutate(key: "id", value: value)
    }
}

/// The protocol provides the element with the ismap handler.
public protocol IsMapAttribute: Attribute {
 
    /// The function represents the html-attribute 'ismap'.
    ///
    /// ```html
    /// <tag ismap />
    /// ```
    func isMap() -> Self
}

extension IsMapAttribute where Self: ContentElement {
    
    internal func mutate(ismap value: String) -> Self {
        return self.mutate(key: "ismap", value: value)
    }
}

extension IsMapAttribute where Self: EmptyElement {
    
    internal func mutate(ismap value: String) -> Self {
        return self.mutate(key: "ismap", value: value)
    }
}

/// The protocol provides the element with the inputmode handler.
public protocol InputModeAttribute: Attribute {
 
    /// The function represents the html-attribute 'inputmode'.
    ///
    /// ```html
    /// <tag inputmode="" />
    /// ```
    func inputMode(_ value: String) -> Self
    
    /// The function represents the html-attribute 'inputmode'.
    ///
    /// ```html
    /// <tag inputmode="" />
    /// ```
    func inputMode(_ value: Property<String>) -> Self
}

extension InputModeAttribute where Self: ContentElement {
    
    internal func mutate(inputmode value: String) -> Self {
        return self.mutate(key: "inputmode", value: value)
    }
    
    internal func mutate(inputmode value: Property<String>) -> Self {
        return self.mutate(key: "inputmode", value: value)
    }
}

extension InputModeAttribute where Self: EmptyElement {
    
    internal func mutate(inputmode value: String) -> Self {
        return self.mutate(key: "inputmode", value: value)
    }
    
    internal func mutate(inputmode value: Property<String>) -> Self {
        return self.mutate(key: "inputmode", value: value)
    }
}

/// The protocol provides the element with the inputmode handler.
public protocol IsAttribute: Attribute {
 
    /// The function represents the html-attribute 'is'.
    ///
    /// ```html
    /// <tag is="" />
    /// ```
    func `is`(_ value: String) -> Self
    
    /// The function represents the html-attribute 'is'.
    ///
    /// ```html
    /// <tag is="" />
    /// ```
    func `is`(_ value: Property<String>) -> Self
}

extension IsAttribute where Self: ContentElement {
    
    internal func mutate(is value: String) -> Self {
        return self.mutate(key: "is", value: value)
    }
    
    internal func mutate(is value: Property<String>) -> Self {
        return self.mutate(key: "is", value: value)
    }
}

extension IsAttribute where Self: EmptyElement {
    
    internal func mutate(is value: String) -> Self {
        return self.mutate(key: "is", value: value)
    }
    
    internal func mutate(is value: Property<String>) -> Self {
        return self.mutate(key: "is", value: value)
    }
}

/// The protocol provides the element with the itemid handler.
public protocol ItemIdAttribute: Attribute {
 
    /// The function represents the html-attribute 'itemid'.
    ///
    /// ```html
    /// <tag itemid="" />
    /// ```
    func itemId(_ value: String) -> Self
    
    /// The function represents the html-attribute 'itemid'.
    ///
    /// ```html
    /// <tag itemid="" />
    /// ```
    func itemId(_ value: Property<String>) -> Self
}

extension ItemIdAttribute where Self: ContentElement {
    
    internal func mutate(itemid value: String) -> Self {
        return self.mutate(key: "itemid", value: value)
    }
    
    internal func mutate(itemid value: Property<String>) -> Self {
        return self.mutate(key: "itemid", value: value)
    }
}

extension ItemIdAttribute where Self: EmptyElement {
    
    internal func mutate(itemid value: String) -> Self {
        return self.mutate(key: "itemid", value: value)
    }
    
    internal func mutate(itemid value: Property<String>) -> Self {
        return self.mutate(key: "itemid", value: value)
    }
}

/// The protocol provides the element with the itemproperty handler.
public protocol ItemPropertyAttribute: Attribute {
 
    /// The function represents the html-attribute 'itemprop'.
    ///
    /// ```html
    /// <tag itemprop="" />
    /// ```
    func itemProperty(_ value: String) -> Self
    
    /// The function represents the html-attribute 'itemprop'.
    ///
    /// ```html
    /// <tag itemprop="" />
    /// ```
    func itemProperty(_ value: Property<String>) -> Self
}

extension ItemPropertyAttribute where Self: ContentElement {
    
    internal func mutate(itemprop value: String) -> Self {
        return self.mutate(key: "itemprop", value: value)
    }
    
    internal func mutate(itemprop value: Property<String>) -> Self {
        return self.mutate(key: "itemprop", value: value)
    }
}

extension ItemPropertyAttribute where Self: EmptyElement {
    
    internal func mutate(itemprop value: String) -> Self {
        return self.mutate(key: "itemprop", value: value)
    }
    
    internal func mutate(itemprop value: Property<String>) -> Self {
        return self.mutate(key: "itemprop", value: value)
    }
}

/// The protocol provides the element with the itemreference handler.
public protocol ItemReferenceAttribute: Attribute {
 
    /// The function represents the html-attribute 'itemref'.
    ///
    /// ```html
    /// <tag itemref="" />
    /// ```
    func itemReference(_ value: String) -> Self
    
    /// The function represents the html-attribute 'itemref'.
    ///
    /// ```html
    /// <tag itemref="" />
    /// ```
    func itemReference(_ value: Property<String>) -> Self
}

extension ItemReferenceAttribute where Self: ContentElement {
    
    internal func mutate(itemref value: String) -> Self {
        return self.mutate(key: "itemref", value: value)
    }
    
    internal func mutate(itemref value: Property<String>) -> Self {
        return self.mutate(key: "itemref", value: value)
    }
}

extension ItemReferenceAttribute where Self: EmptyElement {
    
    internal func mutate(itemref value: String) -> Self {
        return self.mutate(key: "itemref", value: value)
    }
    
    internal func mutate(itemref value: Property<String>) -> Self {
        return self.mutate(key: "itemref", value: value)
    }
}

/// The protocol provides the element with the itemscope handler.
public protocol ItemScopeAttribute: Attribute {
 
    /// The function represents the html-attribute 'itemscope'.
    ///
    /// ```html
    /// <tag itemscope="" />
    /// ```
    func itemScope(_ value: String) -> Self
    
    /// The function represents the html-attribute 'itemscope'.
    ///
    /// ```html
    /// <tag itemscope="" />
    /// ```
    func itemScope(_ value: Property<String>) -> Self
}

extension ItemScopeAttribute where Self: ContentElement {
    
    internal func mutate(itemscope value: String) -> Self {
        return self.mutate(key: "itemscope", value: value)
    }
    
    internal func mutate(itemscope value: Property<String>) -> Self {
        return self.mutate(key: "itemscope", value: value)
    }
}

extension ItemScopeAttribute where Self: EmptyElement {
    
    internal func mutate(itemscope value: String) -> Self {
        return self.mutate(key: "itemscope", value: value)
    }
    
    internal func mutate(itemscope value: Property<String>) -> Self {
        return self.mutate(key: "itemscope", value: value)
    }
}

/// The protocol provides the element with the itemtype handler
public protocol ItemTypeAttribute: Attribute {
 
    /// The function represents the html-attribute 'itemtype'.
    ///
    /// ```html
    /// <tag itemtype="" />
    /// ```
    func itemType(_ value: String) -> Self
    
    /// The function represents the html-attribute 'itemtype'.
    ///
    /// ```html
    /// <tag itemtype="" />
    /// ```
    func itemType(_ value: Property<String>) -> Self
}

extension ItemTypeAttribute where Self: ContentElement {
    
    internal func mutate(itemtype value: String) -> Self {
        return self.mutate(key: "itemtype", value: value)
    }
    
    internal func mutate(itemtype value: Property<String>) -> Self {
        return self.mutate(key: "itemtype", value: value)
    }
}

extension ItemTypeAttribute where Self: EmptyElement {
    
    internal func mutate(itemtype value: String) -> Self {
        return self.mutate(key: "itemtype", value: value)
    }
    
    internal func mutate(itemtype value: Property<String>) -> Self {
        return self.mutate(key: "itemtype", value: value)
    }
}

/// The protocol provides the element with the kind handler.
public protocol KindAttribute: Attribute {
    
    /// The function represents the html-attribute 'kind'.
    ///
    /// ```html
    /// <tag kind="" />
    /// ```
    func kind(_ value: Values.Kind) -> Self
}

extension KindAttribute where Self: ContentElement {
    
    internal func mutate(kind value: String) -> Self {
        return self.mutate(key: "kind", value: value)
    }
}

extension KindAttribute where Self: EmptyElement {
    
    internal func mutate(kind value: String) -> Self {
        return self.mutate(key: "kind", value: value)
    }
}

/// The protocol provides the element with the label handler.
public protocol LabelAttribute: Attribute {
    
    /// The function represents the html-attribute 'label'.
    ///
    /// ```html
    /// <tag label="" />
    /// ```
    func label(_ value: String) -> Self
    
    /// The function represents the html-attribute 'label'.
    ///
    /// ```html
    /// <tag label="" />
    /// ```
    func label(_ value: Property<String>) -> Self
}

extension LabelAttribute where Self: ContentElement {
    
    internal func mutate(label value: String) -> Self {
        return self.mutate(key: "label", value: value)
    }
    
    internal func mutate(label value: Property<String>) -> Self {
        return self.mutate(key: "label", value: value)
    }
}

extension LabelAttribute where Self: EmptyElement {
    
    internal func mutate(label value: String) -> Self {
        return self.mutate(key: "label", value: value)
    }
    
    internal func mutate(label value: Property<String>) -> Self {
        return self.mutate(key: "label", value: value)
    }
}

/// The protocol provides the element with the language handler.
public protocol LanguageAttribute: Attribute {
    
    /// The function represents the html-attribute 'lang'.
    ///
    /// ```html
    /// <tag lang="" />
    /// ```
    func language(_ value: Values.Language) -> Self
}

extension LanguageAttribute where Self: ContentElement {
    
    internal func mutate(lang value: String) -> Self {
        return self.mutate(key: "lang", value: value)
    }
}

extension LanguageAttribute where Self: EmptyElement {
    
    internal func mutate(lang value: String) -> Self {
        return self.mutate(key: "lang", value: value)
    }
}

/// The protocol provides the element with the list handler.
public protocol ListAttribute: Attribute {
    
    /// The function represents the html-attribute 'list'.
    ///
    /// ```html
    /// <tag list="" />
    /// ```
    func list(_ value: String) -> Self
    
    /// The function represents the html-attribute 'list'.
    ///
    /// ```html
    /// <tag list="" />
    /// ```
    func list(_ value: Property<String>) -> Self
}

extension ListAttribute where Self: ContentElement {
    
    internal func mutate(list value: String) -> Self {
        return self.mutate(key: "list", value: value)
    }
    
    internal func mutate(list value: Property<String>) -> Self {
        return self.mutate(key: "list", value: value)
    }
}

extension ListAttribute where Self: EmptyElement {
    
    internal func mutate(list value: String) -> Self {
        return self.mutate(key: "list", value: value)
    }
    
    internal func mutate(list value: Property<String>) -> Self {
        return self.mutate(key: "list", value: value)
    }
}

/// The protocol provides the element with the loop handler.
public protocol LoopAttribute: Attribute {
    
    /// The function represents the html-attribute 'loop'.
    ///
    /// ```html
    /// <tag loop />
    /// ```
    func loop() -> Self
}

extension LoopAttribute where Self: ContentElement {
    
    internal func mutate(loop value: String) -> Self {
        return self.mutate(key: "loop", value: value)
    }
}

extension LoopAttribute where Self: EmptyElement {
    
    internal func mutate(loop value: String) -> Self {
        return self.mutate(key: "loop", value: value)
    }
}

/// The protocol provides the element with the low handler.
public protocol LowAttribute: Attribute {
    
    /// The function represents the html-attribute 'low'.
    ///
    /// ```html
    /// <tag low="" />
    /// ```
    func low(_ value: Float) -> Self
    
    /// The function represents the html-attribute 'low'.
    ///
    /// ```html
    /// <tag low="" />
    /// ```
    func low(_ value: Property<Float>) -> Self
}

extension LowAttribute where Self: ContentElement {
    
    internal func mutate(low value: Float) -> Self {
        return self.mutate(key: "low", value: value)
    }
    
    internal func mutate(low value: Property<Float>) -> Self {
        return self.mutate(key: "low", value: value)
    }
}

extension LowAttribute where Self: EmptyElement {
    
    internal func mutate(low value: Float) -> Self {
        return self.mutate(key: "low", value: value)
    }
    
    internal func mutate(low value: Property<Float>) -> Self {
        return self.mutate(key: "low", value: value)
    }
}

/// The protocol provides the element with the maximumvalue handler.
public protocol MaximumValueAttribute: Attribute {
    
    associatedtype MaximumValueType
    
    /// The function represents the html-attribute 'max'.
    ///
    /// ```html
    /// <tag max="" />
    /// ```
    func maximum(_ value: MaximumValueType) -> Self
}

extension MaximumValueAttribute where Self: ContentElement {
    
    internal func mutate(max value: MaximumValueType) -> Self {
        return self.mutate(key: "max", value: value)
    }
}

extension MaximumValueAttribute where Self: EmptyElement {
    
    internal func mutate(max value: MaximumValueType) -> Self {
        return self.mutate(key: "max", value: value)
    }
}

/// The protocol provides the element with the maximumlength handler.
public protocol MaximumLengthAttribute: Attribute {
    
    /// The function represents the html-attribute 'maxlength'.
    ///
    /// ```html
    /// <tag maxlength="" />
    /// ```
    func maximum(length value: Int) -> Self
    
    /// The function represents the html-attribute 'maxlength'.
    ///
    /// ```html
    /// <tag maxlength="" />
    /// ```
    func maximum(length value: Property<Int>) -> Self
}

extension MaximumLengthAttribute where Self: ContentElement {
    
    internal func mutate(maxlength value: Int) -> Self {
        return self.mutate(key: "maxlength", value: value)
    }
    
    internal func mutate(maxlength value: Property<Int>) -> Self {
        return self.mutate(key: "maxlength", value: value)
    }
}

extension MaximumLengthAttribute where Self: EmptyElement {
    
    internal func mutate(maxlength value: Int) -> Self {
        return self.mutate(key: "maxlength", value: value)
    }
    
    internal func mutate(maxlength value: Property<Int>) -> Self {
        return self.mutate(key: "maxlength", value: value)
    }
}

/// The protocol provides the element with the media handler.
public protocol MediaAttribute: Attribute {
    
    /// The function represents the html-attribute 'media'.
    ///
    /// ```html
    /// <tag media="" />
    /// ```
    func media(_ value: String) -> Self
    
    /// The function represents the html-attribute 'media'.
    ///
    /// ```html
    /// <tag media="" />
    /// ```
    func media(_ value: Property<String>) -> Self
}

extension MediaAttribute where Self: ContentElement {
    
    internal func mutate(media value: String) -> Self {
        return self.mutate(key: "media", value: value)
    }
    
    internal func mutate(media value: Property<String>) -> Self {
        return self.mutate(key: "media", value: value)
    }
}

extension MediaAttribute where Self: EmptyElement {
    
    internal func mutate(media value: String) -> Self {
        return self.mutate(key: "media", value: value)
    }
    
    internal func mutate(media value: Property<String>) -> Self {
        return self.mutate(key: "media", value: value)
    }
}

/// The protocol provides the element with the method handler.
public protocol MethodAttribute: Attribute {
    
    /// The function represents the html-attribute 'method'.
    ///
    /// ```html
    /// <tag method="" />
    /// ```
    func method(_ value: Values.Method) -> Self
}

extension MethodAttribute where Self: ContentElement {
    
    internal func mutate(method value: String) -> Self {
        return self.mutate(key: "method", value: value)
    }
}

extension MethodAttribute where Self: EmptyElement {
    
    internal func mutate(method value: String) -> Self {
        return self.mutate(key: "method", value: value)
    }
}

/// The protocol provides the element with the minimumvalue handler.
public protocol MinimumValueAttribute: Attribute {
    
    associatedtype MinimumValueType
    
    /// The function represents the html-attribute 'min'.
    ///
    /// ```html
    /// <tag min="" />
    /// ```
    func minimum(_ value: MinimumValueType) -> Self
}

extension MinimumValueAttribute where Self: ContentElement {
    
    internal func mutate(min value: MinimumValueType) -> Self {
        return self.mutate(key: "min", value: value)
    }
}

extension MinimumValueAttribute where Self: EmptyElement {
    
    internal func mutate(min value: MinimumValueType) -> Self {
        return self.mutate(key: "min", value: value)
    }
}

/// The protocol provides the element with the minimumlength handler.
public protocol MinimumLengthAttribute: Attribute {
    
    /// The function represents the html-attribute 'minlength'.
    ///
    /// ```html
    /// <tag minlength="" />
    /// ```
    func minimum(length value: Int) -> Self
    
    /// The function represents the html-attribute 'minlength'.
    ///
    /// ```html
    /// <tag minlength="" />
    /// ```
    func minimum(length value: Property<Int>) -> Self
}

extension MinimumLengthAttribute where Self: ContentElement {
    
    internal func mutate(minlength value: Int) -> Self {
        return self.mutate(key: "minlength", value: value)
    }
    
    internal func mutate(minlength value: Property<Int>) -> Self {
        return self.mutate(key: "minlength", value: value)
    }
}

extension MinimumLengthAttribute where Self: EmptyElement {
    
    internal func mutate(minlength value: Int) -> Self {
        return self.mutate(key: "minlength", value: value)
    }
    
    internal func mutate(minlength value: Property<Int>) -> Self {
        return self.mutate(key: "minlength", value: value)
    }
}

/// The protocol provides the element with the multiple handler.
public protocol MultipleAttribute: Attribute {
    
    /// The function represents the html-attribute 'multiple'.
    ///
    /// ```html
    /// <tag multiple />
    /// ```
    func multiple() -> Self
}

extension MultipleAttribute where Self: ContentElement {
    
    internal func mutate(multiple value: String) -> Self {
        return self.mutate(key: "multiple", value: value)
    }
}

extension MultipleAttribute where Self: EmptyElement {
    
    internal func mutate(multiple value: String) -> Self {
        return self.mutate(key: "multiple", value: value)
    }
}

/// The protocol provides the element with the muted handler.
public protocol MutedAttribute: Attribute {
    
    /// The function represents the html-attribute 'muted'.
    ///
    /// ```html
    /// <tag muted />
    /// ```
    func muted() -> Self
}

extension MutedAttribute where Self: ContentElement {
    
    internal func mutate(muted value: String) -> Self {
        return self.mutate(key: "muted", value: value)
    }
}

extension MutedAttribute where Self: EmptyElement {
    
    internal func mutate(muted value: String) -> Self {
        return self.mutate(key: "muted", value: value)
    }
}

/// The protocol provides the element with the name handler.
public protocol NameAttribute: Attribute {

    associatedtype NameValue
    
    /// The function represents the html-attribute 'name'.
    ///
    /// ```html
    /// <tag name="" />
    /// ```
    func name(_ value: NameValue) -> Self
    
    /// The function represents the html-attribute 'name'.
    ///
    /// ```html
    /// <tag name="" />
    /// ```
    func name(_ value: Property<NameValue>) -> Self
}

extension NameAttribute where Self: ContentElement {
    
    internal func mutate(name value: String) -> Self {
        return self.mutate(key: "name", value: value)
    }
    
    internal func mutate(name value: Property<NameValue>) -> Self {
        return self.mutate(key: "name", value: value)
    }
}

extension NameAttribute where Self: EmptyElement {
    
    internal func mutate(name value: String) -> Self {
        return self.mutate(key: "name", value: value)
    }
    
    internal func mutate(name value: Property<NameValue>) -> Self {
        return self.mutate(key: "name", value: value)
    }
}

/// The protocol provides the element with the nonce handler.
public protocol NonceAttribute: Attribute {
    
    /// The function represents the html-attribute 'nonce'.
    ///
    /// ```html
    /// <tag nonce="" />
    /// ```
    func nonce(_ value: String) -> Self
    
    /// The function represents the html-attribute 'nonce'.
    ///
    /// ```html
    /// <tag nonce="" />
    /// ```
    func nonce(_ value: Property<String>) -> Self
}

extension NonceAttribute where Self: ContentElement {
    
    internal func mutate(nonce value: String) -> Self {
        return self.mutate(key: "nonce", value: value)
    }
    
    internal func mutate(nonce value: Property<String>) -> Self {
        return self.mutate(key: "nonce", value: value)
    }
}

extension NonceAttribute where Self: EmptyElement {
    
    internal func mutate(nonce value: String) -> Self {
        return self.mutate(key: "nonce", value: value)
    }
    
    internal func mutate(nonce value: Property<String>) -> Self {
        return self.mutate(key: "nonce", value: value)
    }
}

/// The protocol provides the element with the novalidate handler.
public protocol NoValidateAttribute: Attribute {

    /// The function represents the html-attribute 'novalidate'.
    ///
    /// ```html
    /// <tag novalidate />
    /// ```
    func novalidate() -> Self
}

extension NoValidateAttribute where Self: ContentElement {
    
    internal func mutate(novalidate value: String) -> Self {
        return self.mutate(key: "novalidate", value: value)
    }
}

extension NoValidateAttribute where Self: EmptyElement {
    
    internal func mutate(novalidate value: String) -> Self {
        return self.mutate(key: "novalidate", value: value)
    }
}

/// The protocol provides the element with the open handler.
public protocol OpenAttribute: Attribute {
    
    /// The function represents the html-attribute 'open'.
    ///
    /// ```html
    /// <tag open />
    /// ```
    func isOpen(_ value: Bool) -> Self
    
    /// The function represents the html-attribute 'open'.
    ///
    /// ```html
    /// <tag open />
    /// ```
    func isOpen(_ value: Property<Bool>) -> Self
}

extension OpenAttribute where Self: ContentElement {
    
    internal func mutate(open value: Bool) -> Self {
        return self.mutate(key: "open", value: value)
    }
    
    internal func mutate(open value: Property<Bool>) -> Self {
        return self.mutate(key: "open", value: value)
    }
}

extension OpenAttribute where Self: EmptyElement {
    
    internal func mutate(open value: Bool) -> Self {
        return self.mutate(key: "open", value: value)
    }
    
    internal func mutate(open value: Property<Bool>) -> Self {
        return self.mutate(key: "open", value: value)
    }
}

/// The protocol provides the element with the optimum handler.
public protocol OptimumAttribute: Attribute {
    
    /// The function represents the html-attribute 'optimum'.
    ///
    /// ```html
    /// <tag optimum="" />
    /// ```
    func optimum(_ value: Float) -> Self
    
    /// The function represents the html-attribute 'optimum'.
    ///
    /// ```html
    /// <tag optimum="" />
    /// ```
    func optimum(_ value: Property<Float>) -> Self
}

extension OptimumAttribute where Self: ContentElement {
    
    internal func mutate(optimum value: Float) -> Self {
        return self.mutate(key: "optimum", value: value)
    }
    
    internal func mutate(optimum value: Property<Float>) -> Self {
        return self.mutate(key: "optimum", value: value)
    }
}

extension OptimumAttribute where Self: EmptyElement {
    
    internal func mutate(optimum value: Float) -> Self {
        return self.mutate(key: "optimum", value: value)
    }
    
    internal func mutate(optimum value: Property<Float>) -> Self {
        return self.mutate(key: "optimum", value: value)
    }
}

/// The protocol provides the element with the pattern handler.
public protocol PatternAttribute: Attribute {
    
    /// The function represents the html-attribute 'pattern'.
    ///
    /// ```html
    /// <tag pattern="" />
    /// ```
    func pattern(_ regex: String) -> Self
    
    /// The function represents the html-attribute 'pattern'.
    ///
    /// ```html
    /// <tag pattern="" />
    /// ```
    func pattern(_ regex: Property<String>) -> Self
}

extension PatternAttribute where Self: ContentElement {
    
    internal func mutate(pattern value: String) -> Self {
        return self.mutate(key: "pattern", value: value)
    }
    
    internal func mutate(pattern value: Property<String>) -> Self {
        return self.mutate(key: "pattern", value: value)
    }
}

extension PatternAttribute where Self: EmptyElement {
    
    internal func mutate(pattern value: String) -> Self {
        return self.mutate(key: "pattern", value: value)
    }
    
    internal func mutate(pattern value: Property<String>) -> Self {
        return self.mutate(key: "pattern", value: value)
    }
}

/// The protocol provides the element with the part handler.
public protocol PartAttribute: Attribute {
    
    /// The function represents the html-attribute 'part'.
    ///
    /// ```html
    /// <tag part="" />
    /// ```
    func part(_ value: String) -> Self
    
    /// The function represents the html-attribute 'part'.
    ///
    /// ```html
    /// <tag part="" />
    /// ```
    func part(_ value: Property<String>) -> Self
}

extension PartAttribute where Self: ContentElement {
    
    internal func mutate(part value: String) -> Self {
        return self.mutate(key: "part", value: value)
    }
    
    internal func mutate(part value: Property<String>) -> Self {
        return self.mutate(key: "part", value: value)
    }
}

extension PartAttribute where Self: EmptyElement {
    
    internal func mutate(part value: String) -> Self {
        return self.mutate(key: "part", value: value)
    }
    
    internal func mutate(part value: Property<String>) -> Self {
        return self.mutate(key: "part", value: value)
    }
}

/// The protocol provides the element with the ping handler.
public protocol PingAttribute: Attribute {
    
    /// The function represents the html-attribute 'ping'.
    ///
    /// ```html
    /// <tag ping="" />
    /// ```
    func ping(_ value: String) -> Self
    
    /// The function represents the html-attribute 'ping'.
    ///
    /// ```html
    /// <tag ping="" />
    /// ```
    func ping(_ value: Property<String>) -> Self
}

extension PingAttribute where Self: ContentElement {
    
    internal func mutate(ping value: String) -> Self {
        return self.mutate(key: "ping", value: value)
    }
    
    internal func mutate(ping value: Property<String>) -> Self {
        return self.mutate(key: "ping", value: value)
    }
}

extension PingAttribute where Self: EmptyElement {
    
    internal func mutate(ping value: String) -> Self {
        return self.mutate(key: "ping", value: value)
    }
    
    internal func mutate(ping value: Property<String>) -> Self {
        return self.mutate(key: "ping", value: value)
    }
}

/// The protocol provides the element with the placeholder handler.
public protocol PlaceholderAttribute: Attribute {
    
    /// The function represents the html-attribute 'placeholder'.
    ///
    /// ```html
    /// <tag placeholder="" />
    /// ```
    func placeholder(_ value: String) -> Self
    
    /// The function represents the html-attribute 'placeholder'.
    ///
    /// ```html
    /// <tag placeholder="" />
    /// ```
    func placeholder(_ value: Property<String>) -> Self
}

extension PlaceholderAttribute where Self: ContentElement {
    
    internal func mutate(placeholder value: String) -> Self {
        return self.mutate(key: "placeholder", value: value)
    }
    
    internal func mutate(placeholder value: Property<String>) -> Self {
        return self.mutate(key: "placeholder", value: value)
    }
}

extension PlaceholderAttribute where Self: EmptyElement {
    
    internal func mutate(placeholder value: String) -> Self {
        return self.mutate(key: "placeholder", value: value)
    }
    
    internal func mutate(placeholder value: Property<String>) -> Self {
        return self.mutate(key: "placeholder", value: value)
    }
}

/// The protocol provides the element with the poster handler.
public protocol PosterAttribute: Attribute {
    
    /// The function represents the html-attribute 'poster'.
    ///
    /// ```html
    /// <tag poster="" />
    /// ```
    func poster(_ value: String) -> Self
    
    /// The function represents the html-attribute 'poster'.
    ///
    /// ```html
    /// <tag poster="" />
    /// ```
    func poster(_ value: Property<String>) -> Self
}

extension PosterAttribute where Self: ContentElement {
    
    internal func mutate(poster value: String) -> Self {
        return self.mutate(key: "poster", value: value)
    }
    
    internal func mutate(poster value: Property<String>) -> Self {
        return self.mutate(key: "poster", value: value)
    }
}

extension PosterAttribute where Self: EmptyElement {
    
    internal func mutate(poster value: String) -> Self {
        return self.mutate(key: "poster", value: value)
    }
    
    internal func mutate(poster value: Property<String>) -> Self {
        return self.mutate(key: "poster", value: value)
    }
}

/// The protocol provides the element with the preload handler.
public protocol PreloadAttribute: Attribute {
    
    /// The function represents the html-attribute 'preload'.
    ///
    /// ```html
    /// <tag preload="" />
    /// ```
    func preload(_ value: Values.Preload) -> Self
}

extension PreloadAttribute where Self: ContentElement {
    
    internal func mutate(preload value: String) -> Self {
        return self.mutate(key: "preload", value: value)
    }
}

extension PreloadAttribute where Self: EmptyElement {
    
    internal func mutate(preload value: String) -> Self {
        return self.mutate(key: "preload", value: value)
    }
}

/// The protocol provides the element with the readonly handler.
public protocol ReadyOnlyAttribute: Attribute {
    
    /// The function represents the html-attribute 'readonly'.
    ///
    /// ```html
    /// <tag readonly />
    /// ```
    func readonly() -> Self
}

extension ReadyOnlyAttribute where Self: ContentElement {
    
    internal func mutate(readonly value: String) -> Self {
        return self.mutate(key: "readonly", value: value)
    }
}

extension ReadyOnlyAttribute where Self: EmptyElement {
    
    internal func mutate(readonly value: String) -> Self {
        return self.mutate(key: "readonly", value: value)
    }
}

/// The protocol provides the element with the referrerpolicy handler.
public protocol ReferrerPolicyAttribute: Attribute {
    
    /// The function represents the html-attribute 'referrerpolicy'.
    ///
    /// ```html
    /// <tag referrerpolicy="" />
    /// ```
    func referrerPolicy(_ value: Values.Policy) -> Self
}

extension ReferrerPolicyAttribute where Self: ContentElement {
    
    internal func mutate(referrerpolicy value: String) -> Self {
        return self.mutate(key: "referrerpolicy", value: value)
    }
}

extension ReferrerPolicyAttribute where Self: EmptyElement {
    
    internal func mutate(referrerpolicy value: String) -> Self {
        return self.mutate(key: "referrerpolicy", value: value)
    }
}

/// The protocol provides the element with the relationship handler.
public protocol RelationshipAttribute: Attribute {
    
    /// The function represents the html-attribute 'rel'.
    ///
    /// ```html
    /// <tag rel="" />
    /// ```
    func relationship(_ value: Values.Relation) -> Self
}

extension RelationshipAttribute where Self: ContentElement {
    
    internal func mutate(rel value: String) -> Self {
        return self.mutate(key: "rel", value: value)
    }
}

extension RelationshipAttribute where Self: EmptyElement {
    
    internal func mutate(rel value: String) -> Self {
        return self.mutate(key: "rel", value: value)
    }
}

/// The protocol provides the element with the required handler.
public protocol RequiredAttribute: Attribute {
    
    /// The function represents the html-attribute 'required'.
    ///
    /// ```html
    /// <tag required />
    /// ```
    func required() -> Self
}

extension RequiredAttribute where Self: ContentElement {
    
    internal func mutate(required value: String) -> Self {
        return self.mutate(key: "required", value: value)
    }
}

extension RequiredAttribute where Self: EmptyElement {
    
    internal func mutate(required value: String) -> Self {
        return self.mutate(key: "required", value: value)
    }
}

/// The protocol provides the element with the reversed handler.
public protocol ReversedAttribute: Attribute {
    
    /// The function represents the html-attribute 'reversed'.
    ///
    /// ```html
    /// <tag reversed />
    /// ```
    func reversed() -> Self
}

extension ReversedAttribute where Self: ContentElement {
    
    internal func mutate(reversed value: String) -> Self {
        return self.mutate(key: "reversed", value: value)
    }
}

extension ReversedAttribute where Self: EmptyElement {
    
    internal func mutate(reversed value: String) -> Self {
        return self.mutate(key: "reversed", value: value)
    }
}

/// The protocol provides the element with the role handler.
public protocol RoleAttribute: Attribute {
    
    /// The function represents the html-attribute 'role'.
    ///
    /// ```html
    /// <tag role="" />
    /// ```
    func role(_ value: Values.Role) -> Self
}

extension RoleAttribute where Self: ContentElement {
    
    internal func mutate(role value: String) -> Self {
        return self.mutate(key: "role", value: value)
    }
}

extension RoleAttribute where Self: EmptyElement {
    
    internal func mutate(role value: String) -> Self {
        return self.mutate(key: "role", value: value)
    }
}

/// The protocol provides the element with the rows handler.
public protocol RowsAttribute: Attribute {
    
    /// The function represents the html-attribute 'rows'.
    ///
    /// ```html
    /// <tag rows="" />
    /// ```
    func rows(_ size: Int) -> Self
    
    /// The function represents the html-attribute 'rows'.
    ///
    /// ```html
    /// <tag rows="" />
    /// ```
    func rows(_ size: Property<Int>) -> Self
}

extension RowsAttribute where Self: ContentElement {
    
    internal func mutate(rows value: Int) -> Self {
        return self.mutate(key: "rows", value: value)
    }
    
    internal func mutate(rows value: Property<Int>) -> Self {
        return self.mutate(key: "rows", value: value)
    }
}

extension RowsAttribute where Self: EmptyElement {
    
    internal func mutate(rows value: Int) -> Self {
        return self.mutate(key: "rows", value: value)
    }
    
    internal func mutate(rows value: Property<Int>) -> Self {
        return self.mutate(key: "rows", value: value)
    }
}

/// The protocol provides the element with the rowspan handler.
public protocol RowSpanAttribute: Attribute {
    
    /// The function represents the html-attribute 'rowspan'.
    ///
    /// ```html
    /// <tag rowspan="" />
    /// ```
    func rowSpan(_ size: Int) -> Self
    
    /// The function represents the html-attribute 'rowspan'.
    ///
    /// ```html
    /// <tag rowspan="" />
    /// ```
    func rowSpan(_ size: Property<Int>) -> Self
}

extension RowSpanAttribute where Self: ContentElement {
    
    internal func mutate(rowspan value: Int) -> Self {
        return self.mutate(key: "rowspan", value: value)
    }
    
    internal func mutate(rowspan value: Property<Int>) -> Self {
        return self.mutate(key: "rowspan", value: value)
    }
}

extension RowSpanAttribute where Self: EmptyElement {
    
    internal func mutate(rowspan value: Int) -> Self {
        return self.mutate(key: "rowspan", value: value)
    }
    
    internal func mutate(rowspan value: Property<Int>) -> Self {
        return self.mutate(key: "rowspan", value: value)
    }
}

/// The protocol provides the element with the sandbox handler.
public protocol SandboxAttribute: Attribute {
    
    /// The function represents the html-attribute 'sandbox'.
    ///
    /// ```html
    /// <tag sandbox />
    /// ```
    func sandbox() -> Self
}

extension SandboxAttribute where Self: ContentElement {
    
    internal func mutate(sandbox value: String) -> Self {
        return self.mutate(key: "sandbox", value: value)
    }
}

extension SandboxAttribute where Self: EmptyElement {
    
    internal func mutate(sandbox value: String) -> Self {
        return self.mutate(key: "sandbox", value: value)
    }
}

/// The protocol provides the element with the scope handler.
public protocol ScopeAttribute: Attribute {
    
    /// The function represents the html-attribute 'scope'.
    ///
    /// ```html
    /// <tag scope="" />
    /// ```
    func scope(_ value: String) -> Self
    
    /// The function represents the html-attribute 'scope'.
    ///
    /// ```html
    /// <tag scope="" />
    /// ```
    func scope(_ value: Property<String>) -> Self
}

extension ScopeAttribute where Self: ContentElement {
    
    internal func mutate(scope value: String) -> Self {
        return self.mutate(key: "scope", value: value)
    }
    
    internal func mutate(scope value: Property<String>) -> Self {
        return self.mutate(key: "scope", value: value)
    }
}

extension ScopeAttribute where Self: EmptyElement {
    
    internal func mutate(scope value: String) -> Self {
        return self.mutate(key: "scope", value: value)
    }
    
    internal func mutate(scope value: Property<String>) -> Self {
        return self.mutate(key: "scope", value: value)
    }
}

/// The protocol provides the element with the shape handler.
public protocol ShapeAttribute: Attribute {
    
    /// The function represents the html-attribute 'shape'.
    ///
    /// ```html
    /// <tag shape="" />
    /// ```
    func shape(_ value: Values.Shape) -> Self
}

extension ShapeAttribute where Self: ContentElement {
    
    internal func mutate(shape value: String) -> Self {
        return self.mutate(key: "shape", value: value)
    }
}

extension ShapeAttribute where Self: EmptyElement {
    
    internal func mutate(shape value: String) -> Self {
        return self.mutate(key: "shape", value: value)
    }
}

/// The protocol provides the element with the size handler.
public protocol SizeAttribute: Attribute {
    
    /// The function represents the html-attribute 'size'.
    ///
    /// ```html
    /// <tag size="" />
    /// ```
    func size(_ size: Int) -> Self
    
    /// The function represents the html-attribute 'size'.
    ///
    /// ```html
    /// <tag size="" />
    /// ```
    func size(_ size: Property<Int>) -> Self
}

extension SizeAttribute where Self: ContentElement {
    
    internal func mutate(size value: Int) -> Self {
        return self.mutate(key: "size", value: value)
    }
    
    internal func mutate(size value: Property<Int>) -> Self {
        return self.mutate(key: "size", value: value)
    }
}

extension SizeAttribute where Self: EmptyElement {
    
    internal func mutate(size value: Int) -> Self {
        return self.mutate(key: "size", value: value)
    }
    
    internal func mutate(size value: Property<Int>) -> Self {
        return self.mutate(key: "size", value: value)
    }
}

/// The protocol provides the element with the sizes handler.
public protocol SizesAttribute: Attribute {
    
    /// The function represents the html-attribute 'sizes'.
    ///
    /// ```html
    /// <tag sizes="" />
    /// ```
    func sizes(_ size: Int) -> Self
    
    /// The function represents the html-attribute 'sizes'.
    ///
    /// ```html
    /// <tag sizes="" />
    /// ```
    func sizes(_ size: Property<Int>) -> Self
}

extension SizesAttribute where Self: ContentElement {
    
    internal func mutate(sizes value: Int) -> Self {
        return self.mutate(key: "sizes", value: value)
    }
    
    internal func mutate(sizes value: Property<Int>) -> Self {
        return self.mutate(key: "sizes", value: value)
    }
}

extension SizesAttribute where Self: EmptyElement {
    
    internal func mutate(sizes value: Int) -> Self {
        return self.mutate(key: "sizes", value: value)
    }
    
    internal func mutate(sizes value: Property<Int>) -> Self {
        return self.mutate(key: "sizes", value: value)
    }
}

/// The protocol provides the element with the slot handler.
public protocol SlotAttribute: Attribute {
    
    /// The function represents the html-attribute 'slot'.
    ///
    /// ```html
    /// <tag slot="" />
    /// ```
    func slot(_ value: String) -> Self
    
    /// The function represents the html-attribute 'slot'.
    ///
    /// ```html
    /// <tag slot="" />
    /// ```
    func slot(_ value: Property<String>) -> Self
}

extension SlotAttribute where Self: ContentElement {
    
    internal func mutate(slot value: String) -> Self {
        return self.mutate(key: "slot", value: value)
    }
    
    internal func mutate(slot value: Property<String>) -> Self {
        return self.mutate(key: "slot", value: value)
    }
}

extension SlotAttribute where Self: EmptyElement {
    
    internal func mutate(slot value: String) -> Self {
        return self.mutate(key: "slot", value: value)
    }
    
    internal func mutate(slot value: Property<String>) -> Self {
        return self.mutate(key: "slot", value: value)
    }
}

/// The protocol provides the element with the span handler.
public protocol SpanAttribute: Attribute {
    
    /// The function represents the html-attribute 'span'.
    ///
    /// ```html
    /// <tag span="" />
    /// ```
    func span(_ size: Int) -> Self
    
    /// The function represents the html-attribute 'span'.
    ///
    /// ```html
    /// <tag span="" />
    /// ```
    func span(_ size: Property<Int>) -> Self
}

extension SpanAttribute where Self: ContentElement {
    
    internal func mutate(span value: Int) -> Self {
        return self.mutate(key: "span", value: value)
    }
    
    internal func mutate(span value: Property<Int>) -> Self {
        return self.mutate(key: "span", value: value)
    }
}

extension SpanAttribute where Self: EmptyElement {
    
    internal func mutate(span value: Int) -> Self {
        return self.mutate(key: "span", value: value)
    }
    
    internal func mutate(span value: Property<Int>) -> Self {
        return self.mutate(key: "span", value: value)
    }
}

/// The protocol provides the element with the hasspellcheck handler.
public protocol SpellCheckAttribute: Attribute {
 
    /// The function represents the html-attribute 'spellcheck'.
    ///
    /// ```html
    /// <tag spellcheck="" />
    /// ```
    func hasSpellCheck(_ value: Bool) -> Self
    
    /// The function represents the html-attribute 'spellcheck'.
    ///
    /// ```html
    /// <tag spellcheck="" />
    /// ```
    func hasSpellCheck(_ value: Property<Bool>) -> Self
}

extension SpellCheckAttribute where Self: ContentElement {
    
    internal func mutate(spellcheck value: Bool) -> Self {
        return self.mutate(key: "spellcheck", value: value)
    }
    
    internal func mutate(spellcheck value: Property<Bool>) -> Self {
        return self.mutate(key: "spellcheck", value: value)
    }
}

extension SpellCheckAttribute where Self: EmptyElement {
    
    internal func mutate(spellcheck value: Bool) -> Self {
        return self.mutate(key: "spellcheck", value: value)
    }
    
    internal func mutate(spellcheck value: Property<Bool>) -> Self {
        return self.mutate(key: "spellcheck", value: value)
    }
}

/// The protocol provides the element with the source handler.
public protocol SourceAttribute: Attribute {
    
    /// The function represents the html-attribute 'src'.
    ///
    /// ```html
    /// <tag src="" />
    /// ```
    func source(_ value: String) -> Self
    
    /// The function represents the html-attribute 'src'.
    ///
    /// ```html
    /// <tag src="" />
    /// ```
    func source(_ value: Property<String>) -> Self
}

extension SourceAttribute where Self: ContentElement {
    
    internal func mutate(source value: String) -> Self {
        return self.mutate(key: "src", value: value)
    }
    
    internal func mutate(source value: Property<String>) -> Self {
        return self.mutate(key: "src", value: value)
    }
}

extension SourceAttribute where Self: EmptyElement {
    
    internal func mutate(source value: String) -> Self {
        return self.mutate(key: "src", value: value)
    }
    
    internal func mutate(source value: Property<String>) -> Self {
        return self.mutate(key: "src", value: value)
    }
}

/// The protocol provides the element with the start handler.
public protocol StartAttribute: Attribute {
    
    /// The function represents the html-attribute 'start'.
    ///
    /// ```html
    /// <tag start="" />
    /// ```
    func start(_ size: Int) -> Self
    
    /// The function represents the html-attribute 'start'.
    ///
    /// ```html
    /// <tag start="" />
    /// ```
    func start(_ size: Property<Int>) -> Self
}

extension StartAttribute where Self: ContentElement {
    
    internal func mutate(start value: Int) -> Self {
        return self.mutate(key: "start", value: value)
    }
    
    internal func mutate(start value: Property<Int>) -> Self {
        return self.mutate(key: "start", value: value)
    }
}

extension StartAttribute where Self: EmptyElement {
    
    internal func mutate(start value: Int) -> Self {
        return self.mutate(key: "start", value: value)
    }
    
    internal func mutate(start value: Property<Int>) -> Self {
        return self.mutate(key: "start", value: value)
    }
}

/// The protocol provides the element with the step handler.
public protocol StepAttribute: Attribute {
    
    /// The function represents the html-attribute 'step'.
    ///
    /// ```html
    /// <tag step="" />
    /// ```
    func step(_ size: Int) -> Self
    
    /// The function represents the html-attribute 'step'.
    ///
    /// ```html
    /// <tag step="" />
    /// ```
    func step(_ size: Property<Int>) -> Self
}

extension StepAttribute where Self: ContentElement {
    
    internal func mutate(step value: Int) -> Self {
        return self.mutate(key: "step", value: value)
    }
    
    internal func mutate(step value: Property<Int>) -> Self {
        return self.mutate(key: "step", value: value)
    }
}

extension StepAttribute where Self: EmptyElement {
    
    internal func mutate(step value: Int) -> Self {
        return self.mutate(key: "step", value: value)
    }
    
    internal func mutate(step value: Property<Int>) -> Self {
        return self.mutate(key: "step", value: value)
    }
}

/// The protocol provides the element with the style handler.
public protocol StyleAttribute: Attribute {
    
    /// The function represents the html-attribute 'style'.
    ///
    /// ```html
    /// <tag style="" />
    /// ```
    func style(_ value: String) -> Self
    
    /// The function represents the html-attribute 'style'.
    ///
    /// ```html
    /// <tag style="" />
    /// ```
    func style(_ value: Property<String>) -> Self
}

extension StyleAttribute where Self: ContentElement {
    
    internal func mutate(style value: String) -> Self {
        return self.mutate(key: "style", value: value)
    }
    
    internal func mutate(style value: Property<String>) -> Self {
        return self.mutate(key: "style", value: value)
    }
}

extension StyleAttribute where Self: EmptyElement {
    
    internal func mutate(style value: String) -> Self {
        return self.mutate(key: "style", value: value)
    }
    
    internal func mutate(style value: Property<String>) -> Self {
        return self.mutate(key: "style", value: value)
    }
}

/// The protocol provides the element with the tabindex handler.
public protocol TabulatorAttribute: Attribute {
 
    /// The function represents the html-attribute 'tabindex'.
    ///
    /// ```html
    /// <tag tabindex="" />
    /// ```
    func tabIndex(_ value: Int) -> Self
    
    /// The function represents the html-attribute 'tabindex'.
    ///
    /// ```html
    /// <tag tabindex="" />
    /// ```
    func tabIndex(_ value: Property<Int>) -> Self
}

extension TabulatorAttribute where Self: ContentElement {
    
    internal func mutate(tabindex value: Int) -> Self {
        return self.mutate(key: "tabindex", value: value)
    }
    
    internal func mutate(tabindex value: Property<Int>) -> Self {
        return self.mutate(key: "tabindex", value: value)
    }
}

extension TabulatorAttribute where Self: EmptyElement {
    
    internal func mutate(tabindex value: Int) -> Self {
        return self.mutate(key: "tabindex", value: value)
    }
    
    internal func mutate(tabindex value: Property<Int>) -> Self {
        return self.mutate(key: "tabindex", value: value)
    }
}

/// The protocol provides the element with the target handler.
public protocol TargetAttribute: Attribute {
    
    /// The function represents the html-attribute 'target'.
    ///
    /// ```html
    /// <tag target="" />
    /// ```
    func target(_ value: Values.Target) -> Self
}

extension TargetAttribute where Self: ContentElement {
    
    internal func mutate(target value: String) -> Self {
        return self.mutate(key: "target", value: value)
    }
}

extension TargetAttribute where Self: EmptyElement {
    
    internal func mutate(target value: String) -> Self {
        return self.mutate(key: "target", value: value)
    }
}

/// The protocol provides the element with the title handler.
public protocol TitleAttribute: Attribute {
 
    /// The function represents the html-attribute 'title'.
    ///
    /// ```html
    /// <tag title="" />
    /// ```
    func title(_ value: String) -> Self
    
    /// The function represents the html-attribute 'title'.
    ///
    /// ```html
    /// <tag title="" />
    /// ```
    func title(_ value: Property<String>) -> Self
}

extension TitleAttribute where Self: ContentElement {
    
    internal func mutate(title value: String) -> Self {
        return self.mutate(key: "title", value: value)
    }
    
    internal func mutate(title value: Property<String>) -> Self {
        return self.mutate(key: "title", value: value)
    }
}

extension TitleAttribute where Self: EmptyElement {
    
    internal func mutate(title value: String) -> Self {
        return self.mutate(key: "title", value: value)
    }
    
    internal func mutate(title value: Property<String>) -> Self {
        return self.mutate(key: "title", value: value)
    }
}

/// The protocol provides the element with the translate handler.
public protocol TranslateAttribute: Attribute {
 
    /// The function represents the html-attribute 'translate'.
    ///
    /// ```html
    /// <tag translate="" />
    /// ```
    func translate(_ value: Values.Decision) -> Self
}

extension TranslateAttribute where Self: ContentElement {
    
    internal func mutate(translate value: String) -> Self {
        return self.mutate(key: "translate", value: value)
    }
}

extension TranslateAttribute where Self: EmptyElement {
    
    internal func mutate(translate value: String) -> Self {
        return self.mutate(key: "translate", value: value)
    }
}

/// The protocol provides the element with the type handler.
public protocol TypeAttribute: Attribute {

    associatedtype TypeValue
    
    /// The function represents the html-attribute 'type'.
    ///
    /// ```html
    /// <tag type="" />
    /// ```
    func type(_ value: TypeValue) -> Self
}

extension TypeAttribute where Self: ContentElement {
    
    internal func mutate(type value: String) -> Self {
        return self.mutate(key: "type", value: value)
    }
}

extension TypeAttribute where Self: EmptyElement {
    
    internal func mutate(type value: String) -> Self {
        return self.mutate(key: "type", value: value)
    }
}

/// The protocol provides the element with the value handler.
public protocol ValueAttribute: Attribute {
    
    /// The function represents the html-attribute 'value'.
    ///
    /// ```html
    /// <tag value="" />
    /// ```
    func value(_ value: String) -> Self
    
    /// The function represents the html-attribute 'value'.
    ///
    /// ```html
    /// <tag value="" />
    /// ```
    func value(_ value: Property<String>) -> Self
}

extension ValueAttribute where Self: ContentElement {
    
    internal func mutate(value: String) -> Self {
        return self.mutate(key: "value", value: value)
    }
    
    internal func mutate(value: Property<String>) -> Self {
        return self.mutate(key: "value", value: value)
    }
}

extension ValueAttribute where Self: EmptyElement {
    
    internal func mutate(value: String) -> Self {
        return self.mutate(key: "value", value: value)
    }
    
    internal func mutate(value: Property<String>) -> Self {
        return self.mutate(key: "value", value: value)
    }
}

/// The protocol provides the element with the width handler.
public protocol WidthAttribute: Attribute {
    
    /// The function represents the html-attribute 'width'.
    ///
    /// ```html
    /// <tag width="" />
    /// ```
    func width(_ size: Int) -> Self
    
    /// The function represents the html-attribute 'width'.
    ///
    /// ```html
    /// <tag width="" />
    /// ```
    func width(_ size: Property<Int>) -> Self
}

extension WidthAttribute where Self: ContentElement {
    
    internal func mutate(width value: Int) -> Self {
        return self.mutate(key: "width", value: value)
    }
    
    internal func mutate(width value: Property<Int>) -> Self {
        return self.mutate(key: "width", value: value)
    }
}

extension WidthAttribute where Self: EmptyElement {
    
    internal func mutate(width value: Int) -> Self {
        return self.mutate(key: "width", value: value)
    }
    
    internal func mutate(width value: Property<Int>) -> Self {
        return self.mutate(key: "width", value: value)
    }
}

/// The protocol provides the element with the wrap handler.
public protocol WrapAttribute: Attribute {
    
    /// The function represents the html-attribute 'wrap'.
    ///
    /// ```html
    /// <tag wrap="" />
    /// ```
    func wrap(_ value: Values.Wrapping) -> Self
}

extension WrapAttribute where Self: ContentElement {
    
    internal func mutate(wrap value: String) -> Self {
        return self.mutate(key: "wrap", value: value)
    }
}

extension WrapAttribute where Self: EmptyElement {
    
    internal func mutate(wrap value: String) -> Self {
        return self.mutate(key: "wrap", value: value)
    }
}

/// The protocol provides the element with the property handler.
public protocol PropertyAttribute: Attribute {
    
    /// The function represents the html-attribute 'property'.
    ///
    /// ```html
    /// <tag property="" />
    /// ```
    func property(_ value: Values.Graph) -> Self
}

extension PropertyAttribute where Self: ContentElement {
    
    internal func mutate(property value: String) -> Self {
        return self.mutate(key: "property", value: value)
    }
}

extension PropertyAttribute where Self: EmptyElement {
    
    internal func mutate(property value: String) -> Self {
        return self.mutate(key: "property", value: value)
    }
}

/// The protocol provides the element with the selected handler.
public protocol SelectedAttribute: Attribute {
    
    /// The function represents the html-attribute 'selected'.
    ///
    /// ```html
    /// <tag selected />
    /// ```
    func selected() -> Self
}

extension SelectedAttribute where Self: ContentElement {
    
    internal func mutate(selected value: String) -> Self {
        return self.mutate(key: "selected", value: value)
    }
}

extension SelectedAttribute where Self: EmptyElement {
    
    internal func mutate(selected value: String) -> Self {
        return self.mutate(key: "selected", value: value)
    }
}
