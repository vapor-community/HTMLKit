/*
 Abstract:
 The file contains the protocols for the basic html-attributes.
 
 Authors:
 - Mats Moll (https://github.com/matsmoll)
 
 Contributors:
 - Mattes Mohr (https://github.com/mattesmohr)
 
 Note:
 If you about to add something to the file, stick to the official documentation to keep the code consistent.
 */

import OrderedCollections

/// The alias combines the global attributes of the basic attributes.
public typealias GlobalAttributes = AccessKeyAttribute & AutocapitalizeAttribute & AutofocusAttribute & ClassAttribute & EditAttribute & DirectionAttribute & DragAttribute & EnterKeyHintAttribute & HiddenAttribute & InputModeAttribute & IsAttribute & ItemIdAttribute & ItemPropertyAttribute & ItemReferenceAttribute & ItemScopeAttribute & ItemTypeAttribute & IdentifierAttribute & LanguageAttribute & NonceAttribute & RoleAttribute & SpellCheckAttribute & StyleAttribute & TabulatorAttribute & TitleAttribute & TranslateAttribute

/// The protocol provides the element with the accesskey handler.
public protocol AccessKeyAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'accesskey'.
    ///
    /// ```html
    /// <tag accesskey="" />
    /// ```
    ///
    /// - Parameters:
    ///    - value:
    func accessKey(_ value: Character) -> Self
}

extension AccessKeyAttribute {
    
    internal var key: String { "accesskey" }
}

extension AccessKeyAttribute where Self: ContentNode {
    
    internal func mutate(accesskey value: Character) -> Self {
        return self.mutate(key: key, value: value)
    }
}

extension AccessKeyAttribute where Self: EmptyNode {
    
    internal func mutate(accesskey value: Character) -> Self {
        return self.mutate(key: key, value: value)
    }
}

/// The protocol provides the element with the accept handler.
public protocol AcceptAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'accept'.
    ///
    /// ```html
    /// <tag accept="" />
    /// ```
    func accept(_ value: String) -> Self
}

extension AcceptAttribute {
    
    internal var key: String { "accept" }
}

extension AcceptAttribute where Self: ContentNode {
    
    internal func mutate(accept value: String) -> Self {
        return self.mutate(key: key, value: value)
    }
}

extension AcceptAttribute where Self: EmptyNode {
    
    internal func mutate(accept value: String) -> Self {
        return self.mutate(key: key, value: value)
    }
}

/// The protocol provides the element with the action handler.
public protocol ActionAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'action'.
    ///
    /// ```html
    /// <tag action="" />
    /// ```
    func action(_ value: String) -> Self
}

extension ActionAttribute {
    
    internal var key: String { "action" }
}

extension ActionAttribute where Self: ContentNode {
    
