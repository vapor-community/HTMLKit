/*
 Abstract:
 The file contains the protocols for the event html-attributes.
 
 Authors:
 - Mats Moll (https://github.com/matsmoll)
 
 Contributors:
 - Mattes Mohr (https://github.com/mattesmohr)
 
 Note:
 If you about to add something to the file, stick to the official documentation to keep the code consistent.
 */

import OrderedCollections

/// The alias combines the global attributes of the event attributes.
public typealias GlobalEventAttributes = ContextMenuEventAttribute & WheelEventAttribute & DragEventAttribute & DragEndEventAttribute & DragEnterEventAttribute & DragLeaveEventAttribute & DragOverEventAttribute & DragStartEventAttribute & DropEventAttribute

/// The protocol provides the element with the onafterprint handler.
public protocol AfterPrintEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'onafterprint'.
    ///
    /// ```html
    /// <tag onafterprint="" />
    /// ```
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

/// The protocol provides the element with the onbeforeprint handler.
public protocol BeforePrintEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'onbeforeprint'.
    ///
    /// ```html
    /// <tag onbeforeprint="" />
    /// ```
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

/// The protocol provides the element with the onbeforeunload handler.
public protocol BeforeUnloadEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'onbeforeunload'.
    ///
    /// ```html
    /// <tag onbeforeunload="" />
    /// ```
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

/// The protocol provides the element with the onerror handler.
public protocol ErrorEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'onerror'.
    ///
    /// ```html
    /// <tag onerror="" />
    /// ```
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

/// The protocol provides the element with the onhashchange handler.
public protocol HashChangeEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'onhashchange'.
    ///
    /// ```html
    /// <tag onhashchange="" />
    /// ```
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

/// The protocol provides the element with the onload handler.
public protocol LoadEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'onload'.
    ///
    /// ```html
    /// <tag onload="" />
    /// ```
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

/// The protocol provides the element with the onmessage handler.
public protocol MessageEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'onmessage'.
    ///
    /// ```html
    /// <tag onmessage="" />
    /// ```
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

/// The protocol provides the element with the onoffline handler.
public protocol OfflineEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'onoffline'.
    ///
    /// ```html
    /// <tag onoffline="" />
    /// ```
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

/// The protocol provides the element with the ononline handler.
public protocol OnlineEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'ononline'.
    ///
    /// ```html
    /// <tag ononline="" />
    /// ```
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

/// The protocol provides the element with the onpagehide handler.
public protocol PageHideEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'onpagehide'.
    ///
    /// ```html
    /// <tag onpagehide="" />
    /// ```
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

/// The protocol provides the element with the onpageshow handler.
public protocol PageShowEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'onpageshow'.
    ///
    /// ```html
    /// <tag onpageshow="" />
    /// ```
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

/// The protocol provides the element with the onpopstate handler.
public protocol PopstateEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'onpopstate'.
    ///
    /// ```html
    /// <tag onpopstate="" />
    /// ```
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

/// The protocol provides the element with the onresize handler.
public protocol ResizeEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'onresize'.
    ///
    /// ```html
    /// <tag onresize="" />
    /// ```
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

/// The protocol provides the element with the onstorage handler.
public protocol StorageEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'onstorage'.
    ///
    /// ```html
    /// <tag onstorage="" />
    /// ```
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

/// The protocol provides the element with the onunload handler.
public protocol UnloadEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'onunload'.
    ///
    /// ```html
    /// <tag onunload="" />
    /// ```
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

/// The protocol provides the element with the onblur handler.
public protocol BlurEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'onblur'.
    ///
    /// ```html
    /// <tag onblur="" />
    /// ```
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

/// The protocol provides the element with the onchange handler.
public protocol ChangeEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'onchange'.
    ///
    /// ```html
    /// <tag onchange="" />
    /// ```
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

/// The protocol provides the element with the oncontextmenu handler.
public protocol ContextMenuEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'oncontextmenu'.
    ///
    /// ```html
    /// <tag ncontextmenu="" />
    /// ```
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

/// The protocol provides the element with the onfocus handler.
public protocol FocusEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'onfocus'.
    ///
    /// ```html
    /// <tag onfocus="" />
    /// ```
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

/// The protocol provides the element with the oninput handler.
public protocol InputEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'oninput'.
    ///
    /// ```html
    /// <tag oninput="" />
    /// ```
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

/// The protocol provides the element with the oninvalid handler.
public protocol InvalidEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'oninvalid'.
    ///
    /// ```html
    /// <tag oninvalid="" />
    /// ```
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

