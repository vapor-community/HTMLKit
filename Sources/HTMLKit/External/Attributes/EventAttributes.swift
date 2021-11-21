import OrderedCollections

/// The alias points
///
///
public typealias GlobalEventAttributes = ContextMenuEventAttribute & WheelEventAttribute & DragEventAttribute & DragEndEventAttribute & DragEnterEventAttribute & DragLeaveEventAttribute & DragOverEventAttribute & DragStartEventAttribute & DropEventAttribute

/// The protocol provides
///
///
public protocol AfterPrintEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onAfterPrint(_ value: String) -> Self
}

extension AfterPrintEventAttribute {
    
    internal var key: String { "onafterprint" }
}

extension AfterPrintEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol BeforePrintEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onBeforePrint(_ value: String) -> Self
}

extension BeforePrintEventAttribute {
    
    internal var key: String { "onbeforeprint" }
}

extension BeforePrintEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol BeforeUnloadEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onBeforeUnload(_ value: String) -> Self
}

extension BeforeUnloadEventAttribute {
    
    internal var key: String { "onbeforeunload" }
}

extension BeforeUnloadEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol ErrorEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onError(_ value: String) -> Self
}

extension ErrorEventAttribute {
    
    internal var key: String { "onerror" }
}

extension ErrorEventAttribute where Self: ContentNode, T == Content {
    
    internal func mutate(onerror value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension ErrorEventAttribute where Self: ContentNode, T == String {
    
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

/// The protocol provides
///
///
public protocol HashChangeEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onHashChange(_ value: String) -> Self
}

extension HashChangeEventAttribute {
    
    internal var key: String { "onhashchange" }
}

extension HashChangeEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol LoadEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onLoad(_ value: String) -> Self
}

extension LoadEventAttribute {
    
    internal var key: String { "onload" }
}

extension LoadEventAttribute where Self: ContentNode, T == Content {
    
    internal func mutate(onload value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

extension LoadEventAttribute where Self: ContentNode, T == String {
    
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

/// The protocol provides
///
///
public protocol MessageEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onMessage(_ value: String) -> Self
}

extension MessageEventAttribute {
    
    internal var key: String { "onmessage" }
}

extension MessageEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol OfflineEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onOffline(_ value: String) -> Self
}

extension OfflineEventAttribute {
    
    internal var key: String { "onoffline" }
}

extension OfflineEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol OnlineEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onOnline(_ value: String) -> Self
}

extension OnlineEventAttribute {
    
    internal var key: String { "ononline" }
}

extension OnlineEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol PageHideEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onPageHide(_ value: String) -> Self
}

extension PageHideEventAttribute {
    
    internal var key: String { "onpagehide" }
}

extension PageHideEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol PageShowEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onPageShow(_ value: String) -> Self
}

extension PageShowEventAttribute {
    
    internal var key: String { "onpageshow" }
}

extension PageShowEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol PopstateEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onPopstate(_ value: String) -> Self
}

extension PopstateEventAttribute {
    
    internal var key: String { "onpopstate" }
}

extension PopstateEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol ResizeEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onResize(_ value: String) -> Self
}

extension ResizeEventAttribute {
    
    internal var key: String { "onresize" }
}

extension ResizeEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol StorageEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onStorage(_ value: String) -> Self
}

extension StorageEventAttribute {
    
    internal var key: String { "onstorage" }
}

extension StorageEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol UnloadEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onUnload(_ value: String) -> Self
}

extension UnloadEventAttribute {
    
    internal var key: String { "onunload" }
}

extension UnloadEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol BlurEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onBlur(_ value: String) -> Self
}

extension BlurEventAttribute {
    
    internal var key: String { "onblur" }
}

extension BlurEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol ChangeEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onChange(_ value: String) -> Self
}

extension ChangeEventAttribute {
    
    internal var key: String { "onchange" }
}

extension ChangeEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol ContextMenuEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onContextMenu(_ value: String) -> Self
}

extension ContextMenuEventAttribute {
    
    internal var key: String { "oncontextmenu" }
}

extension ContextMenuEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol FocusEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onFocus(_ value: String) -> Self
}

extension FocusEventAttribute {
    
    internal var key: String { "onfocus" }
}

extension FocusEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol InputEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onInput(_ value: String) -> Self
}

extension InputEventAttribute {
    
    internal var key: String { "oninput" }
}

extension InputEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol InvalidEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onInvalid(_ value: String) -> Self
}

extension InvalidEventAttribute {
    
