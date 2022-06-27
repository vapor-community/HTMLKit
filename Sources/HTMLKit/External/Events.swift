public enum Events {
    
    public enum Global: String {
        
        case error = "onerror"
        case offline = "onoffline"
        case online = "ononline"
        case rejectionhandled = "onrejectionhandled"
        case unhandledrejection = "onunhandledrejection"
    }
    
    public enum Window: String {
        
        case afterprint = "onafterprint"
        case beforeprint = "onbeforeprint"
        case beforeunload = "onbeforeunload"
        case hashchange = "onhashchange"
        case languagechange = "onlanguagechange"
        case message = "onmessage"
        case messageerror = "onmessageerror"
        case pagehide = "onpagehide"
        case pageshow = "onpageshow"
        case popstate = "onpopstate"
        case storage = "onstorage"
        case unload = "onunload"
    }
    
    public enum Focus: String {
        
        case blur = "onblur"
        case focus = "onfocus"
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
    }
    
    public enum Wheel: String {
        
        case wheel = "onwheel"
    }
    
    public enum Input: String {
        
        case beforeinput = "onbeforeinput"
        case input = "oninput"
        case select = "onselect"
    }
    
    public enum Keyboard: String {
        
        case keydown = "onkeydown"
        case keyup = "onkeyup"
    }
    
    public enum Drag: String {
        
        case drag = "ondrag"
        case dragend = "ondragend"
        case dragenter = "ondragenter"
        case dragleave = "ondragleave"
        case dragover = "ondragover"
        case dragstart = "ondragstart"
        case ondrop = "ondrop"
    }
    
    public enum Clipboard: String {
        
        case copy = "oncopy"
        case cut = "oncut"
        case paste = "onpaste"
    }
    
    public enum Selection: String {
        
        case selectionchange = "onselectionchange"
        case selectstart = "onselectstart"
    }
    
    public enum Media: String {
        
        case abort = "onabort"
        case canplay = "oncanplay"
        case canplaythrough = "oncanplaythrough"
        case durationchange = "ondurationchange"
        case emptied = "onemptied"
        case ended = "onended"
        case error = "onerror"
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
    }
    
    public enum Form: String {
        
        case reset = "onreset"
        case submit = "onsubmit"
    }
}