/// The protocol provides the element with the onreset handler.
public protocol ResetEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'onreset'.
    ///
    /// ```html
    /// <tag onreset="" />
    /// ```
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

/// The protocol provides the element with the onsearch handler.
public protocol SearchEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'onsearch'.
    ///
    /// ```html
    /// <tag onsearch="" />
    /// ```
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

/// The protocol provides the element with the onselect handler.
public protocol SelectEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'onselect'.
    ///
    /// ```html
    /// <tag onselect="" />
    /// ```
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

/// The protocol provides the element with the onsubmit handler.
public protocol SubmitEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'onsubmit'.
    ///
    /// ```html
    /// <tag onsubmit="" />
    /// ```
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

/// The protocol provides the element with the onkeydown handler.
public protocol KeyDownEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'onkeydown'.
    ///
    /// ```html
    /// <tag onkeydown="" />
    /// ```
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

/// The protocol provides the element with the onkeypress handler
public protocol KeyPressEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'onkeypress'.
    ///
    /// ```html
    /// <tag onkeypress="" />
    /// ```
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

/// The protocol provides the element with the onkeyup handler.
public protocol KeyUpEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'onkeyup'.
    ///
    /// ```html
    /// <tag onkeyup="" />
    /// ```
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

/// The protocol provides the element with the onclick handler.
public protocol ClickEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'onclick'.
    ///
    /// ```html
    /// <tag onclick="" />
    /// ```
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

/// The protocol provides the element with the ondbclick handler.
public protocol DoubleClickEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'ondbclick'.
    ///
    /// ```html
    /// <tag ondbclick="" />
    /// ```
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

/// The protocol provides the element with the onmousedown handler.
public protocol MouseDownEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'onmousedown'.
    ///
    /// ```html
    /// <tag onmousedown="" />
    /// ```
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

/// The protocol provides the element with the onmousemove handler.
public protocol MouseMoveEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'onmousemove'.
    ///
    /// ```html
    /// <tag onmousemove="" />
    /// ```
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

/// The protocol provides the element with the onmouseout handler.
public protocol MouseOutEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'onmouseout'.
    ///
    /// ```html
    /// <tag onmouseout="" />
    /// ```
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

/// The protocol provides the element with the onmouseover handler.
public protocol MouseOverEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'onmouseover'.
    ///
    /// ```html
    /// <tag onmouseover="" />
    /// ```
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

/// The protocol provides the element with the onmouseup handler.
public protocol MouseUpEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'onmouseup'.
    ///
    /// ```html
    /// <tag onmouseup="" />
    /// ```
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

/// The protocol provides the element with the onwheel handler.
public protocol WheelEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'onwheel'.
    ///
    /// ```html
    /// onwheel="" />
    /// ```
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

/// The protocol provides the element with the ondrag handler.
public protocol DragEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'ondrag'.
    ///
    /// ```html
    /// <tag ondrag="" />
    /// ```
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

/// The protocol provides the element with the ondragenter handler.
public protocol DragEnterEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'ondragenter'.
    ///
    /// ```html
    /// <tag ondragenter="" />
    /// ```
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

/// The protocol provides the element with the ondragend handler.
public protocol DragEndEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'ondragend'.
    ///
    /// ```html
    /// <tag ondragend="" />
    /// ```
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

/// The protocol provides the element with the ondragleave handler.
public protocol DragLeaveEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'ondragleave'.
    ///
    /// ```html
    /// <tag ondragleave="" />
    /// ```
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

/// The protocol provides the element with the ondragover handler.
public protocol DragOverEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'ondragover'.
    ///
    /// ```html
    /// <tag ondragover="" />
    /// ```
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

/// The protocol provides the element with the ondragstart handler.
public protocol DragStartEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'ondragstart'.
    ///
    /// ```html
    /// <tag ondragstart="" />
    /// ```
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

/// The protocol provides the element with the ondrop handler.
public protocol DropEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'ondrop'.
    ///
    /// ```html
    /// <tag ondrop="" />
    /// ```
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

/// The protocol provides the element with the onscroll handler.
public protocol ScrollEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'onscroll'.
    ///
    /// ```html
    /// <tag onscroll="" />
    /// ```
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

/// The protocol provides the element with the oncopy handler.
public protocol CopyEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'oncopy'.
    ///
    /// ```html
    /// <tag oncopy="" />
    /// ```
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

/// The protocol provides the element with the oncut handler.
public protocol CutEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'oncut'.
    ///
    /// ```html
    /// <tag oncut="" />
    /// ```
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

