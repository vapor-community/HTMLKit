/*
 Abstract:
 The file contains the vector elements. The html-element 'svg' only allows these elements to be its descendants.
 
 Authors:
 - Mats Moll (https://github.com/matsmoll)
 
 Contributors:
 - Mattes Mohr (https://github.com/mattesmohr)
 
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
public struct Circle: ContentNode, VectorElement {    

    internal var name: String { "circle" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Circle: GlobalVectorAttributes, CenterPointAttribute, RadiusAttribute {
  
    public func id(_ value: String) -> Circle {
        return self.mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Circle {
        return self.mutate(id: value.rawValue)
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
    
    public func centerPoint(_ point: Point) -> Circle {
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
    
    public func strokeLineCap(_ type: Linecap) -> Circle {
        return self.mutate(strokelinecap: type.rawValue)
    }
    
    public func strokeLineJoin(_ type: Linejoin) -> Circle {
        return self.mutate(strokelinejoin: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Circle {
        return self.mutate(key: key, value: value)
    }
}

extension Circle: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

/// The element represents ...
///
/// ```html
/// <rect></rect>
/// ```
public struct Rectangle: ContentNode, VectorElement {

    internal var name: String { "rect" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Rectangle: GlobalVectorAttributes, WidthAttribute, HeightAttribute, RadiusPointAttribute {
    
    public func id(_ value: String) -> Rectangle {
        return self.mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Rectangle {
        return self.mutate(id: value.rawValue)
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
    
    public func radiusPoint(_ point: Point) -> Rectangle {
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
    
    public func strokeLineCap(_ type: Linecap) -> Rectangle {
        return self.mutate(strokelinecap: type.rawValue)
    }
    
    public func strokeLineJoin(_ type: Linejoin) -> Rectangle {
        return self.mutate(strokelinejoin: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Rectangle {
        return self.mutate(key: key, value: value)
    }
}

extension Rectangle: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

/// The element represents a comment output.
///
/// ```html
/// <ellipse></ellipse>
/// ```
public struct Ellipse: ContentNode, VectorElement {

    internal var name: String { "ellipse" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Ellipse: GlobalVectorAttributes, CenterPointAttribute, RadiusPointAttribute {
    
    public func id(_ value: String) -> Ellipse {
        return self.mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Ellipse {
        return self.mutate(id: value.rawValue)
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
    
    public func centerPoint(_ point: Point) -> Ellipse {
        return self.mutate(centerpoint: point)
    }
    
    public func radiusPoint(_ point: Point) -> Ellipse {
            return self.mutate(radius: point)
    }
    
    public func fillOpacity(_ value: Double) -> Ellipse {
        return self.mutate(fillopacity: value)
    }
    
    public func strokeOpacity(_ value: Double) -> Ellipse {
        return self.mutate(strokeopacity: value)
    }
    
    public func strokeLineCap(_ type: Linecap) -> Ellipse {
        return self.mutate(strokelinecap: type.rawValue)
    }
    
    public func strokeLineJoin(_ type: Linejoin) -> Ellipse {
        return self.mutate(strokelinejoin: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Ellipse {
        return self.mutate(key: key, value: value)
    }
}

extension Ellipse: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

/// The element represents ...
///
/// ```html
/// <line></line>
/// ```
public struct Line: ContentNode, VectorElement {

    internal var name: String { "line" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Line: GlobalVectorAttributes {
    
    public func id(_ value: String) -> Line {
        return self.mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Line {
        return self.mutate(id: value.rawValue)
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
    
    public func strokeLineCap(_ type: Linecap) -> Line {
        return self.mutate(strokelinecap: type.rawValue)
    }
    
    public func strokeLineJoin(_ type: Linejoin) -> Line {
        return self.mutate(strokelinejoin: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Line {
        return self.mutate(key: key, value: value)
    }
}

extension Line: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

/// The element represents a comment output.
///
/// ```html
/// <polygon></polygon>
/// ```
public struct Polygon: ContentNode, VectorElement {

    internal var name: String { "polygon" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Polygon: GlobalVectorAttributes {
    
    public func id(_ value: String) -> Polygon {
        return self.mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Polygon {
        return self.mutate(id: value.rawValue)
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
    
    public func strokeLineCap(_ type: Linecap) -> Polygon {
        return self.mutate(strokelinecap: type.rawValue)
    }
    
    public func strokeLineJoin(_ type: Linejoin) -> Polygon {
        return self.mutate(strokelinejoin: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Polygon {
        return self.mutate(key: key, value: value)
    }
}

extension Polygon: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

/// The element represents ...
///
/// ```html
/// <polyline></polyline>
/// ```
public struct Polyline: ContentNode, VectorElement {

    internal var name: String { "polyline" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Polyline: GlobalVectorAttributes {
    
    public func id(_ value: String) -> Polyline {
        return self.mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Polyline {
        return self.mutate(id: value.rawValue)
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
    
    public func strokeLineCap(_ type: Linecap) -> Polyline {
        return self.mutate(strokelinecap: type.rawValue)
    }
    
    public func strokeLineJoin(_ type: Linejoin) -> Polyline {
        return self.mutate(strokelinejoin: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Polyline {
        return self.mutate(key: key, value: value)
    }
}

extension Polyline: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

/// The element represents ...
///
/// ```html
/// <path></path>
/// ```
public struct Path: ContentNode, VectorElement {

    internal var name: String { "path" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Path: GlobalVectorAttributes {
    
    public func id(_ value: String) -> Path {
        return self.mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Path {
        return self.mutate(id: value.rawValue)
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
    
    public func strokeLineCap(_ type: Linecap) -> Path {
        return self.mutate(strokelinecap: type.rawValue)
    }
    
    public func strokeLineJoin(_ type: Linejoin) -> Path {
        return self.mutate(strokelinejoin: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Path {
        return self.mutate(key: key, value: value)
    }
}

extension Path: DrawAttribute {

    public func draw(_ value: String) -> Path {
        return self.mutate(draw: value)
    }

}

extension Path: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

/// The element represents ...
///
/// ```html
/// <g></g>
/// ```
public struct Group: ContentNode, VectorElement {

    internal var name: String { "g" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }

    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Group: GlobalVectorAttributes {

    public func id(_ value: String) -> Self {
        return self.mutate(id: value)
    }

    public func id(_ value: TemplateValue<String>) -> Self {
        return self.mutate(id: value.rawValue)
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

    public func strokeLineCap(_ type: Linecap) -> Self {
        return self.mutate(strokelinecap: type.rawValue)
    }

    public func strokeLineJoin(_ type: Linejoin) -> Self {
        return self.mutate(strokelinejoin: type.rawValue)
    }

    public func custom(key: String, value: Any) -> Self {
        return self.mutate(key: key, value: value)
    }
}

extension Group: DrawAttribute {

    public func draw(_ value: String) -> Self {
        return self.mutate(draw: value)
    }

}

extension Group: AnyContent {

    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }

    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

/// The element represents ...
///
/// ```html
/// <use></use>
/// ```
public struct Use: ContentNode, VectorElement {

    internal var name: String { "use" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [AnyContent]

    public init(@ContentBuilder<AnyContent> content: () -> [AnyContent]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [AnyContent]) {
        self.attributes = attributes
        self.content = content
    }
}

extension Use: GlobalVectorAttributes, ReferenceAttribute, WidthAttribute, HeightAttribute {

    public func id(_ value: String) -> Use {
        return self.mutate(id: value)
    }
    
    public func id(_ value: TemplateValue<String>) -> Use {
        return self.mutate(id: value.rawValue)
    }
    
    public func tabIndex(_ value: Int) -> Use {
        return self.mutate(tabindex: value)
    }
    
    public func reference(_ value: String) -> Use {
        return self.mutate(href: value)
    }
    
    public func reference(_ value: TemplateValue<String>) -> Use {
        return self.mutate(href: value.rawValue)
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
    
    public func strokeLineCap(_ type: Linecap) -> Use {
        return self.mutate(strokelinecap: type.rawValue)
    }
    
    public func strokeLineJoin(_ type: Linejoin) -> Use {
        return self.mutate(strokelinejoin: type.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Use {
        return self.mutate(key: key, value: value)
    }
}

extension Use: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}
