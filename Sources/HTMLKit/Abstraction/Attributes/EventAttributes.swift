import OrderedCollections

/// The alias combines the global attributes of the event attributes.
@_documentation(visibility: internal)
public typealias GlobalEventAttributes = ClipboardEventAttribute & DragEventAttribute & WheelEventAttribute & KeyboardEventAttribute & MouseEventAttribute

/// The protocol provides the element with event handler.
@_documentation(visibility: internal)
public protocol WindowEventAttribute: Attribute {
    
    /// The function represents the html-attribute 'on'.
    ///
    /// ```html
    /// <tag on*="" />
    /// ```
    func on(event: Events.Window, _ value: String) -> Self
}

/// The protocol provides the element with event handler.
@_documentation(visibility: internal)
public protocol FocusEventAttribute: Attribute {
    
    /// The function represents the html-attribute 'on'.
    ///
    /// ```html
    /// <tag on*="" />
    /// ```
    func on(event: Events.Focus, _ value: String) -> Self
}

/// The protocol provides the element with event handler.
@_documentation(visibility: internal)
public protocol PointerEventAttribute: Attribute {

    /// The function represents the html-attribute 'on'.
    ///
    /// ```html
    /// <tag on*="" />
    /// ```
    func on(event: Events.Pointer, _ value: String) -> Self
}

/// The protocol provides the element with event handler.
@_documentation(visibility: internal)
public protocol MouseEventAttribute: Attribute {
    
    /// The function represents the html-attribute 'on'.
    ///
    /// ```html
    /// <tag on*="" />
    /// ```
    func on(event: Events.Mouse, _ value: String) -> Self
}

/// The protocol provides the element with event handler.
@_documentation(visibility: internal)
public protocol WheelEventAttribute: Attribute {
    
    /// The function represents the html-attribute 'on'.
    ///
    /// ```html
    /// <tag on*="" />
    /// ```
    func on(event: Events.Wheel, _ value: String) -> Self
}

/// The protocol provides the element with event handler.
@_documentation(visibility: internal)
public protocol InputEventAttribute: Attribute {
    
    /// The function represents the html-attribute 'on'.
    ///
    /// ```html
    /// <tag on*="" />
    /// ```
    func on(event: Events.Input, _ value: String) -> Self
}

/// The protocol provides the element with event handler.
@_documentation(visibility: internal)
public protocol KeyboardEventAttribute: Attribute {
    
    /// The function represents the html-attribute 'on'.
    ///
    /// ```html
    /// <tag on*="" />
    /// ```
    func on(event: Events.Keyboard, _ value: String) -> Self
}

/// The protocol provides the element with event handler.
@_documentation(visibility: internal)
public protocol DragEventAttribute: Attribute {
    
    /// The function represents the html-attribute 'on'.
    ///
    /// ```html
    /// <tag on*="" />
    /// ```
    func on(event: Events.Drag, _ value: String) -> Self
}

/// The protocol provides the element with event handler.
@_documentation(visibility: internal)
public protocol ClipboardEventAttribute: Attribute {
    
    /// The function represents the html-attribute 'on'.
    ///
    /// ```html
    /// <tag on*="" />
    /// ```
    func on(event: Events.Clipboard, _ value: String) -> Self
}

/// The protocol provides the element with event handler.
@_documentation(visibility: internal)
public protocol SelectionEventAttribute: Attribute {
    
    /// The function represents the html-attribute 'on'.
    ///
    /// ```html
    /// <tag on*="" />
    /// ```
    func on(event: Events.Selection, _ value: String) -> Self
}

/// The protocol provides the element with event handler.r.
@_documentation(visibility: internal)
public protocol MediaEventAttribute: Attribute {
    
    /// The function represents the html-attribute 'on'.
    ///
    /// ```html
    /// <tag on*="" />
    /// ```
    func on(event: Events.Media, _ value: String) -> Self
}

/// The protocol provides the element with event handler.
@_documentation(visibility: internal)
public protocol FormEventAttribute: Attribute {
    
    /// The function represents the html-attribute 'on'.
    ///
    /// ```html
    /// <tag on*="" />
    /// ```
    func on(event: Events.Form, _ value: String) -> Self
}

/// The protocol provides the element with event handler.
@_documentation(visibility: internal)
public protocol DetailEventAttribute: Attribute {
    
    /// The function represents the html-attribute 'on'.
    ///
    /// ```html
    /// <tag on*="" />
    /// ```
    func on(event: Events.Detail, _ value: String) -> Self
}
