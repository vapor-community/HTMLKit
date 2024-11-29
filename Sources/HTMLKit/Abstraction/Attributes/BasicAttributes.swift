/*
 Abstract:
 The file contains the protocols for the basic html-attributes.
 
 Note:
 If you about to add something to the file, stick to the official documentation to keep the code consistent.
 */

import OrderedCollections

/// The alias combines the global attributes of the basic attributes.
@_documentation(visibility: internal)
public typealias GlobalAttributes = AccessKeyAttribute & AutocapitalizeAttribute & AutofocusAttribute & ClassAttribute & EditAttribute & DirectionAttribute & DragAttribute & EnterKeyHintAttribute & HiddenAttribute & InputModeAttribute & IsAttribute & ItemIdAttribute & ItemPropertyAttribute & ItemReferenceAttribute & ItemScopeAttribute & ItemTypeAttribute & IdentifierAttribute & LanguageAttribute & NonceAttribute & RoleAttribute & SpellCheckAttribute & StyleAttribute & TabulatorAttribute & TitleAttribute & TranslateAttribute & InertAttribute & PopoverAttribute

/// The protocol provides the element with the accesskey handler.
@_documentation(visibility: internal)
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
}

extension AccessKeyAttribute where Self: ContentNode {
    
    internal func mutate(accesskey value: Character) -> Self {
        return self.mutate(key: "accesskey", value: value)
    }
}

extension AccessKeyAttribute where Self: EmptyNode {
    
    internal func mutate(accesskey value: Character) -> Self {
        return self.mutate(key: "accesskey", value: value)
    }
}

/// The protocol provides the element with the accept handler.
@_documentation(visibility: internal)
public protocol AcceptAttribute: Attribute {
    
    /// The function represents the html-attribute 'accept'.
    ///
    /// ```html
    /// <tag accept="" />
    /// ```
    func accept(_ value: String) -> Self
}

extension AcceptAttribute where Self: ContentNode {
    
    internal func mutate(accept value: String) -> Self {
        return self.mutate(key: "accept", value: value)
    }
}

extension AcceptAttribute where Self: EmptyNode {
    
    internal func mutate(accept value: String) -> Self {
        return self.mutate(key: "accept", value: value)
    }
}

/// The protocol provides the element with the action handler.
@_documentation(visibility: internal)
public protocol ActionAttribute: Attribute {
    
    /// The function represents the html-attribute 'action'.
    ///
    /// ```html
    /// <tag action="" />
    /// ```
    func action(_ value: String) -> Self
}

extension ActionAttribute where Self: ContentNode {
    
    internal func mutate(action value: String) -> Self {
        return self.mutate(key: "action", value: value)
    }
}

extension ActionAttribute where Self: EmptyNode {
    
    internal func mutate(action value: String) -> Self {
        return self.mutate(key: "action", value: value)
    }
}

/// The protocol provides the element with the alternate handler.
@_documentation(visibility: internal)
public protocol AlternateAttribute: Attribute {
    
    /// The function represents the html-attribute 'alt'.
    ///
    /// ```html
    /// <tag alt="" />
    /// ```
    func alternate(_ value: String) -> Self
}

extension AlternateAttribute where Self: ContentNode {
    
    internal func mutate(alternate value: String) -> Self {
        return self.mutate(key: "alt", value: value)
    }
}

extension AlternateAttribute where Self: EmptyNode {
    
    internal func mutate(alternate value: String) -> Self {
        return self.mutate(key: "alt", value: value)
    }
}

/// The protocol provides the element with the asynchronously handler.
@_documentation(visibility: internal)
public protocol AsynchronouslyAttribute: Attribute {
    
    /// The function represents the html-attribute 'async'.
    ///
    /// ```html
    /// <tag async="" />
    /// ```
    func asynchronously() -> Self
}

extension AsynchronouslyAttribute where Self: ContentNode {
    
    internal func mutate(async value: String) -> Self {
        return self.mutate(key: "async", value: value)
    }
}

extension AsynchronouslyAttribute where Self: EmptyNode {
    
    internal func mutate(async value: String) -> Self {
        return self.mutate(key: "async", value: value)
    }
}

/// The protocol provides the element with the autocapitalize handler.
@_documentation(visibility: internal)
public protocol AutocapitalizeAttribute: Attribute {
    
    /// The function represents the html-attribute 'autocapitalize'.
    ///
    /// ```html
    /// <tag autocapitalize="" />
    /// ```
    func autocapitalize(_ value: Values.Capitalization) -> Self
}

extension AutocapitalizeAttribute where Self: ContentNode {
    
    internal func mutate(autocapitalize value: String) -> Self {
        return self.mutate(key: "autocapitalize", value: value)
    }
}

extension AutocapitalizeAttribute where Self: EmptyNode {
    
    internal func mutate(autocapitalize value: String) -> Self {
        return self.mutate(key: "autocapitalize", value: value)
    }
}

/// The protocol provides the element with the autocomplete handler.
@_documentation(visibility: internal)
public protocol AutocompleteAttribute: Attribute {
    
    /// The function represents the html-attribute 'autocomplete'.
    ///
    /// ```html
    /// <tag autocomplete="" />
    /// ```
    func hasCompletion(_ value: Bool) -> Self
}

extension AutocompleteAttribute where Self: ContentNode {
    
    internal func mutate(autocomplete value: Bool) -> Self {
        return self.mutate(key: "autocomplete", value: value)
    }
}

extension AutocompleteAttribute where Self: EmptyNode {
    
    internal func mutate(autocomplete value: Bool) -> Self {
        return self.mutate(key: "autocomplete", value: value)
    }
}

/// The protocol provides the element with the autofocus handler.
@_documentation(visibility: internal)
public protocol AutofocusAttribute: Attribute {
    
    /// The function represents the html-attribute 'autofocus'.
    ///
    /// ```html
    /// <tag autofocus />
    /// ```
    func autofocus() -> Self
}

extension AutofocusAttribute where Self: ContentNode {
    
    internal func mutate(autofocus value: String) -> Self {
        return self.mutate(key: "autofocus", value: value)
    }
}

extension AutofocusAttribute where Self: EmptyNode {
    
    internal func mutate(autofocus value: String) -> Self {
        return self.mutate(key: "autofocus", value: value)
    }
}

/// The protocol provides the element with the autoplay handler.
@_documentation(visibility: internal)
public protocol AutoplayAttribute: Attribute {
    
    /// The function represents the html-attribute 'autoplay'.
    ///
    /// ```html
    /// <tag autoplay />
    /// ```
    func autoplay() -> Self
    
    func autoplay(_ condition: Bool) -> Self
}

extension AutoplayAttribute where Self: ContentNode {
    
    internal func mutate(autoplay value: String) -> Self {
        return self.mutate(key: "autoplay", value: value)
    }
}

extension AutoplayAttribute where Self: EmptyNode {
    
    internal func mutate(autoplay value: String) -> Self {
        return self.mutate(key: "autoplay", value: value)
    }
}

/// The protocol provides the element with the charset handler.
@_documentation(visibility: internal)
public protocol CharsetAttribute: Attribute {
    
    /// The function represents the html-attribute 'charset'.
    ///
    /// ```html
    /// <tag charset="" />
    /// ```
    func charset(_ value: Values.Charset) -> Self
}

extension CharsetAttribute where Self: ContentNode {
    
    internal func mutate(charset value: String) -> Self {
        return self.mutate(key: "charset", value: value)
    }
}

extension CharsetAttribute where Self: EmptyNode {
    
    internal func mutate(charset value: String) -> Self {
        return self.mutate(key: "charset", value: value)
    }
}

/// The protocol provides the element with the checked handler.
@_documentation(visibility: internal)
public protocol CheckedAttribute: Attribute {
    
    /// The function represents the html-attribute 'checked'.
    ///
    /// ```html
    /// <tag checked />
    /// ```
    func checked() -> Self
    
    func checked(_ condition: Bool) -> Self
}

extension CheckedAttribute where Self: ContentNode {
    
    internal func mutate(checked value: String) -> Self {
        return self.mutate(key: "checked", value: value)
    }
}

extension CheckedAttribute where Self: EmptyNode {
    
    internal func mutate(checked value: String) -> Self {
        return self.mutate(key: "checked", value: value)
    }
}

/// The protocol provides the element with the cite handler.
@_documentation(visibility: internal)
public protocol CiteAttribute: Attribute {
    
    /// The function represents the html-attribute 'cite'.
    ///
    /// ```html
    /// <tag cite="" />
    /// ```
    func cite(_ value: String) -> Self
}

extension CiteAttribute where Self: ContentNode {
    
    internal func mutate(cite value: String) -> Self {
        return self.mutate(key: "cite", value: value)
    }
}

extension CiteAttribute where Self: EmptyNode {
    
    internal func mutate(cite value: String) -> Self {
        return self.mutate(key: "cite", value: value)
    }
}

/// The protocol provides the element with the class handler.
@_documentation(visibility: internal)
public protocol ClassAttribute: Attribute{
    
    /// The function represents the html-attribute 'class'.
    ///
    /// ```html
    /// <tag class="" />
    /// ```
    func `class`(_ value: String) -> Self
}