    internal func mutate(action value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension ActionAttribute where Self: EmptyNode {
    
    internal func mutate(action value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the alternate handler.
public protocol AlternateAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'alt'.
    ///
    /// ```html
    /// <tag alt="" />
    /// ```
    func alternate(_ value: String) -> Self
}

extension AlternateAttribute {
    
    internal var key: String { "alt" }
}

extension AlternateAttribute where Self: ContentNode {
    
    internal func mutate(alternate value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension AlternateAttribute where Self: EmptyNode {
    
    internal func mutate(alternate value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the asynchronously handler.
public protocol AsynchronouslyAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'async'.
    ///
    /// ```html
    /// <tag async="" />
    /// ```
    func asynchronously() -> Self
}

extension AsynchronouslyAttribute {
    
    internal var key: String { "async" }
}

extension AsynchronouslyAttribute where Self: ContentNode {
    
    internal func mutate(async value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension AsynchronouslyAttribute where Self: EmptyNode {
    
    internal func mutate(async value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the autocapitalize handler.
public protocol AutocapitalizeAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'autocapitalize'.
    ///
    /// ```html
    /// <tag autocapitalize="" />
    /// ```
    func autocapitalize(_ type: Capitalization) -> Self
}

extension AutocapitalizeAttribute {
    
    internal var key: String { "autocapitalize" }
}

extension AutocapitalizeAttribute where Self: ContentNode {
    
    internal func mutate(autocapitalize value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension AutocapitalizeAttribute where Self: EmptyNode {
    
    internal func mutate(autocapitalize value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the autocomplete handler.
public protocol AutocompleteAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'autocomplete'.
    ///
    /// ```html
    /// <tag autocomplete="" />
    /// ```
    func hasCompletion(_ condition: Bool) -> Self
}

extension AutocompleteAttribute {
    
    internal var key: String { "autocomplete" }
}

extension AutocompleteAttribute where Self: ContentNode {
    
    internal func mutate(autocomplete value: Bool) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension AutocompleteAttribute where Self: EmptyNode {
    
    internal func mutate(autocomplete value: Bool) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the autofocus handler.
public protocol AutofocusAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'autofocus'.
    ///
    /// ```html
    /// <tag autofocus />
    /// ```
    func autofocus() -> Self
}

extension AutofocusAttribute {
    
    internal var key: String { "autofocus" }
}

extension AutofocusAttribute where Self: ContentNode {
    
    internal func mutate(autofocus value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension AutofocusAttribute where Self: EmptyNode {
    
    internal func mutate(autofocus value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the autoplay handler.
public protocol AutoplayAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'autoplay'.
    ///
    /// ```html
    /// <tag autoplay />
    /// ```
    func autoplay() -> Self
}

extension AutoplayAttribute {
    
    internal var key: String { "autoplay" }
}

extension AutoplayAttribute where Self: ContentNode {
    
    internal func mutate(autoplay value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension AutoplayAttribute where Self: EmptyNode {
    
    internal func mutate(autoplay value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the charset handler.
public protocol CharsetAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'charset'.
    ///
    /// ```html
    /// <tag charset="" />
    /// ```
    func charset(_ value: Charset) -> Self
}

extension CharsetAttribute {
    
    internal var key: String { "charset" }
}

extension CharsetAttribute where Self: ContentNode {
    
    internal func mutate(charset value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension CharsetAttribute where Self: EmptyNode {
    
    internal func mutate(charset value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the checked handler.
public protocol CheckedAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'checked'.
    ///
    /// ```html
    /// <tag checked />
    /// ```
    func checked() -> Self
}

extension CheckedAttribute {
    
    internal var key: String { "checked" }
}

extension CheckedAttribute where Self: ContentNode {
    
    internal func mutate(checked value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension CheckedAttribute where Self: EmptyNode {
    
    internal func mutate(checked value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the cite handler.
public protocol CiteAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'cite'.
    ///
    /// ```html
    /// <tag cite="" />
    /// ```
    func cite(_ value: String) -> Self
}

extension CiteAttribute {
    
    internal var key: String { "cite" }
}

extension CiteAttribute where Self: ContentNode {
    
    internal func mutate(cite value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension CiteAttribute where Self: EmptyNode {
    
    internal func mutate(cite value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the class handler.
public protocol ClassAttribute: AnyAttribute{
    
    /// The function represents the html-attribute 'class'.
    ///
    /// ```html
    /// <tag class="" />
    /// ```
    func `class`(_ value: String) -> Self
}

extension ClassAttribute {
    
    internal var key: String { "class" }
}

extension ClassAttribute where Self: ContentNode {
    
    internal func mutate(class value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension ClassAttribute where Self: EmptyNode {
    
    internal func mutate(class value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the columns handler.
public protocol ColumnsAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'cols'.
    ///
    /// ```html
    /// <tag cols="" />
    /// ```
    func columns(_ size: Int) -> Self
}

extension ColumnsAttribute {
    
    internal var key: String { "cols" }
}

extension ColumnsAttribute where Self: ContentNode {
    
    internal func mutate(cols value: Int) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension ColumnsAttribute where Self: EmptyNode {
    
    internal func mutate(cols value: Int) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the columnspan handler.
public protocol ColumnSpanAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'colspan'.
    ///
    /// ```html
    /// <tag colspan="" />
    /// ```
    func columnSpan(_ size: Int) -> Self
}

extension ColumnSpanAttribute {
    
    internal var key: String { "colspan" }
}

extension ColumnSpanAttribute where Self: ContentNode {
    
    internal func mutate(colspan value: Int) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension ColumnSpanAttribute where Self: EmptyNode {
    
    internal func mutate(colspan value: Int) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the content handler.
public protocol ContentAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'content'.
    ///
    /// ```html
    /// <tag content="" />
    /// ```
    func content(_ value: String) -> Self
    
    /// The func adds
    func content(_ value: TemplateValue<String>) -> Self
}

extension ContentAttribute {
    
    internal var key: String { "content" }
}

extension ContentAttribute where Self: ContentNode {
    
    internal func mutate(content value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension ContentAttribute where Self: EmptyNode {
    
    internal func mutate(content value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the iseditable handler.
public protocol EditAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'contenteditable'.
    ///
    /// ```html
    /// <tag contenteditable />
    /// ```
    func isEditable(_ condition: Bool) -> Self
}

extension EditAttribute {
    
    internal var key: String { "contenteditable" }
}

extension EditAttribute where Self: ContentNode {
    
    internal func mutate(contenteditable value: Bool) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension EditAttribute where Self: EmptyNode {
    
    internal func mutate(contenteditable value: Bool) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the controls handler.
public protocol ControlsAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'controls'.
    ///
    /// ```html
    /// <tag controls />
    /// ```
    func controls() -> Self
}

extension ControlsAttribute {
    
    internal var key: String { "controls" }
}

extension ControlsAttribute where Self: ContentNode {
    
    internal func mutate(controls value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension ControlsAttribute where Self: EmptyNode {
    
    internal func mutate(controls value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the coordinates handler.
public protocol CoordinatesAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'coordinates'.
    ///
    /// ```html
    /// <tag coordinates="" />
    /// ```
    func coordinates(_ value: String) -> Self
}

extension CoordinatesAttribute {
    
    internal var key: String { "coords" }
}

extension CoordinatesAttribute where Self: ContentNode {
    
    internal func mutate(coords value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension CoordinatesAttribute where Self: EmptyNode {
    
    internal func mutate(coords value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the date handler.
public protocol DataAttribute: AnyAttribute{
    
    /// The function represents the html-attribute 'data'.
    ///
    /// ```html
    /// <tag data="" />
    /// ```
    func data(_ value: String) -> Self
}

extension DataAttribute {
    
    internal var key: String { "data" }
}

extension DataAttribute where Self: ContentNode {
    
    internal func mutate(data value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension DataAttribute where Self: EmptyNode {
    
    internal func mutate(data value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the datetime handler.
public protocol DateTimeAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'datetime'.
    ///
    /// ```html
    /// <tag datetime="" />
    /// ```
    func dateTime(_ value: String) -> Self
}

extension DateTimeAttribute {
    
    internal var key: String { "datetime" }
}

extension DateTimeAttribute where Self: ContentNode {
    
    internal func mutate(datetime value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension DateTimeAttribute where Self: EmptyNode {
    
    internal func mutate(datetime value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the default handler.
public protocol DefaultAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'default'.
    ///
    /// ```html
    /// <tag default />
    /// ```
    func `default`() -> Self
}

extension DefaultAttribute {
    
    internal var key: String { "default" }
}

extension DefaultAttribute where Self: ContentNode {
    
    internal func mutate(default value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension DefaultAttribute where Self: EmptyNode {
    
    internal func mutate(default value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the defer handler.
public protocol DeferAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'defer'.
    ///
    /// ```html
    /// <tag defer />
    /// ```
    func `defer`() -> Self
}

extension DeferAttribute {
    
    internal var key: String { "defer" }
}

extension DeferAttribute where Self: ContentNode {
    
    internal func mutate(defer value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension DeferAttribute where Self: EmptyNode {
    
    internal func mutate(defer value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the direction handler.
public protocol DirectionAttribute: AnyAttribute {

    /// The function represents the html-attribute 'dir'.
    ///
    /// It specifies the element's text directionality.
    ///
    /// ```html
    /// <tag dir="" />
    /// ```
    func direction(_ type: Direction) -> Self
}

extension DirectionAttribute {

    internal var key: String { "dir" }
}

extension DirectionAttribute where Self: ContentNode {
    
    internal func mutate(dir value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension DirectionAttribute where Self: EmptyNode {
    
    internal func mutate(dir value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the disabled handler
public protocol DisabledAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'disabled'.
    ///
    /// ```html
    /// <tag disabled />
    /// ```
    func disabled() -> Self
}

extension DisabledAttribute {
    
    internal var key: String { "disabled" }
}

extension DisabledAttribute where Self: ContentNode {
    
    internal func mutate(disabled value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension DisabledAttribute where Self: EmptyNode {
    
    internal func mutate(disabled value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the download handler.
public protocol DownloadAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'download'.
    ///
    /// ```html
    /// <tag download />
    /// ```
    func download() -> Self
}

extension DownloadAttribute {
    
    internal var key: String { "download" }
}

extension DownloadAttribute where Self: ContentNode {
    
    internal func mutate(download value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension DownloadAttribute where Self: EmptyNode {
    
    internal func mutate(download value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the isdraggable handler.
public protocol DragAttribute: AnyAttribute {
 
    /// The function represents the html-attribute 'draggable'.
    ///
    /// ```html
    /// <tag draggable />
    /// ```
    func isDraggable(_ condition: Bool) -> Self
}

extension DragAttribute {
    
    internal var key: String { "draggable" }
}

extension DragAttribute where Self: ContentNode {
    
    internal func mutate(draggable value: Bool) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension DragAttribute where Self: EmptyNode {
    
    internal func mutate(draggable value: Bool) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the encoding handler.
public protocol EncodingAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'enctype'.
    ///
    /// It specifies encoding type to use for form submission.
    ///
    /// ```html
    /// <tag enctype="" />
    /// ```
    func encoding(_ type: Encoding) -> Self
}

extension EncodingAttribute {
    
    internal var key: String { "enctype" }
}

extension EncodingAttribute where Self: ContentNode {
    
    internal func mutate(enctype value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension EncodingAttribute where Self: EmptyNode {
    
    internal func mutate(enctype value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the enterkeyhint handler.
public protocol EnterKeyHintAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'enterkeyhint'.
    ///
    /// It specifies what action label to present for the enter key on virtual keyboards.
    ///
    /// ```html
    /// <tag enterkeyhint="" />
    /// ```
    func enterKeyHint(_ type: Hint) -> Self
}

extension EnterKeyHintAttribute {
    
    internal var key: String { "enterkeyhint" }
}

extension EnterKeyHintAttribute where Self: ContentNode {
    
    internal func mutate(enterkeyhint value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension EnterKeyHintAttribute where Self: EmptyNode {
    
    internal func mutate(enterkeyhint value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the for handler.
public protocol ForAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'for'.
    ///
    /// It specifies the form control with wich the caption is be associated.
    ///
    /// ```html
    /// <tag for="" />
    /// ```
    func `for`(_ value: String) -> Self
}

extension ForAttribute {
    
    internal var key: String { "for" }
}

extension ForAttribute where Self: ContentNode {
    
    internal func mutate(for value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension ForAttribute where Self: EmptyNode {
    
    internal func mutate(for value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the form handler.
public protocol FormAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'form'.
    ///
    /// ```html
    /// <tag form="" />
    /// ```
    func form(_ value: String) -> Self
}

extension FormAttribute {
    
    internal var key: String { "form" }
}

extension FormAttribute where Self: ContentNode {
    
    internal func mutate(form value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension FormAttribute where Self: EmptyNode {
    
    internal func mutate(form value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the formaction handler.
public protocol FormActionAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'formaction'.
    ///
    /// It sets the url to use for form submissions
    ///
    /// ```html
    /// <tag formaction="" />
    /// ```
    func formAction(_ value: String) -> Self
}

extension FormActionAttribute {
    
    internal var key: String { "formaction" }
}

extension FormActionAttribute where Self: ContentNode {
    
    internal func mutate(formaction value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension FormActionAttribute where Self: EmptyNode {
    
    internal func mutate(formaction value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the http-equiv handler.
public protocol EquivalentAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'http-equiv'.
    ///
    /// It specifiies the header cells for the element.
    ///
    /// ```html
    /// <tag http-equiv="" />
    /// ```
    func equivalent(_ value: Equivalent) -> Self
}

extension EquivalentAttribute {
    
    internal var key: String { "http-equiv" }
}

extension HeaderAttribute where Self: ContentNode {
    
    internal func mutate(httpequiv value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension EquivalentAttribute where Self: EmptyNode {
    
    internal func mutate(httpequiv value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the headers handler.
public protocol HeaderAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'headers'.
    ///
    /// It specifiies the header cells for the element.
    ///
    /// ```html
    /// <tag headers="" />
    /// ```
    func headers(_ value: String) -> Self
}

extension HeaderAttribute {
    
    internal var key: String { "headers" }
}

extension HeaderAttribute where Self: ContentNode {
    
    internal func mutate(headers value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension HeaderAttribute where Self: EmptyNode {
    
    internal func mutate(headers value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the height handler.
public protocol HeightAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'height'.
    ///
    /// It sets the height of the element.
    ///
    /// ```html
    /// <tag height="" />
    /// ```
    func height(_ size: Int) -> Self
}

extension HeightAttribute {
    
    internal var key: String { "height" }
}

extension HeightAttribute where Self: ContentNode {
    
    internal func mutate(height value: Int) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension HeightAttribute where Self: EmptyNode {
    
    internal func mutate(height value: Int) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with hidden handler.
public protocol HiddenAttribute: AnyAttribute {
 
    /// The function represents the html-attribute 'hidden'.
    ///
    /// ```html
    /// <tag hidden />
    /// ```
    func hidden() -> Self
}

extension HiddenAttribute {

    internal var key: String { "hidden" }
}

extension HiddenAttribute where Self: ContentNode {
    
    internal func mutate(hidden value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension HiddenAttribute where Self: EmptyNode {
    
    internal func mutate(hidden value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with high handler.
public protocol HighAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'high'.
    ///
    /// It sets the range of the value.
    ///
    /// ```html
    /// <tag high="" />
    /// ```
    func high(_ value: Float) -> Self
}

extension HighAttribute {
    
    internal var key: String { "high" }
}

extension HighAttribute where Self: ContentNode {
    
    internal func mutate(high value: Float) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension HighAttribute where Self: EmptyNode {
    
    internal func mutate(high value: Float) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with reference handler.
public protocol ReferenceAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'href'.
    ///
    /// It gives the adress of the link.
    ///
    /// ```html
    /// <tag href="" />
    /// ```
    func reference(_ value: String) -> Self
    
    func reference(_ value: TemplateValue<String>) -> Self
}

extension ReferenceAttribute {
    
    internal var key: String { "href" }
}

extension ReferenceAttribute where Self: ContentNode {
    
    internal func mutate(href value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension ReferenceAttribute where Self: EmptyNode {
    
    internal func mutate(href value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the language reference handler.
public protocol ReferenceLanguageAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'hreflang'.
    ///
    /// It gives the language of the linked resource.
    ///
    /// ```html
    /// <tag hreflang="" />
    /// ```
    func referenceLanguage(_ type: Language) -> Self
}

extension ReferenceLanguageAttribute {

    internal var key: String { "hreflang" }
}

extension ReferenceLanguageAttribute where Self: ContentNode {
    
    internal func mutate(hreflang value: String) -> Self {
        self.mutate(key: key, value: value)
    }
}

extension ReferenceLanguageAttribute where Self: EmptyNode {
    
    internal func mutate(hreflang value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the id handler.
public protocol IdentifierAttribute: AnyAttribute {
 
    /// The function represents the html-attribute 'id'.
    ///
    /// It specifies its element's unique identifier.
    ///
    /// ```html
    /// <tag id="" />
    /// ```
    func id(_ value: String) -> Self
    
    func id(_ value: TemplateValue<String>) -> Self
}

extension IdentifierAttribute {
    
    internal var key: String { "id" }
}

extension IdentifierAttribute where Self: ContentNode {
    
    internal func mutate(id value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension IdentifierAttribute where Self: EmptyNode {
    
    internal func mutate(id value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the ismap handler.
public protocol IsMapAttribute: AnyAttribute {
 
    /// The function represents the html-attribute 'ismap'.
    ///
    /// ```html
    /// <tag ismap />
    /// ```
    func isMap() -> Self
}

extension IsMapAttribute {
    
    internal var key: String { "ismap" }
}

extension IsMapAttribute where Self: ContentNode {
    
    internal func mutate(ismap value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension IsMapAttribute where Self: EmptyNode {
    
    internal func mutate(ismap value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the inputmode handler.
public protocol InputModeAttribute: AnyAttribute {
 
    /// The function represents the html-attribute 'inputmode'.
    ///
    /// ```html
    /// <tag inputmode="" />
    /// ```
    func inputMode(_ value: String) -> Self
}

extension InputModeAttribute {
    
    internal var key: String { "inputmode" }
}

extension InputModeAttribute where Self: ContentNode {
    
    internal func mutate(inputmode value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension InputModeAttribute where Self: EmptyNode {
    
    internal func mutate(inputmode value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the inputmode handler.
public protocol IsAttribute: AnyAttribute {
 
    /// The function represents the html-attribute 'is'.
    ///
    /// ```html
    /// <tag is="" />
    /// ```
    func `is`(_ value: String) -> Self
}

extension IsAttribute {
    
    internal var key: String { "is" }
}

extension IsAttribute where Self: ContentNode {
    
    internal func mutate(is value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension IsAttribute where Self: EmptyNode {
    
    internal func mutate(is value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the itemid handler.
public protocol ItemIdAttribute: AnyAttribute {
 
    /// The function represents the html-attribute 'itemid'.
    ///
    /// ```html
    /// <tag itemid="" />
    /// ```
    func itemId(_ value: String) -> Self
}

extension ItemIdAttribute {
    
    internal var key: String { "itemid" }
}

extension ItemIdAttribute where Self: ContentNode {
    
    internal func mutate(itemid value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension ItemIdAttribute where Self: EmptyNode {
    
    internal func mutate(itemid value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the itemproperty handler.
public protocol ItemPropertyAttribute: AnyAttribute {
 
    /// The function represents the html-attribute 'itemprop'.
    ///
    /// ```html
    /// <tag itemprop="" />
    /// ```
    func itemProperty(_ value: String) -> Self
}

extension ItemPropertyAttribute {
    
    internal var key: String { "itemprop" }
}

extension ItemPropertyAttribute where Self: ContentNode {
    
    internal func mutate(itemprop value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension ItemPropertyAttribute where Self: EmptyNode {
    
    internal func mutate(itemprop value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the itemreference handler.
public protocol ItemReferenceAttribute: AnyAttribute {
 
    /// The function represents the html-attribute 'itemref'.
    ///
    /// ```html
    /// <tag itemref="" />
    /// ```
    func itemReference(_ value: String) -> Self
}

extension ItemReferenceAttribute {
    
    internal var key: String { "itemref" }
}

extension ItemReferenceAttribute where Self: ContentNode {
    
    internal func mutate(itemref value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension ItemReferenceAttribute where Self: EmptyNode {
    
    internal func mutate(itemref value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the itemscope handler.
public protocol ItemScopeAttribute: AnyAttribute {
 
    /// The function represents the html-attribute 'itemscope'.
    ///
    /// ```html
    /// <tag itemscope="" />
    /// ```
    func itemScope(_ value: String) -> Self
}

extension ItemScopeAttribute {
    
    internal var key: String { "itemscope" }
}

extension ItemScopeAttribute where Self: ContentNode {
    
    internal func mutate(itemscope value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension ItemScopeAttribute where Self: EmptyNode {
    
    internal func mutate(itemscope value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the itemtype handler
public protocol ItemTypeAttribute: AnyAttribute {
 
    /// The function represents the html-attribute 'itemtype'.
    ///
    /// ```html
    /// <tag itemtype="" />
    /// ```
    func itemType(_ value: String) -> Self
}

extension ItemTypeAttribute {
    
    internal var key: String { "itemtype" }
}

extension ItemTypeAttribute where Self: ContentNode {
    
    internal func mutate(itemtype value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension ItemTypeAttribute where Self: EmptyNode {
    
    internal func mutate(itemtype value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the kind handler.
public protocol KindAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'kind'.
    ///
    /// ```html
    /// <tag kind="" />
    /// ```
    func kind(_ type: Kinds) -> Self
}

extension KindAttribute {
    
    internal var key: String { "kind" }
}

extension KindAttribute where Self: ContentNode {
    
    internal func mutate(kind value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension KindAttribute where Self: EmptyNode {
    
    internal func mutate(kind value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the label handler.
public protocol LabelAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'label'.
    ///
    /// ```html
    /// <tag label="" />
    /// ```
    func label(_ value: String) -> Self
}

extension LabelAttribute {
    
    internal var key: String { "label" }
}

extension LabelAttribute where Self: ContentNode {
    
    internal func mutate(label value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension LabelAttribute where Self: EmptyNode {
    
    internal func mutate(label value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the language handler.
public protocol LanguageAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'lang'.
    ///
    /// ```html
    /// <tag lang="" />
    /// ```
    func language(_ type: Language) -> Self
}

extension LanguageAttribute {
    
    internal var key: String { "lang" }
}

extension LanguageAttribute where Self: ContentNode {
    
    internal func mutate(lang value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension LanguageAttribute where Self: EmptyNode {
    
    internal func mutate(lang value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the list handler.
public protocol ListAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'list'.
    ///
    /// ```html
    /// <tag list="" />
    /// ```
    func list(_ value: String) -> Self
}

extension ListAttribute {
    
    internal var key: String { "list" }
}

extension ListAttribute where Self: ContentNode {
    
    internal func mutate(list value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension ListAttribute where Self: EmptyNode {
    
    internal func mutate(list value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the loop handler.
public protocol LoopAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'loop'.
    ///
    /// ```html
    /// <tag loop />
    /// ```
    func loop() -> Self
}

extension LoopAttribute {
    
    internal var key: String { "loop" }
}

extension LoopAttribute where Self: ContentNode {
    
    internal func mutate(loop value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension LoopAttribute where Self: EmptyNode {
    
    internal func mutate(loop value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the low handler.
public protocol LowAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'low'.
    ///
    /// ```html
    /// <tag low="" />
    /// ```
    func low(_ value: Float) -> Self
}

extension LowAttribute {
    
    internal var key: String { "low" }
}

extension LowAttribute where Self: ContentNode {
    
    internal func mutate(low value: Float) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension LowAttribute where Self: EmptyNode {
    
    internal func mutate(low value: Float) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the maximumvalue handler.
public protocol MaximumValueAttribute: AnyAttribute {
    
    associatedtype MaximumValueType
    
    /// The function represents the html-attribute 'max'.
    ///
    /// ```html
    /// <tag max="" />
    /// ```
    func maximum(_ value: MaximumValueType) -> Self
}

extension MaximumValueAttribute {

    internal var key: String { "max" }
}

extension MaximumValueAttribute where Self: ContentNode {
    
    internal func mutate(max value: MaximumValueType) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension MaximumValueAttribute where Self: EmptyNode {
    
    internal func mutate(max value: MaximumValueType) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the maximumlength handler.
public protocol MaximumLengthAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'maxlength'.
    ///
    /// ```html
    /// <tag maxlength="" />
    /// ```
    func maximum(length value: Int) -> Self
}

extension MaximumLengthAttribute {

    internal var key: String { "maxlength" }
}

extension MaximumLengthAttribute where Self: ContentNode {
    
    internal func mutate(maxlength value: Int) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension MaximumLengthAttribute where Self: EmptyNode {
    
    internal func mutate(maxlength value: Int) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the media handler.
public protocol MediaAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'media'.
    ///
    /// ```html
    /// <tag media="" />
    /// ```
    func media(_ value: String) -> Self
}

extension MediaAttribute {

    internal var key: String { "media" }
}

extension MediaAttribute where Self: ContentNode {
    
    internal func mutate(media value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension MediaAttribute where Self: EmptyNode {
    
    internal func mutate(media value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the method handler.
public protocol MethodAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'method'.
    ///
    /// ```html
    /// <tag method="" />
    /// ```
    func method(_ type: Method) -> Self
}

extension MethodAttribute {

    internal var key: String { "method" }
}

extension MethodAttribute where Self: ContentNode {
    
    internal func mutate(method value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension MethodAttribute where Self: EmptyNode {
    
    internal func mutate(method value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the minimumvalue handler.
public protocol MinimumValueAttribute: AnyAttribute {
    
    associatedtype MinimumValueType
    
    /// The function represents the html-attribute 'min'.
    ///
    /// ```html
    /// <tag min="" />
    /// ```
    func minimum(_ value: MinimumValueType) -> Self
}

extension MinimumValueAttribute {

    internal var key: String { "min" }
}

extension MinimumValueAttribute where Self: ContentNode {
    
    internal func mutate(min value: MinimumValueType) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension MinimumValueAttribute where Self: EmptyNode {
    
    internal func mutate(min value: MinimumValueType) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the minimumlength handler.
public protocol MinimumLengthAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'minlength'.
    ///
    /// ```html
    /// <tag minlength="" />
    /// ```
    func minimum(length value: Int) -> Self
}

extension MinimumLengthAttribute {

    internal var key: String { "minlength" }
}

extension MinimumLengthAttribute where Self: ContentNode {
    
    internal func mutate(minlength value: Int) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension MinimumLengthAttribute where Self: EmptyNode {
    
    internal func mutate(minlength value: Int) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the multiple handler.
public protocol MultipleAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'multiple'.
    ///
    /// ```html
    /// <tag multiple />
    /// ```
    func multiple() -> Self
}

extension MultipleAttribute {
    
    internal var key: String { "multiple" }
}

extension MultipleAttribute where Self: ContentNode {
    
    internal func mutate(multiple value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension MultipleAttribute where Self: EmptyNode {
    
    internal func mutate(multiple value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the muted handler.
public protocol MutedAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'muted'.
    ///
    /// ```html
    /// <tag muted />
    /// ```
    func muted() -> Self
}

extension MutedAttribute {
    
    internal var key: String { "muted" }
}

extension MutedAttribute where Self: ContentNode {
    
    internal func mutate(muted value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension MutedAttribute where Self: EmptyNode {
    
    internal func mutate(muted value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the name handler.
public protocol NameAttribute: AnyAttribute {

    associatedtype NameValue
    
    /// The function represents the html-attribute 'name'.
    ///
    /// ```html
    /// <tag name="" />
    /// ```
    func name(_ value: NameValue) -> Self
    
    /// The func adds
    func name(_ value: TemplateValue<NameValue>) -> Self
}

extension NameAttribute {
    
    internal var key: String { "name" }
}

extension NameAttribute where Self: ContentNode {
    
    internal func mutate(name value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension NameAttribute where Self: EmptyNode {
    
    internal func mutate(name value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the nonce handler.
public protocol NonceAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'nonce'.
    ///
    /// ```html
    /// <tag nonce="" />
    /// ```
    func nonce(_ value: String) -> Self
}

extension NonceAttribute {
    
    internal var key: String { "nonce" }
}

extension NonceAttribute where Self: ContentNode {
    
    internal func mutate(nonce value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension NonceAttribute where Self: EmptyNode {
    
    internal func mutate(nonce value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the novalidate handler.
public protocol NoValidateAttribute: AnyAttribute {

    /// The function represents the html-attribute 'novalidate'.
    ///
    /// ```html
    /// <tag novalidate />
    /// ```
    func novalidate() -> Self
}

extension NoValidateAttribute {
    
    internal var key: String { "novalidate" }
}

extension NoValidateAttribute where Self: ContentNode {
    
    internal func mutate(novalidate value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension NoValidateAttribute where Self: EmptyNode {
    
    internal func mutate(novalidate value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the open handler.
public protocol OpenAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'open'.
    ///
    /// ```html
    /// <tag open />
    /// ```
    func isOpen(_ condition: Bool) -> Self
}

extension OpenAttribute {
    
    internal var key: String { "open" }
}

extension OpenAttribute where Self: ContentNode {
    
    internal func mutate(open value: Bool) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension OpenAttribute where Self: EmptyNode {
    
    internal func mutate(open value: Bool) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the optimum handler.
public protocol OptimumAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'optimum'.
    ///
    /// ```html
    /// <tag optimum="" />
    /// ```
    func optimum(_ value: Float) -> Self
}

extension OptimumAttribute {
    
    internal var key: String { "optimum" }
}

extension OptimumAttribute where Self: ContentNode {
    
    internal func mutate(optimum value: Float) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension OptimumAttribute where Self: EmptyNode {
    
    internal func mutate(optimum value: Float) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the pattern handler.
public protocol PatternAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'pattern'.
    ///
    /// ```html
    /// <tag pattern="" />
    /// ```
    func pattern(_ regex: String) -> Self
}

extension PatternAttribute {
    
    internal var key: String { "pattern" }
}

extension PatternAttribute where Self: ContentNode {
    
    internal func mutate(pattern value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension PatternAttribute where Self: EmptyNode {
    
    internal func mutate(pattern value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the part handler.
public protocol PartAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'part'.
    ///
    /// ```html
    /// <tag part="" />
    /// ```
    func part(_ value: String) -> Self
}

extension PartAttribute {
    
    internal var key: String { "part" }
}

extension PartAttribute where Self: ContentNode {
    
    internal func mutate(part value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension PartAttribute where Self: EmptyNode {
    
    internal func mutate(part value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the ping handler.
public protocol PingAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'ping'.
    ///
    /// ```html
    /// <tag ping="" />
    /// ```
    func ping(_ value: String) -> Self
}

extension PingAttribute {

    internal var key: String { "ping" }
}

extension PingAttribute where Self: ContentNode {
    
    internal func mutate(ping value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension PingAttribute where Self: EmptyNode {
    
    internal func mutate(ping value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the placeholder handler.
public protocol PlaceholderAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'placeholder'.
    ///
    /// ```html
    /// <tag placeholder="" />
    /// ```
    func placeholder(_ value: String) -> Self
    
    func placeholder(_ value: TemplateValue<String>) -> Self
}

extension PlaceholderAttribute {
    
    internal var key: String { "placeholder" }
}

extension PlaceholderAttribute where Self: ContentNode {
    
    internal func mutate(placeholder value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension PlaceholderAttribute where Self: EmptyNode {
    
    internal func mutate(placeholder value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the poster handler.
public protocol PosterAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'poster'.
    ///
    /// ```html
    /// <tag poster="" />
    /// ```
    func poster(_ value: String) -> Self
}

extension PosterAttribute {

    internal var key: String { "poster" }
}

extension PosterAttribute where Self: ContentNode {
    
    internal func mutate(poster value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension PosterAttribute where Self: EmptyNode {
    
    internal func mutate(poster value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the preload handler.
public protocol PreloadAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'preload'.
    ///
    /// ```html
    /// <tag preload="" />
    /// ```
    func preload(_ value: String) -> Self
}

extension PreloadAttribute {
    
    internal var key: String { "preload" }
}

extension PreloadAttribute where Self: ContentNode {
    
    internal func mutate(preload value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension PreloadAttribute where Self: EmptyNode {
    
    internal func mutate(preload value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the readonly handler.
public protocol ReadyOnlyAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'readonly'.
    ///
    /// ```html
    /// <tag readonly />
    /// ```
    func readonly() -> Self
}

extension ReadyOnlyAttribute {
    
    internal var key: String { "readonly" }
}

extension ReadyOnlyAttribute where Self: ContentNode {
    
    internal func mutate(readonly value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension ReadyOnlyAttribute where Self: EmptyNode {
    
    internal func mutate(readonly value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the referrerpolicy handler.
public protocol ReferrerPolicyAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'referrerpolicy'.
    ///
    /// ```html
    /// <tag referrerpolicy="" />
    /// ```
    func referrerPolicy(_ type: Policy) -> Self
}

extension ReferrerPolicyAttribute {

    internal var key: String { "referrerpolicy" }
}

extension ReferrerPolicyAttribute where Self: ContentNode {
    
    internal func mutate(referrerpolicy value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension ReferrerPolicyAttribute where Self: EmptyNode {
    
    internal func mutate(referrerpolicy value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the relationship handler.
public protocol RelationshipAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'rel'.
    ///
    /// ```html
    /// <tag rel="" />
    /// ```
    func relationship(_ type: Relation) -> Self
}

extension RelationshipAttribute {
    
    internal var key: String { "rel" }
}

extension RelationshipAttribute where Self: ContentNode {
    
    internal func mutate(rel value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension RelationshipAttribute where Self: EmptyNode {
    
    internal func mutate(rel value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the required handler.
public protocol RequiredAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'required'.
    ///
    /// ```html
    /// <tag required />
    /// ```
    func required() -> Self
}

extension RequiredAttribute {
    
    internal var key: String { "required" }
}

extension RequiredAttribute where Self: ContentNode {
    
    internal func mutate(required value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension RequiredAttribute where Self: EmptyNode {
    
    internal func mutate(required value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the reversed handler.
public protocol ReversedAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'reversed'.
    ///
    /// ```html
    /// <tag reversed />
    /// ```
    func reversed() -> Self
}

extension ReversedAttribute {
    
    internal var key: String { "reversed" }
}

extension ReversedAttribute where Self: ContentNode {
    
    internal func mutate(reversed value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension ReversedAttribute where Self: EmptyNode {
    
    internal func mutate(reversed value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the role handler.
public protocol RoleAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'role'.
    ///
    /// ```html
    /// <tag role="" />
    /// ```
    func role(_ value: Roles) -> Self
}

extension RoleAttribute {
    
    internal var key: String { "role" }
}

extension RoleAttribute where Self: ContentNode {
    
    internal func mutate(role value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension RoleAttribute where Self: EmptyNode {
    
    internal func mutate(role value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the rows handler.
public protocol RowsAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'rows'.
    ///
    /// ```html
    /// <tag rows="" />
    /// ```
    func rows(_ size: Int) -> Self
}

extension RowsAttribute {

    internal var key: String { "rows" }
}

extension RowsAttribute where Self: ContentNode {
    
    internal func mutate(rows value: Int) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension RowsAttribute where Self: EmptyNode {
    
    internal func mutate(rows value: Int) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the rowspan handler.
public protocol RowSpanAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'rowspan'.
    ///
    /// ```html
    /// <tag rowspan="" />
    /// ```
    func rowSpan(_ size: Int) -> Self
}

extension RowSpanAttribute {

    internal var key: String { "rowspan" }
}

extension RowSpanAttribute where Self: ContentNode {
    
    internal func mutate(rowspan value: Int) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension RowSpanAttribute where Self: EmptyNode {
    
    internal func mutate(rowspan value: Int) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the sandbox handler.
public protocol SandboxAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'sandbox'.
    ///
    /// ```html
    /// <tag sandbox />
    /// ```
    func sandbox() -> Self
}

extension SandboxAttribute {
    
    internal var key: String { "sandbox" }
}

extension SandboxAttribute where Self: ContentNode {
    
    internal func mutate(sandbox value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension SandboxAttribute where Self: EmptyNode {
    
    internal func mutate(sandbox value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the scope handler.
public protocol ScopeAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'scope'.
    ///
    /// ```html
    /// <tag scope="" />
    /// ```
    func scope(_ value: String) -> Self
}

extension ScopeAttribute {

    internal var key: String { "scope" }
}

extension ScopeAttribute where Self: ContentNode {
    
    internal func mutate(scope value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension ScopeAttribute where Self: EmptyNode {
    
    internal func mutate(scope value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the shape handler.
public protocol ShapeAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'shape'.
    ///
    /// ```html
    /// <tag shape="" />
    /// ```
    func shape(_ type: Shape) -> Self
}

extension ShapeAttribute {

    internal var key: String { "shape" }
}

extension ShapeAttribute where Self: ContentNode {
    
    internal func mutate(shape value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension ShapeAttribute where Self: EmptyNode {
    
    internal func mutate(shape value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the size handler.
public protocol SizeAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'size'.
    ///
    /// ```html
    /// <tag size="" />
    /// ```
    func size(_ size: Int) -> Self
}

extension SizeAttribute {

    internal var key: String { "size" }
}

extension SizeAttribute where Self: ContentNode {
    
    internal func mutate(size value: Int) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension SizeAttribute where Self: EmptyNode {
    
    internal func mutate(size value: Int) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the sizes handler.
public protocol SizesAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'sizes'.
    ///
    /// ```html
    /// <tag sizes="" />
    /// ```
    func sizes(_ size: Int) -> Self
}

extension SizesAttribute {

    internal var key: String { "sizes" }
}

extension SizesAttribute where Self: ContentNode {
    
    internal func mutate(sizes value: Int) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension SizesAttribute where Self: EmptyNode {
    
    internal func mutate(sizes value: Int) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the slot handler.
public protocol SlotAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'slot'.
    ///
    /// ```html
    /// <tag slot="" />
    /// ```
    func slot(_ value: String) -> Self
}

extension SlotAttribute {
    
    internal var key: String { "slot" }
}

extension SlotAttribute where Self: ContentNode {
    
    internal func mutate(slot value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension SlotAttribute where Self: EmptyNode {
    
    internal func mutate(slot value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the span handler.
public protocol SpanAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'span'.
    ///
    /// ```html
    /// <tag span="" />
    /// ```
    func span(_ size: Int) -> Self
}

extension SpanAttribute {

    internal var key: String { "span" }
}

extension SpanAttribute where Self: ContentNode {
    
    internal func mutate(span value: Int) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension SpanAttribute where Self: EmptyNode {
    
    internal func mutate(span value: Int) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the hasspellcheck handler.
public protocol SpellCheckAttribute: AnyAttribute {
 
    /// The function represents the html-attribute 'spellcheck'.
    ///
    /// ```html
    /// <tag spellcheck="" />
    /// ```
    func hasSpellCheck(_ condition: Bool) -> Self
}

extension SpellCheckAttribute {
    
    internal var key: String { "spellcheck" }
}

extension SpellCheckAttribute where Self: ContentNode {
    
    internal func mutate(spellcheck value: Bool) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension SpellCheckAttribute where Self: EmptyNode {
    
    internal func mutate(spellcheck value: Bool) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the source handler.
public protocol SourceAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'src'.
    ///
    /// ```html
    /// <tag src="" />
    /// ```
    func source(_ value: String) -> Self
}

extension SourceAttribute {
    
    internal var key: String { "src" }
}

extension SourceAttribute where Self: ContentNode {
    
    internal func mutate(source value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension SourceAttribute where Self: EmptyNode {
    
    internal func mutate(source value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the start handler.
public protocol StartAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'start'.
    ///
    /// ```html
    /// <tag start="" />
    /// ```
    func start(_ size: Int) -> Self
}

extension StartAttribute {
    
    internal var key: String { "start" }
}

extension StartAttribute where Self: ContentNode {
    
    internal func mutate(start value: Int) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension StartAttribute where Self: EmptyNode {
    
    internal func mutate(start value: Int) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the step handler.
public protocol StepAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'step'.
    ///
    /// ```html
    /// <tag step="" />
    /// ```
    func step(_ size: Int) -> Self
}

extension StepAttribute {

    internal var key: String { "step" }
}

extension StepAttribute where Self: ContentNode {
    
    internal func mutate(step value: Int) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension StepAttribute where Self: EmptyNode {
    
    internal func mutate(step value: Int) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the style handler.
public protocol StyleAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'style'.
    ///
    /// ```html
    /// <tag style="" />
    /// ```
    func style(_ value: String) -> Self
}

extension StyleAttribute {
    
    internal var key: String { "style" }
}

extension StyleAttribute where Self: ContentNode {
    
    internal func mutate(style value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension StyleAttribute where Self: EmptyNode {
    
    internal func mutate(style value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the tabindex handler.
public protocol TabulatorAttribute: AnyAttribute {
 
    /// The function represents the html-attribute 'tabindex'.
    ///
    /// ```html
    /// <tag tabindex="" />
    /// ```
    func tabIndex(_ value: String) -> Self
}

extension TabulatorAttribute {
    
    internal var key: String { "tabindex" }
}

extension TabulatorAttribute where Self: ContentNode {
    
    internal func mutate(tabindex value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension TabulatorAttribute where Self: EmptyNode {
    
    internal func mutate(tabindex value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the target handler.
public protocol TargetAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'target'.
    ///
    /// ```html
    /// <tag target="" />
    /// ```
    func target(_ type: Target) -> Self
}

extension TargetAttribute {
    
    internal var key: String { "target" }
}

extension TargetAttribute where Self: ContentNode {
    
    internal func mutate(target value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension TargetAttribute where Self: EmptyNode {
    
    internal func mutate(target value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the title handler.
public protocol TitleAttribute: AnyAttribute {
 
    /// The function represents the html-attribute 'title'.
    ///
    /// ```html
    /// <tag title="" />
    /// ```
    func title(_ value: String) -> Self
}

extension TitleAttribute {
    
    internal var key: String { "title" }
}

extension TitleAttribute where Self: ContentNode {
    
    internal func mutate(title value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension TitleAttribute where Self: EmptyNode {
    
    internal func mutate(title value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the translate handler.
public protocol TranslateAttribute: AnyAttribute {
 
    /// The function represents the html-attribute 'translate'.
    ///
    /// ```html
    /// <tag translate="" />
    /// ```
    func translate(_ type: Decision) -> Self
}

extension TranslateAttribute {
    
    internal var key: String { "translate" }
}

extension TranslateAttribute where Self: ContentNode {
    
    internal func mutate(translate value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension TranslateAttribute where Self: EmptyNode {
    
    internal func mutate(translate value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the type handler.
public protocol TypeAttribute: AnyAttribute {

    associatedtype TypeValue
    
    /// The function represents the html-attribute 'type'.
    ///
    /// ```html
    /// <tag type="" />
    /// ```
    func type(_ value: TypeValue) -> Self
}

extension TypeAttribute {
    
    internal var key: String { "type" }
}

extension TypeAttribute where Self: ContentNode {
    
    internal func mutate(type value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension TypeAttribute where Self: EmptyNode {
    
    internal func mutate(type value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the value handler.
public protocol ValueAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'value'.
    ///
    /// ```html
    /// <tag value="" />
    /// ```
    func value(_ value: String) -> Self
    
    func value(_ value: TemplateValue<String>) -> Self
}

extension ValueAttribute {

    internal var key: String { "value" }
}

extension ValueAttribute where Self: ContentNode {
    
    internal func mutate(value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension ValueAttribute where Self: EmptyNode {
    
    internal func mutate(value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the width handler.
public protocol WidthAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'width'.
    ///
    /// ```html
    /// <tag width="" />
    /// ```
    func width(_ size: Int) -> Self
}

extension WidthAttribute {

    internal var key: String { "width" }
}

extension WidthAttribute where Self: ContentNode {
    
    internal func mutate(width value: Int) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension WidthAttribute where Self: EmptyNode {
    
    internal func mutate(width value: Int) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the wrap handler.
public protocol WrapAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'wrap'.
    ///
    /// ```html
    /// <tag wrap="" />
    /// ```
    func wrap(_ type: Wrapping) -> Self
}

extension WrapAttribute {

    internal var key: String { "wrap" }
}

extension WrapAttribute where Self: ContentNode {
    
    internal func mutate(wrap value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension WrapAttribute where Self: EmptyNode {
    
    internal func mutate(wrap value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the property handler.
public protocol PropertyAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'property'.
    ///
    /// ```html
    /// <tag property="" />
    /// ```
    ///
    /// - Parameter type:
    func property(_ type: Graphs) -> Self
}

extension PropertyAttribute {
    
    internal var key: String { "property" }
}

extension PropertyAttribute where Self: ContentNode {
    
    internal func mutate(property value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension PropertyAttribute where Self: EmptyNode {
    
    internal func mutate(property value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the selected handler.
public protocol SelectedAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'selected'.
    ///
    /// ```html
    /// <tag selected />
    /// ```
    func selected() -> Self
}

extension SelectedAttribute {
    
    internal var key: String { "selected" }
}

extension SelectedAttribute where Self: ContentNode {
    
    internal func mutate(selected value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

extension SelectedAttribute where Self: EmptyNode {
    
    internal func mutate(selected value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}
