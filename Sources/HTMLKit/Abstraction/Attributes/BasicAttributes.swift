import Foundation
import OrderedCollections

/// The alias combines the global attributes of the basic attributes.
@_documentation(visibility: internal)
public typealias GlobalAttributes = AccessKeyAttribute & AutocapitalizeAttribute & AutofocusAttribute & ClassAttribute & EditAttribute & DirectionAttribute & DragAttribute & EnterKeyAttribute & HiddenAttribute & InputModeAttribute & IsAttribute & ItemAttribute & ItemPropertyAttribute & IdentifierAttribute & LanguageAttribute & NonceAttribute & RoleAttribute & SpellCheckAttribute & StyleAttribute & TabulatorAttribute & TitleAttribute & TranslateAttribute & InertAttribute & PopoverAttribute

/// A type that provides the `accessKey` modifier.
@_documentation(visibility: internal)
public protocol AccessKeyAttribute: Attribute {
    
    /// Specifies a shortcut key.
    ///
    /// ```swift
    /// Anchor {
    ///     "Lorem ipsum..."
    /// }
    /// .accessKey("A")
    /// ```
    ///
    /// - Parameter value: The key to press.
    ///
    /// - Returns: The element
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

/// A type that provides the `accept` modifier.
@_documentation(visibility: internal)
public protocol AcceptAttribute: Attribute {
    
    /// Filter accepted file types for upload.
    ///
    /// ```swift
    /// Input()
    ///     .type(.file)
    ///     .accept(["image/png", "image/jpeg"])
    /// ```
    ///
    /// - Parameter specifiers: The file types to pick from.
    ///
    /// - Returns: The element
    func accept(_ specifiers: [String]) -> Self
    
    /// Filter accepted file types for upload.
    ///
    /// ```swift
    /// Input()
    ///     .type(.file)
    ///     .accept("image/png", "image/jpeg")
    /// ```
    ///
    /// - Parameter specifiers: The file types to pick from.
    ///
    /// - Returns: The element
    func accept(_ specifiers: String...) -> Self
    
    /// Filter accepted file types for upload.
    ///
    /// ```swift
    /// Input()
    ///     .type(.file)
    ///     .accept([.ogg, .mpeg])
    /// ```
    ///
    /// - Parameter specifiers: The file types to pick from.
    ///
    /// - Returns: The element
    func accept(_ specifiers: [Values.Media]) -> Self
    
    /// Filter accepted file types for upload.
    ///
    /// ```swift
    /// Input()
    ///     .type(.file)
    ///     .accept(.ogg, .mpeg)
    /// ```
    ///
    /// - Parameter specifiers: The file types to pick from.
    ///
    /// - Returns: The element
    func accept(_ specifiers: Values.Media...) -> Self
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

/// A type that provides the `action` modifier.
@_documentation(visibility: internal)
public protocol ActionAttribute: Attribute {
    
    /// Specify where to send the form data.
    ///
    /// ```swift
    /// Form {
    ///     Label {
    ///         "Lorem ipsum..."
    ///     }
    ///     Input()
    ///         .type(.text)
    ///         .name("lorem")
    ///     Button {
    ///         "Submit"
    ///     }
    ///     .type(.submit)
    /// }
    /// .action("https://...")
    /// .method(.get)
    /// ```
    ///
    /// - Parameter url: The url to send to.
    ///
    /// - Returns: The element
    func action(_ url: String) -> Self
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

/// A type that provides the `alternate` modifier.
@_documentation(visibility: internal)
public protocol AlternateAttribute: Attribute {
    
    /// Provide an alternative information.
    ///
    /// ```swift
    /// Image()
    ///     .alternate("Lorem ipsum...")
    /// ```
    ///
    /// - Parameter value: The text to describe the image.
    ///
    /// - Returns: The element
    func alternate(_ value: String) -> Self
    
    /// Provide an alternative information.
    /// 
    /// ```swift
    /// Image()
    ///     .alternate("Lorem ipsum...")
    /// ```
    ///
    /// - Parameter localizedKey: The string key to be translated.
    /// - Parameter tableName: The translation table to look in.
    ///
    /// - Returns: The element
    func alternate(_ localizedKey: LocalizedStringKey, tableName: String?) -> Self
    
    /// Provide an alternative information without localization.
    ///
    /// ```swift
    /// Image()
    ///     .alternate(verbatim: "Lorem ipsum...")
    /// ```
    ///
    /// - Parameter value: The text to describe the image.
    ///
    /// - Returns: The element
    func alternate(verbatim value: String) -> Self
    
}

extension AlternateAttribute where Self: ContentNode {
    
    internal func mutate(alternate value: String) -> Self {
        return self.mutate(key: "alt", value: value)
    }
    
    internal func mutate(alternate value: LocalizedString) -> Self {
        return self.mutate(key: "alt", value: value)
    }
}

extension AlternateAttribute where Self: EmptyNode {
    
    internal func mutate(alternate value: String) -> Self {
        return self.mutate(key: "alt", value: value)
    }
    
    internal func mutate(alternate value: LocalizedString) -> Self {
        return self.mutate(key: "alt", value: value)
    }
}

/// A type that provides the `as` modifier.
@_documentation(visibility: internal)
public protocol AsAttribute: Attribute {
    
    /// Hint about the type of resource to preload.
    ///
    /// ```swift
    /// Link()
    ///     .relationship(.preload)
    ///     .reference("https://...")
    ///     .as(.script)
    /// ```
    ///
    /// - Parameter value: The resource type to use.
    ///
    /// - Returns: The element
    func `as`(_ value: Values.Resource) -> Self
}

extension AsAttribute where Self: ContentNode {
    
    internal func mutate(as value: String) -> Self {
        return self.mutate(key: "as", value: value)
    }
}

extension AsAttribute where Self: EmptyNode {
    
    internal func mutate(as value: String) -> Self {
        return self.mutate(key: "as", value: value)
    }
}

/// A type that provides the `asynchronously` modifier.
@_documentation(visibility: internal)
public protocol AsynchronouslyAttribute: Attribute {
    
    /// Mark a script to be executed asynchronously.
    ///
    /// ```swift
    /// Script {
    ///     "Lorem ipsum..."
    /// }
    /// .asynchronously()
    /// ```
    ///
    /// - Returns: The element
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

/// A type that provides the `autocapitalize` modifier.
@_documentation(visibility: internal)
public protocol AutocapitalizeAttribute: Attribute {
    
    /// Control the capitalization manner.
    ///
    /// ```swift
    /// Input()
    ///     .autocapitalize(.word)
    /// ```
    ///
    /// - Parameter value: The manner in which to capitalize.
    ///
    /// - Returns: The element
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

/// A type that provides the `autocomplete` modifier.
@_documentation(visibility: internal)
public protocol AutocompleteAttribute: Attribute {
    
    /// Specify an auto completion.
    ///
    /// ```swift
    /// Input()
    ///     .autocomplete(.off)
    /// ```
    ///
    /// - Parameter value: The value to be expected.
    ///
    /// - Returns: The element
    func autocomplete(_ value: Values.Completion) -> Self
    
    /// Specify an auto completion.
    ///
    /// ```swift
    /// Input()
    ///     .autocomplete([.organization, .organizationTitle])
    /// ```
    ///
    /// - Parameter values: The values to be expected.
    ///
    /// - Returns: The element
    func autocomplete(_ values: OrderedSet<Values.Completion>) -> Self
}

extension AutocompleteAttribute where Self: ContentNode {
    
    internal func mutate(autocomplete value: String) -> Self {
        return self.mutate(key: "autocomplete", value: value)
    }
}

extension AutocompleteAttribute where Self: EmptyNode {
    
    internal func mutate(autocomplete value: String) -> Self {
        return self.mutate(key: "autocomplete", value: value)
    }
}

/// A type that provides the `autofocus` modifier.
@_documentation(visibility: internal)
public protocol AutofocusAttribute: Attribute {
    
    /// Focus the element on page load.
    ///
    /// ```swift
    /// Button {
    ///     "Lorem ipsum..."
    /// }
    /// .autofocus()
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

/// A type that provides the `autoplay` modifier.
@_documentation(visibility: internal)
public protocol AutoplayAttribute: Attribute {
    
    /// Mark the video as autoplay.
    ///
    /// ```swift
    /// Video {
    ///     Source()
    /// }
    /// .autoplay(true)
    /// ```
    ///
    /// - Parameter condition: Whether to play automatically.
    ///
    /// - Returns: The element
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

/// A type that provides the `charset` modifier.
@_documentation(visibility: internal)
public protocol CharsetAttribute: Attribute {
    
    /// Specify the character encoding for the document.
    ///
    /// ```swift
    /// Meta()
    ///     .charset(.utf8)
    /// ```
    ///
    /// - Parameter value: The encoding to use.
    ///
    /// - Returns: The element
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

/// A type that provides the `checked` modifier.
@_documentation(visibility: internal)
public protocol CheckedAttribute: Attribute {
    
