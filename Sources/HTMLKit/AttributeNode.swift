
extension AttributeNode {

    // MARK: - Non HTML standard

    public func dataToggle(_ toggle: View) -> Self {
        add(HTML.Attribute(attribute: "data-toggle", value: toggle))
    }

    public func dataTarget(_ target: View) -> Self {
        add(HTML.Attribute(attribute: "data-target", value: target))
    }

    public func role(_ text: View) -> Self {
        add(HTML.Attribute(attribute: "role", value: text))
    }

    public func ariaHaspopup(_ text: View) -> Self {
        add(HTML.Attribute(attribute: "aria-haspopup", value: text))
    }

    public func ariaExpanded(_ text: View) -> Self {
        add(HTML.Attribute(attribute: "aria-expanded", value: text))
    }

    public func ariaValuenow(_ text: View) -> Self {
        add(HTML.Attribute(attribute: "aria-valuenow", value: text))
    }

    public func ariaValuemin(_ text: View) -> Self {
        add(HTML.Attribute(attribute: "aria-valuemin", value: text))
    }

    public func ariaValuemax(_ text: View) -> Self {
        add(HTML.Attribute(attribute: "aria-valuemax", value: text))
    }

    public func dataDismiss(_ text: View) -> Self {
        add(HTML.Attribute(attribute: "data-dismiss", value: text))
    }

    public func ariaLabel(_ text: View) -> Self {
        add(HTML.Attribute(attribute: "aria-label", value: text))
    }

    public func ariaLabelledBy(_ text: View) -> Self {
        add(HTML.Attribute(attribute: "aria-labelledby", value: text))
    }

    public func ariaHidden(_ text: View) -> Self {
        add(HTML.Attribute(attribute: "aria-hidden", value: text))
    }

    // MARK: - HTML Standard

