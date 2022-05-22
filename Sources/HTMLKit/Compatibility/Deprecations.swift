/*
 Abstract:
 The file contains the former objects, wich got deprecated.
 
 Authors:
 - Mats Moll (https://github.com/matsmoll)
 
 Contributors:
 - Mattes Mohr (https://github.com/mattesmohr)
 
 Note:
 If you about to add something to the file, stick to the official documentation to keep the code consistent.
 */

@available(*, deprecated, renamed: "Renderer")
public class HTMLRenderer {}

@available(*, deprecated, renamed: "ContentBuilder")
public class HTMLBuilder {}

@available(*, deprecated, renamed: "AnyContent")
public protocol HTML {}

@available(*, deprecated, renamed: "AnyContent")
public protocol HTMLContent {}

@available(*, deprecated, renamed: "AnyContent")
public protocol Content {}

@available(*, deprecated, renamed: "Page")
public protocol HTMLTemplate {}

@available(*, deprecated, renamed: "View")
public protocol HTMLPage {}

@available(*, deprecated, renamed: "Component")
public protocol HTMLComponent {}

@available(*, deprecated, message: "Is no longer in the scope.")
public struct HTMLAttribute {}

@available(*, deprecated, renamed: "AnyNode")
public protocol HTMLNode {}

@available(*, deprecated, message: "Is no longer in the scope.")
public enum HTMLIdentifier {}

@available(*, deprecated, message: "Is no longer in the scope.")
public struct StringValue {}