    /// Mark an input as pre-selected.
    ///
    /// ```swift
    /// Input()
    ///     .type(.radio)
    ///     .checked(true)
    /// ```
    ///
    /// - Parameter condition: Whether the input should be pre-selected.
    ///
    /// - Returns: The element
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

/// A type that provides the `cite` modifier.
@_documentation(visibility: internal)
public protocol CiteAttribute: Attribute {
    
    /// Specifiy a url that explains the quote.
    ///
    /// ```swift
    /// Blockquote {
    ///     "Lorem ipsum..."
    /// }
    /// .cite("https://...")
    /// ```
    ///
    /// - Parameter url: The url to cite from.
    ///
    /// - Returns: The element
    func cite(_ url: String) -> Self
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

/// A type that provides the `class` modifier.
@_documentation(visibility: internal)
public protocol ClassAttribute: Attribute{
    
    /// Use a style class on an element.
    ///
    /// ```swift
    /// Paragraph {
    ///     "Lorem ipsum..."
    /// }
    /// .class("text")
    /// ```
    ///
    /// - Parameter value: The class to apply to.
    ///
    /// - Returns: The element
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

/// A type that provides the `columns` modifier.
@_documentation(visibility: internal)
public protocol ColumnsAttribute: Attribute {
    
    /// Specify the visible width of a text area.
    ///
    /// ```swift
    /// TextArea {
    ///     "Lorem ipsum..."
    /// }
    /// .columns(10)
    /// ```
    ///
    /// - Parameter number: The number of columns to base the width on.
    ///
    /// - Returns: The element
    func columns(_ number: Int) -> Self
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

/// A type that provides the `columnSpan` modifier.
@_documentation(visibility: internal)
public protocol ColumnSpanAttribute: Attribute {
    
    /// Specify the number of columns a cell should span.
    ///
    /// ```swift
    /// TableRow {
    ///     DataCell {
    ///         "Lorem ipsum..."
    ///     }
    ///     .columnSpan(2)
    /// }
    /// ```
    /// - Parameter size: The number of columns to span.
    ///
    /// - Returns: The element
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

/// A type that provides the `content` modifier.
@_documentation(visibility: internal)
public protocol ContentAttribute: Attribute {
    
    /// Supply a value to the associated name.
    ///
    /// ```swift
    /// Meta()
    ///     .name(.description)
    ///     .content("Lorem ipsum...")
    /// ```
    ///
    /// - Parameter value: The value to describe the name
    ///
    /// - Returns: The element
    func content(_ value: String) -> Self
    
    /// Supply a value to the associated name.
    ///
    /// ```swift
    /// Meta()
    ///     .name(.description)
    ///     .content("Lorem ipsum...")
    /// ```
    ///
    /// - Parameter localizedKey: The string key to be translated
    /// - Parameter tableName: The translation table to look in
    ///
    /// - Returns: The element
    func content(_ localizedKey: LocalizedStringKey, tableName: String?) -> Self
    
    /// Supply a value to the associated name without localization
    ///
    /// ```swift
    /// Meta()
    ///     .name(.description)
    ///     .content(verbatim: "Lorem ipsum...")
    /// ```
    ///
    /// - Parameter value: The value to describe the name
    ///
    /// - Returns: The element
    func content(verbatim value: String) -> Self
}

extension ContentAttribute where Self: ContentNode {
    
    internal func mutate(content value: String) -> Self {
        return self.mutate(key: "content", value: value)
    }
    
    internal func mutate(content value: LocalizedString) -> Self {
        return self.mutate(key: "content", value: value)
    }
}

extension ContentAttribute where Self: EmptyNode {
    
    internal func mutate(content value: String) -> Self {
        return self.mutate(key: "content", value: value)
    }
    
    internal func mutate(content value: LocalizedString) -> Self {
        return self.mutate(key: "content", value: value)
    }
}

/// A type that provides the `editable` modifier.
@_documentation(visibility: internal)
public protocol EditAttribute: Attribute {
    
    /// Mark an element as editable.
    ///
    /// ```swift
    /// Blockquote {
    ///     "Lorem ipsum..."
    /// }
    /// .editable(false)
    /// ```
    ///
    /// - Parameter value: Whether the element should be editable.
    ///
    /// - Returns: The element
    func editable(_ value: Bool) -> Self
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

/// A type that provides the `controls` modifier.
@_documentation(visibility: internal)
public protocol ControlsAttribute: Attribute {
    
    /// Display the controls.
    ///
    /// ```swift
    /// Audio {
    ///     Source()
    /// }
    /// .controls()
    /// ```
    ///
    /// - Returns: The element
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

/// A type that provides the `coordinates` modifier.
@_documentation(visibility: internal)
public protocol CoordinatesAttribute: Attribute {
    
    /// Use coordinates to define the area.
    ///
    /// ```swift
    /// Area()
    ///     .shape(.rect)
    ///     .coordinates("0, 0, 200, 100")
    /// ```
    ///
    /// - Parameter value: The coordinates on which to base the shape.
    ///
    /// - Returns: The element
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

/// A type that provides the `crossOrigin` modifier
@_documentation(visibility: internal)
public protocol CrossOriginAttribute: Attribute {
    
    /// Control the credential mode for cross-origin requests.
    ///
    /// ```swift
    /// Script {
    /// }
    /// .crossOrigin(.anonymous)
    /// ```
    ///
    /// - Parameter value: The mode to use.
    ///
    /// - Returns: The element
    func crossOrigin(_ value: Credential.Mode) -> Self
}

extension CrossOriginAttribute where Self: ContentNode {
    
    internal func mutate(crossorigin value: String) -> Self {
        return self.mutate(key: "crossorigin", value: value)
    }
}

extension CrossOriginAttribute where Self: EmptyNode {
    
    internal func mutate(crossorigin value: String) -> Self {
        return self.mutate(key: "crossorigin", value: value)
    }
}

/// A type that provides the `data` modifier.
@_documentation(visibility: internal)
public protocol DataAttribute: Attribute{
    
    /// Specify the url of the resource.
    ///
    /// ```swift
    /// Object {
    /// }
    /// .data("https://...")
    /// ```
    ///
    /// - Parameter url: The url of the resource to use.
    ///
    /// - Returns: The element
    func data(_ url: String) -> Self
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

/// A type that provides the `dateTime` modifier.
@_documentation(visibility: internal)
public protocol DateTimeAttribute: Attribute {
    
    /// Specify the date and time.
    ///
    /// ```swift
    /// Time {
    ///     "Lorem ipsum..."
    /// }
    /// .dateTime("")
    /// ```
    ///
    /// - Parameter value: The date or time to represent.
    ///
    /// - Returns: The element
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

/// A type that provides the `default` modifier.
@_documentation(visibility: internal)
public protocol DefaultAttribute: Attribute {
    
    /// Mark a track as default.
    ///
    /// ```swift
    /// Track()
    ///     .default()
    /// ```
    ///
    /// - Returns: The element
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

/// A type that provides the `defer` modifier.
@_documentation(visibility: internal)
public protocol DeferAttribute: Attribute {
    
    /// Mark a script as defer.
    ///
    /// ```swift
    /// Script {
    ///     "Lorem ipsum..."
    /// }
    /// .defer()
    /// ```
    ///
    /// - Returns: The element
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

/// A type that provides the `direction` modifier.
@_documentation(visibility: internal)
public protocol DirectionAttribute: Attribute {

    /// Set the text direction.
    ///
    /// ```swift
    /// Paragraph {
    ///     "Lorem ipsum"
    /// }
    /// .direction(.auto)
    /// ```
    ///
    /// - Parameter value: The direction to apply.
    ///
    /// - Returns: The element
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

/// A type that provides the `disabled` modifier.
@_documentation(visibility: internal)
public protocol DisabledAttribute: Attribute {
    
    /// Disable the element.
    ///
    /// ```swift
    /// Input()
    ///     .disabled(true)
    /// ```
    ///
    /// - Parameter condition: Whether to disable the element.
    ///
    /// - Returns: The element
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

/// A type that provides the `download` modifier.
@_documentation(visibility: internal)
public protocol DownloadAttribute: Attribute {
    
    /// Mark the target as downloadable.
    ///
    /// ```swift
    /// Anchor {
    ///     "Lorem ipsum..."
    /// }
    /// .download()
    /// ```
    ///
    /// - Returns: The element
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

/// A type that provides the `draggable` modifier.
@_documentation(visibility: internal)
public protocol DragAttribute: Attribute {
 
    /// Mark an element as draggable.
    ///
    /// ```swift
    /// Division {
    ///     ...
    /// }
    /// .draggable(false)
    /// ```
    ///
    /// - Parameter value: Whether the element should be draggable.
    ///
    /// - Returns: The element
    func draggable(_ value: Bool) -> Self
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

/// A type that provides the `encoding` modifier.
@_documentation(visibility: internal)
public protocol EncodingAttribute: Attribute {
    
