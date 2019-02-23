
public protocol AttributableNode: CompiledTemplate {

    /// Adds an attribute to a node
    ///
    /// - Parameter attribute: The attribute to be added
    /// - Returns: A new modified version of the called object
    func add(_ attribute: HTML.AttributeNode) -> Self
}

extension AttributableNode {

    public func role(_ text: CompiledTemplate) -> Self {
        return self.add( .role(text))
    }

    public func ariaHaspopup(_ text: CompiledTemplate) -> Self {
        return self.add( .ariaHaspopup(text))
    }

    public func ariaExpanded(_ text: CompiledTemplate) -> Self {
        return self.add( .ariaExpanded(text))
    }

    public func ariaValuenow(_ text: CompiledTemplate) -> Self {
        return self.add( .ariaValuenow(text))
    }

    public func ariaValuemin(_ text: CompiledTemplate) -> Self {
        return self.add( .ariaValuemin(text))
    }

    public func ariaValuemax(_ text: CompiledTemplate) -> Self {
        return self.add( .ariaValuemax(text))
    }

    public func dataDismiss(_ text: CompiledTemplate) -> Self {
        return self.add( .dataDismiss(text))
    }

    public func ariaLabel(_ text: CompiledTemplate) -> Self {
        return self.add( .ariaLabel(text))
    }

    public func ariaHidden(_ text: CompiledTemplate) -> Self {
        return self.add( .ariaHidden(text))
    }
}

extension AttributableNode where Self : ContextualTemplate {
    public func `if`(_ condition: HTML.IF<Self>.Condition, add attribute: HTML.AttributeNode) -> CompiledTemplate {
        condition.view = self
        return HTML.IF<Self>(conditions: condition).else(self.add(attribute))
    }
}

extension AttributableNode {

    // MARK: - HTML Standard

    /// Specifies an alternate text when the original element fails to display
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func alt(_ value: CompiledTemplate) -> Self {
        return self.add( .alt(value))
    }

    /// Specifies the types of files that the server accepts (only for type="file")
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func accept(_ text: CompiledTemplate) -> Self {
        return self.add( .accept(text))
    }

    /// Specifies the character encodings that are to be used for the form submission
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func acceptCharset(_ value: CompiledTemplate) -> Self {
        return self.add( .acceptCharset(value))
    }

    /// Specifies a shortcut key to activate/focus an element
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func accesskey(_ value: CompiledTemplate) -> Self {
        return self.add( .accesskey(value))
    }

    /// Specifies where to send the form-data when a form is submitted
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func action(_ value: CompiledTemplate) -> Self {
        return self.add( .action(value))
    }

    /// Specifies that the script is executed asynchronously (only for external scripts)
    ///
    /// - Returns: An attribute node
    public var async: Self {
        return self.add( .async)
    }

    /// Specifies whether the <form> or the <input> element should have autocomplete enabled
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func autocomplete(_ value: CompiledTemplate) -> Self {
        return self.add( .autocomplete(value))
    }

    /// Specifies that the element should automatically get focus when the page loads
    ///
    /// - Returns: An attribute node
    public var autofocus: Self {
        return self.add( .autofocus)
    }

    /// Specifies that the audio/video will start playing as soon as it is ready
    ///
    /// - Returns: An attribute node
    public var autoplay: Self {
        return self.add( .autoplay)
    }

    /// Specifies the character encoding
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func charset(_ value: CompiledTemplate) -> Self {
        return self.add( .charset(value))
    }

    /// Specifies that an <input> element should be pre-selected when the page loads (for type="checkbox" or type="radio")
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public var checked: Self {
        return self.add( .checked)
    }

    /// Specifies a URL which explains the quote/deleted/inserted text
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func cite(_ value: CompiledTemplate) -> Self {
        return self.add( .cite(value))
    }

    /// Specifies one or more classnames for an element (refers to a class in a style sheet)
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func `class`(_ value: CompiledTemplate) -> Self {
        return self.add( .class(value))
    }

    /// Specifies the visible width of a text area
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func cols(_ value: CompiledTemplate) -> Self {
        return self.add( .cols(value))
    }

    /// Specifies the number of columns a table cell should span
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func colspan(_ value: CompiledTemplate) -> Self {
        return self.add( .colspan(value))
    }