extension ClassAttribute where Self: ContentNode {
    
    internal func mutate(class value: String) -> Self {
        return self.mutate(key: "class", value: value)
    }
}

extension ClassAttribute where Self: EmptyNode {
    
    internal func mutate(class value: String) -> Self {
        return self.mutate(key: "class", value: value)
    }
}

/// The protocol provides the element with the columns handler.
@_documentation(visibility: internal)
public protocol ColumnsAttribute: Attribute {
    
    /// The function represents the html-attribute 'cols'.
    ///
    /// ```html
    /// <tag cols="" />
    /// ```
    func columns(_ size: Int) -> Self
}

extension ColumnsAttribute where Self: ContentNode {
    
    internal func mutate(cols value: Int) -> Self {
        return self.mutate(key: "cols", value: value)
    }
}

extension ColumnsAttribute where Self: EmptyNode {
    
    internal func mutate(cols value: Int) -> Self {
        return self.mutate(key: "cols", value: value)
    }
}

/// The protocol provides the element with the columnspan handler.
@_documentation(visibility: internal)
public protocol ColumnSpanAttribute: Attribute {
    
    /// The function represents the html-attribute 'colspan'.
    ///
    /// ```html
    /// <tag colspan="" />
    /// ```
    func columnSpan(_ size: Int) -> Self
}

extension ColumnSpanAttribute where Self: ContentNode {
    
    internal func mutate(colspan value: Int) -> Self {
        return self.mutate(key: "colspan", value: value)
    }
}

extension ColumnSpanAttribute where Self: EmptyNode {
    
    internal func mutate(colspan value: Int) -> Self {
        return self.mutate(key: "colspan", value: value)
    }
}

/// The protocol provides the element with the content handler.
@_documentation(visibility: internal)
public protocol ContentAttribute: Attribute {
    
    /// The function represents the html-attribute 'content'.
    ///
    /// ```html
    /// <tag content="" />
    /// ```
    func content(_ value: String) -> Self
}

extension ContentAttribute where Self: ContentNode {
    
    internal func mutate(content value: String) -> Self {
        return self.mutate(key: "content", value: value)
    }
}

extension ContentAttribute where Self: EmptyNode {
    
    internal func mutate(content value: String) -> Self {
        return self.mutate(key: "content", value: value)
    }
}

/// The protocol provides the element with the iseditable handler.
@_documentation(visibility: internal)
public protocol EditAttribute: Attribute {
    
    /// The function represents the html-attribute 'contenteditable'.
    ///
    /// ```html
    /// <tag contenteditable />
    /// ```
    func isEditable(_ value: Bool) -> Self
}

extension EditAttribute where Self: ContentNode {
    
    internal func mutate(contenteditable value: Bool) -> Self {
        return self.mutate(key: "contenteditable", value: value)
    }
}

extension EditAttribute where Self: EmptyNode {
    
    internal func mutate(contenteditable value: Bool) -> Self {
        return self.mutate(key: "contenteditable", value: value)
    }
}

/// The protocol provides the element with the controls handler.
@_documentation(visibility: internal)
public protocol ControlsAttribute: Attribute {
    
    /// The function represents the html-attribute 'controls'.
    ///
    /// ```html
    /// <tag controls />
    /// ```
    func controls() -> Self
}

extension ControlsAttribute where Self: ContentNode {
    
    internal func mutate(controls value: String) -> Self {
        return self.mutate(key: "controls", value: value)
    }
}

extension ControlsAttribute where Self: EmptyNode {
    
    internal func mutate(controls value: String) -> Self {
        return self.mutate(key: "controls", value: value)
    }
}

/// The protocol provides the element with the coordinates handler.
@_documentation(visibility: internal)
public protocol CoordinatesAttribute: Attribute {
    
    /// The function represents the html-attribute 'coordinates'.
    ///
    /// ```html
    /// <tag coordinates="" />
    /// ```
    func coordinates(_ value: String) -> Self
}

extension CoordinatesAttribute where Self: ContentNode {
    
    internal func mutate(coords value: String) -> Self {
        return self.mutate(key: "coords", value: value)
    }
}

extension CoordinatesAttribute where Self: EmptyNode {
    
    internal func mutate(coords value: String) -> Self {
        return self.mutate(key: "coords", value: value)
    }
}

/// The protocol provides the element with the date handler.
@_documentation(visibility: internal)
public protocol DataAttribute: Attribute{
    
    /// The function represents the html-attribute 'data'.
    ///
    /// ```html
    /// <tag data="" />
    /// ```
    func data(_ value: String) -> Self
}

extension DataAttribute where Self: ContentNode {
    
    internal func mutate(data value: String) -> Self {
        return self.mutate(key: "data", value: value)
    }
}

extension DataAttribute where Self: EmptyNode {
    
    internal func mutate(data value: String) -> Self {
        return self.mutate(key: "data", value: value)
    }
}

/// The protocol provides the element with the datetime handler.
@_documentation(visibility: internal)
public protocol DateTimeAttribute: Attribute {
    
    /// The function represents the html-attribute 'datetime'.
    ///
    /// ```html
    /// <tag datetime="" />
    /// ```
    func dateTime(_ value: String) -> Self
}

extension DateTimeAttribute where Self: ContentNode {
    
    internal func mutate(datetime value: String) -> Self {
        return self.mutate(key: "datetime", value: value)
    }
}

extension DateTimeAttribute where Self: EmptyNode {
    
    internal func mutate(datetime value: String) -> Self {
        return self.mutate(key: "datetime", value: value)
    }
}

/// The protocol provides the element with the default handler.
@_documentation(visibility: internal)
public protocol DefaultAttribute: Attribute {
    
    /// The function represents the html-attribute 'default'.
    ///
    /// ```html
    /// <tag default />
    /// ```
    func `default`() -> Self
}

extension DefaultAttribute where Self: ContentNode {
    
    internal func mutate(default value: String) -> Self {
        return self.mutate(key: "default", value: value)
    }
}

extension DefaultAttribute where Self: EmptyNode {
    
    internal func mutate(default value: String) -> Self {
        return self.mutate(key: "default", value: value)
    }
}

/// The protocol provides the element with the defer handler.
@_documentation(visibility: internal)
public protocol DeferAttribute: Attribute {
    
    /// The function represents the html-attribute 'defer'.
    ///
    /// ```html
    /// <tag defer />
    /// ```
    func `defer`() -> Self
}

extension DeferAttribute where Self: ContentNode {
    
    internal func mutate(defer value: String) -> Self {
        return self.mutate(key: "defer", value: value)
    }
}

extension DeferAttribute where Self: EmptyNode {
    
    internal func mutate(defer value: String) -> Self {
        return self.mutate(key: "defer", value: value)
    }
}

/// The protocol provides the element with the direction handler.
@_documentation(visibility: internal)
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

extension DirectionAttribute where Self: ContentNode {
    
    internal func mutate(dir value: String) -> Self {
        return self.mutate(key: "dir", value: value)
    }
}

extension DirectionAttribute where Self: EmptyNode {
    
    internal func mutate(dir value: String) -> Self {
        return self.mutate(key: "dir", value: value)
    }
}

/// The protocol provides the element with the disabled handler
@_documentation(visibility: internal)
public protocol DisabledAttribute: Attribute {
    
    /// The function represents the html-attribute 'disabled'.
    ///
    /// ```html
    /// <tag disabled />
    /// ```
    func disabled() -> Self
    
    func disabled(_ condition: Bool) -> Self
}

extension DisabledAttribute where Self: ContentNode {
    
    internal func mutate(disabled value: String) -> Self {
        return self.mutate(key: "disabled", value: value)
    }
}

extension DisabledAttribute where Self: EmptyNode {
    
    internal func mutate(disabled value: String) -> Self {
        return self.mutate(key: "disabled", value: value)
    }
}

/// The protocol provides the element with the download handler.
@_documentation(visibility: internal)
public protocol DownloadAttribute: Attribute {
    
    /// The function represents the html-attribute 'download'.
    ///
    /// ```html
    /// <tag download />
    /// ```
    func download() -> Self
}

extension DownloadAttribute where Self: ContentNode {
    
    internal func mutate(download value: String) -> Self {
        return self.mutate(key: "download", value: value)
    }
}

extension DownloadAttribute where Self: EmptyNode {
    
    internal func mutate(download value: String) -> Self {
        return self.mutate(key: "download", value: value)
    }
}

/// The protocol provides the element with the isdraggable handler.
@_documentation(visibility: internal)
public protocol DragAttribute: Attribute {
 
    /// The function represents the html-attribute 'draggable'.
    ///
    /// ```html
    /// <tag draggable />
    /// ```
    func isDraggable(_ value: Bool) -> Self
}

extension DragAttribute where Self: ContentNode {
    
    internal func mutate(draggable value: Bool) -> Self {
        return self.mutate(key: "draggable", value: value)
    }
}

extension DragAttribute where Self: EmptyNode {
    
    internal func mutate(draggable value: Bool) -> Self {
        return self.mutate(key: "draggable", value: value)
    }
}

/// The protocol provides the element with the encoding handler.
@_documentation(visibility: internal)
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

extension EncodingAttribute where Self: ContentNode {
    