    /// Specify the encoding strategy for form submission.
    ///
    /// ```swift
    /// Form {
    /// }
    /// .encoding(.multipart)
    /// ```
    ///
    /// - Parameter value: The strategy to use for the encoding.
    ///
    /// - Returns: The element
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

/// A type that provides the `enterKey` modifier.
@_documentation(visibility: internal)
public protocol EnterKeyAttribute: Attribute {
    
    /// Change the enter key for the virtual keyboards.
    ///
    /// ```swift
    /// Input()
    ///     .type(.text)
    ///     .enterKey(.search)
    /// ```
    ///
    /// - Parameter value: The enter key to apply.
    ///
    /// - Returns: The element
    func enterKey(_ value: Values.Hint) -> Self
}

extension EnterKeyAttribute where Self: ContentNode {
    
    internal func mutate(enterkeyhint value: String) -> Self {
        return self.mutate(key: "enterkeyhint", value: value)
    }
}

extension EnterKeyAttribute where Self: EmptyNode {
    
    internal func mutate(enterkeyhint value: String) -> Self {
        return self.mutate(key: "enterkeyhint", value: value)
    }
}

/// A type that provides the `for` modifier.
@_documentation(visibility: internal)
public protocol ForAttribute: Attribute {
    
    /// Specify the association with the element.
    ///
    /// ```swift
    /// Label {
    ///     "Lorem ipsum..."
    /// }
    /// .for("id")
    /// ```
    ///
    /// - Parameter id: The identifier of the element its bound to.
    ///
    /// - Returns: The element
    func `for`(_ id: String) -> Self
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

/// A type that provides the `form` modifier.
@_documentation(visibility: internal)
public protocol FormAttribute: Attribute {
    
    /// Specify the form the element belongs to.
    ///
    /// ```swift
    /// Button {
    ///     "Lorem ipsum..."
    /// }
    /// .form("id")
    /// ```
    ///
    /// - Parameter id: The identifier of the form its bound to.
    ///
    /// - Returns: The element
    func form(_ id: String) -> Self
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

/// A type that provides the `formAction` modifier.
@_documentation(visibility: internal)
public protocol FormActionAttribute: Attribute {
    
    /// Set a target url to use for form submissions.
    ///
    /// ```swift
    /// Form {
    ///     Button {
    ///         "Submit"
    ///     }
    ///     .type(.submit)
    ///     .formAction("https://...")
    /// }
    /// .method(.get)
    /// ```
    ///
    /// - Parameter url: The url to send the form data to.
    ///
    /// - Returns: The element
    func formAction(_ url: String) -> Self
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

/// A type that provides the `equivalent` modifier.
@_documentation(visibility: internal)
public protocol EquivalentAttribute: Attribute {
    
    /// Specify the header directive equivalent.
    ///
    /// ```swift
    /// Meta()
    ///     .equivalent(.refresh)
    /// ```
    ///
    /// - Parameter value: The header directive to simulate.
    ///
    /// - Returns: The element
    func equivalent(_ value: Values.Equivalent) -> Self
}

extension EquivalentAttribute where Self: ContentNode {
    
    internal func mutate(httpequiv value: String) -> Self {
        return self.mutate(key: "http-equiv", value: value)
    }
}

extension EquivalentAttribute where Self: EmptyNode {
    
    internal func mutate(httpequiv value: String) -> Self {
        return self.mutate(key: "http-equiv", value: value)
    }
}

/// A type that provides the `headers` modifier.
@_documentation(visibility: internal)
public protocol HeadersAttribute: Attribute {
    
    /// Specify the header cells for an element.
    ///
    /// ```swift
    /// DataCell {
    ///     "Lorem ipsum..."
    /// }
    /// .headers(["id", "id"])
    /// ```
    ///
    /// - Parameter ids: The identifiers of the cells to associate with.
    ///
    /// - Returns: The element
    func headers(_ ids: [String]) -> Self
    
    /// Specify the header cells for an element.
    ///
    /// ```swift
    /// DataCell {
    ///     "Lorem ipsum..."
    /// }
    /// .headers("id", "id")
    /// ```
    ///
    /// - Parameter ids: The identifiers of the cells to associate with.
    ///
    /// - Returns: The element
    func headers(_ ids: String...) -> Self
}

extension HeadersAttribute where Self: ContentNode {
    
    internal func mutate(headers value: String) -> Self {
        return self.mutate(key: "headers", value: value)
    }
}

extension HeadersAttribute where Self: EmptyNode {
    
    internal func mutate(headers value: String) -> Self {
        return self.mutate(key: "headers", value: value)
    }
}

/// A type that provides the `height` modifier.
@_documentation(visibility: internal)
public protocol HeightAttribute: Attribute {
    
    /// Set the actual height for the element.
    ///
    /// ```swift
    /// Image()
    ///     .height(200)
    /// ```
    ///
    /// - Parameter size: The height to constrain the element to.
    ///
    /// - Returns: The element
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

/// A type that provides the `hidden` modifier.
@_documentation(visibility: internal)
public protocol HiddenAttribute: Attribute {
    
    /// Hide an element.
    ///
    /// ```swift
    /// Paragraph {
    ///     "Lorem ipsum..."
    /// }
    /// .hidden(false)
    /// ```
    ///
    /// - Parameter condition: Whether to hide the element.
    ///
    /// - Returns: The element
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

/// A type that provides the `high` modifier.
@_documentation(visibility: internal)
public protocol HighAttribute: Attribute {
    
    /// Specify the high threshold for the range.
    ///
    /// ```swift
    /// Meter {
    /// }
    /// .high(40)
    /// ```
    ///
    /// - Parameter value: The value to consider high.
    ///
    /// - Returns: The element
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

/// A type that provides the `reference` modifier.
@_documentation(visibility: internal)
public protocol ReferenceAttribute: Attribute {
    
    /// Specify the url for a link.
    ///
    /// ```swift
    /// Anchor {
    ///     "Lorem ipsum..."
    /// }
    /// .reference("https://...")
    /// ```
    ///
    /// - Parameter url: The url to refer to.
    ///
    /// - Returns: The element
    func reference(_ url: String) -> Self
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

/// A type that provides the `referenceLanguage` modifier.
@_documentation(visibility: internal)
public protocol ReferenceLanguageAttribute: Attribute {
    
    /// Indicate the content language of the linked resource.
    ///
    /// ```swift
    /// Anchor {
    ///     "Lorem ipsum..."
    /// }
    /// .reference("https://...")
    /// .referenceLanguage(.en)
    /// ```
    /// - Parameter value: The language to expect at the linked resource.
    ///
    /// - Returns: The element
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

/// A type that provides the `id` modifier.
@_documentation(visibility: internal)
public protocol IdentifierAttribute: Attribute {
 
    /// Set an unique identifier.
    ///
    /// ```swift
    /// Division {
    /// }
    /// .id("content")
    /// ```
    ///
    /// - Parameter value: The identifier to recognize by.
    ///
    /// - Returns: The element
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

/// A type that provides the `isMap` modifier.
@_documentation(visibility: internal)
public protocol IsMapAttribute: Attribute {
 
    /// Mark an element as a server-side image map.
    ///
    /// It enables the element to send click coordinates to the server,
    /// allowing interactions with the element.
    ///
    /// ```swift
    /// Anchor {
    ///     Image()
    ///         .source("...png")
    ///         .isMap()
    /// }
    /// .reference("https://...")
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

/// A type that provides the `inputMode` modifier.
@_documentation(visibility: internal)
public protocol InputModeAttribute: Attribute {
    
    /// Set the virtual keyboard mode for the editable element.
    ///
    /// ```swift
    /// Input()
    ///     .inputMode(.numeric)
    /// ```
    ///
    /// - Parameter value: The mode to set on
    func inputMode(_ value: Values.Mode) -> Self
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

/// A type that provides the `integrity` modifier
@_documentation(visibility: internal)
public protocol IntegrityAttribute: Attribute {
    
    /// Check the integrity of the resource.
    ///
    /// ```swift
    /// Script {
    /// }
    /// .integrity("sha384...", "sha384...")
    /// ```
    ///
    /// - Parameter hashes: The hashes of the resource to validate against.
    ///
    /// - Returns: The element
    func integrity(_ hashes: String...) -> Self
    
    /// Check the integrity of the resource.
    ///
    /// ```swift
    /// Script {
    /// }
    /// .integrity(["sha384...", "sha384..."])
    /// ```
    ///
    /// - Parameter hashes: The hashes of the resource to validate against.
    ///
    /// - Returns: The element
    func integrity(_ hashes: [String]) -> Self
}

extension IntegrityAttribute where Self: ContentNode {
    
    internal func mutate(integrity value: String) -> Self {
        return self.mutate(key: "integrity", value: value)
    }
}

extension IntegrityAttribute where Self: EmptyNode {
    
    internal func mutate(integrity value: String) -> Self {
        return self.mutate(key: "integrity", value: value)
    }
}

/// A type that provides the `is` modifier.
@_documentation(visibility: internal)
public protocol IsAttribute: Attribute {
 