    /// Specifies an alternate text when the original element fails to display
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func alt(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "alt", value: value))
    }

    /// Specifies the types of files that the server accepts (only for type="file")
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func accept(_ text: View) -> Self {
        add(HTML.Attribute(attribute: "accept", value: text))
    }

    /// Specifies the character encodings that are to be used for the form submission
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func acceptCharset(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "accept-charset", value: value))
    }

    /// Specifies a shortcut key to activate/focus an element
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func accesskey(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "accesskey", value: value))
    }

    /// Specifies where to send the form-data when a form is submitted
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func action(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "action", value: value))
    }

    /// Specifies that the script is executed asynchronously (only for external scripts)
    ///
    /// - Returns: An attribute node
    public func async() -> Self {
        add(HTML.Attribute(attribute: "async", value: nil))
    }

    /// Specifies whether the <form> or the <input> element should have autocomplete enabled
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func autocomplete(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "autocomplete", value: value))
    }

    /// Specifies that the element should automatically get focus when the page loads
    ///
    /// - Returns: An attribute node
    public func autofocus() -> Self {
        add(HTML.Attribute(attribute: "autofocus", value: nil))
    }

    /// Specifies that the audio/video will start playing as soon as it is ready
    ///
    /// - Returns: An attribute node
    public func autoplay() -> Self {
        add(HTML.Attribute(attribute: "autoplay", value: nil))
    }

    /// Specifies the character encoding
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func charset(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "charset", value: value))
    }

    /// Specifies that an <input> element should be pre-selected when the page loads (for type="checkbox" or type="radio")
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func checked() -> Self {
        add(HTML.Attribute(attribute: "checked", value: nil))
    }

    /// Specifies a URL which explains the quote/deleted/inserted text
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func cite(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "cite", value: value))
    }

    /// Specifies one or more classnames for an element (refers to a class in a style sheet)
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func `class`(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "class", value: value))
    }

    /// Specifies the visible width of a text area
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func cols(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "cols", value: value))
    }

    /// Specifies the number of columns a table cell should span
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func colspan(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "colspan", value: value))
    }

    /// Gives the value associated with the http-equiv or name attribute
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func content(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "content", value: value))
    }

    /// Specifies whether the content of an element is editable or not
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func contenteditable(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "contenteditable", value: value))
    }

    /// Specifies that audio/video controls should be displayed (such as a play/pause button etc)
    ///
    /// - Returns: An attribute node
    public func controls() -> Self {
        add(HTML.Attribute(attribute: "controls", value: nil))
    }

    /// Specifies the coordinates of the area
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func coords(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "coords", value: value))
    }

    /// Specifies the URL of the resource to be used by the object
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func data(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "data", value: value))
    }

    /// Specifies the date and time
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func datetime(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "datetime", value: value))
    }

    /// Specifies that the track is to be enabled if the user's preferences do not indicate that another track would be more appropriate
    ///
    /// - Returns: An attribute node
    public func `default`() -> Self {
        add(HTML.Attribute(attribute: "default", value: nil))
    }

    /// Specifies that the script is executed when the page has finished parsing (only for external scripts)
    ///
    /// - Returns: An attribute node
    public func `defer`() -> Self {
        add(HTML.Attribute(attribute: "defer", value: nil))
    }

    /// Specifies the text direction for the content in an element
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func dir(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "dir", value: value))
    }

    /// Specifies that the text direction will be submitted
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func dirname(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "dirname", value: value))
    }

    /// Specifies that the specified element/group of elements should be disabled
    ///
    /// - Returns: An attribute node
    public func disable() -> Self {
        add(HTML.Attribute(attribute: "disable", value: nil))
    }

    /// Specifies that the target will be downloaded when a user clicks on the hyperlink
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func download() -> Self {
        add(HTML.Attribute(attribute: "download", value: nil))
    }

    /// Specifies whether an element is draggable or not
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func draggable(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "draggable", value: value))
    }

    /// Specifies whether the dragged data is copied, moved, or linked, when dropped
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func dropzone(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "dropzone", value: value))
    }

    /// Specifies how the form-data should be encoded when submitting it to the server (only for method="post")
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func enctype(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "enctype", value: value))
    }

    /// Specifies which form element(s) a label/calculation is bound to
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func `for`(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "for", value: value))
    }

    /// Specifies the name of the form the element belongs to
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func form(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "form", value: value))
    }

    /// Specifies where to send the form-data when a form is submitted. Only for type="submit"
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func formaction(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "formaction", value: value))
    }

    /// Specifies one or more headers cells a cell is related to
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func headers(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "headers", value: value))
    }

    /// Specifies the height of the element
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func height(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "height", value: value))
    }

    /// Specifies that an element is not yet, or is no longer, relevant
    ///
    /// - Returns: An attribute node
    public func hidden() -> Self {
        add(HTML.Attribute(attribute: "hidden", value: nil))
    }

    /// Specifies the width of the element
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func width(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "width", value: value))
    }

    /// Specifies the range that is considered to be a high value
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func high(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "high", value: value))
    }

    /// Specifies the URL of the page the link goes to
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func href(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "href", value: value))
    }

    /// Specifies the language of the linked document
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func hreflang(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "hreflang", value: value))
    }

    /// Provides an HTTP header for the information/value of the content attribute
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func httpEquiv(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "http-equiv", value: value))
    }

    /// Specifies a unique id for an element
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func id(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "id", value: value))
    }

    /// Specifies an image as a server-side image-map
    ///
    /// - Returns: An attribute node
    public func ismap() -> Self {
        add(HTML.Attribute(attribute: "ismap", value: nil))
    }

    /// Specifies the kind of text track
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func kind(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "kind", value: value))
    }

    /// Specifies the title of the text track
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func label(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "label", value: value))
    }

    /// Specifies the language of the element's content
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func lang(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "lang", value: value))
    }

    /// Refers to a <datalist> element that contains pre-defined options for an <input> element
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func list(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "list", value: value))
    }

    /// Specifies that the audio/video will start over again, every time it is finished
    ///
    /// - Returns: An attribute node
    public func loop() -> Self {
        add(HTML.Attribute(attribute: "loop", value: nil))
    }

    /// Specifies the range that is considered to be a low value
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func low(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "low", value: value))
    }

    /// Specifies the maximum value
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func max(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "max", value: value))
    }

    /// Specifies the maximum number of characters allowed in an element
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func maxlength(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "maxlength", value: value))
    }

    /// Specifies what media/device the linked document is optimized for
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func media(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "media", value: value))
    }

    /// Specifies the HTTP method to use when sending form-data
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func method(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "method", value: value))
    }

    /// Specifies the HTTP method to use when sending form-data
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func method(_ value: HTML.Attribute.Method) -> Self {
        add(HTML.Attribute(attribute: "method", value: value.rawValue))
    }

    //    /// Specifies a minimum value
    //    ///
    //    /// - Parameter value: The value of the attribute
    //    /// - Returns: An attribute node
    //    public func min<Root>(_ value: TemplateVariable<Root, Int>) -> Self where Root: ContextualTemplate {
    //        add(HTML.Attribute(attribute: "min", value: value))
    //        return self
    //    }

    /// Specifies a minimum value
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func min(_ value: Int) -> Self {
        add(HTML.Attribute(attribute: "min", value: value))
    }

    /// Specifies that a user can enter more than one value
    ///
    /// - Returns: An attribute node
    public func multiple() -> Self {
        add(HTML.Attribute(attribute: "multiple", value: nil))
    }

    /// Specifies that the audio output of the video should be muted
    ///
    /// - Returns: An attribute node
    public func muted() -> Self {
        add(HTML.Attribute(attribute: "muted", value: nil))
    }

    /// Specifies the name of the element
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func name(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "name", value: value))
    }

    /// Specifies that the form should not be validated when submitted
    ///
    /// - Returns: An attribute node
    public func novalidate() -> Self {
        add(HTML.Attribute(attribute: "novalidate", value: nil))
    }

    /// Script to be run on abort
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func onabort(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "onabort", value: value))
    }

    /// Script to be run after the document is printed
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func onafterprint(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "onafterprint", value: value))
    }

    /// Script to be run before the document is printed
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func onbeforeprint(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "onbeforeprint", value: value))
    }

    /// Script to be run when the document is about to be unloaded
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func onbeforeunload(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "onbeforeload", value: value))
    }

    /// Script to be run when the element loses focus
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func onblur(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "onblur", value: value))
    }

    /// Script to be run when a file is ready to start playing (when it has buffered enough to begin)
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func oncanplay(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "oncanplay", value: value))
    }

    /// Script to be run when a file can be played all the way to the end without pausing for buffering
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func oncanplaythrough(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "oncanplaythrough", value: value))
    }

    /// Script to be run when the value of the element is changed
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func onchange(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "onchange", value: value))
    }

    /// Script to be run when the element is being clicked
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func onclick(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "onclick", value: value))
    }

    /// Script to be run when a context menu is triggered
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func oncontextmenu(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "oncontextmenu", value: value))
    }

    /// Script to be run when the content of the element is being copied
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func oncopy(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "oncopy", value: value))
    }

    /// Script to be run when the cue changes in a <track> element
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func oncuechange(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "oncuechange", value: value))
    }

    /// Script to be run when the content of the element is being cut
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func oncut(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "oncut", value: value))
    }

    /// Script to be run when the element is being double-clicked
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func ondblclick(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "ondblclick", value: value))
    }

    /// Script to be run when the element is being dragged
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func ondrag(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "ondrag", value: value))
    }

    /// Script to be run at the end of a drag operation
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func ondragend(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "ondragend", value: value))
    }

    /// Script to be run when an element has been dragged to a valid drop target
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func ondragenter(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "ondragenter", value: value))
    }

    /// Script to be run when an element leaves a valid drop target
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func ondragleave(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "ondragleave", value: value))
    }

    /// Script to be run when an element is being dragged over a valid drop target
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func ondragover(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "ondragover", value: value))
    }

    /// Script to be run at the start of a drag operation
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func ondragstart(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "ondragstart", value: value))
    }

    /// Script to be run when dragged element is being dropped
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func ondrop(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "ondrop", value: value))
    }

    /// Script to be run when the length of the media changes
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func ondurationchange(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "ondurationchange", value: value))
    }

    /// Script to be run when something bad happens and the file is suddenly unavailable (like unexpectedly disconnects)
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func onemptied(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "onemptied", value: value))
    }

    /// Script to be run when the media has reach the end (a useful event for messages like "thanks for listening")
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func onended(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "onended", value: value))
    }

    /// Script to be run when an error occurs
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func onerror(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "onerror", value: value))
    }

    /// Script to be run when the element gets focus
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func onfocus(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "onfocus", value: value))
    }

    /// Script to be run when there has been changes to the anchor part of the a URL
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func onhashchange(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "onhashchange", value: value))
    }

    /// Script to be run when the element gets user input
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func oninput(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "oninput", value: value))
    }

    /// Script to be run when the element is invalid
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func oninvalid(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "oninvalid", value: value))
    }

    /// Script to be run when the element is finished loading
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func onload(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "onload", value: value))
    }

    /// Specifies that the details should be visible (open) to the user
    ///
    /// - Returns: An attribute node
    public func open() -> Self {
        add(HTML.Attribute(attribute: "open", value: nil))
    }

    /// Specifies a regular expression that an <input> element's value is checked against
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func pattern(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "pattern", value: value))
    }

    /// Specifies what value is the optimal value for the gauge
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func optimum(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "optimum", value: value))
    }

    /// Specifies a short hint that describes the expected value of the element
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func placeholder(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "placeholder", value: value))
    }

    /// Specifies an image to be shown while the video is downloading, or until the user hits the play button
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func poster(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "poster", value: value))
    }

    /// Specifies if and how the author thinks the audio/video should be loaded when the page loads
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func preload(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "preload", value: value))
    }

    /// Specifies that the element is read-only
    public func readonly() -> Self {
        add(HTML.Attribute(attribute: "readonly", value: nil))
    }

    /// Specifies the relationship between the current document and the linked document
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func rel(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "rel", value: value))
    }

    /// Specifies that the element must be filled out before submitting the form
    public func `required`() -> Self {
        add(HTML.Attribute(attribute: "required", value: nil))
    }

    /// Specifies that the list order should be descending (9,8,7...)
    public func reversed() -> Self {
        add(HTML.Attribute(attribute: "reversed", value: nil))
    }

    /// Specifies the visible number of lines in a text area
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func rows(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "rows", value: value))
    }

    /// Specifies the number of rows a table cell should span
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func rowspan(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "rowspan", value: value))
    }

    /// Enables an extra set of restrictions for the content in an <iframe>
    public func sandbox() -> Self {
        add(HTML.Attribute(attribute: "sandbox", value: nil))
    }

    /// Specifies whether a header cell is a header for a column, row, or group of columns or rows
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func scope(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "scope", value: value))
    }

    /// Specifies that an option should be pre-selected when the page loads
    public func selected() -> Self {
        add(HTML.Attribute(attribute: "selected", value: nil))
    }

    /// Specifies the shape of the area
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func shape(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "shape", value: value))
    }

    /// Specifies the width, in characters (for <input>) or specifies the number of visible options (for <select>)
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func size(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "size", value: value))
    }

    /// Specifies the size of the linked resource
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func sizes(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "sizes", value: value))
    }

    /// Specifies the number of columns to span
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func span(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "span", value: value))
    }

    /// Specifies whether the element is to have its spelling and grammar checked or not
    public func spellcheck() -> Self {
        add(HTML.Attribute(attribute: "spellcheck", value: nil))
    }

    /// Specifies the URL of the media file
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func src(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "src", value: value))
    }

    /// Specifies the HTML content of the page to show in the <iframe>
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func srcdoc(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "srcdoc", value: value))
    }

    /// Specifies the language of the track text data (required if kind="subtitles")
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func srclang(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "srclang", value: value))
    }

    /// Specifies the URL of the image to use in different situations
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func srcset(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "srcset", value: value))
    }

    /// Specifies the start value of an ordered list
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func start(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "start", value: value))
    }

    /// Specifies the legal number intervals for an input field
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func step(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "step", value: value))
    }

    /// Specifies an inline CSS style for an element
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func style(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "style", value: value))
    }

    /// Specifies the tabbing order of an element
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func tabindex(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "tabindex", value: value))
    }

    /// Specifies the target for where to open the linked document or where to submit the form
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func target(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "target", value: value))
    }

    /// Specifies extra information about an element
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func title(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "title", value: value))
    }

    /// Specifies whether the content of an element should be translated or not
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func translate(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "translate", value: value))
    }

    /// Specifies the type of element
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func type(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "type", value: value))
    }

    /// Specifies an image as a client-side image-map
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func usemap(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "usemap", value: value))
    }

    /// Specifies the value of the element
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func value(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "value", value: value))
    }

    /// Specifies how the text in a text area is to be wrapped when submitted in a form
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func wrap(_ value: View) -> Self {
        add(HTML.Attribute(attribute: "wrap", value: value))
    }
}
