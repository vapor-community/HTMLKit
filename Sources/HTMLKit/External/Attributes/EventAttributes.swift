/*
 Abstract:
 The file contains the protocols for the event html-attributes.
 
 Note:
 If you about to add something to the file, stick to the official documentation to keep the code consistent.
 */

import OrderedCollections

/// The alias combines the global attributes of the event attributes.
public typealias GlobalEventAttributes = ClipboardEventAttribute & DragEventAttribute & WheelEventAttribute & KeyboardEventAttribute & MouseEventAttribute

/// The protocol provides the element with event handler.
public protocol WindowEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'on'.
    ///
    /// ```html
    /// <tag on*="" />
    /// ```
    func on(event: Events.Window, _ value: String) -> Self
}

/// The protocol provides the element with event handler.
public protocol FocusEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'on'.
    ///
    /// ```html
    /// <tag on*="" />
    /// ```
    func on(event: Events.Focus, _ value: String) -> Self
}

/// The protocol provides the element with event handler.
public protocol PointerEventAttribute: AnyAttribute {

    /// The function represents the html-attribute 'on'.
    ///
    /// ```html
    /// <tag on*="" />
    /// ```
    func on(event: Events.Pointer, _ value: String) -> Self
}

/// The protocol provides the element with event handler.
public protocol MouseEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'on'.
    ///
    /// ```html
    /// <tag on*="" />
    /// ```
    func on(event: Events.Mouse, _ value: String) -> Self
}

/// The protocol provides the element with event handler.
public protocol WheelEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'on'.
    ///
    /// ```html
    /// <tag on*="" />
    /// ```
    func on(event: Events.Wheel, _ value: String) -> Self
}

/// The protocol provides the element with event handler.
public protocol InputEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'on'.
    ///
    /// ```html
    /// <tag on*="" />
    /// ```
    func on(event: Events.Input, _ value: String) -> Self
}

/// The protocol provides the element with event handler.
public protocol KeyboardEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'on'.
    ///
    /// ```html
    /// <tag on*="" />
    /// ```
    func on(event: Events.Keyboard, _ value: String) -> Self
}

/// The protocol provides the element with event handler.
public protocol DragEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'on'.
    ///
    /// ```html
    /// <tag on*="" />
    /// ```
    func on(event: Events.Drag, _ value: String) -> Self
}

/// The protocol provides the element with event handler.
public protocol ClipboardEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'on'.
    ///
    /// ```html
    /// <tag on*="" />
    /// ```
    func on(event: Events.Clipboard, _ value: String) -> Self
}

/// The protocol provides the element with event handler.
public protocol SelectionEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'on'.
    ///
    /// ```html
    /// <tag on*="" />
    /// ```
    func on(event: Events.Selection, _ value: String) -> Self
}

/// The protocol provides the element with event handler.r.
public protocol MediaEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'on'.
    ///
    /// ```html
    /// <tag on*="" />
    /// ```
    func on(event: Events.Media, _ value: String) -> Self
}

/// The protocol provides the element with event handler.
public protocol FormEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'on'.
    ///
    /// ```html
    /// <tag on*="" />
    /// ```
    func on(event: Events.Form, _ value: String) -> Self
}

/// The protocol provides the element with event handler.
public protocol DetailEventAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'on'.
    ///
    /// ```html
    /// <tag on*="" />
    /// ```
    func on(event: Events.Detail, _ value: String) -> Self
}