    /// Gives the value associated with the http-equiv or name attribute
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func content(_ value: CompiledTemplate) -> Self {
        return self.add( .content(value))
    }

    /// Specifies whether the content of an element is editable or not
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func contenteditable(_ value: CompiledTemplate) -> Self {
        return self.add( .contenteditable(value))
    }

    /// Specifies that audio/video controls should be displayed (such as a play/pause button etc)
    ///
    /// - Returns: An attribute node
    public var controls: Self {
        return self.add( .controls)
    }

    /// Specifies the coordinates of the area
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func coords(_ value: CompiledTemplate) -> Self {
        return self.add( .coords(value))
    }

    /// Specifies the URL of the resource to be used by the object
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func data(_ value: CompiledTemplate) -> Self {
        return self.add( .data(value))
    }

    /// Specifies the date and time
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func datetime(_ value: CompiledTemplate) -> Self {
        return self.add( .datetime(value))
    }

    /// Specifies that the track is to be enabled if the user's preferences do not indicate that another track would be more appropriate
    ///
    /// - Returns: An attribute node
    public var `default`: Self {
        return self.add( .default)
    }

    /// Specifies that the script is executed when the page has finished parsing (only for external scripts)
    ///
    /// - Returns: An attribute node
    public var `defer`: Self {
        return self.add( .defer)
    }

    /// Specifies the text direction for the content in an element
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func dir(_ value: CompiledTemplate) -> Self {
        return self.add( .dir(value))
    }

    /// Specifies that the text direction will be submitted
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func dirname(_ value: CompiledTemplate) -> Self {
        return self.add( .dirname(value))
    }

    /// Specifies that the specified element/group of elements should be disabled
    ///
    /// - Returns: An attribute node
    public var disable: Self {
        return self.add( .disable)
    }

    /// Specifies that the target will be downloaded when a user clicks on the hyperlink
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public var download: Self {
        return self.add( .download)
    }

    /// Specifies whether an element is draggable or not
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func draggable(_ value: CompiledTemplate) -> Self {
        return self.add( .draggable(value))
    }

    /// Specifies whether the dragged data is copied, moved, or linked, when dropped
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func dropzone(_ value: CompiledTemplate) -> Self {
        return self.add( .dropzone(value))
    }

    /// Specifies how the form-data should be encoded when submitting it to the server (only for method="post")
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func enctype(_ value: CompiledTemplate) -> Self {
        return self.add( .enctype(value))
    }

    /// Specifies which form element(s) a label/calculation is bound to
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func `for`(_ value: CompiledTemplate) -> Self {
        return self.add( .for(value))
    }

    /// Specifies the name of the form the element belongs to
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func form(_ value: CompiledTemplate) -> Self {
        return self.add( .form(value))
    }

    /// Specifies where to send the form-data when a form is submitted. Only for type="submit"
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func formaction(_ value: CompiledTemplate) -> Self {
        return self.add( .formaction(value))
    }

    /// Specifies one or more headers cells a cell is related to
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func headers(_ value: CompiledTemplate) -> Self {
        return self.add( .headers(value))
    }

    /// Specifies the height of the element
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func height(_ value: CompiledTemplate) -> Self {
        return self.add( .height(value))
    }

    /// Specifies that an element is not yet, or is no longer, relevant
    ///
    /// - Returns: An attribute node
    public var hidden: Self {
        return self.add( .hidden)
    }

    /// Specifies the width of the element
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func width(_ value: CompiledTemplate) -> Self {
        return self.add( .width(value))
    }

    /// Specifies the range that is considered to be a high value
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func high(_ value: CompiledTemplate) -> Self {
        return self.add( .high(value))
    }

    /// Specifies the URL of the page the link goes to
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func href(_ value: CompiledTemplate) -> Self {
        return self.add( .href(value))
    }

    /// Specifies the language of the linked document
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func hreflang(_ value: CompiledTemplate) -> Self {
        return self.add( .hreflang(value))
    }

    /// Provides an HTTP header for the information/value of the content attribute
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func httpEquiv(_ value: CompiledTemplate) -> Self {
        return self.add( .httpEquiv(value))
    }