    internal func mutate(enctype value: String) -> Self {
        return self.mutate(key: "enctype", value: value)
    }
}

extension EncodingAttribute where Self: EmptyNode {
    
    internal func mutate(enctype value: String) -> Self {
        return self.mutate(key: "enctype", value: value)
    }
}

/// The protocol provides the element with the enterkeyhint handler.
@_documentation(visibility: internal)
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

extension EnterKeyHintAttribute where Self: ContentNode {
    
    internal func mutate(enterkeyhint value: String) -> Self {
        return self.mutate(key: "enterkeyhint", value: value)
    }
}

extension EnterKeyHintAttribute where Self: EmptyNode {
    
    internal func mutate(enterkeyhint value: String) -> Self {
        return self.mutate(key: "enterkeyhint", value: value)
    }
}

/// The protocol provides the element with the for handler.
@_documentation(visibility: internal)
public protocol ForAttribute: Attribute {
    
    /// The function represents the html-attribute 'for'.
    ///
    /// It specifies the form control with wich the caption is be associated.
    ///
    /// ```html
    /// <tag for="" />
    /// ```
    func `for`(_ value: String) -> Self
}

extension ForAttribute where Self: ContentNode {
    
    internal func mutate(for value: String) -> Self {
        return self.mutate(key: "for", value: value)
    }
}

extension ForAttribute where Self: EmptyNode {
    
    internal func mutate(for value: String) -> Self {
        return self.mutate(key: "for", value: value)
    }
}

/// The protocol provides the element with the form handler.
@_documentation(visibility: internal)
public protocol FormAttribute: Attribute {
    
    /// The function represents the html-attribute 'form'.
    ///
    /// ```html
    /// <tag form="" />
    /// ```
    func form(_ value: String) -> Self
}

extension FormAttribute where Self: ContentNode {
    
    internal func mutate(form value: String) -> Self {
        return self.mutate(key: "form", value: value)
    }
}

extension FormAttribute where Self: EmptyNode {
    
    internal func mutate(form value: String) -> Self {
        return self.mutate(key: "form", value: value)
    }
}

/// The protocol provides the element with the formaction handler.
@_documentation(visibility: internal)
public protocol FormActionAttribute: Attribute {
    
    /// The function represents the html-attribute 'formaction'.
    ///
    /// It sets the url to use for form submissions
    ///
    /// ```html
    /// <tag formaction="" />
    /// ```
    func formAction(_ value: String) -> Self
}

extension FormActionAttribute where Self: ContentNode {
    
    internal func mutate(formaction value: String) -> Self {
        return self.mutate(key: "formaction", value: value)
    }
}

extension FormActionAttribute where Self: EmptyNode {
    
    internal func mutate(formaction value: String) -> Self {
        return self.mutate(key: "formaction", value: value)
    }
}

/// The protocol provides the element with the http-equiv handler.
@_documentation(visibility: internal)
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

extension HeaderAttribute where Self: ContentNode {
    
    internal func mutate(httpequiv value: String) -> Self {
        return self.mutate(key: "http-equiv", value: value)
    }
}

extension EquivalentAttribute where Self: EmptyNode {
    
    internal func mutate(httpequiv value: String) -> Self {
        return self.mutate(key: "http-equiv", value: value)
    }
}

/// The protocol provides the element with the headers handler.
@_documentation(visibility: internal)
public protocol HeaderAttribute: Attribute {
    
    /// The function represents the html-attribute 'headers'.
    ///
    /// It specifiies the header cells for the element.
    ///
    /// ```html
    /// <tag headers="" />
    /// ```
    func headers(_ value: String) -> Self
}

extension HeaderAttribute where Self: ContentNode {
    
    internal func mutate(headers value: String) -> Self {
        return self.mutate(key: "headers", value: value)
    }
}

extension HeaderAttribute where Self: EmptyNode {
    
    internal func mutate(headers value: String) -> Self {
        return self.mutate(key: "headers", value: value)
    }
}

/// The protocol provides the element with the height handler.
@_documentation(visibility: internal)
public protocol HeightAttribute: Attribute {
    
    /// The function represents the html-attribute 'height'.
    ///
    /// It sets the height of the element.
    ///
    /// ```html
    /// <tag height="" />
    /// ```
    func height(_ size: Int) -> Self
}

extension HeightAttribute where Self: ContentNode {
    
    internal func mutate(height value: Int) -> Self {
        return self.mutate(key: "height", value: value)
    }
}

extension HeightAttribute where Self: EmptyNode {
    
    internal func mutate(height value: Int) -> Self {
        return self.mutate(key: "height", value: value)
    }
}

/// The protocol provides the element with hidden handler.
@_documentation(visibility: internal)
public protocol HiddenAttribute: Attribute {
 
    /// The function represents the html-attribute 'hidden'.
    ///
    /// ```html
    /// <tag hidden />
    /// ```
    func hidden() -> Self
    
    func hidden(_ condition: Bool) -> Self
}

extension HiddenAttribute where Self: ContentNode {
    
    internal func mutate(hidden value: String) -> Self {
        return self.mutate(key: "hidden", value: value)
    }
}

extension HiddenAttribute where Self: EmptyNode {
    
    internal func mutate(hidden value: String) -> Self {
        return self.mutate(key: "hidden", value: value)
    }
}

/// The protocol provides the element with high handler.
@_documentation(visibility: internal)
public protocol HighAttribute: Attribute {
    
    /// The function represents the html-attribute 'high'.
    ///
    /// It sets the range of the value.
    ///
    /// ```html
    /// <tag high="" />
    /// ```
    func high(_ value: Float) -> Self
}

extension HighAttribute where Self: ContentNode {
    
    internal func mutate(high value: Float) -> Self {
        return self.mutate(key: "high", value: value)
    }
}

extension HighAttribute where Self: EmptyNode {
    
    internal func mutate(high value: Float) -> Self {
        return self.mutate(key: "high", value: value)
    }
}

/// The protocol provides the element with reference handler.
@_documentation(visibility: internal)
public protocol ReferenceAttribute: Attribute {
    
    /// The function represents the html-attribute 'href'.
    ///
    /// It gives the adress of the link.
    ///
    /// ```html
    /// <tag href="" />
    /// ```
    func reference(_ value: String) -> Self
}

extension ReferenceAttribute where Self: ContentNode {
    
    internal func mutate(href value: String) -> Self {
        return self.mutate(key: "href", value: value)
    }
}

extension ReferenceAttribute where Self: EmptyNode {
    
    internal func mutate(href value: String) -> Self {
        return self.mutate(key: "href", value: value)
    }
}

/// The protocol provides the element with the language reference handler.
@_documentation(visibility: internal)
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

extension ReferenceLanguageAttribute where Self: ContentNode {
    
    internal func mutate(hreflang value: String) -> Self {
        return self.mutate(key: "hreflang", value: value)
    }
}

extension ReferenceLanguageAttribute where Self: EmptyNode {
    
    internal func mutate(hreflang value: String) -> Self {
        return self.mutate(key: "hreflang", value: value)
    }
}

/// The protocol provides the element with the id handler.
@_documentation(visibility: internal)
public protocol IdentifierAttribute: Attribute {
 
    /// The function represents the html-attribute 'id'.
    ///
    /// It specifies its element's unique identifier.
    ///
    /// ```html
    /// <tag id="" />
    /// ```
    func id(_ value: String) -> Self
}

extension IdentifierAttribute where Self: ContentNode {
    
    internal func mutate(id value: String) -> Self {
        return self.mutate(key: "id", value: value)
    }
}

extension IdentifierAttribute where Self: EmptyNode {
    
    internal func mutate(id value: String) -> Self {
        return self.mutate(key: "id", value: value)
    }
}

/// The protocol provides the element with the ismap handler.
@_documentation(visibility: internal)
public protocol IsMapAttribute: Attribute {
 
    /// The function represents the html-attribute 'ismap'.
    ///
    /// ```html
    /// <tag ismap />
    /// ```
    func isMap() -> Self
}

extension IsMapAttribute where Self: ContentNode {
    
    internal func mutate(ismap value: String) -> Self {
        return self.mutate(key: "ismap", value: value)
    }
}

extension IsMapAttribute where Self: EmptyNode {
    
    internal func mutate(ismap value: String) -> Self {
        return self.mutate(key: "ismap", value: value)
    }
}

/// The protocol provides the element with the inputmode handler.
@_documentation(visibility: internal)
public protocol InputModeAttribute: Attribute {
 
    /// The function represents the html-attribute 'inputmode'.
    ///
    /// ```html
    /// <tag inputmode="" />
    /// ```
    func inputMode(_ value: String) -> Self
}

extension InputModeAttribute where Self: ContentNode {
    
    internal func mutate(inputmode value: String) -> Self {
        return self.mutate(key: "inputmode", value: value)
    }
}

extension InputModeAttribute where Self: EmptyNode {
    
    internal func mutate(inputmode value: String) -> Self {
        return self.mutate(key: "inputmode", value: value)
    }
}

/// The protocol provides the element with the inputmode handler.
@_documentation(visibility: internal)
public protocol IsAttribute: Attribute {
 
    /// The function represents the html-attribute 'is'.
    ///
    /// ```html
    /// <tag is="" />
    /// ```
    func `is`(_ value: String) -> Self
}

