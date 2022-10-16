/*
 Abstract:
 The file contains event-types.
 
 Note:
 If you about to add something to the file, stick to the official documentation to keep the code consistent.
 */

/// A namespace for several types of events.
public enum Events {
    
    /// A event for the window element.
    public enum Window: String {
        
        /// Occurs, when the document has started printing or the print preview has been closed.
        case afterprint = "onafterprint"
        
        /// Occurs, when the document is about to be printed or the print preview is open.
        case beforeprint = "onbeforeprint"
        
        /// Occurs, when
        case beforeunload = "onbeforeunload"
        
        /// Occurs, when the fragment identifier of the url is being changed.
        case hashchange = "onhashchange"
        
        /// Occurs, when the language has been changed.
        case languagechange = "onlanguagechange"
        
        /// Occurs, when the window element is recieving a message.
        case message = "onmessage"
        
        /// Occurs, when the recieving message cannot be deserialized.
        case messageerror = "onmessageerror"
        
        /// Occurs, when
        case offline = "onoffline"
        
        /// Occurs, when
        case online = "ononline"
        
        /// Occurs, when a page has lost focus.
        case pagehide = "onpagehide"
        
        /// Occurs, when a page is focused.
        case pageshow = "onpageshow"
        
        /// Occurs, when
        case popstate = "onpopstate"
        
        /// Occurs, when
        case rejectionhandled = "onrejectionhandled"
        
        /// Occurs, when the storage context has been changed.
        case storage = "onstorage"
        
        /// Occurs, when
        case unhandledrejection = "onunhandledrejection"
        
        /// Occurs, when
        case unload = "onunload"
        
        /// Occurs for various targets and different kinds of reasons.
        case error = "onerror"
    }
    
    /// A event
    public enum Focus: String {
        
        /// Occurs, when a element has lost focus.
        case blur = "onblur"
        
        /// Occurs, when a element is being focused.
        case focus = "onfocus"
        
        /// Occurs for various targets and different kinds of reasons.
        case error = "onerror"
    }
    
    /// A event for a pointing device.
    public enum Pointer: String {
        
        /// Occurs, when
        case pointercancel = "onpointercancel"
        
        /// Occurs, when the pointing device is pressed.
        case pointerdown = "onpointerdown"
        
        /// Occurs, when
        case pointerenter = "onpointerenter"
        
        /// Occurs, when
        case pointerleave = "onpointerleave"
        
        /// Occurs, when
        case pointermove = "onpointermove"
        
        /// Occurs, when
        case pointerout = "onpointerout"
        
        /// Occurs, when
        case pointerover = "onpointerover"
        
        /// Occurs, when the pointing device is not pressed anymore.
        case pointerup = "onpointerup"
        
        /// Occurs, when
        case gotpointercapture = "ongotpointercapture"
        
        /// Occurs, when
        case lostpointercapture = "onlostpointercapture"
        
        /// Occurs for various targets and different kinds of reasons.
        case error = "onerror"
    }
    
    /// A event for a mouse device.
    public enum Mouse: String {
        
        /// Occurs, when a element is being clicked.
        case click = "onclick"
        
        /// Occurs, when the right mouse button is pressed.
        case contextmenu = "oncontextmenu"
        
        /// Occurs, when a element is being clicked twice in time.
        case doubleclick = "ondblclick"
        
        /// Occurs, when a mouse button is pressed and not yet released.
        case mousedown = "onmousedown"
        
        /// Occurs, when
        case mouseenter = "onmouseenter"
        
        /// Occurs, when
        case mouseleave = "onmouseleave"
        
        /// Occurs, when the mouse moves.
        case mousemove = "onmousemove"
        
        /// Occurs, when
        case mouseout = "onmouseout"
        
        /// Occurs, when the mouse pointer is over a particular element.
        case mouseover = "onmouseover"
        
        /// Occurs, when a mouse button is released.
        case mouseup = "onmouseup"
        
        /// Occurs for various targets and different kinds of reasons.
        case error = "onerror"
    }
    
    /// A event for a mouse device.
    public enum Wheel: String {
        
        /// Occurs, when the mouse wheel rotates.
        case wheel = "onwheel"
        
        /// Occurs for various targets and different kinds of reasons.
        case error = "onerror"
    }
    
    /// A event
    public enum Input: String {
        
        /// Occurs, when the value of the element is about to be modified.
        case beforeinput = "onbeforeinput"
        
