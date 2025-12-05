import OrderedCollections

/// The alias for the element ``Rectangle``.
@_documentation(visibility: internal)
public typealias Rect = Rectangle

/// An element that represents a vector shape.
///
/// Use `Circle` to draw a circle.
///
/// ```swift
/// Vector {
///     Circle {
///     }
///     .centerPoint((50,50))
///     .radius(50)
/// }
/// .viewBox("0 0 100 100")
/// .namespace("http://...")
/// ```
public struct Circle: ContentNode, VectorElement {

    internal var name: String { "circle" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [Content]

    /// Create a circle.
    ///
    /// - Parameter content: The circle's content.
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [Content]) {
        self.attributes = attributes
        self.content = content
    }
    
    public func modify(if condition: Bool, element: (Circle) -> Circle) -> Circle {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (Circle, T) -> Circle) -> Circle {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
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
        return self.mutate(style: TaintedString(value, as: .css(.attribute)))
    }
    
    public func fill(_ color: String, opacity: Double? = nil) -> Circle {
        return self.mutate(fill: color).mutate(fillopacity: opacity)   
    }
    
    public func stroke(_ value: String) -> Circle {
        return self.mutate(stroke: value)
    }
    
    public func strokeWidth(_ size: Int) -> Circle {
        return self.mutate(strokewidth: size)
    }
    
    @available(*, deprecated, message: "Use the center(x:y:) modifier instead.")
    public func centerPoint(_ point: (Int, Int)) -> Circle {
        return self.mutate(cx: "\(point.0)").mutate(cy: "\(point.1)")
    }
    
    public func center(x: Int, y: Int) -> Circle {
        return self.mutate(cx: "\(x)").mutate(cy: "\(y)")
    }
    
    public func center(x: Double, y: Double) -> Circle {
        return self.mutate(cx: "\(x)").mutate(cy: "\(y)")
    }
    
    public func center(_ point: UnitPoint) -> Circle {
        return self.mutate(cx: point.x).mutate(cy: point.y)
    }
    
    public func radius(_ size: Int) -> Circle {
        return self.mutate(radius: size)
    }
    
    @available(*, deprecated, message: "Use the fill(_:opacity:) modifier instead.")
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

/// An element that represents a vector shape.
///
/// Use `Rectangle` to draw a rectangle.
///
/// ```swift
/// Vector {
///     Rectangle {
///     }
///     .width(200)
///     .height(100)
/// }
/// .viewBox("0 0 400 200")
/// .namespace("https://...")
/// ```
public struct Rectangle: ContentNode, VectorElement {

    internal var name: String { "rect" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [Content]

    /// Create a rectangle.
    ///
    /// - Parameter content: The rectangle's content.
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [Content]) {
        self.attributes = attributes
        self.content = content
    }
    