    internal var key: String { "oninvalid" }
}

extension InvalidEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol ResetEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onReset(_ value: String) -> Self
}

extension ResetEventAttribute {
    
    internal var key: String { "onreset" }
}

extension ResetEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol SearchEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onSearch(_ value: String) -> Self
}

extension SearchEventAttribute {
    
    internal var key: String { "onsearch" }
}

extension SearchEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol SelectEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onSelect(_ value: String) -> Self
}

extension SelectEventAttribute {
    
    internal var key: String { "onselect" }
}

extension SelectEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol SubmitEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onSubmit(_ value: String) -> Self
}

extension SubmitEventAttribute {
    
    internal var key: String { "onsubmit" }
}

extension SubmitEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol KeyDownEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onKeyDown(_ value: String) -> Self
}

extension KeyDownEventAttribute {
    
    internal var key: String { "onkeydown" }
}

extension KeyDownEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol KeyPressEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onKeyPress(_ value: String) -> Self
}

extension KeyPressEventAttribute {
    
    internal var key: String { "onkeypress" }
}

extension KeyPressEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol KeyUpEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onKeyUp(_ value: String) -> Self
}

extension KeyUpEventAttribute {
    
    internal var key: String { "onkeyup" }
}

extension KeyUpEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol ClickEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onClick(_ value: String) -> Self
}

extension ClickEventAttribute {
    
    internal var key: String { "onclick" }
}

extension ClickEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol DoubleClickEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onDoubleClick(_ value: String) -> Self
}

extension DoubleClickEventAttribute {
    
    internal var key: String { "ondbclick" }
}

extension DoubleClickEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol MouseDownEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onMouseDown(_ value: String) -> Self
}

extension MouseDownEventAttribute {
    
    internal var key: String { "onmousedown" }
}

extension MouseDownEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol MouseMoveEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onMouseMove(_ value: String) -> Self
}

extension MouseMoveEventAttribute {
    
    internal var key: String { "onmousemove" }
}

extension MouseMoveEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol MouseOutEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onMouseOut(_ value: String) -> Self
}

extension MouseOutEventAttribute {
    
    internal var key: String { "onmouseout" }
}

extension MouseOutEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol MouseOverEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onMouseOver(_ value: String) -> Self
}

extension MouseOverEventAttribute {
    
    internal var key: String { "onmouseover" }
}

extension MouseOverEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol MouseUpEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onMouseUp(_ value: String) -> Self
}

extension MouseUpEventAttribute {
    
    internal var key: String { "onmouseup" }
}

extension MouseUpEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol WheelEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onWheel(_ value: String) -> Self
}

extension WheelEventAttribute {
    
    internal var key: String { "onwheel" }
}

extension WheelEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol DragEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onDrag(_ value: String) -> Self
}

extension DragEventAttribute {
    
    internal var key: String { "ondrag" }
}

extension DragEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol DragEnterEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onDragEnter(_ value: String) -> Self
}

extension DragEnterEventAttribute {
    
    internal var key: String { "ondragenter" }
}

extension DragEnterEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol DragEndEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onDragEnd(_ value: String) -> Self
}

extension DragEndEventAttribute {
    
    internal var key: String { "ondragend" }
}

extension DragEndEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol DragLeaveEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onDragLeave(_ value: String) -> Self
}

extension DragLeaveEventAttribute {
    
    internal var key: String { "ondragleave" }
}

extension DragLeaveEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol DragOverEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onDragOver(_ value: String) -> Self
}

extension DragOverEventAttribute {
    
    internal var key: String { "ondragover" }
}

extension DragOverEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol DragStartEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onDragStart(_ value: String) -> Self
}

extension DragStartEventAttribute {
    
    internal var key: String { "ondragstart" }
}

extension DragStartEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol DropEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onDrop(_ value: String) -> Self
}

extension DropEventAttribute {
    
    internal var key: String { "ondrop" }
}

extension DropEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol ScrollEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onScroll(_ value: String) -> Self
}

extension ScrollEventAttribute {
    
    internal var key: String { "onscroll" }
}

extension ScrollEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol CopyEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onCopy(_ value: String) -> Self
}

extension CopyEventAttribute {
    
    internal var key: String { "oncopy" }
}

extension CopyEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol CutEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onCut(_ value: String) -> Self
}

extension CutEventAttribute {
    
    internal var key: String { "oncut" }
}

extension CutEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol PasteEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onPaste(_ value: String) -> Self
}

extension PasteEventAttribute {
    