        /// Occurs, when the value of the element has been modified.
        case input = "oninput"
        
        /// Occurs, when the value within the element has been selected.
        case select = "onselect"
        
        /// Occurs for various targets and different kinds of reasons.
        case error = "onerror"
    }
    
    /// A event for a keyboard device.
    public enum Keyboard: String {
        
        /// Occurs, when a key is pressed and not yet released.
        case keydown = "onkeydown"

        /// Occurs, when a key releases.
        case keyup = "onkeyup"
        
        /// Occurs for various targets and different kinds of reasons.
        case error = "onerror"
    }
    
    /// A event
    public enum Drag: String {
        
        /// Occurs, when a element is being dragged.
        case drag = "ondrag"
        
        /// Occurs, when a drag operation is being ended.
        case dragend = "ondragend"
        
        /// Occurs, when a dragged element is entering a valid target.
        case dragenter = "ondragenter"
        
        /// Occurs, when a dragged element is leaving a valid target.
        case dragleave = "ondragleave"
        
        /// Occurs, when a a dragged element is over a valid target.
        case dragover = "ondragover"
        
        /// Occurs, when a drag operation starts.
        case dragstart = "ondragstart"
        
        /// Occurs, when a dragged element has been dropped on a valid target.
        case drop = "ondrop"
        
        /// Occurs for various targets and different kinds of reasons.
        case error = "onerror"
    }
    
    /// A event
    public enum Clipboard: String {
        
        /// Occurs, when a copy action is initated.
        case copy = "oncopy"
        
        /// Occurs, when a cut action is initated.
        case cut = "oncut"
        
        /// Occurs, when a paste action is initated.
        case paste = "onpaste"
        
        /// Occurs for various targets and different kinds of reasons.
        case error = "onerror"
    }
    
    /// A event
    public enum Selection: String {
        
        /// Occurs, when
        case selectionchange = "onselectionchange"
        
        /// Occurs, when
        case selectstart = "onselectstart"
        
        /// Occurs for various targets and different kinds of reasons.
        case error = "onerror"
    }
    
    /// A event for the audio and video element.
    public enum Media: String {
        
        /// Occurs, when the ressource cannot be loaded.
        case abort = "onabort"
        
        /// Occurs, when the playback can be started, but the loading operation is still processing.
        case canplay = "oncanplay"
        
        /// Occurs, when the playback can be started and the loading operation is done.
        case canplaythrough = "oncanplaythrough"
        
        /// Occurs, when the duration is being updated.
        case durationchange = "ondurationchange"
        
        /// Occurs, when
        case emptied = "onemptied"
        
        /// Occurs, when the end of the media is reached.
        case ended = "onended"
        
        /// Occurs, when the playback starts.
        case play = "onplay"
        
        /// Occurs, when the playback has resumed.
        case playing = "onplaying"
        
        /// Occurs, when the playback has paused.
        case pause = "onpause"
        
        /// Occurs, when the playback rate has changed.
        case ratechange = "onratechange"
        
        /// Occurs, when a seek operation has been completed.
        case seeked = "onseeked"
        
        /// Occurs, when a seek operation starts.
        case seeking = "onseeking"
        
        /// Occurs, when the loading operation is unexpectedly not forthcoming.
        case stalled = "onstalled"
        
        /// Occurs, when the loading operation has been suspended.
        case suspend = "onsuspend"
        
        /// Occurs, when the current time has been updated.
        case timeupdate = "ontimeupdate"
        
        /// Occurs, when the volume has changed.
        case volumenchange = "onvolumechange"
        
        /// Occurs, when the playback has stopped, cause of lack of data.
        case waiting = "onwaiting"
        
        /// Occurs for various targets and different kinds of reasons.
        case error = "onerror"
    }
    
    /// A event for the form element.
    public enum Form: String {
        
        /// Occurs, when the reset button within the form element is clicked.
        case reset = "onreset"
        
        /// Occurs, when the form is submitted.
        case submit = "onsubmit"
        
        /// Occurs for various targets and different kinds of reasons.
        case error = "onerror"
    }
    
    /// A event for the dialog element.
    public enum Detail: String {
        
        /// Occurs, when the detail element is toggled (open/closed).
        case toggle = "ontoggle"
        
        /// Occurs for various targets and different kinds of reasons.
        case error = "onerror"
    }
}