    /// Refere to a custom element.
    ///
    /// ```swift
    /// Paragraph {
    ///     "Lorem ipsum..."
    /// }
    /// .is("foo-bar")
    /// ```
    ///
    /// - Parameter name: The name of the custom element to refere to.
    ///
    /// - Returns: The element
    func `is`(_ name: String) -> Self
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

/// A type that provides the `item` modifier.
@_documentation(visibility: internal)
public protocol ItemAttribute: Attribute {
    
    /// Create an new item.
    ///
    /// ```swift
    /// DefinitionList {
    /// }
    /// .item(id: "urn:...", as: "https://...", for: ["foo", "bar"])
    /// ```
    /// 
    /// - Parameters:
    ///   - id: The identifier used to name the item.
    ///   - schema: The url of the schema the item should conform to.
    ///   - elements: The identifiers of elements to associated the item with.
    ///
    /// - Returns: The element
    func item(id: String?, as schema: URL?, for elements: [String]?) -> Self
    
    /// Create an new item.
    ///
    /// ```swift
    /// DefinitionList {
    /// }
    /// .item(id: "urn:...", as: "https://...", for: "foo", "bar")
    /// ```
    ///
    /// - Parameters:
    ///   - id: The identifier used to name the item.
    ///   - schema: The url of the schema the item should conform to.
    ///   - elements: The identifiers of elements to associated the item with.
    ///
    /// - Returns: The element
    func item(id: String?, as schema: URL?, for elements: String...) -> Self
}

extension ItemAttribute where Self: ContentNode {
    
    internal func mutate(itemscope value: String) -> Self {
        return self.mutate(key: "itemscope", value: value)
    }
    
    internal func mutate(itemid value: String?) -> Self {
        
        if let value = value {
            return self.mutate(key: "itemid", value: value)
        }
        
        return self
    }
    
    internal func mutate(itemtype value: String?) -> Self {
        
        if let value = value {
            return self.mutate(key: "itemtype", value: value)
        }
        
        return self
    }
    
    internal func mutate(itemref value: String?) -> Self {

        if let value = value {
            return self.mutate(key: "itemref", value: value)
        }
        
        return self
    }
}

extension ItemAttribute where Self: EmptyNode {
    
    internal func mutate(itemscope value: String) -> Self {
        return self.mutate(key: "itemscope", value: value)
    }
    
    internal func mutate(itemid value: String?) -> Self {
        
        if let value = value {
            return self.mutate(key: "itemid", value: value)
        }
        
        return self
    }
    
    internal func mutate(itemtype value: String?) -> Self {
        
        if let value = value {
            return self.mutate(key: "itemtype", value: value)
        }
        
        return self
    }
    
    internal func mutate(itemref value: String?) -> Self {

        if let value = value {
            return self.mutate(key: "itemref", value: value)
        }
        
        return self
    }
}

/// A type that provides the `itemProperty` modifier.
@_documentation(visibility: internal)
public protocol ItemPropertyAttribute: Attribute {
 
    /// Create an item property on an element.
    ///
    /// ```swift
    /// Span {
    ///     "Lorem ipsum..."
    /// }
    /// .itemProperty("")
    /// ```
    ///
    /// - Parameter value: The name used for the property.
    ///
    /// - Returns: The element
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

/// A type that provides the `kind` modifier.
@_documentation(visibility: internal)
public protocol KindAttribute: Attribute {
    
    /// Hint the kind of track content.
    ///
    /// ```swift
    /// Track()
    ///     .source("...vtt")
    ///     .kind(.chapters)
    /// ```
    ///
    /// - Parameter value: The kind of content to associate with.
    ///
    /// - Returns: The element
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

/// A type that provides the `label` modifier.
@_documentation(visibility: internal)
public protocol LabelAttribute: Attribute {
    
    /// Specify a label for the element.
    ///
    /// ```swift
    /// Track()
    ///     .source("...vtt")
    ///     .kind(.chapters)
    ///     .label("lorem")
    /// ```
    ///
    /// - Parameter value: The text to use as a label.
    ///
    /// - Returns: The element
    func label(_ value: String) -> Self
    
    /// Specify a label for the element.
    ///
    /// ```swift
    /// Track()
    ///     .source("...vtt")
    ///     .kind(.chapters)
    ///     .label("lorem")
    /// ```
    ///
    /// - Parameter localizedKey: The string key to be translated.
    /// - Parameter tableName: The translation table to look in.
    ///
    /// - Returns: The element
    func label(_ localizedKey: LocalizedStringKey, tableName: String?) -> Self
    
    /// Specify a label for the element without localization.
    ///
    /// ```swift
    /// Track()
    ///     .source("...vtt")
    ///     .kind(.chapters)
    ///     .label(verbatim: "lorem")
    /// ```
    ///
    /// - Parameter value: The text to use as a label.
    ///
    /// - Returns: The element
    func label(verbatim value: String) -> Self
}

extension LabelAttribute where Self: ContentNode {
    
    internal func mutate(label value: String) -> Self {
        return self.mutate(key: "label", value: value)
    }
    
    internal func mutate(label value: LocalizedString) -> Self {
        return self.mutate(key: "label", value: value)
    }
}

extension LabelAttribute where Self: EmptyNode {
    
    internal func mutate(label value: String) -> Self {
        return self.mutate(key: "label", value: value)
    }
    
    internal func mutate(label value: LocalizedString) -> Self {
        return self.mutate(key: "label", value: value)
    }
}

/// A type that provides the `language` modifier.
@_documentation(visibility: internal)
public protocol LanguageAttribute: Attribute {
    
    /// Specify the language for the following content.
    ///
    /// ```swift
    /// Paragraph {
    ///     "Lorem ipsum..."
    /// }
    /// .language(.german)
    /// ```
    ///
    /// - Parameter value: The language used to intepret the content.
    ///
    /// - Returns: The element
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

/// A type that provides the `list` modifier.
@_documentation(visibility: internal)
public protocol ListAttribute: Attribute {
    
    /// Refere to a datalist.
    ///
    /// ```swift
    /// Input()
    ///     .list("")
    /// ```
    ///
    /// - Parameter id: The identifier of the datalist.
    ///
    /// - Returns: The element.
    func list(_ id: String) -> Self
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

/// A type that provides the `loop` modifier.
@_documentation(visibility: internal)
public protocol LoopAttribute: Attribute {
    
    /// Activate autoplay.
    /// 
    /// It specifies that the element will start over again, every time it is finished.
    ///
    /// ```swift
    /// Audio {
    /// }
    /// .loop()
    /// ```
    ///
    /// - Parameter condition: Whether the element should play repeatedly
    ///
    /// - Returns: The element
    func loop(_ condition: Bool) -> Self
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

/// A type that provides the `low` modifier.
@_documentation(visibility: internal)
public protocol LowAttribute: Attribute {
    
    /// Specify the low threshold for the range.
    ///
    /// ```swift
    /// Meter {
    /// }
    /// .low(40)
    /// ```
    ///
    /// - Parameter value: The value to consider low.
    ///
    /// - Returns: The element
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

/// A type that provides the `maximum` modifier.
@_documentation(visibility: internal)
public protocol MaximumValueAttribute: Attribute {
    
    associatedtype MaximumValueType
    
    /// Specify the maximum bound for the range.
    ///
    /// ```swift
    /// Input()
    ///     .maximum(100)
    /// ```
    /// - Parameter value: The value to consider maximum.
    ///
    /// - Returns: The element
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

/// A type that provides the `maximum(length:)` modifier.
@_documentation(visibility: internal)
public protocol MaximumLengthAttribute: Attribute {
    
    /// Set the maximum string length.
    ///
    /// ```swift
    /// TextArea {
    ///     "Lorem ipsum..."
    /// }
    /// .maximum(length: 10)
    /// ```
    ///
    /// - Parameter value: The maximum number of characters to require.
    ///
    /// - Returns: The element
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

/// A type that provides the `media` modifier.
@_documentation(visibility: internal)
public protocol MediaAttribute: Attribute {
    
    /// Specify the media the ressource is optimized for.
    ///
    /// ```swift
    /// Link()
    ///     .reference("...css")
    ///     .media([
    ///         MediaQuery(target: .screen, features: .orientation(.portrait)), 
    ///         MediaQuery(target: .print, features: .resolution("300dpi"))
    ///     ])
    /// ```
    ///
    /// - Parameter queries: The media to be considered.
    ///
    /// - Returns: The element
    func media(_ queries: [MediaQuery]) -> Self
    
    
    /// Specify the media the ressource is optimized for.
    ///
    /// ```swift
    /// Link()
    ///     .reference("...css")
    ///     .media(
    ///         MediaQuery(target: .screen, features: .orientation(.portrait)),
    ///         MediaQuery(target: .print, features: .resolution("300dpi"))
    ///     )
    /// ```
    ///
    /// - Parameter queries: The media to be considered.
    ///
    /// - Returns: The element
    func media(_ queries: MediaQuery...) -> Self
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

/// A type that provides the `method` modifier.
@_documentation(visibility: internal)
public protocol MethodAttribute: Attribute {
    