extension IsAttribute where Self: ContentNode {
    
    internal func mutate(is value: String) -> Self {
        return self.mutate(key: "is", value: value)
    }
}

extension IsAttribute where Self: EmptyNode {
    
    internal func mutate(is value: String) -> Self {
        return self.mutate(key: "is", value: value)
    }
}

/// The protocol provides the element with the itemid handler.
@_documentation(visibility: internal)
public protocol ItemIdAttribute: Attribute {
 
    /// The function represents the html-attribute 'itemid'.
    ///
    /// ```html
    /// <tag itemid="" />
    /// ```
    func itemId(_ value: String) -> Self
}

extension ItemIdAttribute where Self: ContentNode {
    
    internal func mutate(itemid value: String) -> Self {
        return self.mutate(key: "itemid", value: value)
    }
}

extension ItemIdAttribute where Self: EmptyNode {
    
    internal func mutate(itemid value: String) -> Self {
        return self.mutate(key: "itemid", value: value)
    }
}

/// The protocol provides the element with the itemproperty handler.
@_documentation(visibility: internal)
public protocol ItemPropertyAttribute: Attribute {
 
    /// The function represents the html-attribute 'itemprop'.
    ///
    /// ```html
    /// <tag itemprop="" />
    /// ```
    func itemProperty(_ value: String) -> Self
}

extension ItemPropertyAttribute where Self: ContentNode {
    
    internal func mutate(itemprop value: String) -> Self {
        return self.mutate(key: "itemprop", value: value)
    }
}

extension ItemPropertyAttribute where Self: EmptyNode {
    
    internal func mutate(itemprop value: String) -> Self {
        return self.mutate(key: "itemprop", value: value)
    }
}

/// The protocol provides the element with the itemreference handler.
@_documentation(visibility: internal)
public protocol ItemReferenceAttribute: Attribute {
 
    /// The function represents the html-attribute 'itemref'.
    ///
    /// ```html
    /// <tag itemref="" />
    /// ```
    func itemReference(_ value: String) -> Self
}

extension ItemReferenceAttribute where Self: ContentNode {
    
    internal func mutate(itemref value: String) -> Self {
        return self.mutate(key: "itemref", value: value)
    }
}

extension ItemReferenceAttribute where Self: EmptyNode {
    
    internal func mutate(itemref value: String) -> Self {
        return self.mutate(key: "itemref", value: value)
    }
}

/// The protocol provides the element with the itemscope handler.
@_documentation(visibility: internal)
public protocol ItemScopeAttribute: Attribute {
 
    /// The function represents the html-attribute 'itemscope'.
    ///
    /// ```html
    /// <tag itemscope="" />
    /// ```
    func itemScope(_ value: String) -> Self
}

extension ItemScopeAttribute where Self: ContentNode {
    
    internal func mutate(itemscope value: String) -> Self {
        return self.mutate(key: "itemscope", value: value)
    }
}

extension ItemScopeAttribute where Self: EmptyNode {
    
    internal func mutate(itemscope value: String) -> Self {
        return self.mutate(key: "itemscope", value: value)
    }
}

/// The protocol provides the element with the itemtype handler
@_documentation(visibility: internal)
public protocol ItemTypeAttribute: Attribute {
 
    /// The function represents the html-attribute 'itemtype'.
    ///
    /// ```html
    /// <tag itemtype="" />
    /// ```
    func itemType(_ value: String) -> Self
}

extension ItemTypeAttribute where Self: ContentNode {
    
    internal func mutate(itemtype value: String) -> Self {
        return self.mutate(key: "itemtype", value: value)
    }
}

extension ItemTypeAttribute where Self: EmptyNode {
    
    internal func mutate(itemtype value: String) -> Self {
        return self.mutate(key: "itemtype", value: value)
    }
}

/// The protocol provides the element with the kind handler.
@_documentation(visibility: internal)
public protocol KindAttribute: Attribute {
    
    /// The function represents the html-attribute 'kind'.
    ///
    /// ```html
    /// <tag kind="" />
    /// ```
    func kind(_ value: Values.Kind) -> Self
}

extension KindAttribute where Self: ContentNode {
    
    internal func mutate(kind value: String) -> Self {
        return self.mutate(key: "kind", value: value)
    }
}

extension KindAttribute where Self: EmptyNode {
    
    internal func mutate(kind value: String) -> Self {
        return self.mutate(key: "kind", value: value)
    }
}

/// The protocol provides the element with the label handler.
@_documentation(visibility: internal)
public protocol LabelAttribute: Attribute {
    
    /// The function represents the html-attribute 'label'.
    ///
    /// ```html
    /// <tag label="" />
    /// ```
    func label(_ value: String) -> Self
}

extension LabelAttribute where Self: ContentNode {
    
    internal func mutate(label value: String) -> Self {
        return self.mutate(key: "label", value: value)
    }
}

extension LabelAttribute where Self: EmptyNode {
    
    internal func mutate(label value: String) -> Self {
        return self.mutate(key: "label", value: value)
    }
}

/// The protocol provides the element with the language handler.
@_documentation(visibility: internal)
public protocol LanguageAttribute: Attribute {
    
    /// The function represents the html-attribute 'lang'.
    ///
    /// ```html
    /// <tag lang="" />
    /// ```
    func language(_ value: Values.Language) -> Self
}

extension LanguageAttribute where Self: ContentNode {
    
    internal func mutate(lang value: String) -> Self {
        return self.mutate(key: "lang", value: value)
    }
}

extension LanguageAttribute where Self: EmptyNode {
    
    internal func mutate(lang value: String) -> Self {
        return self.mutate(key: "lang", value: value)
    }
}

/// The protocol provides the element with the list handler.
@_documentation(visibility: internal)
public protocol ListAttribute: Attribute {
    
    /// The function represents the html-attribute 'list'.
    ///
    /// ```html
    /// <tag list="" />
    /// ```
    func list(_ value: String) -> Self
}

extension ListAttribute where Self: ContentNode {
    
    internal func mutate(list value: String) -> Self {
        return self.mutate(key: "list", value: value)
    }
}

extension ListAttribute where Self: EmptyNode {
    
    internal func mutate(list value: String) -> Self {
        return self.mutate(key: "list", value: value)
    }
}

/// The protocol provides the element with the loop handler.
@_documentation(visibility: internal)
public protocol LoopAttribute: Attribute {
    
    /// The function represents the html-attribute 'loop'.
    ///
    /// ```html
    /// <tag loop />
    /// ```
    func loop() -> Self
}

extension LoopAttribute where Self: ContentNode {
    
    internal func mutate(loop value: String) -> Self {
        return self.mutate(key: "loop", value: value)
    }
}

extension LoopAttribute where Self: EmptyNode {
    
    internal func mutate(loop value: String) -> Self {
        return self.mutate(key: "loop", value: value)
    }
}

/// The protocol provides the element with the low handler.
@_documentation(visibility: internal)
public protocol LowAttribute: Attribute {
    
    /// The function represents the html-attribute 'low'.
    ///
    /// ```html
    /// <tag low="" />
    /// ```
    func low(_ value: Float) -> Self
}

extension LowAttribute where Self: ContentNode {
    
    internal func mutate(low value: Float) -> Self {
        return self.mutate(key: "low", value: value)
    }
}

extension LowAttribute where Self: EmptyNode {
    
    internal func mutate(low value: Float) -> Self {
        return self.mutate(key: "low", value: value)
    }
}

/// The protocol provides the element with the maximumvalue handler.
@_documentation(visibility: internal)
public protocol MaximumValueAttribute: Attribute {
    
    associatedtype MaximumValueType
    
    /// The function represents the html-attribute 'max'.
    ///
    /// ```html
    /// <tag max="" />
    /// ```
    func maximum(_ value: MaximumValueType) -> Self
}

extension MaximumValueAttribute where Self: ContentNode {
    
    internal func mutate(max value: MaximumValueType) -> Self {
        return self.mutate(key: "max", value: value)
    }
}

extension MaximumValueAttribute where Self: EmptyNode {
    
    internal func mutate(max value: MaximumValueType) -> Self {
        return self.mutate(key: "max", value: value)
    }
}

/// The protocol provides the element with the maximumlength handler.
@_documentation(visibility: internal)
public protocol MaximumLengthAttribute: Attribute {
    
    /// The function represents the html-attribute 'maxlength'.
    ///
    /// ```html
    /// <tag maxlength="" />
    /// ```
    func maximum(length value: Int) -> Self
}

extension MaximumLengthAttribute where Self: ContentNode {
    
    internal func mutate(maxlength value: Int) -> Self {
        return self.mutate(key: "maxlength", value: value)
    }
}

extension MaximumLengthAttribute where Self: EmptyNode {
    
    internal func mutate(maxlength value: Int) -> Self {
        return self.mutate(key: "maxlength", value: value)
    }
}

/// The protocol provides the element with the media handler.
@_documentation(visibility: internal)
public protocol MediaAttribute: Attribute {
    
    /// The function represents the html-attribute 'media'.
    ///
    /// ```html
    /// <tag media="" />
    /// ```
    func media(_ value: String) -> Self
}

