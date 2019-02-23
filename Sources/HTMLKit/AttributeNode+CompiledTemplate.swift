
extension HTML.AttributeNode: CompiledTemplate {

    public func render<T>(with manager: HTML.Renderer.ContextManager<T>) throws -> String {
        if let value = value {
            return try "\(attribute)='\(value.render(with: manager))'"
        } else {
            return "\(attribute)"
        }
    }

    public func brew<T>(_ formula: HTML.Renderer.Formula<T>) throws {
        formula.add(string: attribute)
        if let value = value {
            formula.add(string: "='")
            try value.brew(formula)
            formula.add(string: "'")
        }
    }
}

extension HTML.AttributeNode {

    // MARK: - Non HTML standard

    public static func dataToggle(_ toggle: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "data-toggle", value: toggle)
    }

    public static func dataTarget(_ target: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "data-target", value: target)
    }

    public static func role(_ text: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "role", value: text)
    }

    public static func ariaHaspopup(_ text: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "aria-haspopup", value: text)
    }

    public static func ariaExpanded(_ text: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "aria-expanded", value: text)
    }

    public static func ariaValuenow(_ text: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "aria-valuenow", value: text)
    }

    public static func ariaValuemin(_ text: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "aria-valuemin", value: text)
    }

    public static func ariaValuemax(_ text: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "aria-valuemax", value: text)
    }

    public static func dataDismiss(_ text: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "data-dismiss", value: text)
    }

    public static func ariaLabel(_ text: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "aria-label", value: text)
    }

    public static func ariaHidden(_ text: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "aria-hidden", value: text)
    }

    // MARK: - HTML Standard

    /// Specifies an alternate text when the original element fails to display
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func alt(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "alt", value: value)
    }

    /// Specifies the types of files that the server accepts (only for type="file")
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func accept(_ text: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "accept", value: text)
    }

    /// Specifies the character encodings that are to be used for the form submission
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func acceptCharset(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "accept-charset", value: value)
    }

    /// Specifies a shortcut key to activate/focus an element
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func accesskey(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "accesskey", value: value)
    }

    /// Specifies where to send the form-data when a form is submitted
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func action(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "action", value: value)
    }

    /// Specifies that the script is executed asynchronously (only for external scripts)
    ///
    /// - Returns: An attribute node
    public static var async: HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "async", value: nil)
    }

    /// Specifies whether the <form> or the <input> element should have autocomplete enabled
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func autocomplete(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "autocomplete", value: value)
    }

    /// Specifies that the element should automatically get focus when the page loads
    ///
    /// - Returns: An attribute node
    public static var autofocus: HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "autofocus", value: nil)
    }

    /// Specifies that the audio/video will start playing as soon as it is ready
    ///
    /// - Returns: An attribute node
    public static var autoplay: HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "autoplay", value: nil)
    }

    /// Specifies the character encoding
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func charset(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "charset", value: value)
    }

    /// Specifies that an <input> element should be pre-selected when the page loads (for type="checkbox" or type="radio")
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static var checked: HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "checked", value: nil)
    }

    /// Specifies a URL which explains the quote/deleted/inserted text
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func cite(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "cite", value: value)
    }

    /// Specifies one or more classnames for an element (refers to a class in a style sheet)
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func `class`(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "class", value: value)
    }

    /// Specifies the visible width of a text area
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func cols(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "cols", value: value)
    }

    /// Specifies the number of columns a table cell should span
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func colspan(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "colspan", value: value)
    }

    /// Gives the value associated with the http-equiv or name attribute
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func content(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "content", value: value)
    }

    /// Specifies whether the content of an element is editable or not
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func contenteditable(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "contenteditable", value: value)
    }

    /// Specifies that audio/video controls should be displayed (such as a play/pause button etc)
    ///
    /// - Returns: An attribute node
    public static var controls: HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "controls", value: nil)
    }

    /// Specifies the coordinates of the area
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func coords(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "coords", value: value)
    }

    /// Specifies the URL of the resource to be used by the object
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func data(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "data", value: value)
    }

    /// Specifies the date and time
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func datetime(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "datetime", value: value)
    }

    /// Specifies that the track is to be enabled if the user's preferences do not indicate that another track would be more appropriate
    ///
    /// - Returns: An attribute node
    public static var `default`: HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "default", value: nil)
    }

    /// Specifies that the script is executed when the page has finished parsing (only for external scripts)
    ///
    /// - Returns: An attribute node
    public static var `defer`: HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "defer", value: nil)
    }

    /// Specifies the text direction for the content in an element
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func dir(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "dir", value: value)
    }

    /// Specifies that the text direction will be submitted
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func dirname(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "dirname", value: value)
    }

    /// Specifies that the specified element/group of elements should be disabled
    ///
    /// - Returns: An attribute node
    public static var disable: HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "disable", value: nil)
    }

    /// Specifies that the target will be downloaded when a user clicks on the hyperlink
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static var download: HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "download", value: nil)
    }

    /// Specifies whether an element is draggable or not
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func draggable(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "draggable", value: value)
    }

    /// Specifies whether the dragged data is copied, moved, or linked, when dropped
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func dropzone(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "dropzone", value: value)
    }

    /// Specifies how the form-data should be encoded when submitting it to the server (only for method="post")
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func enctype(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "enctype", value: value)
    }

    /// Specifies which form element(s) a label/calculation is bound to
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func `for`(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "for", value: value)
    }

    /// Specifies the name of the form the element belongs to
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func form(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "form", value: value)
    }

    /// Specifies where to send the form-data when a form is submitted. Only for type="submit"
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func formaction(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "formaction", value: value)
    }

    /// Specifies one or more headers cells a cell is related to
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func headers(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "headers", value: value)
    }

    /// Specifies the height of the element
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func height(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "height", value: value)
    }

    /// Specifies that an element is not yet, or is no longer, relevant
    ///
    /// - Returns: An attribute node
    public static var hidden: HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "hidden", value: nil)
    }

    /// Specifies the width of the element
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func width(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "width", value: value)
    }

    /// Specifies the range that is considered to be a high value
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func high(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "high", value: value)
    }

    /// Specifies the URL of the page the link goes to
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func href(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "href", value: value)
    }

    /// Specifies the language of the linked document
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func hreflang(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "hreflang", value: value)
    }

    /// Provides an HTTP header for the information/value of the content attribute
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func httpEquiv(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "http-equiv", value: value)
    }

    /// Specifies a unique id for an element
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func id(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "id", value: value)
    }

    /// Specifies an image as a server-side image-map
    ///
    /// - Returns: An attribute node
    public static var ismap: HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "ismap", value: nil)
    }

    /// Specifies the kind of text track
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func kind(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "kind", value: value)
    }

    /// Specifies the title of the text track
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func label(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "label", value: value)
    }

    /// Specifies the language of the element's content
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func lang(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "lang", value: value)
    }

    /// Refers to a <datalist> element that contains pre-defined options for an <input> element
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func list(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "list", value: value)
    }

    /// Specifies that the audio/video will start over again, every time it is finished
    ///
    /// - Returns: An attribute node
    public static var loop: HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "loop", value: nil)
    }

    /// Specifies the range that is considered to be a low value
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func low(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "low", value: value)
    }

    /// Specifies the maximum value
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func max(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "max", value: value)
    }

    /// Specifies the maximum number of characters allowed in an element
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func maxlength(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "maxlength", value: value)
    }

    /// Specifies what media/device the linked document is optimized for
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func media(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "media", value: value)
    }

    /// Specifies the HTTP method to use when sending form-data
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func method(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "method", value: value)
    }

    /// Specifies a minimum value
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func min(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "min", value: value)
    }

    /// Specifies that a user can enter more than one value
    ///
    /// - Returns: An attribute node
    public static var multiple: HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "multiple", value: nil)
    }

    /// Specifies that the audio output of the video should be muted
    ///
    /// - Returns: An attribute node
    public static var muted: HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "muted", value: nil)
    }

    /// Specifies the name of the element
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func name(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "name", value: value)
    }

    /// Specifies that the form should not be validated when submitted
    ///
    /// - Returns: An attribute node
    public static var novalidate: HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "novalidate", value: nil)
    }

    /// Script to be run on abort
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func onabort(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "onabort", value: value)
    }

    /// Script to be run after the document is printed
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func onafterprint(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "onafterprint", value: value)
    }

    /// Script to be run before the document is printed
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func onbeforeprint(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "onbeforeprint", value: value)
    }

    /// Script to be run when the document is about to be unloaded
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func onbeforeunload(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "onbeforeload", value: value)
    }

    /// Script to be run when the element loses focus
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func onblur(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "onblur", value: value)
    }

    /// Script to be run when a file is ready to start playing (when it has buffered enough to begin)
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func oncanplay(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "oncanplay", value: value)
    }

    /// Script to be run when a file can be played all the way to the end without pausing for buffering
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func oncanplaythrough(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "oncanplaythrough", value: value)
    }

    /// Script to be run when the value of the element is changed
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func onchange(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "onchange", value: value)
    }

    /// Script to be run when the element is being clicked
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func onclick(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "onclick", value: value)
    }

    /// Script to be run when a context menu is triggered
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func oncontextmenu(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "oncontextmenu", value: value)
    }

    /// Script to be run when the content of the element is being copied
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func oncopy(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "oncopy", value: value)
    }

    /// Script to be run when the cue changes in a <track> element
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func oncuechange(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "oncuechange", value: value)
    }

    /// Script to be run when the content of the element is being cut
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func oncut(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "oncut", value: value)
    }

    /// Script to be run when the element is being double-clicked
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func ondblclick(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "ondblclick", value: value)
    }

    /// Script to be run when the element is being dragged
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func ondrag(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "ondrag", value: value)
    }

    /// Script to be run at the end of a drag operation
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func ondragend(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "ondragend", value: value)
    }

    /// Script to be run when an element has been dragged to a valid drop target
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func ondragenter(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "ondragenter", value: value)
    }

    /// Script to be run when an element leaves a valid drop target
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func ondragleave(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "ondragleave", value: value)
    }

    /// Script to be run when an element is being dragged over a valid drop target
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func ondragover(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "ondragover", value: value)
    }

    /// Script to be run at the start of a drag operation
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func ondragstart(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "ondragstart", value: value)
    }

    /// Script to be run when dragged element is being dropped
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func ondrop(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "ondrop", value: value)
    }

    /// Script to be run when the length of the media changes
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func ondurationchange(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "ondurationchange", value: value)
    }

    /// Script to be run when something bad happens and the file is suddenly unavailable (like unexpectedly disconnects)
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func onemptied(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "onemptied", value: value)
    }

    /// Script to be run when the media has reach the end (a useful event for messages like "thanks for listening")
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func onended(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "onended", value: value)
    }

    /// Script to be run when an error occurs
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func onerror(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "onerror", value: value)
    }

    /// Script to be run when the element gets focus
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func onfocus(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "onfocus", value: value)
    }

    /// Script to be run when there has been changes to the anchor part of the a URL
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func onhashchange(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "onhashchange", value: value)
    }

    /// Script to be run when the element gets user input
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func oninput(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "oninput", value: value)
    }

    /// Script to be run when the element is invalid
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func oninvalid(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "oninvalid", value: value)
    }

    /// Script to be run when the element is finished loading
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func onload(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "onload", value: value)
    }

    /// Specifies that the details should be visible (open) to the user
    ///
    /// - Returns: An attribute node
    public static var open: HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "open", value: nil)
    }

    /// Specifies a regular expression that an <input> element's value is checked against
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func pattern(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "pattern", value: value)
    }

    /// Specifies what value is the optimal value for the gauge
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func optimum(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "optimum", value: value)
    }


    /// Specifies a short hint that describes the expected value of the element
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func placeholder(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "placeholder", value: value)
    }

    /// Specifies an image to be shown while the video is downloading, or until the user hits the play button
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func poster(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "poster", value: value)
    }

    /// Specifies if and how the author thinks the audio/video should be loaded when the page loads
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func preload(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "preload", value: value)
    }

    /// Specifies that the element is read-only
    public static var readonly: HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "readonly", value: nil)
    }

    /// Specifies the relationship between the current document and the linked document
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func rel(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "rel", value: value)
    }

    /// Specifies that the element must be filled out before submitting the form
    public static var `required`: HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "required", value: nil)
    }

    /// Specifies that the list order should be descending (9,8,7...)
    public static var reversed: HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "reversed", value: nil)
    }

    /// Specifies the visible number of lines in a text area
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func rows(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "rows", value: value)
    }

    /// Specifies the number of rows a table cell should span
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func rowspan(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "rowspan", value: value)
    }

    /// Enables an extra set of restrictions for the content in an <iframe>
    public static var sandbox: HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "sandbox", value: nil)
    }

    /// Specifies whether a header cell is a header for a column, row, or group of columns or rows
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func scope(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "scope", value: value)
    }

    /// Specifies that an option should be pre-selected when the page loads
    public static var selected: HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "selected", value: nil)
    }

    /// Specifies the shape of the area
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func shape(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "shape", value: value)
    }

    /// Specifies the width, in characters (for <input>) or specifies the number of visible options (for <select>)
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func size(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "size", value: value)
    }

    /// Specifies the size of the linked resource
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func sizes(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "sizes", value: value)
    }

    /// Specifies the number of columns to span
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func span(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "span", value: value)
    }

    /// Specifies whether the element is to have its spelling and grammar checked or not
    public static var spellcheck: HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "spellcheck", value: nil)
    }

    /// Specifies the URL of the media file
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func src(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "src", value: value)
    }

    /// Specifies the HTML content of the page to show in the <iframe>
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func srcdoc(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "srcdoc", value: value)
    }

    /// Specifies the language of the track text data (required if kind="subtitles")
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func srclang(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "srclang", value: value)
    }

    /// Specifies the URL of the image to use in different situations
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func srcset(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "srcset", value: value)
    }

    /// Specifies the start value of an ordered list
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func start(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "start", value: value)
    }

    /// Specifies the legal number intervals for an input field
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func step(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "step", value: value)
    }

    /// Specifies an inline CSS style for an element
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func style(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "style", value: value)
    }

    /// Specifies the tabbing order of an element
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func tabindex(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "tabindex", value: value)
    }

    /// Specifies the target for where to open the linked document or where to submit the form
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func target(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "target", value: value)
    }

    /// Specifies extra information about an element
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func title(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "title", value: value)
    }

    /// Specifies whether the content of an element should be translated or not
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func translate(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "translate", value: value)
    }

    /// Specifies the type of element
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func type(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "type", value: value)
    }

    /// Specifies an image as a client-side image-map
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func usemap(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "usemap", value: value)
    }

    /// Specifies the value of the element
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func value(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "value", value: value)
    }

    /// Specifies how the text in a text area is to be wrapped when submitted in a form
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public static func wrap(_ value: CompiledTemplate) -> HTML.AttributeNode {
        return HTML.AttributeNode(attribute: "wrap", value: value)
    }
}