    /// Specify how to send form data.
    ///
    /// ```swift
    /// Form {
    /// }
    /// .method(.post)
    /// ```
    ///
    /// - Parameter value: The method to use for submission.
    ///
    /// - Returns: The element
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

/// A type that provides the `minimum` modifier.
@_documentation(visibility: internal)
public protocol MinimumValueAttribute: Attribute {
    
    associatedtype MinimumValueType
    
    /// Specify the minimum bound for the range.
    ///
    /// ```swift
    /// Input()
    ///     .minimum(0)
    /// ```
    ///
    /// - Parameter value: The value to consider minimum.
    ///
    /// - Returns: The element
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

/// A type that provides the `minimum(length:)` modifier.
@_documentation(visibility: internal)
public protocol MinimumLengthAttribute: Attribute {
    
    /// Set the minimum string length.
    ///
    /// ```swift
    /// TextArea {
    ///     "Lorem ipsum..."
    /// }
    /// .minimum(length: 10)
    /// ```
    /// - Parameter value: The minimum number of characters to require.
    ///
    /// - Returns: The element
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

/// A type that provides the `multiple` modifier.
@_documentation(visibility: internal)
public protocol MultipleAttribute: Attribute {
    
    /// Specify that the user is allowed to select more than one value.
    ///
    /// ```swift
    /// Select {
    ///     Option()
    ///     Option()
    /// }
    /// .multiple()
    /// ```
    ///
    /// - Returns: The element
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

/// A type that provides the `muted` modifier.
@_documentation(visibility: internal)
public protocol MutedAttribute: Attribute {
    
    /// Mute the element.
    ///
    /// ```swift
    /// Video {
    ///     Source()
    /// }
    /// .muted()
    /// ```
    ///
    /// - Returns: The element
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

/// A type that provides the `name` modifier.
@_documentation(visibility: internal)
public protocol NameAttribute: Attribute {

    associatedtype NameValue
    
    /// Define a name for the element.
    ///
    /// ```swift
    /// Button {
    ///     "Lorem ipsum..."
    /// }
    /// .name("lorem")
    /// ```
    ///
    /// - Parameter value: The name to be referenced.
    ///
    /// - Returns: The element
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

/// A type that provides the `nonce` modifier.
@_documentation(visibility: internal)
public protocol NonceAttribute: Attribute {
    
    /// Use a nonce for an element.
    ///
    /// ```swift
    /// Script {
    ///     const foo = 'bar';
    /// }
    /// .nonce("k9XJ2mL4qR8VpTeYw0HsZg==")
    /// ```
    ///
    /// - Parameter value: The nonce to send with.
    ///
    /// - Returns: The element
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

/// A type that provides the `novalidate` modifier.
@_documentation(visibility: internal)
public protocol NoValidateAttribute: Attribute {

    /// Prevent the form from being validated.
    ///
    /// ```swift
    /// Form {
    /// }
    /// .novalidate()
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

/// A type that provides the `open` modifier.
@_documentation(visibility: internal)
public protocol OpenAttribute: Attribute {
    
    /// Mark the details as open.
    ///
    /// ```swift
    /// Details {
    ///     Summary {
    ///         "Lorem ipsum"
    ///     }
    ///     Paragraph {
    ///         "Lorem ipsum..."
    ///     }
    /// }
    /// .open(true)
    /// ```
    ///
    /// - Parameter condition: Whether the details should be open.
    ///
    /// - Returns: The element
    func open(_ condition: Bool) -> Self
}

extension OpenAttribute where Self: ContentNode {
    
    internal func mutate(open value: String) -> Self {
        return self.mutate(key: "open", value: value)
    }
}

extension OpenAttribute where Self: EmptyNode {
    
    internal func mutate(open value: String) -> Self {
        return self.mutate(key: "open", value: value)
    }
}

/// A type that provides the `optimum` modifier.
@_documentation(visibility: internal)
public protocol OptimumAttribute: Attribute {
    
    /// Specify the optimum threshold for the range.
    ///
    /// ```swift
    /// Meter {
    /// }
    /// .optimum(10)
    /// ```
    ///
    /// - Parameter value: The number to consider ideal.
    ///
    /// - Returns: The element
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

/// A type that provides the `pattern` modifier.
@_documentation(visibility: internal)
public protocol PatternAttribute: Attribute {
    
    /// Specifiy a regular expression for the input.
    ///
    /// The input value is checked against the regular expression on form submission.
    ///
    /// ```swift
    /// Input()
    ///     .pattern("[A-Za-z]")
    /// ```
    ///
    /// - Parameter regex: The pattern to check against.
    ///
    /// - Returns: The element
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

/// A type that provides the `part` modifier.
@_documentation(visibility: internal)
public protocol PartAttribute: Attribute {
    
    /// Expose the element outside of the shadow tree.
    ///
    /// ```struct
    /// Template {
    ///     Span {
    ///     }
    ///     .part("lorem")
    /// }
    /// ```
    ///
    /// - Parameter name: The name of the element to expose.
    ///
    /// - Returns: The element
    func part(_ name: String) -> Self
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

/// A type that provides the `ping` modifier.
@_documentation(visibility: internal)
public protocol PingAttribute: Attribute {
    
    /// Define a callback url.
    ///
    /// ```swift
    /// Anchor {
    ///     "Lorem ipsum..."
    /// }
    /// .reference("https://...")
    /// .ping("https://...")
    /// ```
    ///
    /// - Parameter url: The url to be notified.
    ///
    /// - Returns: The element
    func ping(_ url: String) -> Self
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

/// A type that provides the `placeholder` modifier.
@_documentation(visibility: internal)
public protocol PlaceholderAttribute: Attribute {
    
    /// Supply a short hint.
    ///
    /// ```swift
    /// Input()
    ///     .placeholder("Lorem ipsum...")
    /// ```
    ///
    /// - Parameter value: The text to display as a hint
    ///
    /// - Returns: The element
    func placeholder(_ value: String) -> Self
    
    /// Supply a short hint.
    /// 
    /// ```swift
    /// Input()
    ///     .placeholder("Lorem ipsum...")
    /// ```
    ///
    /// - Parameter localizedKey: The string key to be translated
    /// - Parameter tableName: The translation table to look in
    ///
    /// - Returns: The element
    func placeholder(_ localizedKey: LocalizedStringKey, tableName: String?) -> Self
    
    /// Supply a short hint without localization.
    ///
    /// ```swift
    /// Input()
    ///     .placeholder(verbatim: "Lorem ipsum...")
    /// ```
    ///
    /// - Parameter value: The text to display as a hint
    ///
    /// - Returns: The element
    func placeholder(verbatim value: String) -> Self
}

extension PlaceholderAttribute where Self: ContentNode {
    
    internal func mutate(placeholder value: String) -> Self {
        return self.mutate(key: "placeholder", value: value)
    }
    
    internal func mutate(placeholder value: LocalizedString) -> Self {
        return self.mutate(key: "placeholder", value: value)
    }
}

extension PlaceholderAttribute where Self: EmptyNode {
    
    internal func mutate(placeholder value: String) -> Self {
        return self.mutate(key: "placeholder", value: value)
    }
    
    internal func mutate(placeholder value: LocalizedString) -> Self {
        return self.mutate(key: "placeholder", value: value)
    }
}

/// A type that provides the `poster` modifier.
@_documentation(visibility: internal)
public protocol PosterAttribute: Attribute {
    
    /// Supply a fallback while the video is processing.
    ///
    /// ```swift
    /// Video {
    ///     Source()
    /// }
    /// .poster("https://...")
    /// ```
    ///
    /// - Parameter url: The absolute or relative url to point to.
    ///
    /// - Returns: The element
    func poster(_ url: String) -> Self
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

/// A type that provides the `playInline` modifier.
@_documentation(visibility: internal)
public protocol PlaysInlineAttribute: Attribute {
    
    /// Enables inline playback.
    ///
    /// It specifies that the element should not use the native fullscreen mode when playing.
    ///
    /// ```swift
    /// Video {
    /// }
    /// .playInline()
    /// ```
    ///
    /// - Parameter condition: Whether the element should play inline
    ///
    /// - Returns: The element
    func playInline(_ condition: Bool) -> Self
}

extension PlaysInlineAttribute where Self: ContentNode {
    
    internal func mutate(playsinline value: String) -> Self {
        return self.mutate(key: "playsinline", value: value)
    }
}

extension PlaysInlineAttribute where Self: EmptyNode {
    
    internal func mutate(playsinline value: String) -> Self {
        return self.mutate(key: "playsinline", value: value)
    }
}

/// A type that provides the `preload` modifier.
@_documentation(visibility: internal)
public protocol PreloadAttribute: Attribute {
    