extension MediaAttribute where Self: ContentNode {
    
    internal func mutate(media value: String) -> Self {
        return self.mutate(key: "media", value: value)
    }
}

extension MediaAttribute where Self: EmptyNode {
    
    internal func mutate(media value: String) -> Self {
        return self.mutate(key: "media", value: value)
    }
}

/// The protocol provides the element with the method handler.
@_documentation(visibility: internal)
public protocol MethodAttribute: Attribute {
    
    /// The function represents the html-attribute 'method'.
    ///
    /// ```html
    /// <tag method="" />
    /// ```
    func method(_ value: Values.Method) -> Self
}

extension MethodAttribute where Self: ContentNode {
    
    internal func mutate(method value: String) -> Self {
        return self.mutate(key: "method", value: value)
    }
}

extension MethodAttribute where Self: EmptyNode {
    
    internal func mutate(method value: String) -> Self {
        return self.mutate(key: "method", value: value)
    }
}

/// The protocol provides the element with the minimumvalue handler.
@_documentation(visibility: internal)
public protocol MinimumValueAttribute: Attribute {
    
    associatedtype MinimumValueType
    
    /// The function represents the html-attribute 'min'.
    ///
    /// ```html
    /// <tag min="" />
    /// ```
    func minimum(_ value: MinimumValueType) -> Self
}

extension MinimumValueAttribute where Self: ContentNode {
    
    internal func mutate(min value: MinimumValueType) -> Self {
        return self.mutate(key: "min", value: value)
    }
}

extension MinimumValueAttribute where Self: EmptyNode {
    
    internal func mutate(min value: MinimumValueType) -> Self {
        return self.mutate(key: "min", value: value)
    }
}

/// The protocol provides the element with the minimumlength handler.
@_documentation(visibility: internal)
public protocol MinimumLengthAttribute: Attribute {
    
    /// The function represents the html-attribute 'minlength'.
    ///
    /// ```html
    /// <tag minlength="" />
    /// ```
    func minimum(length value: Int) -> Self
}

extension MinimumLengthAttribute where Self: ContentNode {
    
    internal func mutate(minlength value: Int) -> Self {
        return self.mutate(key: "minlength", value: value)
    }
}

extension MinimumLengthAttribute where Self: EmptyNode {
    
    internal func mutate(minlength value: Int) -> Self {
        return self.mutate(key: "minlength", value: value)
    }
}

/// The protocol provides the element with the multiple handler.
@_documentation(visibility: internal)
public protocol MultipleAttribute: Attribute {
    
    /// The function represents the html-attribute 'multiple'.
    ///
    /// ```html
    /// <tag multiple />
    /// ```
    func multiple() -> Self
}

extension MultipleAttribute where Self: ContentNode {
    
    internal func mutate(multiple value: String) -> Self {
        return self.mutate(key: "multiple", value: value)
    }
}

extension MultipleAttribute where Self: EmptyNode {
    
    internal func mutate(multiple value: String) -> Self {
        return self.mutate(key: "multiple", value: value)
    }
}

/// The protocol provides the element with the muted handler.
@_documentation(visibility: internal)
public protocol MutedAttribute: Attribute {
    
    /// The function represents the html-attribute 'muted'.
    ///
    /// ```html
    /// <tag muted />
    /// ```
    func muted() -> Self
}

extension MutedAttribute where Self: ContentNode {
    
    internal func mutate(muted value: String) -> Self {
        return self.mutate(key: "muted", value: value)
    }
}

extension MutedAttribute where Self: EmptyNode {
    
    internal func mutate(muted value: String) -> Self {
        return self.mutate(key: "muted", value: value)
    }
}

/// The protocol provides the element with the name handler.
@_documentation(visibility: internal)
public protocol NameAttribute: Attribute {

    associatedtype NameValue
    
    /// The function represents the html-attribute 'name'.
    ///
    /// ```html
    /// <tag name="" />
    /// ```
    func name(_ value: NameValue) -> Self
}

extension NameAttribute where Self: ContentNode {
    
    internal func mutate(name value: String) -> Self {
        return self.mutate(key: "name", value: value)
    }
}

extension NameAttribute where Self: EmptyNode {
    
    internal func mutate(name value: String) -> Self {
        return self.mutate(key: "name", value: value)
    }
}

/// The protocol provides the element with the nonce handler.
@_documentation(visibility: internal)
public protocol NonceAttribute: Attribute {
    
    /// The function represents the html-attribute 'nonce'.
    ///
    /// ```html
    /// <tag nonce="" />
    /// ```
    func nonce(_ value: String) -> Self
}

extension NonceAttribute where Self: ContentNode {
    
    internal func mutate(nonce value: String) -> Self {
        return self.mutate(key: "nonce" , value: value)
    }
}

extension NonceAttribute where Self: EmptyNode {
    
    internal func mutate(nonce value: String) -> Self {
        return self.mutate(key: "nonce" , value: value)
    }
}

/// The protocol provides the element with the novalidate handler.
@_documentation(visibility: internal)
public protocol NoValidateAttribute: Attribute {

    /// The function represents the html-attribute 'novalidate'.
    ///
    /// ```html
    /// <tag novalidate />
    /// ```
    func novalidate() -> Self
}

extension NoValidateAttribute where Self: ContentNode {
    
    internal func mutate(novalidate value: String) -> Self {
        return self.mutate(key: "novalidate", value: value)
    }
}

extension NoValidateAttribute where Self: EmptyNode {
    
    internal func mutate(novalidate value: String) -> Self {
        return self.mutate(key: "novalidate", value: value)
    }
}

/// The protocol provides the element with the open handler.
@_documentation(visibility: internal)
public protocol OpenAttribute: Attribute {
    
    /// The function represents the html-attribute 'open'.
    ///
    /// ```html
    /// <tag open />
    /// ```
    func isOpen(_ value: Bool) -> Self
}

extension OpenAttribute where Self: ContentNode {
    
    internal func mutate(open value: Bool) -> Self {
        return self.mutate(key: "open", value: value)
    }
}

extension OpenAttribute where Self: EmptyNode {
    
    internal func mutate(open value: Bool) -> Self {
        return self.mutate(key: "open", value: value)
    }
}

/// The protocol provides the element with the optimum handler.
@_documentation(visibility: internal)
public protocol OptimumAttribute: Attribute {
    
    /// The function represents the html-attribute 'optimum'.
    ///
    /// ```html
    /// <tag optimum="" />
    /// ```
    func optimum(_ value: Float) -> Self
}

extension OptimumAttribute where Self: ContentNode {
    
    internal func mutate(optimum value: Float) -> Self {
        return self.mutate(key: "optimum", value: value)
    }
}

extension OptimumAttribute where Self: EmptyNode {
    
    internal func mutate(optimum value: Float) -> Self {
        return self.mutate(key: "optimum", value: value)
    }
}

/// The protocol provides the element with the pattern handler.
@_documentation(visibility: internal)
public protocol PatternAttribute: Attribute {
    
    /// The function represents the html-attribute 'pattern'.
    ///
    /// ```html
    /// <tag pattern="" />
    /// ```
    func pattern(_ regex: String) -> Self
}

extension PatternAttribute where Self: ContentNode {
    
    internal func mutate(pattern value: String) -> Self {
        return self.mutate(key: "pattern", value: value)
    }
}

extension PatternAttribute where Self: EmptyNode {
    
    internal func mutate(pattern value: String) -> Self {
        return self.mutate(key: "pattern", value: value)
    }
}

/// The protocol provides the element with the part handler.
@_documentation(visibility: internal)
public protocol PartAttribute: Attribute {
    
    /// The function represents the html-attribute 'part'.
    ///
    /// ```html
    /// <tag part="" />
    /// ```
    func part(_ value: String) -> Self
}

extension PartAttribute where Self: ContentNode {
    
    internal func mutate(part value: String) -> Self {
        return self.mutate(key: "part", value: value)
    }
}

extension PartAttribute where Self: EmptyNode {
    
    internal func mutate(part value: String) -> Self {
        return self.mutate(key: "part", value: value)
    }
}

/// The protocol provides the element with the ping handler.
@_documentation(visibility: internal)
public protocol PingAttribute: Attribute {
    
    /// The function represents the html-attribute 'ping'.
    ///
    /// ```html
    /// <tag ping="" />
    /// ```
    func ping(_ value: String) -> Self
}

extension PingAttribute where Self: ContentNode {
    
    internal func mutate(ping value: String) -> Self {
        return self.mutate(key: "ping", value: value)
    }
}

extension PingAttribute where Self: EmptyNode {
    
    internal func mutate(ping value: String) -> Self {
        return self.mutate(key: "ping", value: value)
    }
}

/// The protocol provides the element with the placeholder handler.
@_documentation(visibility: internal)
public protocol PlaceholderAttribute: Attribute {
    
    /// The function represents the html-attribute 'placeholder'.
    ///
    /// ```html
    /// <tag placeholder="" />
    /// ```
    func placeholder(_ value: String) -> Self
}

extension PlaceholderAttribute where Self: ContentNode {
    
    internal func mutate(placeholder value: String) -> Self {
        return self.mutate(key: "placeholder", value: value)
    }
}

extension PlaceholderAttribute where Self: EmptyNode {
    
