/*
 Abstract:
 The file contains the element definition.
 
 Authors:
 - Mats Moll (https://github.com/matsmoll)
 
 Contributors:
 - Mattes Mohr (https://github.com/mattesmohr)
 
 Note:
 If you about to add something to the file, stick to the official documentation to keep the code consistent.
 */

public typealias GlobalElement = BodyElement & DescriptionElement & FigureElement & FormElement & BasicElement & HeadElement & ListElement & MapElement & MediaElement & ObjectElement & RubyElement & TableElement & HtmlElement & InputElement

/// The protocol defines a body element.
public protocol BodyElement: AnyElement {
}

/// The protocol defines a description element.
public protocol DescriptionElement: AnyElement {
}

/// The protocol defines a figure element.
public protocol FigureElement: AnyElement {
}

/// The protocol defines a form element.
public protocol FormElement: AnyElement {
}

/// The protocol defines a basic element.
public protocol BasicElement: AnyElement {
}

/// The protocol defines a head element.
public protocol HeadElement: AnyElement {
}

/// The protocol defines a input element./
public protocol InputElement: AnyElement {
}

/// The protocol defines a list element.
public protocol ListElement: AnyElement {
}

/// The protocol defines a map element.
public protocol MapElement: AnyElement {
}

/// The protocol defines a media element.
public protocol MediaElement: AnyElement {
}

/// The protocol defines a object element.
public protocol ObjectElement: AnyElement {
}

/// The protocol defines a ruby element.
public protocol RubyElement: AnyElement {
}

/// The protocol defines a table element.
public protocol TableElement: AnyElement {
}

/// The protocol defines a html element.
public protocol HtmlElement: AnyElement {
}

/// The protocol defines a vector element.
public protocol VectorElement: AnyElement {
}