    /// Define the loading behaviour.
    ///
    /// ```swift
    /// Video {
    ///     Source()
    ///         .source("https://...")
    ///         .type(.mp4)
    /// }
    /// .preload(.auto)
    /// ```
    ///
    /// - Parameter value: The behaviour
    ///
    /// - Returns: The element
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

/// A type that provides the `readonly` modifier.
@_documentation(visibility: internal)
public protocol ReadOnlyAttribute: Attribute {
    
    /// Mark the input as read only based on a condition.
    ///
    /// ```swift
    /// Input()
    ///     .readonly(false)
    /// ```
    ///
    /// - Parameter condition: Whether the input should be read only.
    ///
    /// - Returns: The element
    func readonly(_ condition: Bool) -> Self
}

extension ReadOnlyAttribute where Self: ContentNode {
    
    internal func mutate(readonly value: String) -> Self {
        return self.mutate(key: "readonly", value: value)
    }
}

extension ReadOnlyAttribute where Self: EmptyNode {
    
    internal func mutate(readonly value: String) -> Self {
        return self.mutate(key: "readonly", value: value)
    }
}

/// A type that provides the `referrerPolicy` modifier.
@_documentation(visibility: internal)
public protocol ReferrerPolicyAttribute: Attribute {
    
    /// Specify that no referrer information will be sent along with the request.
    ///
    /// ```swift
    /// Link()
    ///     .referrerPolicy(.sameOrigin)
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

/// A type that provides the `relationship` modifier.
@_documentation(visibility: internal)
public protocol RelationshipAttribute: Attribute {
    
    /// Indicate the relationship between documents.
    ///
    /// ```swift
    /// Anchor {
    ///     "Lorem ipsum..."
    /// }
    /// .reference("https://...")
    /// .relationship(.author)
    /// ```
    ///
    /// - Parameter value: The relationship type to associate with.
    ///
    /// - Returns: The element
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

/// A type that provides the `required` modifier.
@_documentation(visibility: internal)
public protocol RequiredAttribute: Attribute {
    
    /// Mark an input as required based on a condition.
    ///
    /// ```swift
    /// Input()
    ///     .required(false)
    /// ```
    ///
    /// - Parameter condition: Whether the element should be a requirement.
    ///
    /// - Returns: The element
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

/// A type that provides the `reversed` modifier.
@_documentation(visibility: internal)
public protocol ReversedAttribute: Attribute {
    
    /// Mark a list as reversed.
    ///
    /// ```swift
    /// OrderedList {
    ///     ListItem {
    ///         "Lorem ipsum"
    ///     }
    /// }
    /// .reversed()
    /// ```
    ///
    /// - Returns: The element
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

/// A type that provides the `role` modifier.
@_documentation(visibility: internal)
public protocol RoleAttribute: Attribute {
    
    /// Describe the role of an element.
    ///
    /// ```swift
    /// Anchor {
    ///     "Lorem ipsum..."
    /// }
    /// .reference("https://...")
    /// .role(.button)
    /// ```
    ///
    /// - Parameter value: The role to inform about.
    ///
    /// - Returns: The element
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

/// A type that provides the `rows` modifier.
@_documentation(visibility: internal)
public protocol RowsAttribute: Attribute {
    
    /// Define the visible height of the text area.
    ///
    /// ```swift
    /// TextArea {
    ///     "Lorem ipsum..."
    /// }
    /// .rows(4)
    /// ```
    ///
    /// - Parameter number: The number of rows to base the height on.
    ///
    /// - Returns: The element
    func rows(_ number: Int) -> Self
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

/// A type that provides the `rowSpan` modifier.
@_documentation(visibility: internal)
public protocol RowSpanAttribute: Attribute {
    
    /// Specify the number of rows a cell should span
    ///
    /// ```swift
    /// TableRow {
    ///     DataCell {
    ///         "Lorem ipsum..."
    ///     }
    ///     .rowSpan(2)
    /// }
    /// ```
    ///
    /// - Parameter size: The number of rows to span.
    ///
    /// - Returns: The element
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

/// A type that provides the `sandbox` modifier.
@_documentation(visibility: internal)
public protocol SandboxAttribute: Attribute {
    
    /// Define the permissions for the element.
    ///
    /// ```swift
    /// InlineFrame {
    /// }
    /// .source("https://...")
    /// .sandbox()
    /// ```
    func sandbox() -> Self
    
    /// Define the permissions for the element.
    ///
    /// ```swift
    /// InlineFrame {
    /// }
    /// .source("https://...")
    /// .sandbox(.allowDownloads)
    /// ```
    func sandbox(_ value: Values.Permission) -> Self
    
    /// Define the permissions for the element.
    ///
    /// ```swift
    /// InlineFrame {
    /// }
    /// .source("https://...")
    /// .sandbox([.allowDownloads, .allowPopups])
    /// ```
    func sandbox(_ values: OrderedSet<Values.Permission>) -> Self
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
    
    /// Define the scope for a header cell.
    ///
    /// It specifies whether the cell is for a column, row or a group of columns
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
    /// - Parameter value: The scope of the header cell.
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

/// A type that provides the `shape` modifier.
@_documentation(visibility: internal)
public protocol ShapeAttribute: Attribute {
    
    /// Define the entire area as shape.
    ///
    /// ```swift
    /// Area()
    ///     .shape()
    /// ```
    ///
    /// - Returns: The element
    func shape() -> Self
    
    /// Define the shape for an area.
    ///
    /// ```swift
    /// Area()
    ///     .shape(.rect, coordinates: "0, 0, 200, 100")
    /// ```
    ///
    /// - Parameter value: The shape used to interpret the coordinates.
    /// - Parameter coordinates: The coordinates on which to base the shape.
    ///
    /// - Returns: The element
    func shape(_ value: Values.Shape, coordinates: String) -> Self
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

/// A type that provides the `size` modifier.
@_documentation(visibility: internal)
public protocol SizeAttribute: Attribute {
    
    /// Set the display size for an input.
    ///
    /// ```swift
    /// Input()
    ///     .size(4)
    /// ```
    ///
    /// - Parameter size: The length to constrain content to.
    ///
    /// - Returns: The element
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

/// A type that provides the `sizes` modifier.
@_documentation(visibility: internal)
public protocol SizesAttribute: Attribute {
    
    associatedtype SizesValueType
    
    /// Describe different sizes for different viewport sizes.
    ///
    /// ```swift
    /// Link()
    ///     .sizes("16x16", "32x32")
    /// ```
    ///
    /// - Parameter candidates: The sizes to take into consideration.
    ///
    /// - Returns: The element
    func sizes(_ candidates: [SizesValueType]) -> Self
}

extension SizesAttribute where Self: ContentNode {
    
    internal func mutate(sizes value: String) -> Self {
        return self.mutate(key: "sizes", value: value)
    }
}

extension SizesAttribute where Self: EmptyNode {
    
    internal func mutate(sizes value: String) -> Self {
        return self.mutate(key: "sizes", value: value)
    }
}

/// A type that provides the `slot` modifier.
@_documentation(visibility: internal)
public protocol SlotAttribute: Attribute {
    
    /// Define named placeholders within a custom element.
    ///
    /// ```swift
    /// Template {
    ///     Slot {
    ///     }
    ///     .name("name")
    /// }
    /// Custom {
    ///     Heading1 {
    ///         "Lorem ipsum..."
    ///     }
    ///     .slot("name")
    /// }
    /// ```
    ///
    /// - Parameter name: The identifier to name after.
    ///
    /// - Returns: The element
    func slot(_ name: String) -> Self
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

/// A type that provides the `span` modifier.
@_documentation(visibility: internal)
public protocol SpanAttribute: Attribute {
    
    /// Specify the span for a column.
    ///
    /// ```swift
    /// Column()
    ///     .span(2)
    /// ```
    ///
    /// - Parameter size: The number of columns to span.
    ///
    /// - Returns: The element
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

/// A type that provides the `spellcheck` modifier.
@_documentation(visibility: internal)
public protocol SpellCheckAttribute: Attribute {
 
    /// Mark a element as spellchecked.
    ///
    /// ```swift
    /// Input()
    ///     .spellcheck(false)
    /// ```
    ///
    /// - Parameter value: Whether to spellcheck the content.
    ///
    /// - Returns: The element
    func spellcheck(_ value: Bool) -> Self
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

/// A type that provides the `source` modifier.
@_documentation(visibility: internal)
public protocol SourceAttribute: Attribute {
    
    /// Specify the url for the source.
    ///
    /// ```swift
    /// Audio {
    ///     Source()
    ///         .type(.mpeg)
    ///         .source("...mpeg")
    /// }
    /// ```
    /// - Parameter url: The url to load from.
    ///
    /// - Returns: The element
    func source(_ url: String) -> Self
    
    /// Specify the url for the source.
    ///
    /// ```swift
    /// Audio {
    ///     Source()
    ///         .type(.mpeg)
    ///         .source("...mpeg")
    /// }
    /// ```
    /// - Parameter url: The url to load from.
    ///
    /// - Returns: The element
    func source(_ url: EnvironmentValue) -> Self
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

/// A type that provides the `sourceDocument` modifier.
@_documentation(visibility: internal)
public protocol SourceDocumentAttribute: Attribute {
    