    internal func mutate(placeholder value: String) -> Self {
        return self.mutate(key: "placeholder", value: value)
    }
}

/// The protocol provides the element with the poster handler.
@_documentation(visibility: internal)
public protocol PosterAttribute: Attribute {
    
    /// The function represents the html-attribute 'poster'.
    ///
    /// ```html
    /// <tag poster="" />
    /// ```
    func poster(_ value: String) -> Self
}

extension PosterAttribute where Self: ContentNode {
    
    internal func mutate(poster value: String) -> Self {
        return self.mutate(key: "poster", value: value)
    }
}

extension PosterAttribute where Self: EmptyNode {
    
    internal func mutate(poster value: String) -> Self {
        return self.mutate(key: "poster", value: value)
    }
}

/// The protocol provides the element with the preload handler.
@_documentation(visibility: internal)
public protocol PreloadAttribute: Attribute {
    
    /// The function represents the html-attribute 'preload'.
    ///
    /// ```html
    /// <tag preload="" />
    /// ```
    func preload(_ value: Values.Preload) -> Self
}

extension PreloadAttribute where Self: ContentNode {
    
    internal func mutate(preload value: String) -> Self {
        return self.mutate(key: "preload", value: value)
    }
}

extension PreloadAttribute where Self: EmptyNode {
    
    internal func mutate(preload value: String) -> Self {
        return self.mutate(key: "preload", value: value)
    }
}

/// The protocol provides the element with the readonly handler.
@_documentation(visibility: internal)
public protocol ReadyOnlyAttribute: Attribute {
    
    /// The function represents the html-attribute 'readonly'.
    ///
    /// ```html
    /// <tag readonly />
    /// ```
    func readonly() -> Self
    
    func readonly(_ condition: Bool) -> Self
}

extension ReadyOnlyAttribute where Self: ContentNode {
    
    internal func mutate(readonly value: String) -> Self {
        return self.mutate(key: "readonly", value: value)
    }
}

extension ReadyOnlyAttribute where Self: EmptyNode {
    
    internal func mutate(readonly value: String) -> Self {
        return self.mutate(key: "readonly", value: value)
    }
}

/// The protocol provides the element with the referrerpolicy handler.
@_documentation(visibility: internal)
public protocol ReferrerPolicyAttribute: Attribute {
    
    /// The function represents the html-attribute 'referrerpolicy'.
    ///
    /// ```html
    /// <tag referrerpolicy="" />
    /// ```
    func referrerPolicy(_ value: Values.Policy) -> Self
}

extension ReferrerPolicyAttribute where Self: ContentNode {
    
    internal func mutate(referrerpolicy value: String) -> Self {
        return self.mutate(key: "referrerpolicy", value: value)
    }
}

extension ReferrerPolicyAttribute where Self: EmptyNode {
    
    internal func mutate(referrerpolicy value: String) -> Self {
        return self.mutate(key: "referrerpolicy", value: value)
    }
}

/// The protocol provides the element with the relationship handler.
@_documentation(visibility: internal)
public protocol RelationshipAttribute: Attribute {
    
    /// The function represents the html-attribute 'rel'.
    ///
    /// ```html
    /// <tag rel="" />
    /// ```
    func relationship(_ value: Values.Relation) -> Self
}

extension RelationshipAttribute where Self: ContentNode {
    
    internal func mutate(rel value: String) -> Self {
        return self.mutate(key: "rel", value: value)
    }
}

extension RelationshipAttribute where Self: EmptyNode {
    
    internal func mutate(rel value: String) -> Self {
        return self.mutate(key: "rel", value: value)
    }
}

/// The protocol provides the element with the required handler.
@_documentation(visibility: internal)
public protocol RequiredAttribute: Attribute {
    
    /// The function represents the html-attribute 'required'.
    ///
    /// ```html
    /// <tag required />
    /// ```
    func required() -> Self
    
    func required(_ condition: Bool) -> Self
}

extension RequiredAttribute where Self: ContentNode {
    
    internal func mutate(required value: String) -> Self {
        return self.mutate(key: "required", value: value)
    }
}

extension RequiredAttribute where Self: EmptyNode {
    
    internal func mutate(required value: String) -> Self {
        return self.mutate(key: "required", value: value)
    }
}

/// The protocol provides the element with the reversed handler.
@_documentation(visibility: internal)
public protocol ReversedAttribute: Attribute {
    
    /// The function represents the html-attribute 'reversed'.
    ///
    /// ```html
    /// <tag reversed />
    /// ```
    func reversed() -> Self
}

extension ReversedAttribute where Self: ContentNode {
    
    internal func mutate(reversed value: String) -> Self {
        return self.mutate(key: "reversed", value: value)
    }
}

extension ReversedAttribute where Self: EmptyNode {
    
    internal func mutate(reversed value: String) -> Self {
        return self.mutate(key: "reversed", value: value)
    }
}

/// The protocol provides the element with the role handler.
@_documentation(visibility: internal)
public protocol RoleAttribute: Attribute {
    
    /// The function represents the html-attribute 'role'.
    ///
    /// ```html
    /// <tag role="" />
    /// ```
    func role(_ value: Values.Role) -> Self
}

extension RoleAttribute where Self: ContentNode {
    
    internal func mutate(role value: String) -> Self {
        return self.mutate(key: "role", value: value)
    }
}

extension RoleAttribute where Self: EmptyNode {
    
    internal func mutate(role value: String) -> Self {
        return self.mutate(key: "role", value: value)
    }
}

/// The protocol provides the element with the rows handler.
@_documentation(visibility: internal)
public protocol RowsAttribute: Attribute {
    
    /// The function represents the html-attribute 'rows'.
    ///
    /// ```html
    /// <tag rows="" />
    /// ```
    func rows(_ size: Int) -> Self
}

extension RowsAttribute where Self: ContentNode {
    
    internal func mutate(rows value: Int) -> Self {
        return self.mutate(key: "rows", value: value)
    }
}

extension RowsAttribute where Self: EmptyNode {
    
    internal func mutate(rows value: Int) -> Self {
        return self.mutate(key: "rows", value: value)
    }
}

/// The protocol provides the element with the rowspan handler.
@_documentation(visibility: internal)
public protocol RowSpanAttribute: Attribute {
    
    /// The function represents the html-attribute 'rowspan'.
    ///
    /// ```html
    /// <tag rowspan="" />
    /// ```
    func rowSpan(_ size: Int) -> Self
}

extension RowSpanAttribute where Self: ContentNode {
    
    internal func mutate(rowspan value: Int) -> Self {
        return self.mutate(key: "rowspan", value: value)
    }
}

extension RowSpanAttribute where Self: EmptyNode {
    
    internal func mutate(rowspan value: Int) -> Self {
        return self.mutate(key: "rowspan", value: value)
    }
}

/// The protocol provides the element with the sandbox handler.
@_documentation(visibility: internal)
public protocol SandboxAttribute: Attribute {
    
    /// The function represents the html-attribute 'sandbox'.
    ///
    /// ```html
    /// <tag sandbox />
    /// ```
    func sandbox() -> Self
}

extension SandboxAttribute where Self: ContentNode {
    
    internal func mutate(sandbox value: String) -> Self {
        return self.mutate(key: "sandbox", value: value)
    }
}

extension SandboxAttribute where Self: EmptyNode {
    
    internal func mutate(sandbox value: String) -> Self {
        return self.mutate(key: "sandbox", value: value)
    }
}

/// A type that provides the `scope` modifier.
@_documentation(visibility: internal)
public protocol ScopeAttribute: Attribute {
    
    /// Define the scope for a header cell
    ///
    /// It specifies wether the cell is for a column, row or a group of columns
    /// and rows.
    ///
    /// ```swift
    /// TableRow {
    ///     HeaderCell {
    ///         "..."
    ///     }
    ///     .scope(.column)
    /// }
    /// ```
    ///
    /// - Parameter value: The scope of the header cell
    func scope(_ value: Values.Scope) -> Self
}

extension ScopeAttribute where Self: ContentNode {
    
    internal func mutate(scope value: String) -> Self {
        return self.mutate(key: "scope", value: value)
    }
}

extension ScopeAttribute where Self: EmptyNode {
    
    internal func mutate(scope value: String) -> Self {
        return self.mutate(key: "scope", value: value)
    }
}

/// The protocol provides the element with the shape handler.
@_documentation(visibility: internal)
public protocol ShapeAttribute: Attribute {
    
    /// The function represents the html-attribute 'shape'.
    ///
    /// ```html
    /// <tag shape="" />
    /// ```
    func shape(_ value: Values.Shape) -> Self
}

extension ShapeAttribute where Self: ContentNode {
    
    internal func mutate(shape value: String) -> Self {
        return self.mutate(key: "shape", value: value)
    }
}

extension ShapeAttribute where Self: EmptyNode {
    
    internal func mutate(shape value: String) -> Self {
        return self.mutate(key: "shape", value: value)
    }
}

/// The protocol provides the element with the size handler.
@_documentation(visibility: internal)
public protocol SizeAttribute: Attribute {
    
    /// The function represents the html-attribute 'size'.
    ///
    /// ```html
    /// <tag size="" />
    /// ```
    func size(_ size: Int) -> Self
}

