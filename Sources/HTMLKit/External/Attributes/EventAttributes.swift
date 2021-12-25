/// ## Description
/// The file contains the event attribute handlers.
///
/// ## Note
/// If you about to add something to the file, stick to the official documentation to keep the code consistent.
///
/// ## Authors
/// Mats Moll: https://github.com/matsmoll
/// Mattes Mohr: https://github.com/mattesmohr

import OrderedCollections

/// ## Description
/// The alias combines the global attributes.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public typealias GlobalEventAttributes = ContextMenuEventAttribute & WheelEventAttribute & DragEventAttribute & DragEndEventAttribute & DragEnterEventAttribute & DragLeaveEventAttribute & DragOverEventAttribute & DragStartEventAttribute & DropEventAttribute

/// ## Description
/// The protocol provides the element with the onafterprint handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol AfterPrintEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onAfterPrint(_ value: String) -> Self
}

extension AfterPrintEventAttribute {
    
    internal var key: String { "onafterprint" }
}

extension AfterPrintEventAttribute where Self: ContentNode {
    
    internal func mutate(onafterprint value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension AfterPrintEventAttribute where Self: EmptyNode {
    
    internal func mutate(onafterprint value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the onbeforeprint handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol BeforePrintEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onBeforePrint(_ value: String) -> Self
}

extension BeforePrintEventAttribute {
    
    internal var key: String { "onbeforeprint" }
}

extension BeforePrintEventAttribute where Self: ContentNode {
    
    internal func mutate(onbeforeprint value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension BeforePrintEventAttribute where Self: EmptyNode {
    
    internal func mutate(onbeforeprint value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the onbeforeunload handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol BeforeUnloadEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onBeforeUnload(_ value: String) -> Self
}

extension BeforeUnloadEventAttribute {
    
    internal var key: String { "onbeforeunload" }
}

extension BeforeUnloadEventAttribute where Self: ContentNode {
    
    internal func mutate(onbeforeunload value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension BeforeUnloadEventAttribute where Self: EmptyNode {
    
    internal func mutate(onbeforeunload value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the onerror handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol ErrorEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onError(_ value: String) -> Self
}

extension ErrorEventAttribute {
    
    internal var key: String { "onerror" }
}

extension ErrorEventAttribute where Self: ContentNode {
    
    internal func mutate(onerror value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension ErrorEventAttribute where Self: EmptyNode {
    
    internal func mutate(onerror value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the onhashchange handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol HashChangeEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onHashChange(_ value: String) -> Self
}

extension HashChangeEventAttribute {
    
    internal var key: String { "onhashchange" }
}

extension HashChangeEventAttribute where Self: ContentNode {
    
    internal func mutate(onhashchange value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension HashChangeEventAttribute where Self: EmptyNode {
    
    internal func mutate(onhashchange value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the onload handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol LoadEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onLoad(_ value: String) -> Self
}

extension LoadEventAttribute {
    
    internal var key: String { "onload" }
}

extension LoadEventAttribute where Self: ContentNode {
    
    internal func mutate(onload value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension LoadEventAttribute where Self: EmptyNode {
    
    internal func mutate(onload value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the onmessage handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol MessageEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onMessage(_ value: String) -> Self
}

extension MessageEventAttribute {
    
    internal var key: String { "onmessage" }
}

extension MessageEventAttribute where Self: ContentNode {
    
    internal func mutate(onmessage value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension MessageEventAttribute where Self: EmptyNode {
    
    internal func mutate(onmessage value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the onoffline handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol OfflineEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onOffline(_ value: String) -> Self
}

extension OfflineEventAttribute {
    
    internal var key: String { "onoffline" }
}

extension OfflineEventAttribute where Self: ContentNode {
    
    internal func mutate(onoffline value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension OfflineEventAttribute where Self: EmptyNode {
    
    internal func mutate(onoffline value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the ononline handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol OnlineEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onOnline(_ value: String) -> Self
}

extension OnlineEventAttribute {
    
    internal var key: String { "ononline" }
}

extension OnlineEventAttribute where Self: ContentNode {
    
    internal func mutate(ononline value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension OnlineEventAttribute where Self: EmptyNode {
    
    internal func mutate(ononline value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the onpagehide handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol PageHideEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onPageHide(_ value: String) -> Self
}

extension PageHideEventAttribute {
    
    internal var key: String { "onpagehide" }
}

extension PageHideEventAttribute where Self: ContentNode {
    
    internal func mutate(onpagehide value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension PageHideEventAttribute where Self: EmptyNode {
    
    internal func mutate(onpagehide value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the onpageshow handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol PageShowEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onPageShow(_ value: String) -> Self
}

extension PageShowEventAttribute {
    
    internal var key: String { "onpageshow" }
}

extension PageShowEventAttribute where Self: ContentNode {
    
    internal func mutate(onpageshow value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension PageShowEventAttribute where Self: EmptyNode {
    
    internal func mutate(onpageshow value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the onpopstate handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol PopstateEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onPopstate(_ value: String) -> Self
}

extension PopstateEventAttribute {
    
    internal var key: String { "onpopstate" }
}

extension PopstateEventAttribute where Self: ContentNode {
    
    internal func mutate(onpopstate value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension PopstateEventAttribute where Self: EmptyNode {
    
    internal func mutate(onpopstate value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the onresize handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol ResizeEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onResize(_ value: String) -> Self
}

extension ResizeEventAttribute {
    
    internal var key: String { "onresize" }
}

extension ResizeEventAttribute where Self: ContentNode {
    
    internal func mutate(onresize value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension ResizeEventAttribute where Self: EmptyNode {
    
    internal func mutate(onresize value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the onstorage handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol StorageEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onStorage(_ value: String) -> Self
}

extension StorageEventAttribute {
    
    internal var key: String { "onstorage" }
}

extension StorageEventAttribute where Self: ContentNode {
    
    internal func mutate(onstorage value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension StorageEventAttribute where Self: EmptyNode {
    
    internal func mutate(onstorage value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the onunload handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol UnloadEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onUnload(_ value: String) -> Self
}

extension UnloadEventAttribute {
    
    internal var key: String { "onunload" }
}

extension UnloadEventAttribute where Self: ContentNode {
    
    internal func mutate(onunload value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension UnloadEventAttribute where Self: EmptyNode {
    
    internal func mutate(onunload value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the onblur handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol BlurEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onBlur(_ value: String) -> Self
}

extension BlurEventAttribute {
    
    internal var key: String { "onblur" }
}

extension BlurEventAttribute where Self: ContentNode {
    
    internal func mutate(onblur value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension BlurEventAttribute where Self: EmptyNode {
    
    internal func mutate(onblur value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the onchange handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol ChangeEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onChange(_ value: String) -> Self
}

extension ChangeEventAttribute {
    
    internal var key: String { "onchange" }
}

extension ChangeEventAttribute where Self: ContentNode {
    
    internal func mutate(onchange value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension ChangeEventAttribute where Self: EmptyNode {
    
    internal func mutate(onchange value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the oncontextmenu handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol ContextMenuEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onContextMenu(_ value: String) -> Self
}

extension ContextMenuEventAttribute {
    
    internal var key: String { "oncontextmenu" }
}

extension ContextMenuEventAttribute where Self: ContentNode {
    
    internal func mutate(oncontextmenu value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension ContextMenuEventAttribute where Self: EmptyNode {
    
    internal func mutate(oncontextmenu value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the onfocus handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol FocusEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onFocus(_ value: String) -> Self
}

extension FocusEventAttribute {
    
    internal var key: String { "onfocus" }
}

extension FocusEventAttribute where Self: ContentNode {
    
    internal func mutate(onfocus value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension FocusEventAttribute where Self: EmptyNode {
    
    internal func mutate(onfocus value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the oninput handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol InputEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onInput(_ value: String) -> Self
}

extension InputEventAttribute {
    
    internal var key: String { "oninput" }
}

extension InputEventAttribute where Self: ContentNode {
    
    internal func mutate(oninput value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension InputEventAttribute where Self: EmptyNode {
    
    internal func mutate(oninput value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the oninvalid handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol InvalidEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onInvalid(_ value: String) -> Self
}

extension InvalidEventAttribute {
    
    internal var key: String { "oninvalid" }
}

extension InvalidEventAttribute where Self: ContentNode {
    
    internal func mutate(oninvalid value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension InvalidEventAttribute where Self: EmptyNode {
    
    internal func mutate(oninvalid value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the onreset handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol ResetEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onReset(_ value: String) -> Self
}

extension ResetEventAttribute {
    
    internal var key: String { "onreset" }
}

extension ResetEventAttribute where Self: ContentNode {
    
    internal func mutate(onreset value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension ResetEventAttribute where Self: EmptyNode {
    
    internal func mutate(onreset value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the onsearch handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol SearchEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onSearch(_ value: String) -> Self
}

extension SearchEventAttribute {
    
    internal var key: String { "onsearch" }
}

extension SearchEventAttribute where Self: ContentNode {
    
    internal func mutate(onsearch value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension SearchEventAttribute where Self: EmptyNode {
    
    internal func mutate(onsearch value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the onselect handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol SelectEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onSelect(_ value: String) -> Self
}

extension SelectEventAttribute {
    
    internal var key: String { "onselect" }
}

extension SelectEventAttribute where Self: ContentNode {
    
    internal func mutate(onselect value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension SelectEventAttribute where Self: EmptyNode {
    
    internal func mutate(onselect value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the onsubmit handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol SubmitEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onSubmit(_ value: String) -> Self
}

extension SubmitEventAttribute {
    
    internal var key: String { "onsubmit" }
}

extension SubmitEventAttribute where Self: ContentNode {
    
    internal func mutate(onsubmit value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension SubmitEventAttribute where Self: EmptyNode {
    
    internal func mutate(onsubmit value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the onkeydown handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol KeyDownEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onKeyDown(_ value: String) -> Self
}

extension KeyDownEventAttribute {
    
    internal var key: String { "onkeydown" }
}

extension KeyDownEventAttribute where Self: ContentNode {
    
    internal func mutate(onkeydown value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension KeyDownEventAttribute where Self: EmptyNode {
    
    internal func mutate(onkeydown value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the onkeypress handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol KeyPressEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onKeyPress(_ value: String) -> Self
}

extension KeyPressEventAttribute {
    
    internal var key: String { "onkeypress" }
}

extension KeyPressEventAttribute where Self: ContentNode {
    
    internal func mutate(onkeypress value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension KeyPressEventAttribute where Self: EmptyNode {
    
    internal func mutate(onkeypress value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the onkeyup handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol KeyUpEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onKeyUp(_ value: String) -> Self
}

extension KeyUpEventAttribute {
    
    internal var key: String { "onkeyup" }
}

extension KeyUpEventAttribute where Self: ContentNode {
    
    internal func mutate(onkeyup value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension KeyUpEventAttribute where Self: EmptyNode {
    
    internal func mutate(onkeyup value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the onclick handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol ClickEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onClick(_ value: String) -> Self
}

extension ClickEventAttribute {
    
    internal var key: String { "onclick" }
}

extension ClickEventAttribute where Self: ContentNode {
    
    internal func mutate(onclick value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension ClickEventAttribute where Self: EmptyNode {
    
    internal func mutate(onclick value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the ondbclick handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol DoubleClickEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onDoubleClick(_ value: String) -> Self
}

extension DoubleClickEventAttribute {
    
    internal var key: String { "ondbclick" }
}

extension DoubleClickEventAttribute where Self: ContentNode {
    
    internal func mutate(ondbclick value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension DoubleClickEventAttribute where Self: EmptyNode {
    
    internal func mutate(ondbclick value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the onmousedown handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol MouseDownEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onMouseDown(_ value: String) -> Self
}

extension MouseDownEventAttribute {
    
    internal var key: String { "onmousedown" }
}

extension MouseDownEventAttribute where Self: ContentNode {
    
    internal func mutate(onmousedown value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension MouseDownEventAttribute where Self: EmptyNode {
    
    internal func mutate(onmousedown value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the onmousemove handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol MouseMoveEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onMouseMove(_ value: String) -> Self
}

extension MouseMoveEventAttribute {
    
    internal var key: String { "onmousemove" }
}

extension MouseMoveEventAttribute where Self: ContentNode {
    
    internal func mutate(onmousemove value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension MouseMoveEventAttribute where Self: EmptyNode {
    
    internal func mutate(onmousemove value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the onmouseout handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol MouseOutEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onMouseOut(_ value: String) -> Self
}

extension MouseOutEventAttribute {
    
    internal var key: String { "onmouseout" }
}

extension MouseOutEventAttribute where Self: ContentNode {
    
    internal func mutate(onmouseout value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension MouseOutEventAttribute where Self: EmptyNode {
    
    internal func mutate(onmouseout value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the onmouseover handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol MouseOverEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onMouseOver(_ value: String) -> Self
}

extension MouseOverEventAttribute {
    
    internal var key: String { "onmouseover" }
}

extension MouseOverEventAttribute where Self: ContentNode {
    
    internal func mutate(onmouseover value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension MouseOverEventAttribute where Self: EmptyNode {
    
    internal func mutate(onmouseover value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the onmouseup handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol MouseUpEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onMouseUp(_ value: String) -> Self
}

extension MouseUpEventAttribute {
    
    internal var key: String { "onmouseup" }
}

extension MouseUpEventAttribute where Self: ContentNode {
    
    internal func mutate(onmouseup value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension MouseUpEventAttribute where Self: EmptyNode {
    
    internal func mutate(onmouseup value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the onwheel handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol WheelEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onWheel(_ value: String) -> Self
}

extension WheelEventAttribute {
    
    internal var key: String { "onwheel" }
}

extension WheelEventAttribute where Self: ContentNode {
    
    internal func mutate(onwheel value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension WheelEventAttribute where Self: EmptyNode {
    
    internal func mutate(onwheel value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the ondrag handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol DragEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onDrag(_ value: String) -> Self
}

extension DragEventAttribute {
    
    internal var key: String { "ondrag" }
}

extension DragEventAttribute where Self: ContentNode {
    
    internal func mutate(ondrag value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension DragEventAttribute where Self: EmptyNode {
    
    internal func mutate(ondrag value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the ondragenter handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol DragEnterEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onDragEnter(_ value: String) -> Self
}

extension DragEnterEventAttribute {
    
    internal var key: String { "ondragenter" }
}

extension DragEnterEventAttribute where Self: ContentNode {
    
    internal func mutate(ondragenter value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension DragEnterEventAttribute where Self: EmptyNode {
    
    internal func mutate(ondragenter value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the ondragend handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol DragEndEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onDragEnd(_ value: String) -> Self
}

extension DragEndEventAttribute {
    
    internal var key: String { "ondragend" }
}

extension DragEndEventAttribute where Self: ContentNode {
    
    internal func mutate(ondragend value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension DragEndEventAttribute where Self: EmptyNode {
    
    internal func mutate(ondragend value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the ondragleave handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol DragLeaveEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onDragLeave(_ value: String) -> Self
}

extension DragLeaveEventAttribute {
    
    internal var key: String { "ondragleave" }
}

extension DragLeaveEventAttribute where Self: ContentNode {
    
    internal func mutate(ondragleave value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension DragLeaveEventAttribute where Self: EmptyNode {
    
    internal func mutate(ondragleave value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the ondragover handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol DragOverEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onDragOver(_ value: String) -> Self
}

extension DragOverEventAttribute {
    
    internal var key: String { "ondragover" }
}

extension DragOverEventAttribute where Self: ContentNode {
    
    internal func mutate(ondragover value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension DragOverEventAttribute where Self: EmptyNode {
    
    internal func mutate(ondragover value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the ondragstart handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol DragStartEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onDragStart(_ value: String) -> Self
}

extension DragStartEventAttribute {
    
    internal var key: String { "ondragstart" }
}

extension DragStartEventAttribute where Self: ContentNode {
    
    internal func mutate(ondragstart value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension DragStartEventAttribute where Self: EmptyNode {
    
    internal func mutate(ondragstart value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the ondrop handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol DropEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onDrop(_ value: String) -> Self
}

extension DropEventAttribute {
    
    internal var key: String { "ondrop" }
}

extension DropEventAttribute where Self: ContentNode {
    
    internal func mutate(ondrop value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension DropEventAttribute where Self: EmptyNode {
    
    internal func mutate(ondrop value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the onscroll handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol ScrollEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onScroll(_ value: String) -> Self
}

extension ScrollEventAttribute {
    
    internal var key: String { "onscroll" }
}

extension ScrollEventAttribute where Self: ContentNode {
    
    internal func mutate(onscroll value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension ScrollEventAttribute where Self: EmptyNode {
    
    internal func mutate(onscroll value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the oncopy handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol CopyEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onCopy(_ value: String) -> Self
}

extension CopyEventAttribute {
    
    internal var key: String { "oncopy" }
}

extension CopyEventAttribute where Self: ContentNode {
    
    internal func mutate(oncopy value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension CopyEventAttribute where Self: EmptyNode {
    
    internal func mutate(oncopy value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the oncut handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol CutEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onCut(_ value: String) -> Self
}

extension CutEventAttribute {
    
    internal var key: String { "oncut" }
}

extension CutEventAttribute where Self: ContentNode {
    
    internal func mutate(oncut value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension CutEventAttribute where Self: EmptyNode {
    
    internal func mutate(oncut value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the onpaste handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol PasteEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onPaste(_ value: String) -> Self
}

extension PasteEventAttribute {
    
    internal var key: String { "onpaste" }
}

extension PasteEventAttribute where Self: ContentNode {
    
    internal func mutate(onpaste value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension PasteEventAttribute where Self: EmptyNode {
    
    internal func mutate(onpaste value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the onabort handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol AbortEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onAbort(_ value: String) -> Self
}

extension AbortEventAttribute {
    
    internal var key: String { "onabort" }
}

extension AbortEventAttribute where Self: ContentNode {
    
    internal func mutate(onabort value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension AbortEventAttribute where Self: EmptyNode {
    
    internal func mutate(onabort value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the oncanplay handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol CanPlayEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onCanPlay(_ value: String) -> Self
}

extension CanPlayEventAttribute {
    
    internal var key: String { "oncanplay" }
}

extension CanPlayEventAttribute where Self: ContentNode {
    
    internal func mutate(oncanplay value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension CanPlayEventAttribute where Self: EmptyNode {
    
    internal func mutate(oncanplay value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the oncanplaythrough handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol CanPlayThroughEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onCanPlayThrough(_ value: String) -> Self
}

extension CanPlayThroughEventAttribute {
    
    internal var key: String { "oncanplaythrough" }
}

extension CanPlayThroughEventAttribute where Self: ContentNode {
    
    internal func mutate(oncanplaythrough value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension CanPlayThroughEventAttribute where Self: EmptyNode {
    
    internal func mutate(oncanplaythrough value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the oncuechange handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol CueChangeEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onCueChange(_ value: String) -> Self
}

extension CueChangeEventAttribute {
    
    internal var key: String { "oncuechange" }
}

extension CueChangeEventAttribute where Self: ContentNode {
    
    internal func mutate(oncuechange value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension CueChangeEventAttribute where Self: EmptyNode {
    
    internal func mutate(oncuechange value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the ondurationchange handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol DurationChangeEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onDurationChange(_ value: String) -> Self
}

extension DurationChangeEventAttribute {
    
    internal var key: String { "ondurationchange" }
}

extension DurationChangeEventAttribute where Self: ContentNode {
    
    internal func mutate(ondurationchange value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension DurationChangeEventAttribute where Self: EmptyNode {
    
    internal func mutate(ondurationchange value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the onemptied handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol EmptiedEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onEmptied(_ value: String) -> Self
}

extension EmptiedEventAttribute {
    
    internal var key: String { "onemptied" }
}

extension EmptiedEventAttribute where Self: ContentNode {
    
    internal func mutate(onemptied value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension EmptiedEventAttribute where Self: EmptyNode {
    
    internal func mutate(onemptied value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the onended handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol EndedEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onEnded(_ value: String) -> Self
}

extension EndedEventAttribute {
    
    internal var key: String { "onended" }
}

extension EndedEventAttribute where Self: ContentNode {
    
    internal func mutate(onended value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension EndedEventAttribute where Self: EmptyNode {
    
    internal func mutate(onended value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the onloadeddata handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol LoadedDataEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onLoadedData(_ value: String) -> Self
}

extension LoadedDataEventAttribute {
    
    internal var key: String { "onloadeddata" }
}

extension LoadedDataEventAttribute where Self: ContentNode {
    
    internal func mutate(onloadeddata value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension LoadedDataEventAttribute where Self: EmptyNode {
    
    internal func mutate(onloadeddata value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the onloadedmetadata handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol LoadedMetaDataEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onLoadedMetaData(_ value: String) -> Self
}

extension LoadedMetaDataEventAttribute {
    
    internal var key: String { "onloadedmetadata" }
}

extension LoadedMetaDataEventAttribute where Self: ContentNode {
    
    internal func mutate(onloadedmetadata value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension LoadedMetaDataEventAttribute where Self: EmptyNode {
    
    internal func mutate(onloadedmetadata value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the onloadstart handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol LoadStartEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onLoadStart(_ value: String) -> Self
}

extension LoadStartEventAttribute {
    
    internal var key: String { "onloadstart" }
}

extension LoadStartEventAttribute where Self: ContentNode {
    
    internal func mutate(onloadstart value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension LoadStartEventAttribute where Self: EmptyNode {
    
    internal func mutate(onloadstart value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the onpause handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol PauseEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onPause(_ value: String) -> Self
}

extension PauseEventAttribute {
    
    internal var key: String { "onpause" }
}

extension PauseEventAttribute where Self: ContentNode {
    
    internal func mutate(onpause value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension PauseEventAttribute where Self: EmptyNode {
    
    internal func mutate(onpause value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the onplay handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol PlayEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onPlay(_ value: String) -> Self
}

extension PlayEventAttribute {
    
    internal var key: String { "onplay" }
}

extension PlayEventAttribute where Self: ContentNode {
    
    internal func mutate(onplay value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension PlayEventAttribute where Self: EmptyNode {
    
    internal func mutate(onplay value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the onplaying handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol PlayingEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func OnPlaying(_ value: String) -> Self
}

extension PlayingEventAttribute {
    
    internal var key: String { "onplaying" }
}

extension PlayingEventAttribute where Self: ContentNode {
    
    internal func mutate(onplaying value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension PlayingEventAttribute where Self: EmptyNode {
    
    internal func mutate(onplaying value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the onprogress handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol ProgressEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onProgress(_ value: String) -> Self
}

extension ProgressEventAttribute {
    
    internal var key: String { "onprogress" }
}

extension ProgressEventAttribute where Self: ContentNode {
    
    internal func mutate(onprogress value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension ProgressEventAttribute where Self: EmptyNode {
    
    internal func mutate(onprogress value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the onratechange handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol RateChangeEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onRateChange(_ value: String) -> Self
}

extension RateChangeEventAttribute {
    
    internal var key: String { "onratechange" }
}

extension RateChangeEventAttribute where Self: ContentNode {
    
    internal func mutate(onratechange value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension RateChangeEventAttribute where Self: EmptyNode {
    
    internal func mutate(onratechange value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the onseeked handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol SeekedEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onSeeked(_ value: String) -> Self
}

extension SeekedEventAttribute {
    
    internal var key: String { "onseeked" }
}

extension SeekedEventAttribute where Self: ContentNode {
    
    internal func mutate(onseeked value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension SeekedEventAttribute where Self: EmptyNode {
    
    internal func mutate(onseeked value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the onseeking handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol SeekingEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onSeeking(_ value: String) -> Self
}

extension SeekingEventAttribute {
    
    internal var key: String { "onseeking" }
}

extension SeekingEventAttribute where Self: ContentNode {
    
    internal func mutate(onseeking value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension SeekingEventAttribute where Self: EmptyNode {
    
    internal func mutate(onseeking value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the onstalled handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol StalledEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onStalled(_ value: String) -> Self
}

extension StalledEventAttribute {
    
    internal var key: String { "onstalled" }
}

extension StalledEventAttribute where Self: ContentNode {
    
    internal func mutate(onstalled value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension StalledEventAttribute where Self: EmptyNode {
    
    internal func mutate(onstalled value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the onsuspend handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol SuspendEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onSuspend(_ value: String) -> Self
}

extension SuspendEventAttribute {
    
    internal var key: String { "onsuspend" }
}

extension SuspendEventAttribute where Self: ContentNode {
    
    internal func mutate(onsuspend value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension SuspendEventAttribute where Self: EmptyNode {
    
    internal func mutate(onsuspend value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the ontimeupdate handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol TimeUpdateEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onTimeUpdate(_ value: String) -> Self
}

extension TimeUpdateEventAttribute {
    
    internal var key: String { "ontimeupdate" }
}

extension TimeUpdateEventAttribute where Self: ContentNode {
    
    internal func mutate(ontimeupdate value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension TimeUpdateEventAttribute where Self: EmptyNode {
    
    internal func mutate(ontimeupdate value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the onvolumechange handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol VolumeChangeEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onVolumeChange(_ value: String) -> Self
}

extension VolumeChangeEventAttribute {
    
    internal var key: String { "onvolumechange" }
}

extension VolumeChangeEventAttribute where Self: ContentNode {
    
    internal func mutate(onvolumechange value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension VolumeChangeEventAttribute where Self: EmptyNode {
    
    internal func mutate(onvolumechange value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the onwaiting handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol WaitingEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onWaiting(_ value: String) -> Self
}

extension WaitingEventAttribute {
    
    internal var key: String { "onwaiting" }
}

extension WaitingEventAttribute where Self: ContentNode {
    
    internal func mutate(onwaiting value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension WaitingEventAttribute where Self: EmptyNode {
    
    internal func mutate(onwaiting value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}

/// ## Description
/// The protocol provides the element with the ontoggle handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-ol-reversed
///
public protocol ToggleEventAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func onToggle(_ value: String) -> Self
}

extension ToggleEventAttribute {
    
    internal var key: String { "ontoggle" }
}

extension ToggleEventAttribute where Self: ContentNode {
    
    internal func mutate(ontoggle value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension ToggleEventAttribute where Self: EmptyNode {
    
    internal func mutate(ontoggle value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value))
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes))
    }
}