    /// Embed inline markup into the frame.
    ///
    /// ```swift
    /// InlineFrame {
    /// }
    /// .sourceDocument("<!doctype html><html lang=\"de\"></html>")
    /// ```
    ///
    /// - Parameter value: The markup to render.
    ///
    /// - Returns: The element
    func sourceDocument(_ value: String) -> Self
}

extension SourceDocumentAttribute where Self: ContentNode {
    
    internal func mutate(sourcedocument value: String) -> Self {
        return self.mutate(key: "srcdoc", value: value)
    }
}

extension SourceDocumentAttribute where Self: EmptyNode {
    
    internal func mutate(sourcedocument value: String) -> Self {
        return self.mutate(key: "srcdoc", value: value)
    }
}

/// A type that provides the `sourceLanguage` modifier.
@_documentation(visibility: internal)
public protocol SourceLanguageAttribute: Attribute {
    
    /// Indicate the language of the text track.
    ///
    /// ```swift
    /// Video {
    ///     Source()
    ///         .type(.mp4)
    ///         .source("...mp4")
    ///     Track()
    ///         .source("...vtt")
    ///         .sourceLanguage(.english)
    ///         .kind(.subtitles)
    /// }
    /// ```
    ///
    /// - Parameter value: The language to expect.
    ///
    /// - Returns: The element
    func sourceLanguage(_ value: Values.Language) -> Self
}

extension SourceLanguageAttribute where Self: ContentNode {
    
    internal func mutate(sourcelanguage value: String) -> Self {
        return self.mutate(key: "srclang", value: value)
    }
}

extension SourceLanguageAttribute where Self: EmptyNode {
    
    internal func mutate(sourcelanguage value: String) -> Self {
        return self.mutate(key: "srclang", value: value)
    }
}

/// A type that provides the `start` modifier.
@_documentation(visibility: internal)
public protocol StartAttribute: Attribute {
    
    /// Specify the start value for the list.
    ///
    /// ```swift
    /// OrderedList {
    ///     ListItem {
    ///         "Lorem ipsum"
    ///     }
    /// }
    /// .start(10)
    /// ```
    ///
    /// - Parameter number: The number to start to count from.
    ///
    /// - Returns: The element
    func start(_ number: Int) -> Self
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

/// A type that provides the `step` modifier.
@_documentation(visibility: internal)
public protocol StepAttribute: Attribute {
    
    /// Specify the number intervals for an input.
    ///
    /// ```swift
    /// Input()
    ///     .type(.number)
    ///     .step(3)
    /// ```
    ///
    /// - Parameter size: The increment to use.
    ///
    /// - Returns: The element
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

/// A type that provides the `style` modifier.
@_documentation(visibility: internal)
public protocol StyleAttribute: Attribute {
    
    /// Specify an inline style for an element.
    ///
    /// ```swift
    /// Heading1 {
    ///     "Lorem ipsum..."
    /// }
    /// .style("color: black;")
    /// ```
    ///
    /// - Parameter value: The style to apply.
    ///
    /// - Returns: The element
    func style(_ value: String) -> Self
}

extension StyleAttribute where Self: ContentNode {
    
    internal func mutate(style value: String) -> Self {
        return self.mutate(key: "style", value: value)
    }
    
    internal func mutate(style value: TaintedString) -> Self {
        return self.mutate(key: "style", value: value)
    }
}

extension StyleAttribute where Self: EmptyNode {
    
    internal func mutate(style value: String) -> Self {
        return self.mutate(key: "style", value: value)
    }
    
    internal func mutate(style value: TaintedString) -> Self {
        return self.mutate(key: "style", value: value)
    }
}

/// A type that provides the `tabIndex` modifier.
@_documentation(visibility: internal)
public protocol TabulatorAttribute: Attribute {
 
    /// Specify the tab order.
    ///
    /// ```swift
    /// Division {
    /// }
    /// .tabIndex(3)
    /// ```
    ///
    /// - Parameter number: The number for the order.
    ///
    /// - Returns: The element
    func tabIndex(_ number: Int) -> Self
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

/// A type that provides the `target` modifier.
@_documentation(visibility: internal)
public protocol TargetAttribute: Attribute {
    
    /// Define where to open the linked document.
    ///
    /// ```swift
    /// Anchor {
    ///     "Lorem ipsum..."
    /// }
    /// .reference("https://")
    /// .target(.blank)
    /// ```
    ///
    /// - Parameter value: The kind of target to indicate.
    ///
    /// - Returns: The element
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

/// A type that provides the `title` modifier.
@_documentation(visibility: internal)
public protocol TitleAttribute: Attribute {
 
    /// Supply extra information about the element.
    ///
    /// ```swift
    /// Paragraph {
    ///     "Lorem ipsum..."
    /// }
    /// .title("Lorem ipsum")
    /// ```
    ///
    /// - Parameter value: The extra information to display.
    ///
    /// - Returns: The element
    func title(_ value: String) -> Self
    
    /// Supply extra information about the element..
    /// 
    /// ```swift
    /// Paragraph {
    ///     "Lorem ipsum..."
    /// }
    /// .title("Lorem ipsum")
    /// ```
    ///
    /// - Parameter localizedKey: The string key to be translated.
    /// - Parameter tableName: The translation table to look in.
    ///
    /// - Returns: The element
    func title(_ localizedKey: LocalizedStringKey, tableName: String?) -> Self
    
    /// Supply extra information about the element without localization.
    ///
    /// ```swift
    /// Paragraph {
    ///     "Lorem ipsum..."
    /// }
    /// .title(verbatim: "Lorem ipsum")
    /// ```
    ///
    /// - Parameter value: The extra information to display.
    ///
    /// - Returns: The element
    func title(verbatim value: String) -> Self
}

extension TitleAttribute where Self: ContentNode {
    
    internal func mutate(title value: String) -> Self {
        return self.mutate(key: "title", value: value)
    }
    
    internal func mutate(title value: LocalizedString) -> Self {
        return self.mutate(key: "title", value: value)
    }
}

extension TitleAttribute where Self: EmptyNode {
    
    internal func mutate(title value: String) -> Self {
        return self.mutate(key: "title", value: value)
    }
    
    internal func mutate(title value: LocalizedString) -> Self {
        return self.mutate(key: "title", value: value)
    }
}

/// A type that provides the `translate` modifier.
@_documentation(visibility: internal)
public protocol TranslateAttribute: Attribute {
 
    /// Hint the translation behaviour.
    ///
    /// ```swift
    /// Paragraph {
    ///     "Lorem ipsum..."
    /// }
    /// .translate(true)
    /// ```
    ///
    /// - Parameter value: Whether to exclude the content from translation.
    ///
    /// - Returns: The element
    func translate(_ value: Bool) -> Self
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

/// A type that provides the `type` modifier.
@_documentation(visibility: internal)
public protocol TypeAttribute: Attribute {

    associatedtype TypeValue
    
    /// Specify the type of an element.
    ///
    /// ```swift
    /// Input()
    ///     .type(.text)
    /// ```
    ///
    /// - Parameter value: The type to choose from.
    ///
    /// - Returns: The element
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

/// A type that provides the `useMap` modifier.
@_documentation(visibility: internal)
public protocol UseMapAttribute: Attribute {
    
    /// Link the element with an associated map.
    ///
    /// ```swift
    /// Image()
    ///     .source("....png")
    ///     .useMap("...")
    /// Map {
    ///     Area()
    ///         .shape(.circle, coordinates: "...")
    /// }
    /// .name("...")
    /// ```
    /// - Parameter name: The name of the map to link to
    func useMap(_ name: String) -> Self
}

extension UseMapAttribute where Self: ContentNode {
    
    internal func mutate(usemap value: String) -> Self {
        return self.mutate(key: "usemap", value: "#\(value)")
    }
}

extension UseMapAttribute where Self: EmptyNode {
    
    internal func mutate(usemap value: String) -> Self {
        return self.mutate(key: "usemap", value: "#\(value)")
    }
}

/// A type that provides the `value` modifier.
@_documentation(visibility: internal)
public protocol ValueAttribute: Attribute {
    
    /// Set a initial value for the element.
    ///
    /// ```swift
    /// Input()
    ///     .type(.text)
    ///     .value("Lorem ipsum...")
    /// ```
    ///
    /// - Parameter value: The initial value
    ///
    /// - Returns: The element
    func value(_ value: String) -> Self
    
    /// Set a initial value for the element.
    /// 
    /// ```swift
    /// Input()
    ///     .type(.text)
    ///     .value("Lorem ipsum...")
    /// ```
    ///
    /// - Parameter localizedKey: The string key to be translated
    /// - Parameter tableName: The translation table to look in
    ///
    /// - Returns: The element
    func value(_ localizedKey: LocalizedStringKey, tableName: String?) -> Self
    