    /// Specifies a unique id for an element
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func id(_ value: CompiledTemplate) -> Self {
        return self.add( .id(value))
    }

    /// Specifies an image as a server-side image-map
    ///
    /// - Returns: An attribute node
    public var ismap: Self {
        return self.add( .ismap)
    }

    /// Specifies the kind of text track
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func kind(_ value: CompiledTemplate) -> Self {
        return self.add( .kind(value))
    }

    /// Specifies the title of the text track
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func label(_ value: CompiledTemplate) -> Self {
        return self.add( .label(value))
    }

    /// Specifies the language of the element's content
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func lang(_ value: CompiledTemplate) -> Self {
        return self.add( .lang(value))
    }

    /// Refers to a <datalist> element that contains pre-defined options for an <input> element
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func list(_ value: CompiledTemplate) -> Self {
        return self.add( .list(value))
    }

    /// Specifies that the audio/video will start over again, every time it is finished
    ///
    /// - Returns: An attribute node
    public var loop: Self {
        return self.add( .loop)
    }

    /// Specifies the range that is considered to be a low value
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func low(_ value: CompiledTemplate) -> Self {
        return self.add( .low(value))
    }

    /// Specifies the maximum value
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func max(_ value: CompiledTemplate) -> Self {
        return self.add( .max(value))
    }

    /// Specifies the maximum number of characters allowed in an element
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func maxlength(_ value: CompiledTemplate) -> Self {
        return self.add( .maxlength(value))
    }

    /// Specifies what media/device the linked document is optimized for
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func media(_ value: CompiledTemplate) -> Self {
        return self.add( .media(value))
    }

    /// Specifies the HTTP method to use when sending form-data
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func method(_ value: CompiledTemplate) -> Self {
        return self.add( .method(value))
    }

    /// Specifies a minimum value
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func min(_ value: CompiledTemplate) -> Self {
        return self.add( .min(value))
    }

    /// Specifies that a user can enter more than one value
    ///
    /// - Returns: An attribute node
    public var multiple: Self {
        return self.add( .multiple)
    }

    /// Specifies that the audio output of the video should be muted
    ///
    /// - Returns: An attribute node
    public var muted: Self {
        return self.add( .muted)
    }

    /// Specifies the name of the element
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func name(_ value: CompiledTemplate) -> Self {
        return self.add( .name(value))
    }

    /// Specifies that the form should not be validated when submitted
    ///
    /// - Returns: An attribute node
    public var novalidate: Self {
        return self.add( .novalidate)
    }

    /// Script to be run on abort
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func onabort(_ value: CompiledTemplate) -> Self {
        return self.add( .onabort(value))
    }

    /// Script to be run after the document is printed
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func onafterprint(_ value: CompiledTemplate) -> Self {
        return self.add( .onafterprint(value))
    }

    /// Script to be run before the document is printed
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func onbeforeprint(_ value: CompiledTemplate) -> Self {
        return self.add( .onbeforeprint(value))
    }

    /// Script to be run when the document is about to be unloaded
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func onbeforeunload(_ value: CompiledTemplate) -> Self {
        return self.add( .onbeforeunload(value))
    }

    /// Script to be run when the element loses focus
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func onblur(_ value: CompiledTemplate) -> Self {
        return self.add( .onblur(value))
    }

    /// Script to be run when a file is ready to start playing (when it has buffered enough to begin)
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func oncanplay(_ value: CompiledTemplate) -> Self {
        return self.add( .oncanplay(value))
    }

    /// Script to be run when a file can be played all the way to the end without pausing for buffering
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func oncanplaythrough(_ value: CompiledTemplate) -> Self {
        return self.add( .oncanplaythrough(value))
    }

    /// Script to be run when the value of the element is changed
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func onchange(_ value: CompiledTemplate) -> Self {
        return self.add( .onchange(value))
    }

    /// Script to be run when the element is being clicked
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func onclick(_ value: CompiledTemplate) -> Self {
        return self.add( .onclick(value))
    }

    /// Script to be run when a context menu is triggered
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func oncontextmenu(_ value: CompiledTemplate) -> Self {
        return self.add( .oncontextmenu(value))
    }

    /// Script to be run when the content of the element is being copied
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func oncopy(_ value: CompiledTemplate) -> Self {
        return self.add( .oncopy(value))
    }