    public func modify(if condition: Bool, element: (Rectangle) -> Rectangle) -> Rectangle {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (Rectangle, T) -> Rectangle) -> Rectangle {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension Rectangle: GlobalVectorAttributes, WidthAttribute, HeightAttribute, RadiusPointAttribute, PositionPointAttribute {

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
        return self.mutate(style: TaintedString(value, as: .css(.attribute)))
    }
    
    public func fill(_ color: String, opacity: Double? = nil) -> Rectangle {
        return self.mutate(fill: color).mutate(fillopacity: opacity)  
    }
    
    public func stroke(_ value: String) -> Rectangle {
        return self.mutate(stroke: value)
    }
    
    public func strokeWidth(_ size: Int) -> Rectangle {
        return self.mutate(strokewidth: size)
    }
    
    @available(*, deprecated, message: "Use the radius(x:y:) modifier instead.")
    public func radiusPoint(_ point: (Int, Int)) -> Rectangle {
        return self.mutate(rx: "\(point.0)").mutate(ry: "\(point.1)")
    }
    
    public func radius(x: Int, y: Int) -> Rectangle {
        return self.mutate(rx: "\(x)").mutate(ry: "\(y)")
    }
    
    public func radius(x: Double, y: Double) -> Rectangle {
        return self.mutate(rx: "\(x)").mutate(ry: "\(y)")
    }
    
    public func radius(_ point: UnitPoint) -> Rectangle {
        return self.mutate(rx: point.x).mutate(ry: point.y)
    }
    
    @available(*, deprecated, message: "Use the position(x:y:) modifier instead.")
    public func positionPoint(_ point: (Int, Int)) -> Rectangle {
        return self.mutate(x: "\(point.0)").mutate(y: "\(point.1)")
    }
    
    public func position(x: Int, y: Int) -> Rectangle {
        return self.mutate(x: "\(x)").mutate(y: "\(y)")
    }
    
    public func position(x: Double, y: Double) -> Rectangle {
        return self.mutate(x: "\(x)").mutate(y: "\(y)")
    }
    
    public func position(_ point: UnitPoint) -> Rectangle {
        return self.mutate(x: point.x).mutate(y: point.y)
    }
    
    public func width(_ size: Int) -> Rectangle {
        return self.mutate(width: size)
    }
    
    public func height(_ size: Int) -> Rectangle {
        return self.mutate(height: size)
    }
    
    @available(*, deprecated, message: "Use the fill(_:opacity:) modifier instead.")
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

/// An element that represents a vector shape.
///
/// Use `Ellipse` to draw an ellipse.
///
/// ```swift
/// Vector {
///     Ellipse {
///     }
///     .centerPoint((100, 50))
///     .radiusPoint((100, 50))
/// }
/// .viewBox("0 0 200 100")
/// .namespace("http://...")
/// ```
public struct Ellipse: ContentNode, VectorElement {

    internal var name: String { "ellipse" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [Content]
    
    /// Create an ellipse.
    ///
    /// - Parameter content: The elliipse's content.
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [Content]) {
        self.attributes = attributes
        self.content = content
    }
    
    public func modify(if condition: Bool, element: (Ellipse) -> Ellipse) -> Ellipse {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (Ellipse, T) -> Ellipse) -> Ellipse {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
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
        return self.mutate(style: TaintedString(value, as: .css(.attribute)))
    }
    
    public func fill(_ color: String, opacity: Double? = nil) -> Ellipse {
        return self.mutate(fill: color).mutate(fillopacity: opacity)  
    }
    
    public func stroke(_ value: String) -> Ellipse {
        return self.mutate(stroke: value)
    }
    
    public func strokeWidth(_ size: Int) -> Ellipse {
        return self.mutate(strokewidth: size)
    }
    
    @available(*, deprecated, message: "Use the center(x:y:) modifier instead.")
    public func centerPoint(_ point: (Int, Int)) -> Ellipse {
        return self.mutate(cx: "\(point.0)").mutate(cy: "\(point.1)")
    }
    
    public func center(x: Int, y: Int) -> Ellipse {
        return self.mutate(cx: "\(x)").mutate(cy: "\(y)")
    }
    
    public func center(x: Double, y: Double) -> Ellipse {
        return self.mutate(cx: "\(x)").mutate(cy: "\(y)")
    }
    
    public func center(_ point: UnitPoint) -> Ellipse {
        return self.mutate(cx: point.x).mutate(cy: point.y)
    }
    
    @available(*, deprecated, message: "Use the radius(x:y:) modifier instead.")
    public func radiusPoint(_ point: (Int, Int)) -> Ellipse {
        return self.mutate(rx: "\(point.0)").mutate(ry: "\(point.1)")
    }
    
    public func radius(x: Int, y: Int) -> Ellipse {
        return self.mutate(rx: "\(x)").mutate(ry: "\(y)")
    }
    
    public func radius(x: Double, y: Double) -> Ellipse {
        return self.mutate(rx: "\(x)").mutate(ry: "\(y)")
    }
    
    public func radius(_ point: UnitPoint) -> Ellipse {
        return self.mutate(rx: point.x).mutate(ry: point.y)
    }
    
    @available(*, deprecated, message: "Use the fill(_:opacity:) modifier instead.")
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

/// An element that represents a vector shape.
///
/// Use `Line` to draw a straight line.
///
/// ```swift
/// Vector {
///     Line {
///     }
///     .stroke("black")
///     .strokeWidth(1)
/// }
/// .viewBox("0 0 400 200")
/// .namespace("http://...")
/// ```
public struct Line: ContentNode, VectorElement {

    internal var name: String { "line" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [Content]

    /// Creates a line.
    ///
    /// - Parameter content: The line's content.
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [Content]) {
        self.attributes = attributes
        self.content = content
    }
    
    public func modify(if condition: Bool, element: (Line) -> Line) -> Line {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (Line, T) -> Line) -> Line {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
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
        return self.mutate(style: TaintedString(value, as: .css(.attribute)))
    }
    
    public func fill(_ color: String, opacity: Double? = nil) -> Line {
        return self.mutate(fill: color).mutate(fillopacity: opacity)  
    }
    
    public func stroke(_ value: String) -> Line {
        return self.mutate(stroke: value)
    }
    
    public func strokeWidth(_ size: Int) -> Line {
        return self.mutate(strokewidth: size)
    }
    
    @available(*, deprecated, message: "Use the fill(_:opacity:) modifier instead.")
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

/// An element that represents a vector shape.
///
/// Use `Polygon` to draw a polygon.
///
/// ```swift
/// Vector {
///     Polygon {
///     }
///     .points("0, 100, 5...")
/// }
/// .viewBox("0 0 400 200")
/// .namespace("http://...")
/// ```
public struct Polygon: ContentNode, VectorElement {

    internal var name: String { "polygon" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [Content]

    /// Create a polygon.
    ///
    /// - Parameter content: The polygon's content.
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [Content]) {
        self.attributes = attributes
        self.content = content
    }
    
    public func modify(if condition: Bool, element: (Polygon) -> Polygon) -> Polygon {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (Polygon, T) -> Polygon) -> Polygon {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension Polygon: GlobalVectorAttributes, PointsAttribute {
    
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
        return self.mutate(style: TaintedString(value, as: .css(.attribute)))
    }
    
    public func fill(_ color: String, opacity: Double? = nil) -> Polygon {
        return self.mutate(fill: color).mutate(fillopacity: opacity)  
    }
    
    public func stroke(_ value: String) -> Polygon {
        return self.mutate(stroke: value)
    }
    
    public func strokeWidth(_ size: Int) -> Polygon {
        return self.mutate(strokewidth: size)
    }
    
    @available(*, deprecated, message: "Use the fill(_:opacity:) modifier instead.")
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
    
    public func points(_ value: String) -> Polygon {
        return self.mutate(points: value)
    }
    
    public func custom(key: String, value: Any) -> Polygon {
        return self.mutate(key: key, value: value)
    }
}

/// An element that represents a vector shape.
///
/// Use `Polyline` to draw a polyline.
///
/// ```swift
/// Vector {
///     Polyline {
///     }
///     .points("0, 100, 5...")
/// }
/// .viewBox("0 0 400 200")
/// .namespace("http://...")
/// ```
public struct Polyline: ContentNode, VectorElement {

    internal var name: String { "polyline" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [Content]

    /// Create a polyline.
    ///
    /// - Parameter content: The polyline's content.
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [Content]) {
        self.attributes = attributes
        self.content = content
    }
    
    public func modify(if condition: Bool, element: (Polyline) -> Polyline) -> Polyline {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (Polyline, T) -> Polyline) -> Polyline {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension Polyline: GlobalVectorAttributes, PointsAttribute {
    
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
        return self.mutate(style: TaintedString(value, as: .css(.attribute)))
    }
    
    public func fill(_ color: String, opacity: Double? = nil) -> Polyline {
        return self.mutate(fill: color).mutate(fillopacity: opacity)  
    }
    
    public func stroke(_ value: String) -> Polyline {
        return self.mutate(stroke: value)
    }
    
    public func strokeWidth(_ size: Int) -> Polyline {
        return self.mutate(strokewidth: size)
    }
    
    @available(*, deprecated, message: "Use the fill(_:opacity:) modifier instead.")
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
    
    public func points(_ value: String) -> Polyline {
        return self.mutate(points: value)
    }
    
    public func custom(key: String, value: Any) -> Polyline {
        return self.mutate(key: key, value: value)
    }
}

/// An element that represents a vector path.
///
/// Use `Path` to create lines, curves and arcs.
///
/// ```swift
/// Vector {
///     Path {
///     }
///     .draw("M10 10...")
/// }
/// .viewBox("0 0 400 200")
/// .namespace("http://...")
/// ```
public struct Path: ContentNode, VectorElement {

    internal var name: String { "path" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [Content]

    /// Create a path.
    ///
    /// - Parameter content: The path's content.
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [Content]) {
        self.attributes = attributes
        self.content = content
    }
    
    public func modify(if condition: Bool, element: (Path) -> Path) -> Path {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (Path, T) -> Path) -> Path {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
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
        return self.mutate(style: TaintedString(value, as: .css(.attribute)))
    }

    public func fill(_ color: String, opacity: Double? = nil) -> Path {
        return self.mutate(fill: color).mutate(fillopacity: opacity)  
    }
    
    public func stroke(_ value: String) -> Path {
        return self.mutate(stroke: value)
    }
    
    public func strokeWidth(_ size: Int) -> Path {
        return self.mutate(strokewidth: size)
    }
    
    @available(*, deprecated, message: "Use the fill(_:opacity:) modifier instead.")
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

/// An element that represents a group container.
///
/// Use `Group` to group vector elements together.
///
/// ```swift
/// Vector {
///     Group {
///     }
/// }
/// .viewBox("0 0 400 200")
/// .namespace("http://...")
/// ```
public struct Group: ContentNode, VectorElement {

    internal var name: String { "g" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [Content]

    /// Create a group.
    ///
    /// - Parameter content: The group's content.
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }

    internal init(attributes: OrderedDictionary<String, Any>?, content: [Content]) {
        self.attributes = attributes
        self.content = content
    }
    
    public func modify(if condition: Bool, element: (Group) -> Group) -> Group {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (Group, T) -> Group) -> Group {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension Group: GlobalVectorAttributes {

    public func id(_ value: String) -> Group {
        return self.mutate(id: value)
    }

    public func tabIndex(_ value: Int) -> Group {
        return self.mutate(tabindex: value)
    }

    public func `class`(_ value: String) -> Group {
        return self.mutate(class: value)
    }

    public func style(_ value: String) -> Group {
        return self.mutate(style: TaintedString(value, as: .css(.attribute)))
    }

    public func fill(_ color: String, opacity: Double? = nil) -> Group {
        return self.mutate(fill: color).mutate(fillopacity: opacity)  
    }

    public func stroke(_ value: String) -> Group {
        return self.mutate(stroke: value)
    }

    public func strokeWidth(_ size: Int) -> Group {
        return self.mutate(strokewidth: size)
    }

    @available(*, deprecated, message: "Use the fill(_:opacity:) modifier instead.")
    public func fillOpacity(_ value: Double) -> Group {
        return self.mutate(fillopacity: value)
    }

    public func strokeOpacity(_ value: Double) -> Group {
        return self.mutate(strokeopacity: value)
    }

    public func strokeLineCap(_ value: Values.Linecap) -> Group {
        return self.mutate(strokelinecap: value.rawValue)
    }

    public func strokeLineJoin(_ value: Values.Linejoin) -> Group {
        return self.mutate(strokelinejoin: value.rawValue)
    }
    
    public func custom(key: String, value: Any) -> Group {
        return self.mutate(key: key, value: value)
    }
}

/// An element that represents a vector method.
///
/// Use `Use` to reuse associated vector elements.
///
/// ```swift
/// Vector {
///     Circle {
///     }
///     .id("lorem")
///     Use {
///     }
///     .reference("#lorem")
/// }
/// .viewBox("0 0 400 200")
/// .namespace("http://...")
/// ```
public struct Use: ContentNode, VectorElement {

    internal var name: String { "use" }

    internal var attributes: OrderedDictionary<String, Any>?

    internal var content: [Content]

    /// Create a use.
    ///
    /// - Parameter content: The use's content.
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, Any>?, content: [Content]) {
        self.attributes = attributes
        self.content = content
    }
    
    public func modify(if condition: Bool, element: (Use) -> Use) -> Use {
        
        if condition {
            return self.modify(element(self))
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, element: (Use, T) -> Use) -> Use {
        
        guard let value = value else {
            return self
        }
        
        return self.modify(element(self, value as T))
    }
}

extension Use: GlobalVectorAttributes, ReferenceAttribute, WidthAttribute, HeightAttribute, PositionPointAttribute {

    public func id(_ value: String) -> Use {
        return self.mutate(id: value)
    }
    
    public func tabIndex(_ value: Int) -> Use {
        return self.mutate(tabindex: value)
    }
    
    public func reference(_ value: String) -> Use {
        return self.mutate(href: value)
    }
    
    @available(*, deprecated, message: "Use the position(x:y:) modifier instead.")
    public func positionPoint(_ point: (Int, Int)) -> Use {
        return self.mutate(x: "\(point.0)").mutate(y: "\(point.1)")
    }
    
    public func position(x: Int, y: Int) -> Use {
        return self.mutate(x: "\(x)").mutate(y: "\(y)")
    }
    
    public func position(x: Double, y: Double) -> Use {
        return self.mutate(x: "\(x)").mutate(y: "\(y)")
    }
    
    public func position(_ point: UnitPoint) -> Use {
        return self.mutate(x: point.x).mutate(y: point.y)
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
        return self.mutate(style: TaintedString(value, as: .css(.attribute)))
    }
    
    public func fill(_ color: String, opacity: Double? = nil) -> Use {
        return self.mutate(fill: color).mutate(fillopacity: opacity)  
    }
    
    public func stroke(_ value: String) -> Use {
        return self.mutate(stroke: value)
    }
    
    public func strokeWidth(_ size: Int) -> Use {
        return self.mutate(strokewidth: size)
    }
    
    @available(*, deprecated, message: "Use the fill(_:opacity:) modifier instead.")
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