/// The protocol provides the element with the onpaste handler.
public protocol PasteEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'onpaste'.
    ///
    /// ```html
    /// <tag onpaste="" />
    /// ```
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

/// The protocol provides the element with the onabort handler.
public protocol AbortEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'onabort'.
    ///
    /// ```html
    /// <tag onabort="" />
    /// ```
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

/// The protocol provides the element with the oncanplay handler.
public protocol CanPlayEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'oncanplay'.
    ///
    /// ```html
    /// <tag oncanplay="" />
    /// ```
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

/// The protocol provides the element with the oncanplaythrough handler.
public protocol CanPlayThroughEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'oncanplaythrough'.
    ///
    /// ```html
    /// <tag oncanplaythrough="" />
    /// ```
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

/// The protocol provides the element with the oncuechange handler.
public protocol CueChangeEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'oncuechange'.
    ///
    /// ```html
    /// <tag oncuechange="" />
    /// ```
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

/// The protocol provides the element with the ondurationchange handler.
public protocol DurationChangeEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'ondurationchange'.
    ///
    /// ```html
    /// <tag ondurationchange="" />
    /// ```
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

/// The protocol provides the element with the onemptied handler.
public protocol EmptiedEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'onemptied'.
    ///
    /// ```html
    /// <tag onemptied="" />
    /// ```
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

/// The protocol provides the element with the onended handler.
public protocol EndedEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'onended'.
    ///
    /// ```html
    /// <tag onended="" />
    /// ```
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

/// The protocol provides the element with the onloadeddata handler.
public protocol LoadedDataEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'onloadeddata'.
    ///
    /// ```html
    /// <tag onloadeddata="" />
    /// ```
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

/// The protocol provides the element with the onloadedmetadata handler.
public protocol LoadedMetaDataEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'onloadedmetadata'.
    ///
    /// ```html
    /// <tag onloadedmetadata="" />
    /// ```
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

/// The protocol provides the element with the onloadstart handler.
public protocol LoadStartEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'onloadstart'.
    ///
    /// ```html
    /// <tag onloadstart="" />
    /// ```
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

/// The protocol provides the element with the onpause handler.
public protocol PauseEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'onpause'.
    ///
    /// ```html
    /// <tag onpause="" />
    /// ```
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

/// The protocol provides the element with the onplay handler.
public protocol PlayEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'onplay'.
    ///
    /// ```html
    /// <tag onplay="" />
    /// ```
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

/// The protocol provides the element with the onplaying handler.
public protocol PlayingEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'onplaying'.
    ///
    /// ```html
    /// <tag onplaying="" />
    /// ```
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

/// The protocol provides the element with the onprogress handler.
public protocol ProgressEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'onprogress'.
    ///
    /// ```html
    /// <tag onprogress="" />
    /// ```
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

/// The protocol provides the element with the onratechange handler.
public protocol RateChangeEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'onratechange'.
    ///
    /// ```html
    /// <tag onratechange="" />
    /// ```
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

/// The protocol provides the element with the onseeked handler.
public protocol SeekedEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'onseeked'.
    ///
    /// ```html
    /// <tag onseeked="" />
    /// ```
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

/// The protocol provides the element with the onseeking handler.
public protocol SeekingEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'onseeking'.
    ///
    /// ```html
    /// <tag onseeking="" />
    /// ```
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

/// The protocol provides the element with the onstalled handler.
public protocol StalledEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'onstalled'.
    ///
    /// ```html
    /// <tag onstalled="" />
    /// ```
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

/// The protocol provides the element with the onsuspend handler.
public protocol SuspendEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'onsuspend'.
    ///
    /// ```html
    /// <tag onsuspend="" />
    /// ```
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

/// The protocol provides the element with the ontimeupdate handler.
public protocol TimeUpdateEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'ontimeupdate'.
    ///
    /// ```html
    /// <tag ontimeupdate="" />
    /// ```
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

/// The protocol provides the element with the onvolumechange handler.
public protocol VolumeChangeEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'onvolumechange'.
    ///
    /// ```html
    /// <tag onvolumechange="" />
    /// ```
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

/// The protocol provides the element with the onwaiting handler.
public protocol WaitingEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'onwaiting'.
    ///
    /// ```html
    /// <tag onwaiting="" />
    /// ```
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

/// The protocol provides the element with the ontoggle handler.
public protocol ToggleEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'ontoggle'.
    ///
    /// ```html
    /// <tag ontoggle="" />
    /// ```
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