    internal var key: String { "onpaste" }
}

extension PasteEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol AbortEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onAbort(_ value: String) -> Self
}

extension AbortEventAttribute {
    
    internal var key: String { "onabort" }
}

extension AbortEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol CanPlayEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onCanPlay(_ value: String) -> Self
}

extension CanPlayEventAttribute {
    
    internal var key: String { "oncanplay" }
}

extension CanPlayEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol CanPlayThroughEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onCanPlayThrough(_ value: String) -> Self
}

extension CanPlayThroughEventAttribute {
    
    internal var key: String { "oncanplaythrough" }
}

extension CanPlayThroughEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol CueChangeEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onCueChange(_ value: String) -> Self
}

extension CueChangeEventAttribute {
    
    internal var key: String { "oncuechange" }
}

extension CueChangeEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol DurationChangeEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onDurationChange(_ value: String) -> Self
}

extension DurationChangeEventAttribute {
    
    internal var key: String { "ondurationchange" }
}

extension DurationChangeEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol EmptiedEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onEmptied(_ value: String) -> Self
}

extension EmptiedEventAttribute {
    
    internal var key: String { "onemptied" }
}

extension EmptiedEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol EndedEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onEnded(_ value: String) -> Self
}

extension EndedEventAttribute {
    
    internal var key: String { "onended" }
}

extension EndedEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol LoadedDataEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onLoadedData(_ value: String) -> Self
}

extension LoadedDataEventAttribute {
    
    internal var key: String { "onloadeddata" }
}

extension LoadedDataEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol LoadedMetaDataEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onLoadedMetaData(_ value: String) -> Self
}

extension LoadedMetaDataEventAttribute {
    
    internal var key: String { "onloadedmetadata" }
}

extension LoadedMetaDataEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol LoadStartEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onLoadStart(_ value: String) -> Self
}

extension LoadStartEventAttribute {
    
    internal var key: String { "onloadstart" }
}

extension LoadStartEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol PauseEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onPause(_ value: String) -> Self
}

extension PauseEventAttribute {
    
    internal var key: String { "onpause" }
}

extension PauseEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol PlayEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onPlay(_ value: String) -> Self
}

extension PlayEventAttribute {
    
    internal var key: String { "onplay" }
}

extension PlayEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol PlayingEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func OnPlaying(_ value: String) -> Self
}

extension PlayingEventAttribute {
    
    internal var key: String { "onplaying" }
}

extension PlayingEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol ProgressEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onProgress(_ value: String) -> Self
}

extension ProgressEventAttribute {
    
    internal var key: String { "onprogress" }
}

extension ProgressEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol RateChangeEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onRateChange(_ value: String) -> Self
}

extension RateChangeEventAttribute {
    
    internal var key: String { "onratechange" }
}

extension RateChangeEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol SeekedEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onSeeked(_ value: String) -> Self
}

extension SeekedEventAttribute {
    
    internal var key: String { "onseeked" }
}

extension SeekedEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol SeekingEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onSeeking(_ value: String) -> Self
}

extension SeekingEventAttribute {
    
    internal var key: String { "onseeking" }
}

extension SeekingEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol StalledEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onStalled(_ value: String) -> Self
}

extension StalledEventAttribute {
    
    internal var key: String { "onstalled" }
}

extension StalledEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol SuspendEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onSuspend(_ value: String) -> Self
}

extension SuspendEventAttribute {
    
    internal var key: String { "onsuspend" }
}

extension SuspendEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol TimeUpdateEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onTimeUpdate(_ value: String) -> Self
}

extension TimeUpdateEventAttribute {
    
    internal var key: String { "ontimeupdate" }
}

extension TimeUpdateEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol VolumeChangeEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onVolumeChange(_ value: String) -> Self
}

extension VolumeChangeEventAttribute {
    
    internal var key: String { "onvolumechange" }
}

extension VolumeChangeEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol WaitingEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onWaiting(_ value: String) -> Self
}

extension WaitingEventAttribute {
    
    internal var key: String { "onwaiting" }
}

extension WaitingEventAttribute where Self: ContentNode, T == Content {
    
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

/// The protocol provides
///
///
public protocol ToggleEventAttribute: Attribute {
    
    /// The func adds
    ///
    ///
    func onToggle(_ value: String) -> Self
}

extension ToggleEventAttribute {
    
    internal var key: String { "ontoggle" }
}

extension ToggleEventAttribute where Self: ContentNode, T == Content {
    
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
