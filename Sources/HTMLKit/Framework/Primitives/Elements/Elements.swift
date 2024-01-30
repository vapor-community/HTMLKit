/*
 Abstract:
 The file contains the default definition of different elements.
 */

@_documentation(visibility: internal)
public typealias GlobalElement = BodyElement & DescriptionElement & FigureElement & FormElement & BasicElement & HeadElement & ListElement & MapElement & MediaElement & ObjectElement & RubyElement & TableElement & HtmlElement & InputElement & VectorElement

/// The protocol defines a body element.
@_documentation(visibility: internal)
public protocol BodyElement: Element {
}

/// The protocol defines a description element.
@_documentation(visibility: internal)
public protocol DescriptionElement: Element {
}

/// The protocol defines a figure element.
@_documentation(visibility: internal)
public protocol FigureElement: Element {
}

/// The protocol defines a form element.
@_documentation(visibility: internal)
public protocol FormElement: Element {
}

/// The protocol defines a basic element.
@_documentation(visibility: internal)
public protocol BasicElement: Element {
}

/// The protocol defines a head element.
@_documentation(visibility: internal)
public protocol HeadElement: Element {
}

/// The protocol defines a input element./
@_documentation(visibility: internal)
public protocol InputElement: Element {
}

/// The protocol defines a list element.
@_documentation(visibility: internal)
public protocol ListElement: Element {
}

/// The protocol defines a map element.
@_documentation(visibility: internal)
public protocol MapElement: Element {
}

/// The protocol defines a media element.
@_documentation(visibility: internal)
public protocol MediaElement: Element {
}

/// The protocol defines a object element.
@_documentation(visibility: internal)
public protocol ObjectElement: Element {
}

/// The protocol defines a ruby element.
@_documentation(visibility: internal)
public protocol RubyElement: Element {
}

/// The protocol defines a table element.
@_documentation(visibility: internal)
public protocol TableElement: Element {
}

/// The protocol defines a html element.
@_documentation(visibility: internal)
public protocol HtmlElement: Element {
}

/// The protocol defines a vector element.
@_documentation(visibility: internal)
public protocol VectorElement: Element {
}
