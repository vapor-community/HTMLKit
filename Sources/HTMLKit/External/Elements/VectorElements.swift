import OrderedCollections

/// ## Description
/// The alias points to Rectangle.
///
public typealias Rect = Rectangle

/// ## Description
/// The element represents ...
///
/// ## References
/// https://html.spec.whatwg.org/#the-table-element
///
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
    
    public func tabIndex(_ value: String) -> Circle {
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
}

extension Circle: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

/// ## Description
/// The element represents ...
///
/// ## References
/// https://html.spec.whatwg.org/#the-table-element
///
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
    
    public func tabIndex(_ value: String) -> Rectangle {
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
}

extension Rectangle: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

/// ## Description
/// The element represents a comment output.
///
/// ## References
/// https://html.spec.whatwg.org/#the-table-element
///
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
    
    public func tabIndex(_ value: String) -> Ellipse {
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
}

extension Ellipse: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

/// ## Description
/// The element represents ...
///
/// ## References
/// https://html.spec.whatwg.org/#the-table-element
///
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
    
    public func tabIndex(_ value: String) -> Line {
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
}

extension Line: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

/// ## Description
/// The element represents a comment output.
///
/// ## References
/// https://html.spec.whatwg.org/#the-table-element
///
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
    
    public func tabIndex(_ value: String) -> Polygon {
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
}

extension Polygon: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

/// ## Description
/// The element represents ...
///
/// ## References
/// https://html.spec.whatwg.org/#the-table-element
///
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
    
    public func tabIndex(_ value: String) -> Polyline {
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
}

extension Polyline: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

/// ## Description
/// The element represents ...
///
/// ## References
/// https://html.spec.whatwg.org/#the-table-element
///
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
    
    public func tabIndex(_ value: String) -> Path {
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
}

extension Path: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}

/// ## Description
/// The element represents ...
///
/// ## References
/// https://html.spec.whatwg.org/#the-table-element
///
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
    
    public func tabIndex(_ value: String) -> Use {
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
}

extension Use: AnyContent {
    
    public func prerender(_ formula: Renderer.Formula) throws {
        try self.build(formula)
    }
    
    public func render<T>(with manager: Renderer.ContextManager<T>) throws -> String {
        try self.build(with: manager)
    }
}