    /// Script to be run when the cue changes in a <track> element
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func oncuechange(_ value: CompiledTemplate) -> Self {
        return self.add( .oncuechange(value))
    }

    /// Script to be run when the content of the element is being cut
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func oncut(_ value: CompiledTemplate) -> Self {
        return self.add( .oncut(value))
    }

    /// Script to be run when the element is being double-clicked
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func ondblclick(_ value: CompiledTemplate) -> Self {
        return self.add( .ondblclick(value))
    }

    /// Script to be run when the element is being dragged
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func ondrag(_ value: CompiledTemplate) -> Self {
        return self.add( .ondrag(value))
    }

    /// Script to be run at the end of a drag operation
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func ondragend(_ value: CompiledTemplate) -> Self {
        return self.add( .ondragend(value))
    }

    /// Script to be run when an element has been dragged to a valid drop target
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func ondragenter(_ value: CompiledTemplate) -> Self {
        return self.add( .ondragenter(value))
    }

    /// Script to be run when an element leaves a valid drop target
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func ondragleave(_ value: CompiledTemplate) -> Self {
        return self.add( .ondragleave(value))
    }

    /// Script to be run when an element is being dragged over a valid drop target
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func ondragover(_ value: CompiledTemplate) -> Self {
        return self.add( .ondragover(value))
    }

    /// Script to be run at the start of a drag operation
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func ondragstart(_ value: CompiledTemplate) -> Self {
        return self.add( .ondragstart(value))
    }

    /// Script to be run when dragged element is being dropped
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func ondrop(_ value: CompiledTemplate) -> Self {
        return self.add( .ondrop(value))
    }

    /// Script to be run when the length of the media changes
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func ondurationchange(_ value: CompiledTemplate) -> Self {
        return self.add( .ondurationchange(value))
    }

    /// Script to be run when something bad happens and the file is suddenly unavailable (like unexpectedly disconnects)
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func onemptied(_ value: CompiledTemplate) -> Self {
        return self.add( .onemptied(value))
    }

    /// Script to be run when the media has reach the end (a useful event for messages like "thanks for listening")
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func onended(_ value: CompiledTemplate) -> Self {
        return self.add( .onended(value))
    }

    /// Script to be run when an error occurs
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func onerror(_ value: CompiledTemplate) -> Self {
        return self.add( .onerror(value))
    }

    /// Script to be run when the element gets focus
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func onfocus(_ value: CompiledTemplate) -> Self {
        return self.add( .onfocus(value))
    }

    /// Script to be run when there has been changes to the anchor part of the a URL
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func onhashchange(_ value: CompiledTemplate) -> Self {
        return self.add( .onhashchange(value))
    }

    /// Script to be run when the element gets user input
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func oninput(_ value: CompiledTemplate) -> Self {
        return self.add( .oninput(value))
    }

    /// Script to be run when the element is invalid
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func oninvalid(_ value: CompiledTemplate) -> Self {
        return self.add( .oninvalid(value))
    }

    /// Script to be run when the element is finished loading
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func onload(_ value: CompiledTemplate) -> Self {
        return self.add( .onload(value))
    }

    /// Specifies that the details should be visible (open) to the user
    ///
    /// - Returns: An attribute node
    public var open: Self {
        return self.add( .open)
    }

    /// Specifies a regular expression that an <input> element's value is checked against
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func pattern(_ value: CompiledTemplate) -> Self {
        return self.add( .pattern(value))
    }

    /// Specifies what value is the optimal value for the gauge
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func optimum(_ value: CompiledTemplate) -> Self {
        return self.add( .optimum(value))
    }

    /// Specifies a short hint that describes the expected value of the element
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func placeholder(_ value: CompiledTemplate) -> Self {
        return self.add( .placeholder(value))
    }

    /// Specifies an image to be shown while the video is downloading, or until the user hits the play button
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func poster(_ value: CompiledTemplate) -> Self {
        return self.add( .poster(value))
    }

    /// Specifies if and how the author thinks the audio/video should be loaded when the page loads
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func preload(_ value: CompiledTemplate) -> Self {
        return self.add( .preload(value))
    }

    /// Specifies that the element is read-only
    public var readonly: Self {
        return self.add( .readonly)
    }