extension SizeAttribute where Self: ContentNode {
    
    internal func mutate(size value: Int) -> Self {
        return self.mutate(key: "size", value: value)
    }
}

extension SizeAttribute where Self: EmptyNode {
    
    internal func mutate(size value: Int) -> Self {
        return self.mutate(key: "size", value: value)
    }
}

/// The protocol provides the element with the sizes handler.
@_documentation(visibility: internal)
public protocol SizesAttribute: Attribute {
    
    /// The function represents the html-attribute 'sizes'.
    ///
    /// ```html
    /// <tag sizes="" />
    /// ```
    func sizes(_ size: Int) -> Self
}

extension SizesAttribute where Self: ContentNode {
    
    internal func mutate(sizes value: Int) -> Self {
        return self.mutate(key: "sizes", value: value)
    }
}

extension SizesAttribute where Self: EmptyNode {
    
    internal func mutate(sizes value: Int) -> Self {
        return self.mutate(key: "sizes", value: value)
    }
}

/// The protocol provides the element with the slot handler.
@_documentation(visibility: internal)
public protocol SlotAttribute: Attribute {
    
    /// The function represents the html-attribute 'slot'.
    ///
    /// ```html
    /// <tag slot="" />
    /// ```
    func slot(_ value: String) -> Self
}

extension SlotAttribute where Self: ContentNode {
    
    internal func mutate(slot value: String) -> Self {
        return self.mutate(key: "slot", value: value)
    }
}

extension SlotAttribute where Self: EmptyNode {
    
    internal func mutate(slot value: String) -> Self {
        return self.mutate(key: "slot", value: value)
    }
}

/// The protocol provides the element with the span handler.
@_documentation(visibility: internal)
public protocol SpanAttribute: Attribute {
    
    /// The function represents the html-attribute 'span'.
    ///
    /// ```html
    /// <tag span="" />
    /// ```
    func span(_ size: Int) -> Self
}

extension SpanAttribute where Self: ContentNode {
    
    internal func mutate(span value: Int) -> Self {
        return self.mutate(key: "span", value: value)
    }
}

extension SpanAttribute where Self: EmptyNode {
    
    internal func mutate(span value: Int) -> Self {
        return self.mutate(key: "span", value: value)
    }
}

/// The protocol provides the element with the hasspellcheck handler.
@_documentation(visibility: internal)
public protocol SpellCheckAttribute: Attribute {
 
    /// The function represents the html-attribute 'spellcheck'.
    ///
    /// ```html
    /// <tag spellcheck="" />
    /// ```
    func hasSpellCheck(_ value: Bool) -> Self
}

extension SpellCheckAttribute where Self: ContentNode {
    
    internal func mutate(spellcheck value: Bool) -> Self {
        return self.mutate(key: "spellcheck", value: value)
    }
}

extension SpellCheckAttribute where Self: EmptyNode {
    
    internal func mutate(spellcheck value: Bool) -> Self {
        return self.mutate(key: "spellcheck", value: value)
    }
}

/// The protocol provides the element with the source handler.
@_documentation(visibility: internal)
public protocol SourceAttribute: Attribute {
    
    /// The function represents the html-attribute 'src'.
    ///
    /// ```html
    /// <tag src="" />
    /// ```
    func source(_ value: String) -> Self
    
    func source(_ value: EnvironmentValue) -> Self
}

extension SourceAttribute where Self: ContentNode {
    
    internal func mutate(source value: String) -> Self {
        return self.mutate(key: "src", value: value)
    }
    
    internal func mutate(source value: EnvironmentValue) -> Self {
        return self.mutate(key: "src", value: value)
    }
}

extension SourceAttribute where Self: EmptyNode {
    
    internal func mutate(source value: String) -> Self {
        return self.mutate(key: "src", value: value)
    }
    
    internal func mutate(source value: EnvironmentValue) -> Self {
        return self.mutate(key: "src", value: value)
    }
}

/// The protocol provides the element with the start handler.
@_documentation(visibility: internal)
public protocol StartAttribute: Attribute {
    
    /// The function represents the html-attribute 'start'.
    ///
    /// ```html
    /// <tag start="" />
    /// ```
    func start(_ size: Int) -> Self
}

extension StartAttribute where Self: ContentNode {
    
    internal func mutate(start value: Int) -> Self {
        return self.mutate(key: "start", value: value)
    }
}

extension StartAttribute where Self: EmptyNode {
    
    internal func mutate(start value: Int) -> Self {
        return self.mutate(key: "start", value: value)
    }
}

/// The protocol provides the element with the step handler.
@_documentation(visibility: internal)
public protocol StepAttribute: Attribute {
    
    /// The function represents the html-attribute 'step'.
    ///
    /// ```html
    /// <tag step="" />
    /// ```
    func step(_ size: Int) -> Self
}

extension StepAttribute where Self: ContentNode {
    
    internal func mutate(step value: Int) -> Self {
        return self.mutate(key: "step", value: value)
    }
}

extension StepAttribute where Self: EmptyNode {
    
    internal func mutate(step value: Int) -> Self {
        return self.mutate(key: "step", value: value)
    }
}

/// The protocol provides the element with the style handler.
@_documentation(visibility: internal)
public protocol StyleAttribute: Attribute {
    
    /// The function represents the html-attribute 'style'.
    ///
    /// ```html
    /// <tag style="" />
    /// ```
    func style(_ value: String) -> Self
}

extension StyleAttribute where Self: ContentNode {
    
    internal func mutate(style value: String) -> Self {
        return self.mutate(key: "style", value: value)
    }
}

extension StyleAttribute where Self: EmptyNode {
    
    internal func mutate(style value: String) -> Self {
        return self.mutate(key: "style", value: value)
    }
}

/// The protocol provides the element with the tabindex handler.
@_documentation(visibility: internal)
public protocol TabulatorAttribute: Attribute {
 
    /// The function represents the html-attribute 'tabindex'.
    ///
    /// ```html
    /// <tag tabindex="" />
    /// ```
    func tabIndex(_ value: Int) -> Self
}

extension TabulatorAttribute where Self: ContentNode {
    
    internal func mutate(tabindex value: Int) -> Self {
        return self.mutate(key: "tabindex", value: value)
    }
}

extension TabulatorAttribute where Self: EmptyNode {
    
    internal func mutate(tabindex value: Int) -> Self {
        return self.mutate(key: "tabindex", value: value)
    }
}

/// The protocol provides the element with the target handler.
@_documentation(visibility: internal)
public protocol TargetAttribute: Attribute {
    
    /// The function represents the html-attribute 'target'.
    ///
    /// ```html
    /// <tag target="" />
    /// ```
    func target(_ value: Values.Target) -> Self
}

extension TargetAttribute where Self: ContentNode {
    
    internal func mutate(target value: String) -> Self {
        return self.mutate(key: "target", value: value)
    }
}

extension TargetAttribute where Self: EmptyNode {
    
    internal func mutate(target value: String) -> Self {
        return self.mutate(key: "target", value: value)
    }
}

/// The protocol provides the element with the title handler.
@_documentation(visibility: internal)
public protocol TitleAttribute: Attribute {
 
    /// The function represents the html-attribute 'title'.
    ///
    /// ```html
    /// <tag title="" />
    /// ```
    func title(_ value: String) -> Self
}

extension TitleAttribute where Self: ContentNode {
    
    internal func mutate(title value: String) -> Self {
        return self.mutate(key: "title", value: value)
    }
}

extension TitleAttribute where Self: EmptyNode {
    
    internal func mutate(title value: String) -> Self {
        return self.mutate(key: "title", value: value)
    }
}

/// The protocol provides the element with the translate handler.
@_documentation(visibility: internal)
public protocol TranslateAttribute: Attribute {
 
    /// The function represents the html-attribute 'translate'.
    ///
    /// ```html
    /// <tag translate="" />
    /// ```
    func translate(_ value: Values.Decision) -> Self
}

extension TranslateAttribute where Self: ContentNode {
    
    internal func mutate(translate value: String) -> Self {
        return self.mutate(key: "translate", value: value)
    }
}

extension TranslateAttribute where Self: EmptyNode {
    
    internal func mutate(translate value: String) -> Self {
        return self.mutate(key: "translate", value: value)
    }
}

/// The protocol provides the element with the type handler.
@_documentation(visibility: internal)
public protocol TypeAttribute: Attribute {

    associatedtype TypeValue
    
    /// The function represents the html-attribute 'type'.
    ///
    /// ```html
    /// <tag type="" />
    /// ```
    func type(_ value: TypeValue) -> Self
}

extension TypeAttribute where Self: ContentNode {
    
    internal func mutate(type value: String) -> Self {
        return self.mutate(key: "type", value: value)
    }
}

extension TypeAttribute where Self: EmptyNode {
    
    internal func mutate(type value: String) -> Self {
        return self.mutate(key: "type", value: value)
    }
}

/// The protocol provides the element with the value handler.
@_documentation(visibility: internal)
public protocol ValueAttribute: Attribute {
    
    /// The function represents the html-attribute 'value'.
    ///
    /// ```html
    /// <tag value="" />
    /// ```
    func value(_ value: String) -> Self
}

