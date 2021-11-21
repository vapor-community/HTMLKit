import OrderedCollections

/// The alias points
///
///
public typealias GlobalEventAttributes = ContextMenuEventAttribute & WheelEventAttribute & DragEventAttribute & DragEndEventAttribute & DragEnterEventAttribute & DragLeaveEventAttribute & DragOverEventAttribute & DragStartEventAttribute & DropEventAttribute

/// The protocol provides
///
///
public protocol AfterPrintEventAttribute {
    
    /// The func adds
    ///
    ///
    func onAfterPrint(_ value: String) -> Self
}

extension AfterPrintEventAttribute {
    
    private var key: String { "onafterprint" }
    
    internal func set(onafterprint value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(onafterprint value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol BeforePrintEventAttribute {
    
    /// The func adds
    ///
    ///
    func onBeforePrint(_ value: String) -> Self
}

extension BeforePrintEventAttribute {
    
    private var key: String { "onbeforeprint" }
    
    internal func set(onbeforeprint value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(onbeforeprint value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol BeforeUnloadEventAttribute {
    
    /// The func adds
    ///
    ///
    func onBeforeUnload(_ value: String) -> Self
}

extension BeforeUnloadEventAttribute {
    
    private var key: String { "onbeforeunload" }
    
    internal func set(onbeforeunload value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(onbeforeunload value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol ErrorEventAttribute {
    
    /// The func adds
    ///
    ///
    func onError(_ value: String) -> Self
}

extension ErrorEventAttribute {
    
    private var key: String { "onerror" }
    
    internal func set(onerror value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(onerror value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol HashChangeEventAttribute {
    
    /// The func adds
    ///
    ///
    func onHashChange(_ value: String) -> Self
}

extension HashChangeEventAttribute {
    
    private var key: String { "onhashchange" }
    
    internal func set(onhashchange value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(onhashchange value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol LoadEventAttribute {
    
    /// The func adds
    ///
    ///
    func onLoad(_ value: String) -> Self
}

extension LoadEventAttribute {
    
    private var key: String { "onload" }
    
    internal func set(onload value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(onload value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol MessageEventAttribute {
    
    /// The func adds
    ///
    ///
    func onMessage(_ value: String) -> Self
}

extension MessageEventAttribute {
    
    private var key: String { "onmessage" }
    
    internal func set(onmessage value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(onmessage value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol OfflineEventAttribute {
    
    /// The func adds
    ///
    ///
    func onOffline(_ value: String) -> Self
}

extension OfflineEventAttribute {
    
    private var key: String { "onoffline" }
    
    internal func set(onoffline value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(onoffline value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}


/// The protocol provides
///
///
public protocol OnlineEventAttribute {
    
    /// The func adds
    ///
    ///
    func onOnline(_ value: String) -> Self
}

extension OnlineEventAttribute {
    
    private var key: String { "ononline" }
    
    internal func set(ononline value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(ononline value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol PageHideEventAttribute {
    
    /// The func adds
    ///
    ///
    func onPageHide(_ value: String) -> Self
}

extension PageHideEventAttribute {
    
    private var key: String { "onpagehide" }
    
    internal func set(onpagehide value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(onpagehide value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol PageShowEventAttribute {
    
    /// The func adds
    ///
    ///
    func onPageShow(_ value: String) -> Self
}

extension PageShowEventAttribute {
    
    private var key: String { "onpageshow" }
    
    internal func set(onpageshow value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(onpageshow value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol PopstateEventAttribute {
    
    /// The func adds
    ///
    ///
    func onPopstate(_ value: String) -> Self
}

extension PopstateEventAttribute {
    
    private var key: String { "onpopstate" }
    
    internal func set(onpopstate value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(onpopstate value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol ResizeEventAttribute {
    
    /// The func adds
    ///
    ///
    func onResize(_ value: String) -> Self
}

extension ResizeEventAttribute {
    
    private var key: String { "onresize" }
    
    internal func set(onresize value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(onresize value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol StorageEventAttribute {
    
    /// The func adds
    ///
    ///
    func onStorage(_ value: String) -> Self
}

extension StorageEventAttribute {
    
    private var key: String { "onstorage" }
    
    internal func set(onstorage value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(onstorage value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}


/// The protocol provides
///
///
public protocol UnloadEventAttribute {
    
    /// The func adds
    ///
    ///
    func onUnload(_ value: String) -> Self
}

extension UnloadEventAttribute {
    
    private var key: String { "onunload" }
    
    internal func set(onunload value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(onunload value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol BlurEventAttribute {
    
    /// The func adds
    ///
    ///
    func onBlur(_ value: String) -> Self
}

extension BlurEventAttribute {
    
    private var key: String { "onblur" }
    
    internal func set(onblur value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(onblur value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol ChangeEventAttribute {
    
    /// The func adds
    ///
    ///
    func onChange(_ value: String) -> Self
}

extension ChangeEventAttribute {
    
    private var key: String { "onchange" }
    
    internal func set(onchange value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(onchange value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol ContextMenuEventAttribute {
    
    /// The func adds
    ///
    ///
    func onContextMenu(_ value: String) -> Self
}

extension ContextMenuEventAttribute {
    
    private var key: String { "oncontextmenu" }
    
    internal func set(oncontextmenu value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(oncontextmenu value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol FocusEventAttribute {
    
    /// The func adds
    ///
    ///
    func onFocus(_ value: String) -> Self
}

extension FocusEventAttribute {
    
    private var key: String { "onfocus" }
    
    internal func set(onfocus value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(onfocus value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol InputEventAttribute {
    
    /// The func adds
    ///
    ///
    func onInput(_ value: String) -> Self
}

extension InputEventAttribute {
    
    private var key: String { "oninput" }
    
    internal func set(oninput value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(oninput value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol InvalidEventAttribute {
    
    /// The func adds
    ///
    ///
    func onInvalid(_ value: String) -> Self
}

extension InvalidEventAttribute {
    
    private var key: String { "oninvalid" }
    
    internal func set(oninvalid value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(oninvalid value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol ResetEventAttribute {
    
    /// The func adds
    ///
    ///
    func onReset(_ value: String) -> Self
}

extension ResetEventAttribute {
    
    private var key: String { "onreset" }
    
    internal func set(onreset value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(onreset value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol SearchEventAttribute {
    
    /// The func adds
    ///
    ///
    func onSearch(_ value: String) -> Self
}

extension SearchEventAttribute {
    
    private var key: String { "onsearch" }
    
    internal func set(onsearch value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(onsearch value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol SelectEventAttribute {
    
    /// The func adds
    ///
    ///
    func onSelect(_ value: String) -> Self
}

extension SelectEventAttribute {
    
    private var key: String { "onselect" }
    
    internal func set(onselect value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(onselect value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol SubmitEventAttribute {
    
    /// The func adds
    ///
    ///
    func onSubmit(_ value: String) -> Self
}

extension SubmitEventAttribute {
    
    private var key: String { "onsubmit" }
    
    internal func set(onsubmit value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(onsubmit value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol KeyDownEventAttribute {
    
    /// The func adds
    ///
    ///
    func onKeyDown(_ value: String) -> Self
}

extension KeyDownEventAttribute {
    
    private var key: String { "onkeydown" }
    
    internal func set(onkeydown value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(onkeydown value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol KeyPressEventAttribute {
    
    /// The func adds
    ///
    ///
    func onKeyPress(_ value: String) -> Self
}

extension KeyPressEventAttribute {
    
    private var key: String { "onkeypress" }
    
    internal func set(onkeypress value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(onkeypress value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol KeyUpEventAttribute {
    
    /// The func adds
    ///
    ///
    func onKeyUp(_ value: String) -> Self
}

extension KeyUpEventAttribute {
    
    private var key: String { "onkeyup" }
    
    internal func set(onkeyup value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(onkeyup value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol ClickEventAttribute {
    
    /// The func adds
    ///
    ///
    func onClick(_ value: String) -> Self
}

extension ClickEventAttribute {
    
    private var key: String { "onclick" }
    
    internal func set(onclick value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(onclick value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol DoubleClickEventAttribute {
    
    /// The func adds
    ///
    ///
    func onDoubleClick(_ value: String) -> Self
}

extension DoubleClickEventAttribute {
    
    private var key: String { "ondbclick" }
    
    internal func set(ondbclick value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(ondbclick value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol MouseDownEventAttribute {
    
    /// The func adds
    ///
    ///
    func onMouseDown(_ value: String) -> Self
}

extension MouseDownEventAttribute {
    
    private var key: String { "onmousedown" }
    
    internal func set(onmousedown value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(onmousedown value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol MouseMoveEventAttribute {
    
    /// The func adds
    ///
    ///
    func onMouseMove(_ value: String) -> Self
}

extension MouseMoveEventAttribute {
    
    private var key: String { "onmousemove" }
    
    internal func set(onmousemove value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(onmousemove value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}


/// The protocol provides
///
///
public protocol MouseOutEventAttribute {
    
    /// The func adds
    ///
    ///
    func onMouseOut(_ value: String) -> Self
}

extension MouseOutEventAttribute {
    
    private var key: String { "onmouseout" }
    
    internal func set(onmouseout value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(onmouseout value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol MouseOverEventAttribute {
    
    /// The func adds
    ///
    ///
    func onMouseOver(_ value: String) -> Self
}

extension MouseOverEventAttribute {
    
    private var key: String { "onmouseover" }
    
    internal func set(onmouseover value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(onmouseover value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol MouseUpEventAttribute {
    
    /// The func adds
    ///
    ///
    func onMouseUp(_ value: String) -> Self
}

extension MouseUpEventAttribute {
    
    private var key: String { "onmouseup" }
    
    internal func set(onmouseup value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(onmouseup value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol WheelEventAttribute {
    
    /// The func adds
    ///
    ///
    func onWheel(_ value: String) -> Self
}

extension WheelEventAttribute {
    
    private var key: String { "onwheel" }
    
    internal func set(onwheel value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(onwheel value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol DragEventAttribute {
    
    /// The func adds
    ///
    ///
    func onDrag(_ value: String) -> Self
}

extension DragEventAttribute {
    
    private var key: String { "ondrag" }
    
    internal func set(ondrag value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(ondrag value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol DragEnterEventAttribute {
    
    /// The func adds
    ///
    ///
    func onDragEnter(_ value: String) -> Self
}

extension DragEnterEventAttribute {
    
    private var key: String { "ondragenter" }
    
    internal func set(ondragenter value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(ondragenter value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol DragEndEventAttribute {
    
    /// The func adds
    ///
    ///
    func onDragEnd(_ value: String) -> Self
}

extension DragEndEventAttribute {
    
    private var key: String { "ondragend" }
    
    internal func set(ondragend value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(ondragend value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol DragLeaveEventAttribute {
    
    /// The func adds
    ///
    ///
    func onDragLeave(_ value: String) -> Self
}

extension DragLeaveEventAttribute {
    
    private var key: String { "ondragleave" }
    
    internal func set(ondragleave value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(ondragleave value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol DragOverEventAttribute {
    
    /// The func adds
    ///
    ///
    func onDragOver(_ value: String) -> Self
}

extension DragOverEventAttribute {
    
    private var key: String { "ondragover" }
    
    internal func set(ondragover value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(ondragover value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol DragStartEventAttribute {
    
    /// The func adds
    ///
    ///
    func onDragStart(_ value: String) -> Self
}

extension DragStartEventAttribute {
    
    private var key: String { "ondragstart" }
    
    internal func set(ondragstart value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(ondragstart value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol DropEventAttribute {
    
    /// The func adds
    ///
    ///
    func onDrop(_ value: String) -> Self
}

extension DropEventAttribute {
    
    private var key: String { "ondrop" }
    
    internal func set(ondrop value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(ondrop value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol ScrollEventAttribute {
    
    /// The func adds
    ///
    ///
    func onScroll(_ value: String) -> Self
}

extension ScrollEventAttribute {
    
    private var key: String { "onscroll" }
    
    internal func set(onscroll value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(onscroll value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol CopyEventAttribute {
    
    /// The func adds
    ///
    ///
    func onCopy(_ value: String) -> Self
}

extension CopyEventAttribute {
    
    private var key: String { "oncopy" }
    
    internal func set(oncopy value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(oncopy value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol CutEventAttribute {
    
    /// The func adds
    ///
    ///
    func onCut(_ value: String) -> Self
}

extension CutEventAttribute {
    
    private var key: String { "oncut" }
    
    internal func set(oncut value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(oncut value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol PasteEventAttribute {
    
    /// The func adds
    ///
    ///
    func onPaste(_ value: String) -> Self
}

extension PasteEventAttribute {
    
    private var key: String { "onpaste" }
    
    internal func set(onpaste value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(onpaste value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol AbortEventAttribute {
    
    /// The func adds
    ///
    ///
    func onAbort(_ value: String) -> Self
}

extension AbortEventAttribute {
    
    private var key: String { "onabort" }
    
    internal func set(onabort value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(onabort value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol CanPlayEventAttribute {
    
    /// The func adds
    ///
    ///
    func onCanPlay(_ value: String) -> Self
}

extension CanPlayEventAttribute {
    
    private var key: String { "oncanplay" }
    
    internal func set(oncanplay value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(oncanplay value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol CanPlayThroughEventAttribute {
    
    /// The func adds
    ///
    ///
    func onCanPlayThrough(_ value: String) -> Self
}

extension CanPlayThroughEventAttribute {
    
    private var key: String { "oncanplaythrough" }
    
    internal func set(oncanplaythrough value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(oncanplaythrough value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol CueChangeEventAttribute {
    
    /// The func adds
    ///
    ///
    func onCueChange(_ value: String) -> Self
}

extension CueChangeEventAttribute {
    
    private var key: String { "oncuechange" }
    
    internal func set(oncuechange value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(oncuechange value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol DurationChangeEventAttribute {
    
    /// The func adds
    ///
    ///
    func onDurationChange(_ value: String) -> Self
}

extension DurationChangeEventAttribute {
    
    private var key: String { "ondurationchange" }
    
    internal func set(ondurationchange value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(ondurationchange value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol EmptiedEventAttribute {
    
    /// The func adds
    ///
    ///
    func onEmptied(_ value: String) -> Self
}

extension EmptiedEventAttribute {
    
    private var key: String { "onemptied" }
    
    internal func set(onemptied value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(onemptied value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol EndedEventAttribute {
    
    /// The func adds
    ///
    ///
    func onEnded(_ value: String) -> Self
}

extension EndedEventAttribute {
    
    private var key: String { "onended" }
    
    internal func set(onended value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(onended value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol LoadedDataEventAttribute {
    
    /// The func adds
    ///
    ///
    func onLoadedData(_ value: String) -> Self
}

extension LoadedDataEventAttribute {
    
    private var key: String { "onloadeddata" }
    
    internal func set(onloadeddata value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(onloadeddata value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol LoadedMetaDataEventAttribute {
    
    /// The func adds
    ///
    ///
    func onLoadedMetaData(_ value: String) -> Self
}

extension LoadedMetaDataEventAttribute {
    
    private var key: String { "onloadedmetadata" }
    
    internal func set(onloadedmetadata value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(onloadedmetadata value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol LoadStartEventAttribute {
    
    /// The func adds
    ///
    ///
    func onLoadStart(_ value: String) -> Self
}

extension LoadStartEventAttribute {
    
    private var key: String { "onloadstart" }
    
    internal func set(onloadstart value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(onloadstart value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol PauseEventAttribute {
    
    /// The func adds
    ///
    ///
    func onPause(_ value: String) -> Self
}

extension PauseEventAttribute {
    
    private var key: String { "onpause" }
    
    internal func set(onpause value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(onpause value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol PlayEventAttribute {
    
    /// The func adds
    ///
    ///
    func onPlay(_ value: String) -> Self
}

extension PlayEventAttribute {
    
    private var key: String { "onplay" }
    
    internal func set(onplay value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(onplay value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol PlayingEventAttribute {
    
    /// The func adds
    ///
    ///
    func OnPlaying(_ value: String) -> Self
}

extension PlayingEventAttribute {
    
    private var key: String { "onplaying" }
    
    internal func set(onplaying value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(onplaying value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol ProgressEventAttribute {
    
    /// The func adds
    ///
    ///
    func onProgress(_ value: String) -> Self
}

extension ProgressEventAttribute {
    
    private var key: String { "onprogress" }
    
    internal func set(onprogress value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(onprogress value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol RateChangeEventAttribute {
    
    /// The func adds
    ///
    ///
    func onRateChange(_ value: String) -> Self
}

extension RateChangeEventAttribute {
    
    private var key: String { "onratechange" }
    
    internal func set(onratechange value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(onratechange value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol SeekedEventAttribute {
    
    /// The func adds
    ///
    ///
    func onSeeked(_ value: String) -> Self
}

extension SeekedEventAttribute {
    
    private var key: String { "onseeked" }
    
    internal func set(onseeked value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(onseeked value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol SeekingEventAttribute {
    
    /// The func adds
    ///
    ///
    func onSeeking(_ value: String) -> Self
}

extension SeekingEventAttribute {
    
    private var key: String { "onseeking" }
    
    internal func set(onseeking value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(onseeking value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol StalledEventAttribute {
    
    /// The func adds
    ///
    ///
    func onStalled(_ value: String) -> Self
}

extension StalledEventAttribute {
    
    private var key: String { "onstalled" }
    
    internal func set(onstalled value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(onstalled value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol SuspendEventAttribute {
    
    /// The func adds
    ///
    ///
    func onSuspend(_ value: String) -> Self
}

extension SuspendEventAttribute {
    
    private var key: String { "onsuspend" }
    
    internal func set(onsuspend value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(onsuspend value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol TimeUpdateEventAttribute {
    
    /// The func adds
    ///
    ///
    func onTimeUpdate(_ value: String) -> Self
}

extension TimeUpdateEventAttribute {
    
    private var key: String { "ontimeupdate" }
    
    internal func set(ontimeupdate value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(ontimeupdate value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol VolumeChangeEventAttribute {
    
    /// The func adds
    ///
    ///
    func onVolumeChange(_ value: String) -> Self
}

extension VolumeChangeEventAttribute {
    
    private var key: String { "onvolumechange" }
    
    internal func set(onvolumechange value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(onvolumechange value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol WaitingEventAttribute {
    
    /// The func adds
    ///
    ///
    func onWaiting(_ value: String) -> Self
}

extension WaitingEventAttribute {
    
    private var key: String { "onwaiting" }
    
    internal func set(onwaiting value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(onwaiting value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}

/// The protocol provides
///
///
public protocol ToggleEventAttribute {
    
    /// The func adds
    ///
    ///
    func onToggle(_ value: String) -> Self
}

extension ToggleEventAttribute {
    
    private var key: String { "ontoggle" }
    
    internal func set(ontoggle value: String) -> OrderedDictionary<String, Any> {
        return [key: value]
    }
    
    internal func update(ontoggle value: String, on attributes: inout OrderedDictionary<String, Any>) -> OrderedDictionary<String, Any> {
        attributes[key] = value
        return attributes
    }
}
