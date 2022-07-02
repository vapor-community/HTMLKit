public enum Events {
    
    public enum Window: String {
        
        case afterprint = "onafterprint"
        case beforeprint = "onbeforeprint"
        case beforeunload = "onbeforeunload"
        case hashchange = "onhashchange"
        case languagechange = "onlanguagechange"
        case message = "onmessage"
        case messageerror = "onmessageerror"
        case offline = "onoffline"
        case online = "ononline"
        case pagehide = "onpagehide"
        case pageshow = "onpageshow"
        case popstate = "onpopstate"
        case rejectionhandled = "onrejectionhandled"
        case storage = "onstorage"
        case unhandledrejection = "onunhandledrejection"
        case unload = "onunload"
        case error = "onerror"
    }
    
    public enum Focus: String {
        
        case blur = "onblur"
        case focus = "onfocus"
        case error = "onerror"
    }
    
    public enum Pointer: String {
        
        case pointercancel = "onpointercancel"
        case pointerdown = "onpointerdown"
        case pointerenter = "onpointerenter"
        case pointerleave = "onpointerleave"
        case pointermove = "onpointermove"
        case pointerout = "onpointerout"
        case pointerover = "onpointerover"
        case pointerup = "onpointerup"
        case gotpointercapture = "ongotpointercapture"
        case lostpointercapture = "onlostpointercapture"
        case error = "onerror"
    }
    
    public enum Mouse: String {
        
        case click = "onclick"
        case contextmenu = "oncontextmenu"
        case doubleclick = "ondblclick"
        case mousedown = "onmousedown"
        case mouseenter = "onmouseenter"
        case mouseleave = "onmouseleave"
        case mousemove = "onmousemove"
        case mouseout = "onmouseout"
        case mouseover = "onmouseover"
        case mouseup = "onmouseup"
        case error = "onerror"
    }
    
    public enum Wheel: String {
        
        case wheel = "onwheel"
        case error = "onerror"
    }
    
    public enum Input: String {
        
        case beforeinput = "onbeforeinput"
        case input = "oninput"
        case select = "onselect"
        case error = "onerror"
    }
    
    public enum Keyboard: String {
        
        case keydown = "onkeydown"
        case keyup = "onkeyup"
        case error = "onerror"
    }
    
    public enum Drag: String {
        
        case drag = "ondrag"
        case dragend = "ondragend"
        case dragenter = "ondragenter"
        case dragleave = "ondragleave"
        case dragover = "ondragover"
        case dragstart = "ondragstart"
        case drop = "ondrop"
        case error = "onerror"
    }
    
    public enum Clipboard: String {
        
        case copy = "oncopy"
        case cut = "oncut"
        case paste = "onpaste"
        case error = "onerror"
    }
    
    public enum Selection: String {
        
        case selectionchange = "onselectionchange"
        case selectstart = "onselectstart"
        case error = "onerror"
    }
    
    public enum Media: String {
        
        case abort = "onabort"
        case canplay = "oncanplay"
        case canplaythrough = "oncanplaythrough"
        case durationchange = "ondurationchange"
        case emptied = "onemptied"
        case ended = "onended"
        case play = "onplay"
        case playing = "onplaying"
        case pause = "onpause"
        case ratechange = "onratechange"
        case seeked = "onseeked"
        case seeking = "onseeking"
        case stalled = "onstalled"
        case suspend = "onsuspend"
        case timeupdate = "ontimeupdate"
        case volumenchange = "onvolumechange"
        case waiting = "onwaiting"
        case error = "onerror"
    }
    
    public enum Form: String {
        
        case reset = "onreset"
        case submit = "onsubmit"
        case error = "onerror"
    }
    
    public enum Detail: String {
        
        case toggle = "ontoggle"
        case error = "onerror"
    }
}