extension ValueAttribute where Self: ContentNode {
    
    internal func mutate(value: String) -> Self {
        return self.mutate(key: "value", value: value)
    }
}

extension ValueAttribute where Self: EmptyNode {
    
    internal func mutate(value: String) -> Self {
        return self.mutate(key: "value", value: value)
    }
}

/// The protocol provides the element with the width handler.
@_documentation(visibility: internal)
public protocol WidthAttribute: Attribute {
    
    /// The function represents the html-attribute 'width'.
    ///
    /// ```html
    /// <tag width="" />
    /// ```
    func width(_ size: Int) -> Self
}

extension WidthAttribute where Self: ContentNode {
    
    internal func mutate(width value: Int) -> Self {
        return self.mutate(key: "width", value: value)
    }
}

extension WidthAttribute where Self: EmptyNode {
    
    internal func mutate(width value: Int) -> Self {
        return self.mutate(key: "width", value: value)
    }
}

/// The protocol provides the element with the wrap handler.
@_documentation(visibility: internal)
public protocol WrapAttribute: Attribute {
    
    /// The function represents the html-attribute 'wrap'.
    ///
    /// ```html
    /// <tag wrap="" />
    /// ```
    func wrap(_ value: Values.Wrapping) -> Self
}

extension WrapAttribute where Self: ContentNode {
    
    internal func mutate(wrap value: String) -> Self {
        return self.mutate(key: "wrap", value: value)
    }
}

extension WrapAttribute where Self: EmptyNode {
    
    internal func mutate(wrap value: String) -> Self {
        return self.mutate(key: "wrap", value: value)
    }
}

/// The protocol provides the element with the property handler.
@_documentation(visibility: internal)
public protocol PropertyAttribute: Attribute {
    
    /// The function represents the html-attribute 'property'.
    ///
    /// ```html
    /// <tag property="" />
    /// ```
    ///
    /// - Parameter type:
    func property(_ value: Values.Graph) -> Self
}

extension PropertyAttribute where Self: ContentNode {
    
    internal func mutate(property value: String) -> Self {
        return self.mutate(key: "property", value: value)
    }
}

extension PropertyAttribute where Self: EmptyNode {
    
    internal func mutate(property value: String) -> Self {
        return self.mutate(key: "property", value: value)
    }
}

/// The protocol provides the element with the selected handler.
@_documentation(visibility: internal)
public protocol SelectedAttribute: Attribute {
    
    /// The function represents the html-attribute 'selected'.
    ///
    /// ```html
    /// <tag selected />
    /// ```
    func selected() -> Self
}

extension SelectedAttribute where Self: ContentNode {
    
    internal func mutate(selected value: String) -> Self {
        return self.mutate(key: "selected", value: value)
    }
}

extension SelectedAttribute where Self: EmptyNode {
    
    internal func mutate(selected value: String) -> Self {
        return self.mutate(key: "selected", value: value)
    }
}

/// The protocol provides the element with the shadowrootmode handler.
@_documentation(visibility: internal)
public protocol ShadowRootModeAttribute: Attribute {
    
    /// The function represents the html-attribute 'shadowrootmode'.
    ///
    /// ```html
    /// <tag shadowrootmode="" />
    /// ```
    func shadowRootMode(_ value: Values.Shadow.Mode) -> Self
}

extension ShadowRootModeAttribute where Self: ContentNode {
    
    internal func mutate(shadowrootmode value: String) -> Self {
        return self.mutate(key: "shadowrootmode", value: value)
    }
}

/// The protocol provides the element with inhert handler.
@_documentation(visibility: internal)
public protocol InertAttribute: Attribute {
    
    /// The function represents the html-attribute 'inert'.
    ///
    /// ```html
    /// <tag inert />
    /// ```
    func inert() -> Self
    
    func inert(_ condition: Bool) -> Self
}

extension InertAttribute where Self: ContentNode {
    
    internal func mutate(inert value: String) -> Self {
        return self.mutate(key: "inert", value: value)
    }
}

extension InertAttribute where Self: EmptyNode {
    
    internal func mutate(inert value: String) -> Self {
        return self.mutate(key: "inert", value: value)
    }
}

@_documentation(visibility: internal)
public protocol FetchPriorityAttribute: Attribute {
    
    /// The function represents the html-attribute 'shadowrootmode'.
    ///
    /// ```html
    /// <tag fetchpriority="" />
    /// ```
    func fetchPriority(_ value: Values.Priority) -> Self
}

extension FetchPriorityAttribute where Self: ContentNode {
    
    internal func mutate(fetchpriority value: String) -> Self {
        return self.mutate(key: "fetchpriority", value: value)
    }
}

extension FetchPriorityAttribute where Self: EmptyNode {
    
    internal func mutate(fetchpriority value: String) -> Self {
        return self.mutate(key: "fetchpriority", value: value)
    }
}

@_documentation(visibility: internal)
public protocol LoadingAttribute: Attribute {
    
    /// The function represents the html-attribute 'loading'.
    ///
    /// ```html
    /// <tag loading="" />
    /// ```
    func loading(_ value: Values.Loading) -> Self
}

extension LoadingAttribute where Self: ContentNode {
    
    internal func mutate(loading value: String) -> Self {
        return self.mutate(key: "loading", value: value)
    }
}

extension LoadingAttribute where Self: EmptyNode {
    
    internal func mutate(loading value: String) -> Self {
        return self.mutate(key: "loading", value: value)
    }
}

@_documentation(visibility: internal)
public protocol SourceSetAttribute: Attribute {
    
    /// The function represents the html-attribute 'loading'.
    ///
    /// ```html
    /// <tag srcset="" />
    /// ```
    func sourceSet(_ value: String) -> Self
}

extension SourceSetAttribute where Self: ContentNode {
    
    internal func mutate(sourceset value: String) -> Self {
        return self.mutate(key: "srcset", value: value)
    }
}

extension SourceSetAttribute where Self: EmptyNode {
    
    internal func mutate(sourceset value: String) -> Self {
        return self.mutate(key: "srcset", value: value)
    }
}

@_documentation(visibility: internal)
public protocol DecodingAttribute: Attribute {
    
    /// The function represents the html-attribute 'decoding'.
    ///
    /// ```html
    /// <tag decoding="" />
    /// ```
    func decoding(_ value: Values.Decoding) -> Self
}

extension DecodingAttribute where Self: ContentNode {
    
    internal func mutate(decoding value: String) -> Self {
        return self.mutate(key: "decoding", value: value)
    }
}

extension DecodingAttribute where Self: EmptyNode {
    
    internal func mutate(decoding value: String) -> Self {
        return self.mutate(key: "decoding", value: value)
    }
}

@_documentation(visibility: internal)
public protocol BlockingAttribute: Attribute {
    
    /// The function represents the html-attribute 'blocking'.
    ///
    /// ```html
    /// <tag blocking="" />
    /// ```
    func blocking(_ value: Values.Blocking) -> Self
}

extension BlockingAttribute where Self: ContentNode {
    
    internal func mutate(blocking value: String) -> Self {
        return self.mutate(key: "blocking", value: value)
    }
}

extension BlockingAttribute where Self: EmptyNode {
    
    internal func mutate(blocking value: String) -> Self {
        return self.mutate(key: "blocking", value: value)
    }
}

@_documentation(visibility: internal)
public protocol PopoverAttribute: Attribute {
    
    /// The function represents the html-attribute 'popover'.
    ///
    /// ```html
    /// <tag popover="" />
    /// ```
    func popover(_ value: Values.Popover.State) -> Self
}

extension PopoverAttribute where Self: ContentNode {
    
    internal func mutate(popover value: String) -> Self {
        return self.mutate(key: "popover", value: value)
    }
}

extension PopoverAttribute where Self: EmptyNode {
    
    internal func mutate(popover value: String) -> Self {
        return self.mutate(key: "popover", value: value)
    }
}

@_documentation(visibility: internal)
public protocol PopoverTargetAttribute: Attribute {
    
    /// The function represents the html-attribute 'popovertarget'.
    ///
    /// ```html
    /// <tag popovertarget="" />
    /// ```
    func popoverTarget(_ value: String) -> Self
}

extension PopoverAttribute where Self: ContentNode {
    
    internal func mutate(popovertarget value: String) -> Self {
        return self.mutate(key: "popovertarget", value: value)
    }
}

extension PopoverAttribute where Self: EmptyNode {
    
    internal func mutate(popovertarget value: String) -> Self {
        return self.mutate(key: "popovertarget", value: value)
    }
}

@_documentation(visibility: internal)
public protocol PopoverActionAttribute: Attribute {
    
    /// The function represents the html-attribute 'popovertargetaction'.
    ///
    /// ```html
    /// <tag popovertargetaction="" />
    /// ```
    func popoverAction(_ value: Values.Popover.Action) -> Self
}

extension PopoverAttribute where Self: ContentNode {
    
    internal func mutate(popoveraction value: String) -> Self {
        return self.mutate(key: "popovertargetaction", value: value)
    }
}

extension PopoverAttribute where Self: EmptyNode {
    
    internal func mutate(popoveraction value: String) -> Self {
        return self.mutate(key: "popovertargetaction", value: value)
    }
}
