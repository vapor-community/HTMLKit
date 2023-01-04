/*
 Abstract:
 The file contains the default definition of different elements.
 */

public typealias GlobalElement = BodyElement & DescriptionElement & FigureElement & FormElement & BasicElement & HeadElement & ListElement & MapElement & MediaElement & ObjectElement & RubyElement & TableElement & HtmlElement & InputElement & VectorElement

/// The protocol defines a body element.
public protocol BodyElement: Element {
}

/// The protocol defines a description element.
public protocol DescriptionElement: Element {
}

/// The protocol defines a figure element.
public protocol FigureElement: Element {
}

/// The protocol defines a form element.
public protocol FormElement: Element {
}

/// The protocol defines a basic element.
public protocol BasicElement: Element {
}

/// The protocol defines a head element.
public protocol HeadElement: Element {
}

/// The protocol defines a input element./
public protocol InputElement: Element {
}

/// The protocol defines a list element.
public protocol ListElement: Element {
}

/// The protocol defines a map element.
public protocol MapElement: Element {
}

/// The protocol defines a media element.
public protocol MediaElement: Element {
}

/// The protocol defines a object element.
public protocol ObjectElement: Element {
}

/// The protocol defines a ruby element.
public protocol RubyElement: Element {
}

/// The protocol defines a table element.
public protocol TableElement: Element {
}

/// The protocol defines a html element.
public protocol HtmlElement: Element {
}

/// The protocol defines a vector element.
public protocol VectorElement: Element {
}
