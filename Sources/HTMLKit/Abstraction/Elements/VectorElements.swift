/*
 Abstract:
 The file contains the vector elements. The html-element 'svg' only allows these elements to be its descendants.

 Note:
 If you about to add something to the file, stick to the official documentation to keep the code consistent.
 */

import OrderedCollections

/// The alias for the element Rectangle.
///
/// Rect is the official tag and can be used instead of Rectangle.
///
/// ```html
/// <rect></rect>
/// ```
public typealias Rect = Rectangle

/// The element represents a svg basic shape, used to draw circles.
///
/// ```html
/// <circle></circle>
/// ```
public struct Circle: ContentElement {

    internal var name: String { "circle" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [Content]

    public init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [Content]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Circle: GlobalVectorAttributes, CenterPointAttribute, RadiusAttribute {
  
    public func id(_ value: String) -> Circle {
        return self.mutate(id: value)
    }
    
    public func tabIndex(_ value: Int) -> Circle {
        return self.mutate(tabindex: value)
    }
    
    public func `class`(_ value: String) -> Circle {
        return self.mutate(class: value)
    }
    
    public func style(_ value: String) -> Circle {
        return self.mutate(style: value)
    }
    
    public func fill(_ value: String) -> Circle {
        return self.mutate(fill: value)
    }
    
    public func stroke(_ value: String) -> Circle {
        return self.mutate(stroke: value)
    }
    
    public func strokeWidth(_ size: Int) -> Circle {
        return self.mutate(strokewidth: size)
    }
    
    public func centerPoint(_ point: Geometrics.Point) -> Circle {
        return self.mutate(centerpoint: point)
    }
    
    public func radius(_ size: Int) -> Circle {
        return self.mutate(radius: size)
    }
    
    public func fillOpacity(_ value: Double) -> Circle {
        return self.mutate(fillopacity: value)
    }
    
    public func strokeOpacity(_ value: Double) -> Circle {
        return self.mutate(strokeopacity: value)
    }
    
    public func strokeLineCap(_ value: Values.Linecap) -> Circle {
        return self.mutate(strokelinecap: value.rawValue)
    }
    
    public func strokeLineJoin(_ value: Values.Linejoin) -> Circle {
        return self.mutate(strokelinejoin: value.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Circle {
        return self.mutate(key: key, value: value)
    }
}

/// The element represents ...
///
/// ```html
/// <rect></rect>
/// ```
public struct Rectangle: ContentElement {

    internal var name: String { "rect" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [Content]

    public init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [Content]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Rectangle: GlobalVectorAttributes, WidthAttribute, HeightAttribute, RadiusPointAttribute {
    
    public func id(_ value: String) -> Rectangle {
        return self.mutate(id: value)
    }
    
    public func tabIndex(_ value: Int) -> Rectangle {
        return self.mutate(tabindex: value)
    }
    
    public func `class`(_ value: String) -> Rectangle {
        return self.mutate(class: value)
    }
    
    public func style(_ value: String) -> Rectangle {
        return self.mutate(style: value)
    }
    
    public func fill(_ value: String) -> Rectangle {
        return self.mutate(fill: value)
    }
    
    public func stroke(_ value: String) -> Rectangle {
        return self.mutate(stroke: value)
    }
    
    public func strokeWidth(_ size: Int) -> Rectangle {
        return self.mutate(strokewidth: size)
    }
    
    public func radiusPoint(_ point: Geometrics.Point) -> Rectangle {
        return self.mutate(radius: point)
    }
    
    public func width(_ size: Int) -> Rectangle {
        return self.mutate(width: size)
    }
    
    public func height(_ size: Int) -> Rectangle {
        return self.mutate(height: size)
    }
    
    public func fillOpacity(_ value: Double) -> Rectangle {
        return self.mutate(fillopacity: value)
    }
    
    public func strokeOpacity(_ value: Double) -> Rectangle {
        return self.mutate(strokeopacity: value)
    }
    
    public func strokeLineCap(_ value: Values.Linecap) -> Rectangle {
        return self.mutate(strokelinecap: value.rawValue)
    }
    
    public func strokeLineJoin(_ value: Values.Linejoin) -> Rectangle {
        return self.mutate(strokelinejoin: value.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Rectangle {
        return self.mutate(key: key, value: value)
    }
}

/// The element represents a comment output.
///
/// ```html
/// <ellipse></ellipse>
/// ```
public struct Ellipse: ContentElement {

    internal var name: String { "ellipse" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [Content]

    public init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [Content]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Ellipse: GlobalVectorAttributes, CenterPointAttribute, RadiusPointAttribute {
    
    public func id(_ value: String) -> Ellipse {
        return self.mutate(id: value)
    }
    
    public func tabIndex(_ value: Int) -> Ellipse {
        return self.mutate(tabindex: value)
    }
    
    public func `class`(_ value: String) -> Ellipse {
        return self.mutate(class: value)
    }
    
    public func style(_ value: String) -> Ellipse {
        return self.mutate(style: value)
    }
    
    public func fill(_ value: String) -> Ellipse {
        return self.mutate(fill: value)
    }
    
    public func stroke(_ value: String) -> Ellipse {
        return self.mutate(stroke: value)
    }
    
    public func strokeWidth(_ size: Int) -> Ellipse {
        return self.mutate(strokewidth: size)
    }
    
    public func centerPoint(_ point: Geometrics.Point) -> Ellipse {
        return self.mutate(centerpoint: point)
    }
    
    public func radiusPoint(_ point: Geometrics.Point) -> Ellipse {
            return self.mutate(radius: point)
    }
    
    public func fillOpacity(_ value: Double) -> Ellipse {
        return self.mutate(fillopacity: value)
    }
    
    public func strokeOpacity(_ value: Double) -> Ellipse {
        return self.mutate(strokeopacity: value)
    }
    
    public func strokeLineCap(_ value: Values.Linecap) -> Ellipse {
        return self.mutate(strokelinecap: value.rawValue)
    }
    
    public func strokeLineJoin(_ value: Values.Linejoin) -> Ellipse {
        return self.mutate(strokelinejoin: value.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Ellipse {
        return self.mutate(key: key, value: value)
    }
}

/// The element represents ...
///
/// ```html
/// <line></line>
/// ```
public struct Line: ContentElement {

    internal var name: String { "line" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [Content]

    public init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [Content]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Line: GlobalVectorAttributes {
    
    public func id(_ value: String) -> Line {
        return self.mutate(id: value)
    }
    
    public func tabIndex(_ value: Int) -> Line {
        return self.mutate(tabindex: value)
    }
    
    public func `class`(_ value: String) -> Line {
        return self.mutate(class: value)
    }
    
    public func style(_ value: String) -> Line {
        return self.mutate(style: value)
    }
    
    public func fill(_ value: String) -> Line {
        return self.mutate(fill: value)
    }
    
    public func stroke(_ value: String) -> Line {
        return self.mutate(stroke: value)
    }
    
    public func strokeWidth(_ size: Int) -> Line {
        return self.mutate(strokewidth: size)
    }
    
    public func fillOpacity(_ value: Double) -> Line {
        return self.mutate(fillopacity: value)
    }
    
    public func strokeOpacity(_ value: Double) -> Line {
        return self.mutate(strokeopacity: value)
    }
    
    public func strokeLineCap(_ value: Values.Linecap) -> Line {
        return self.mutate(strokelinecap: value.rawValue)
    }
    
    public func strokeLineJoin(_ value: Values.Linejoin) -> Line {
        return self.mutate(strokelinejoin: value.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Line {
        return self.mutate(key: key, value: value)
    }
}

/// The element represents a comment output.
///
/// ```html
/// <polygon></polygon>
/// ```
public struct Polygon: ContentElement {

    internal var name: String { "polygon" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [Content]

    public init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [Content]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Polygon: GlobalVectorAttributes {
    
    public func id(_ value: String) -> Polygon {
        return self.mutate(id: value)
    }
    
    public func tabIndex(_ value: Int) -> Polygon {
        return self.mutate(tabindex: value)
    }
    
    public func `class`(_ value: String) -> Polygon {
        return self.mutate(class: value)
    }
    
    public func style(_ value: String) -> Polygon {
        return self.mutate(style: value)
    }
    
    public func fill(_ value: String) -> Polygon {
        return self.mutate(fill: value)
    }
    
    public func stroke(_ value: String) -> Polygon {
        return self.mutate(stroke: value)
    }
    
    public func strokeWidth(_ size: Int) -> Polygon {
        return self.mutate(strokewidth: size)
    }
    
    public func fillOpacity(_ value: Double) -> Polygon {
        return self.mutate(fillopacity: value)
    }
    
    public func strokeOpacity(_ value: Double) -> Polygon {
        return self.mutate(strokeopacity: value)
    }
    
    public func strokeLineCap(_ value: Values.Linecap) -> Polygon {
        return self.mutate(strokelinecap: value.rawValue)
    }
    
    public func strokeLineJoin(_ value: Values.Linejoin) -> Polygon {
        return self.mutate(strokelinejoin: value.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Polygon {
        return self.mutate(key: key, value: value)
    }
}

/// The element represents ...
///
/// ```html
/// <polyline></polyline>
/// ```
public struct Polyline: ContentElement {

    internal var name: String { "polyline" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [Content]

    public init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [Content]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Polyline: GlobalVectorAttributes {
    
    public func id(_ value: String) -> Polyline {
        return self.mutate(id: value)
    }
    
    public func tabIndex(_ value: Int) -> Polyline {
        return self.mutate(tabindex: value)
    }
    
    public func `class`(_ value: String) -> Polyline {
        return self.mutate(class: value)
    }
    
    public func style(_ value: String) -> Polyline {
        return self.mutate(style: value)
    }
    
    public func fill(_ value: String) -> Polyline {
        return self.mutate(fill: value)
    }
    
    public func stroke(_ value: String) -> Polyline {
        return self.mutate(stroke: value)
    }
    
    public func strokeWidth(_ size: Int) -> Polyline {
        return self.mutate(strokewidth: size)
    }
    
    public func fillOpacity(_ value: Double) -> Polyline {
        return self.mutate(fillopacity: value)
    }
    
    public func strokeOpacity(_ value: Double) -> Polyline {
        return self.mutate(strokeopacity: value)
    }
    
    public func strokeLineCap(_ value: Values.Linecap) -> Polyline {
        return self.mutate(strokelinecap: value.rawValue)
    }
    
    public func strokeLineJoin(_ value: Values.Linejoin) -> Polyline {
        return self.mutate(strokelinejoin: value.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Polyline {
        return self.mutate(key: key, value: value)
    }
}

/// The element represents ...
///
/// ```html
/// <path></path>
/// ```
public struct Path: ContentElement {

    internal var name: String { "path" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [Content]

    public init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [Content]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Path: GlobalVectorAttributes, DrawAttribute {
    
    public func id(_ value: String) -> Path {
        return self.mutate(id: value)
    }
    
    public func tabIndex(_ value: Int) -> Path {
        return self.mutate(tabindex: value)
    }
    
    public func `class`(_ value: String) -> Path {
        return self.mutate(class: value)
    }
    
    public func style(_ value: String) -> Path {
        return self.mutate(style: value)
    }

    public func fill(_ value: String) -> Path {
        return self.mutate(fill: value)
    }
    
    public func stroke(_ value: String) -> Path {
        return self.mutate(stroke: value)
    }
    
    public func strokeWidth(_ size: Int) -> Path {
        return self.mutate(strokewidth: size)
    }
    
    public func fillOpacity(_ value: Double) -> Path {
        return self.mutate(fillopacity: value)
    }
    
    public func strokeOpacity(_ value: Double) -> Path {
        return self.mutate(strokeopacity: value)
    }
    
    public func strokeLineCap(_ value: Values.Linecap) -> Path {
        return self.mutate(strokelinecap: value.rawValue)
    }
    
    public func strokeLineJoin(_ value: Values.Linejoin) -> Path {
        return self.mutate(strokelinejoin: value.rawValue)
    }
    
    public func draw(_ value: String) -> Path {
        return self.mutate(draw: value)
    }
    
    public func custom(key: String, value: Any) -> Path {
        return self.mutate(key: key, value: value)
    }
}

/// The element represents ...
///
/// ```html
/// <g></g>
/// ```
public struct Group: ContentElement {

    internal var name: String { "g" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [Content]

    public init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }

    internal init(attributes: OrderedDictionary<String, Any>?, content: [Content]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Group: GlobalVectorAttributes {

    public func id(_ value: String) -> Self {
        return self.mutate(id: value)
    }

    public func tabIndex(_ value: Int) -> Self {
        return self.mutate(tabindex: value)
    }

    public func `class`(_ value: String) -> Self {
        return self.mutate(class: value)
    }

    public func style(_ value: String) -> Self {
        return self.mutate(style: value)
    }

    public func fill(_ value: String) -> Self {
        return self.mutate(fill: value)
    }

    public func stroke(_ value: String) -> Self {
        return self.mutate(stroke: value)
    }

    public func strokeWidth(_ size: Int) -> Self {
        return self.mutate(strokewidth: size)
    }

    public func fillOpacity(_ value: Double) -> Self {
        return self.mutate(fillopacity: value)
    }

    public func strokeOpacity(_ value: Double) -> Self {
        return self.mutate(strokeopacity: value)
    }

    public func strokeLineCap(_ value: Values.Linecap) -> Self {
        return self.mutate(strokelinecap: value.rawValue)
    }

    public func strokeLineJoin(_ value: Values.Linejoin) -> Self {
        return self.mutate(strokelinejoin: value.rawValue)
    }

    public func custom(key: String, value: Any) -> Self {
        return self.mutate(key: key, value: value)
    }
}

/// The element represents ...
///
/// ```html
/// <use></use>
/// ```
public struct Use: ContentElement {

    internal var name: String { "use" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [Content]

    public init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [Content]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Use: GlobalVectorAttributes, ReferenceAttribute, WidthAttribute, HeightAttribute {

    public func id(_ value: String) -> Use {
        return self.mutate(id: value)
    }
    
    public func tabIndex(_ value: Int) -> Use {
        return self.mutate(tabindex: value)
    }
    
    public func reference(_ value: String) -> Use {
        return self.mutate(href: value)
    }
    
    public func width(_ size: Int) -> Use {
        return self.mutate(width: size)
    }
    
    public func height(_ size: Int) -> Use {
        return self.mutate(height: size)
    }
    
    public func `class`(_ value: String) -> Use {
        return self.mutate(class: value)
    }
    
    public func style(_ value: String) -> Use {
        return self.mutate(style: value)
    }
    
    public func fill(_ value: String) -> Use {
        return self.mutate(fill: value)
    }
    
    public func stroke(_ value: String) -> Use {
        return self.mutate(stroke: value)
    }
    
    public func strokeWidth(_ size: Int) -> Use {
        return self.mutate(strokewidth: size)
    }
    
    public func fillOpacity(_ value: Double) -> Use {
        return self.mutate(fillopacity: value)
    }
    
    public func strokeOpacity(_ value: Double) -> Use {
        return self.mutate(strokeopacity: value)
    }
    
    public func strokeLineCap(_ value: Values.Linecap) -> Use {
        return self.mutate(strokelinecap: value.rawValue)
    }
    
    public func strokeLineJoin(_ value: Values.Linejoin) -> Use {
        return self.mutate(strokelinejoin: value.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Use {
        return self.mutate(key: key, value: value)
    }
}