    /// Specifies the relationship between the current document and the linked document
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func rel(_ value: CompiledTemplate) -> Self {
        return self.add( .rel(value))
    }

    /// Specifies that the element must be filled out before submitting the form
    public var `required`: Self {
        return self.add( .required)
    }

    /// Specifies that the list order should be descending (9,8,7...)
    public var reversed: Self {
        return self.add( .reversed)
    }

    /// Specifies the visible number of lines in a text area
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func rows(_ value: CompiledTemplate) -> Self {
        return self.add( .rows(value))
    }

    /// Specifies the number of rows a table cell should span
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func rowspan(_ value: CompiledTemplate) -> Self {
        return self.add( .rowspan(value))
    }

    /// Enables an extra set of restrictions for the content in an <iframe>
    public var sandbox: Self {
        return self.add( .sandbox)
    }

    /// Specifies whether a header cell is a header for a column, row, or group of columns or rows
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func scope(_ value: CompiledTemplate) -> Self {
        return self.add( .scope(value))
    }

    /// Specifies that an option should be pre-selected when the page loads
    public var selected: Self {
        return self.add( .selected)
    }

    /// Specifies the shape of the area
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func shape(_ value: CompiledTemplate) -> Self {
        return self.add( .shape(value))
    }

    /// Specifies the width, in characters (for <input>) or specifies the number of visible options (for <select>)
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func size(_ value: CompiledTemplate) -> Self {
        return self.add( .size(value))
    }

    /// Specifies the size of the linked resource
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func sizes(_ value: CompiledTemplate) -> Self {
        return self.add( .sizes(value))
    }

    /// Specifies the number of columns to span
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func span(_ value: CompiledTemplate) -> Self {
        return self.add( .span(value))
    }

    /// Specifies whether the element is to have its spelling and grammar checked or not
    public var spellcheck: Self {
        return self.add( .spellcheck)
    }

    /// Specifies the URL of the media file
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func src(_ value: CompiledTemplate) -> Self {
        return self.add( .src(value))
    }

    /// Specifies the HTML content of the page to show in the <iframe>
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func srcdoc(_ value: CompiledTemplate) -> Self {
        return self.add( .srcdoc(value))
    }

    /// Specifies the language of the track text data (required if kind="subtitles")
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func srclang(_ value: CompiledTemplate) -> Self {
        return self.add( .srclang(value))
    }

    /// Specifies the URL of the image to use in different situations
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func srcset(_ value: CompiledTemplate) -> Self {
        return self.add( .srcset(value))
    }

    /// Specifies the start value of an ordered list
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func start(_ value: CompiledTemplate) -> Self {
        return self.add( .start(value))
    }

    /// Specifies the legal number intervals for an input field
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func step(_ value: CompiledTemplate) -> Self {
        return self.add( .step(value))
    }

    /// Specifies an inline CSS style for an element
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func style(_ value: CompiledTemplate) -> Self {
        return self.add( .style(value))
    }

    /// Specifies the tabbing order of an element
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func tabindex(_ value: CompiledTemplate) -> Self {
        return self.add( .tabindex(value))
    }

    /// Specifies the target for where to open the linked document or where to submit the form
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func target(_ value: CompiledTemplate) -> Self {
        return self.add( .target(value))
    }

    /// Specifies extra information about an element
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func title(_ value: CompiledTemplate) -> Self {
        return self.add( .title(value))
    }

    /// Specifies whether the content of an element should be translated or not
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func translate(_ value: CompiledTemplate) -> Self {
        return self.add( .translate(value))
    }

    /// Specifies the type of element
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func type(_ value: CompiledTemplate) -> Self {
        return self.add( .type(value))
    }

    /// Specifies an image as a client-side image-map
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func usemap(_ value: CompiledTemplate) -> Self {
        return self.add( .usemap(value))
    }

    /// Specifies the value of the element
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func value(_ value: CompiledTemplate) -> Self {
        return self.add( .value(value))
    }

    /// Specifies how the text in a text area is to be wrapped when submitted in a form
    ///
    /// - Parameter value: The value of the attribute
    /// - Returns: An attribute node
    public func wrap(_ value: CompiledTemplate) -> Self {
        return self.add( .wrap(value))
    }
}