    /// Set a initial value for the element without localization.
    ///
    /// ```swift
    /// Input()
    ///     .type(.text)
    ///     .value(verbatim: "Lorem ipsum...")
    /// ```
    ///
    /// - Parameter value: The initial value
    ///
    /// - Returns: The element
    func value(verbatim value: String) -> Self
}

extension ValueAttribute where Self: ContentNode {
    
    internal func mutate(value: String) -> Self {
        return self.mutate(key: "value", value: value)
    }
    
    internal func mutate(value: LocalizedString) -> Self {
        return self.mutate(key: "value", value: value)
    }
}

extension ValueAttribute where Self: EmptyNode {
    
    internal func mutate(value: String) -> Self {
        return self.mutate(key: "value", value: value)
    }
    
    internal func mutate(value: LocalizedString) -> Self {
        return self.mutate(key: "value", value: value)
    }
}

/// A type that provides the `width` modifier.
@_documentation(visibility: internal)
public protocol WidthAttribute: Attribute {
    
    /// Set the actual width for the element.
    ///
    /// ```swift
    /// Input()
    ///     .width(200)
    /// ```
    ///
    /// - Parameter size: The width to constrain the element to.
    ///
    /// - Returns: The element
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

/// A type that provides the `wrap` modifier.
@_documentation(visibility: internal)
public protocol WrapAttribute: Attribute {
    
    /// Specifiy how the text in a text area is to be wrapped when submitted in a form.
    ///
    /// ```swift
    /// TextArea {
    ///     "Lorem ipsum..."
    /// }
    /// .wrap(.soft)
    /// ```
    ///
    /// - Parameter value: The way to break words accross lines.
    ///
    /// - Returns: The element
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

/// A type that provides the `property` modifier.
@_documentation(visibility: internal)
public protocol PropertyAttribute: Attribute {
    
    /// Add a property for a link preview.
    ///
    /// ```swift
    /// Meta()
    ///     .property(.url)
    ///     .content("https://...")
    /// ```
    ///
    /// - Parameter value: The property to describe the purpose.
    ///
    /// - Returns: The element
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

/// A type that provides the `selected` modifier.
@_documentation(visibility: internal)
public protocol SelectedAttribute: Attribute {
    
    /// Mark a select option as default.
    ///
    /// ```swift
    /// Select {
    ///     Option()
    ///         .value("lorem")
    ///         .selected()
    /// }
    /// .name("lorem")
    /// .id("lorem")
    /// ```
    ///
    /// - Parameter condition: Whether to default the option.
    ///
    /// - Returns: The element
    func selected(_ condition: Bool) -> Self
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

/// A type that provides the `shadowRootMode` modifier.
@_documentation(visibility: internal)
public protocol ShadowRootModeAttribute: Attribute {
    
    /// Restrict access to the shadow root for the element.
    ///
    /// ```swift
    /// Template {
    ///     Slot {
    ///     }
    /// }
    /// .shadowRootMode(.open)
    /// ```
    /// - Parameter mode: The mode that controls access.
    ///
    /// - Returns: The element
    func shadowRootMode(_ mode: Values.Shadow.Mode) -> Self
}

extension ShadowRootModeAttribute where Self: ContentNode {
    
    internal func mutate(shadowrootmode value: String) -> Self {
        return self.mutate(key: "shadowrootmode", value: value)
    }
}

/// A type that provides the `inert` modifier.
@_documentation(visibility: internal)
public protocol InertAttribute: Attribute {
    
    /// Disable the element and the content of the element based on a condition.
    ///
    /// ```swift
    /// Division {
    /// }
    /// .inert(true)
    /// ```
    ///
    /// - Parameter condition: Whether the element should be disabled.
    ///
    /// - Returns: The element
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

/// A type that provides the `fetchPriority` modifier
@_documentation(visibility: internal)
public protocol FetchPriorityAttribute: Attribute {
    
    /// Set the priority to fetch the resource.
    ///
    /// ```swift
    /// Image()
    ///     .fetchPriority(.high)
    /// ```
    ///
    /// - Parameter value: The priority to take into account.
    ///
    /// - Returns: The elemet
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

/// A type that provides the `loading` modifier
@_documentation(visibility: internal)
public protocol LoadingAttribute: Attribute {
    
    /// Specify the loading behaviour.
    ///
    /// ```swift
    /// Image()
    ///     .source("https://...")
    ///     .loading(.lazy)
    /// ```
    ///
    /// - Parameter value: The loading method to use.
    ///
    /// - Returns: The element
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

/// A type that provides the `sourceSet` modifier
@_documentation(visibility: internal)
public protocol SourceSetAttribute: Attribute {
    
    /// Define a set of sources for a picture element.
    ///
    /// ```swift
    /// Picture {
    ///     Source()
    ///         .sourceSet([SourceCandidate("...webp", width: 1024), SourceCandidate("...webp", width: 1680)])
    /// }
    /// ```
    ///
    /// - Parameter candidates: The candidates to choose from.
    ///
    /// - Returns: The element.
    func sourceSet(_ candidates: [SourceCandidate]) -> Self
    
    /// Define a set of sources for a picture element.
    ///
    /// ```swift
    /// Picture {
    ///     Source()
    ///         .sourceSet(SourceCandidate("...webp", width: 1024), SourceCandidate("...webp", width: 1680))
    /// }
    /// ```
    ///
    /// - Parameter candidates: The candidates to choose from.
    ///
    /// - Returns: The element.
    func sourceSet(_ candidates: SourceCandidate...) -> Self
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

/// A type that provides the `decoding` modifier
@_documentation(visibility: internal)
public protocol DecodingAttribute: Attribute {
    
    /// Hint the decoding strategy.
    ///
    /// ```swift
    /// Image()
    ///     .source("...jpg")
    ///     .alternate("Lorem ipsum...")
    ///     .decoding(.async)
    /// ```
    ///
    /// - Parameter value: The strategy to use for the decoding.
    ///
    /// - Returns: The element
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

/// A type that provides the `blocking` modifier
@_documentation(visibility: internal)
public protocol BlockingAttribute: Attribute {
    
    /// Announce an element as render blocking.
    ///
    /// ```swift
    /// Style {
    ///     "Lorem ipsum..."
    /// }
    /// .blocking(.render)
    /// ```
    ///
    /// - Parameter value: The strategy to use for blocking.
    ///
    /// - Returns: The element
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

/// A type that provides the `popover` modifier
@_documentation(visibility: internal)
public protocol PopoverAttribute: Attribute {
    
    /// Apply an popover to an element.
    ///
    /// ```swift
    /// Division {
    /// }
    /// .popover(.manual)
    /// ```
    ///
    /// - Parameter value: The behavior for closing the popover.
    ///
    /// - Returns: The element
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

/// A type that provides the `popoverTarget` modifier
@_documentation(visibility: internal)
public protocol PopoverTargetAttribute: Attribute {
    
    /// Bind the popover to a target.
    ///
    /// ```swift
    /// Division {
    ///}
    ///.popover(.manual)
    ///.id("id")
    /// Button {
    ///     "Lorem ipsum"
    /// }
    /// .popoverTarget("id", action: .hide)
    /// ```
    ///
    /// - Parameter id: The identifier of the target to bind the popover to.
    /// - Parameter action: The action to perform when triggered.
    ///
    /// - Returns: The element
    func popoverTarget(_ id: String, action: Values.Popover.Action?) -> Self
}

extension PopoverTargetAttribute where Self: ContentNode {
    
    internal func mutate(popovertarget value: String) -> Self {
        return self.mutate(key: "popovertarget", value: value)
    }
    
    internal func mutate(popovertargetaction value: String?) -> Self {
        
        if let value = value {
            return self.mutate(key: "popovertargetaction", value: value)
        }
        
        return self
    }
}

extension PopoverTargetAttribute where Self: EmptyNode {
    
    internal func mutate(popovertarget value: String) -> Self {
        return self.mutate(key: "popovertarget", value: value)
    }
    
    internal func mutate(popovertargetaction value: String?) -> Self {
        
        if let value = value {
            return self.mutate(key: "popovertargetaction", value: value)
        }
        
        return self
    }
}

/// A type that provides the `popoverAction` modifier
@_documentation(visibility: internal)
public protocol PopoverActionAttribute: Attribute {
    
    /// Specify the action for the popover.
    ///
    /// ```swift
    /// Button {
    ///     "Lorem ipsum"
    /// }
    /// .popoverTarget("id")
    /// .popoverAction(.hide)
    /// ```
    ///
    /// - Parameter action: The action to perform when triggered.
    ///
    /// - Returns: The element
    func popoverAction(_ action: Values.Popover.Action) -> Self
}

extension PopoverActionAttribute where Self: ContentNode {
    
    internal func mutate(popoveraction value: String) -> Self {
        return self.mutate(key: "popovertargetaction", value: value)
    }
}

extension PopoverActionAttribute where Self: EmptyNode {
    
    internal func mutate(popoveraction value: String) -> Self {
        return self.mutate(key: "popovertargetaction", value: value)
    }
}
