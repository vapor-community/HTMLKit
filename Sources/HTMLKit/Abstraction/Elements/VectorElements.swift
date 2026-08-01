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

    internal var attributes: OrderedDictionary<String, AttributeData>?

    internal var content: [Content]
    
    internal var context: EscapeContext

    /// Create a circle.
    ///
    /// - Parameter content: The circle's content.
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        
        self.context = .tainted(.html)
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, AttributeData>? = nil, context: EscapeContext = .tainted(.html), content: [Content] = []) {
        
        self.attributes = attributes
        self.context = context
        self.content = content
    }
    
    public func modify(if condition: Bool, use strategy: MergeStrategy = .replacing, element: (Circle) -> Circle) -> Circle {
        
        if condition {

            switch strategy {
            case .combining:
                return self.combine(element(self))
                
            case .replacing:
                return self.replace(element(self))
            }
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, use strategy: MergeStrategy = .replacing, element: (Circle, T) -> Circle) -> Circle {
        
        guard let value = value else {
            return self
        }
        
        switch strategy {
        case .combining:
            return self.combine(element(self, value as T))
            
        case .replacing:
            return self.replace(element(self, value as T))
        }
    }
}

extension Circle: GlobalVectorAttributes, CenterPointAttribute, RadiusAttribute {

    public func id(_ value: String) -> Circle {
        return mutate(id: .init(value, context: .tainted(.html)))
    }
    
    public func tabIndex(_ value: Int) -> Circle {
        return mutate(tabindex: .init(value, context: .trusted))
    }
    
    public func `class`(_ names: [String]) -> Circle {
        return self.mutate(class: .init(EnumeratedList(values: names, separator: " "), context: .tainted(.html)))
    }
    
    public func `class`(_ names: String...) -> Circle {
        return self.mutate(class: .init(EnumeratedList(values: names, separator: " "), context: .tainted(.html)))
    }
    
    public func style(_ value: String) -> Circle {
        return self.mutate(style: .init(value, context: .tainted(.css)))
    }
    
    public func fill(_ color: String, opacity: Double? = nil) -> Circle {
 
        var copy = self
        
        copy = copy.mutate(fill: .init(color, context: .tainted(.html)))
        
        if let opacity = opacity {
            copy = copy.mutate(fillopacity: .init(opacity, context: .trusted))
        }
        
        return copy
    }
    
    public func stroke(_ color: String, width: Int? = nil, opacity: Double? = nil, cap: Values.Linecap? = nil, join: Values.Linejoin? = nil) -> Circle {

        var copy = self
        
        copy = copy.mutate(stroke: .init(color, context: .tainted(.html)))
        
        if let width = width {
            copy = copy.mutate(strokewidth: .init(width, context: .trusted))
        }
        
        if let opacity = opacity {
            copy = copy.mutate(strokeopacity: .init(opacity, context: .trusted))
        }
        
        if let cap = cap {
            copy = copy.mutate(strokelinecap: .init(cap.rawValue, context: .trusted))
        }
        
        if let join = join {
            copy = copy.mutate(strokelinejoin: .init(join.rawValue, context: .trusted))
        }
        
        return copy
    }
    
    public func center(x: Int, y: Int) -> Circle {
        return self.mutate(cx: .init(x, context: .trusted)).mutate(cy: .init(y, context: .trusted))
    }
    
    public func center(x: Double, y: Double) -> Circle {
        return self.mutate(cx: .init(x, context: .trusted)).mutate(cy: .init(y, context: .trusted))
    }
    
    public func center(_ point: UnitPoint) -> Circle {
        return self.mutate(cx: .init(point.x, context: .trusted)).mutate(cy: .init(point.y, context: .trusted))
    }
    
    public func radius(_ size: Int) -> Circle {
        return self.mutate(radius: .init(size, context: .trusted))
    }
    
    public func custom(key: String, value: String, context: EscapeContext = .tainted(.html)) -> Circle {
        return mutate(key: key, value: .init(value, context: context))
    }
    
    public func custom(key: String, value: Int) -> Circle {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Double) -> Circle {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Bool) -> Circle {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Float) -> Circle {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: EnvironmentValue, context: EscapeContext = .tainted(.html)) -> Circle {
        return mutate(key: key, value: .init(value, context: context))
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

    internal var attributes: OrderedDictionary<String, AttributeData>?

    internal var content: [Content]
    
    internal var context: EscapeContext

    /// Create a rectangle.
    ///
    /// - Parameter content: The rectangle's content.
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        
        self.context = .tainted(.html)
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, AttributeData>? = nil, context: EscapeContext = .tainted(.html), content: [Content] = []) {
        
        self.attributes = attributes
        self.context = context
        self.content = content
    }
    
    public func modify(if condition: Bool, use strategy: MergeStrategy = .replacing, element: (Rectangle) -> Rectangle) -> Rectangle {
        
        if condition {

            switch strategy {
            case .combining:
                return self.combine(element(self))
                
            case .replacing:
                return self.replace(element(self))
            }
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, use strategy: MergeStrategy = .replacing, element: (Rectangle, T) -> Rectangle) -> Rectangle {
        
        guard let value = value else {
            return self
        }
        
        switch strategy {
        case .combining:
            return self.combine(element(self, value as T))
            
        case .replacing:
            return self.replace(element(self, value as T))
        }
    }
}

extension Rectangle: GlobalVectorAttributes, WidthAttribute, HeightAttribute, RadiusPointAttribute, PositionPointAttribute {

    public func id(_ value: String) -> Rectangle {
        return mutate(id: .init(value, context: .tainted(.html)))
    }
    
    public func tabIndex(_ value: Int) -> Rectangle {
        return mutate(tabindex: .init(value, context: .trusted))
    }
    
    public func `class`(_ names: [String]) -> Rectangle {
        return self.mutate(class: .init(EnumeratedList(values: names, separator: " "), context: .tainted(.html)))
    }
    
    public func `class`(_ names: String...) -> Rectangle {
        return self.mutate(class: .init(EnumeratedList(values: names, separator: " "), context: .tainted(.html)))
    }
    
    public func style(_ value: String) -> Rectangle {
        return self.mutate(style: .init(value, context: .tainted(.css)))
    }
    
    public func fill(_ color: String, opacity: Double? = nil) -> Rectangle {

        var copy = self
        
        copy = copy.mutate(fill: .init(color, context: .tainted(.html)))
        
        if let opacity = opacity {
            copy = copy.mutate(fillopacity: .init(opacity, context: .trusted))
        }
        
        return copy
    }

    public func stroke(_ color: String, width: Int? = nil, opacity: Double? = nil, cap: Values.Linecap? = nil, join: Values.Linejoin? = nil) -> Rectangle {

        var copy = self
        
        copy = copy.mutate(stroke: .init(color, context: .tainted(.html)))
        
        if let width = width {
            copy = copy.mutate(strokewidth: .init(width, context: .trusted))
        }
        
        if let opacity = opacity {
            copy = copy.mutate(strokeopacity: .init(opacity, context: .trusted))
        }
        
        if let cap = cap {
            copy = copy.mutate(strokelinecap: .init(cap.rawValue, context: .trusted))
        }
        
        if let join = join {
            copy = copy.mutate(strokelinejoin: .init(join.rawValue, context: .trusted))
        }
        
        return copy
    }
    
    public func radius(x: Int, y: Int) -> Rectangle {
        return self.mutate(rx: .init(x, context: .trusted)).mutate(ry: .init(y, context: .trusted))
    }
    
    public func radius(x: Double, y: Double) -> Rectangle {
        return self.mutate(rx: .init(x, context: .trusted)).mutate(ry: .init(y, context: .trusted))
    }
    
    public func radius(_ point: UnitPoint) -> Rectangle {
        return self.mutate(rx: .init(point.x, context: .trusted)).mutate(ry: .init(point.y, context: .trusted))
    }
    
    public func position(x: Int, y: Int) -> Rectangle {
        return self.mutate(x: .init(x, context: .trusted)).mutate(y: .init(x, context: .trusted))
    }
    
    public func position(x: Double, y: Double) -> Rectangle {
        return self.mutate(x: .init(x, context: .trusted)).mutate(y: .init(x, context: .trusted))
    }
    
    public func position(_ point: UnitPoint) -> Rectangle {
        return self.mutate(x: .init(point.x, context: .trusted)).mutate(y: .init(point.y, context: .trusted))
    }
    
    public func width(_ size: Int) -> Rectangle {
        return self.mutate(width: .init(size, context: .trusted))
    }
    
    public func height(_ size: Int) -> Rectangle {
        return self.mutate(height: .init(size, context: .trusted))
    }
    
    public func custom(key: String, value: String, context: EscapeContext = .tainted(.html)) -> Rectangle {
        return mutate(key: key, value: .init(value, context: context))
    }
    
    public func custom(key: String, value: Int) -> Rectangle {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Double) -> Rectangle {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Bool) -> Rectangle {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Float) -> Rectangle {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: EnvironmentValue, context: EscapeContext = .tainted(.html)) -> Rectangle {
        return mutate(key: key, value: .init(value, context: context))
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

    internal var attributes: OrderedDictionary<String, AttributeData>?

    internal var content: [Content]
    
    internal var context: EscapeContext
    
    /// Create an ellipse.
    ///
    /// - Parameter content: The elliipse's content.
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        
        self.context = .tainted(.html)
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, AttributeData>? = nil, context: EscapeContext = .tainted(.html), content: [Content] = []) {
        
        self.attributes = attributes
        self.context = context
        self.content = content
    }
    
    public func modify(if condition: Bool, use strategy: MergeStrategy = .replacing, element: (Ellipse) -> Ellipse) -> Ellipse {
        
        if condition {

            switch strategy {
            case .combining:
                return self.combine(element(self))
                
            case .replacing:
                return self.replace(element(self))
            }
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, use strategy: MergeStrategy = .replacing, element: (Ellipse, T) -> Ellipse) -> Ellipse {
        
        guard let value = value else {
            return self
        }
        
        switch strategy {
        case .combining:
            return self.combine(element(self, value as T))
            
        case .replacing:
            return self.replace(element(self, value as T))
        }
    }
}

extension Ellipse: GlobalVectorAttributes, CenterPointAttribute, RadiusPointAttribute {
    
    public func id(_ value: String) -> Ellipse {
        return mutate(id: .init(value, context: .tainted(.html)))
    }
    
    public func tabIndex(_ value: Int) -> Ellipse {
        return mutate(tabindex: .init(value, context: .trusted))
    }
    
    public func `class`(_ names: [String]) -> Ellipse {
        return self.mutate(class: .init(EnumeratedList(values: names, separator: " "), context: .tainted(.html)))
    }
    
    public func `class`(_ names: String...) -> Ellipse {
        return self.mutate(class: .init(EnumeratedList(values: names, separator: " "), context: .tainted(.html)))
    }
    
    public func style(_ value: String) -> Ellipse {
        return self.mutate(style: .init(value, context: .tainted(.css)))
    }
    
    public func fill(_ color: String, opacity: Double? = nil) -> Ellipse {

        var copy = self
        
        copy = copy.mutate(fill: .init(color, context: .tainted(.html)))
        
        if let opacity = opacity {
            copy = copy.mutate(fillopacity: .init(opacity, context: .trusted))
        }
        
        return copy
    }
    
    public func stroke(_ color: String, width: Int? = nil, opacity: Double? = nil, cap: Values.Linecap? = nil, join: Values.Linejoin? = nil) -> Ellipse {

        var copy = self
        
        copy = copy.mutate(stroke: .init(color, context: .tainted(.html)))
        
        if let width = width {
            copy = copy.mutate(strokewidth: .init(width, context: .trusted))
        }
        
        if let opacity = opacity {
            copy = copy.mutate(strokeopacity: .init(opacity, context: .trusted))
        }
        
        if let cap = cap {
            copy = copy.mutate(strokelinecap: .init(cap.rawValue, context: .trusted))
        }
        
        if let join = join {
            copy = copy.mutate(strokelinejoin: .init(join.rawValue, context: .trusted))
        }
        
        return copy
    }
    
    public func center(x: Int, y: Int) -> Ellipse {
        return self.mutate(cx: .init(x, context: .trusted)).mutate(cy: .init(y, context: .trusted))
    }
    
    public func center(x: Double, y: Double) -> Ellipse {
        return self.mutate(cx: .init(x, context: .trusted)).mutate(cy: .init(y, context: .trusted))
    }
    
    public func center(_ point: UnitPoint) -> Ellipse {
        return self.mutate(cx: .init(point.x, context: .trusted)).mutate(cy: .init(point.y, context: .trusted))
    }
    
    public func radius(x: Int, y: Int) -> Ellipse {
        return self.mutate(rx: .init(x, context: .trusted)).mutate(ry: .init(y, context: .trusted))
    }
    
    public func radius(x: Double, y: Double) -> Ellipse {
        return self.mutate(rx: .init(x, context: .trusted)).mutate(ry: .init(y, context: .trusted))
    }
    
    public func radius(_ point: UnitPoint) -> Ellipse {
        return self.mutate(rx: .init(point.x, context: .trusted)).mutate(ry: .init(point.y, context: .trusted))
    }
    
    public func custom(key: String, value: String, context: EscapeContext = .tainted(.html)) -> Ellipse {
        return mutate(key: key, value: .init(value, context: context))
    }
    
    public func custom(key: String, value: Int) -> Ellipse {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Double) -> Ellipse {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Bool) -> Ellipse {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Float) -> Ellipse {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: EnvironmentValue, context: EscapeContext = .tainted(.html)) -> Ellipse {
        return mutate(key: key, value: .init(value, context: context))
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

    internal var attributes: OrderedDictionary<String, AttributeData>?

    internal var content: [Content]
    
    internal var context: EscapeContext

    /// Creates a line.
    ///
    /// - Parameter content: The line's content.
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        
        self.context = .tainted(.html)
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, AttributeData>? = nil, context: EscapeContext = .tainted(.html), content: [Content] = []) {
        
        self.attributes = attributes
        self.context = context
        self.content = content
    }
    
    public func modify(if condition: Bool, use strategy: MergeStrategy = .replacing, element: (Line) -> Line) -> Line {
        
        if condition {

            switch strategy {
            case .combining:
                return self.combine(element(self))
                
            case .replacing:
                return self.replace(element(self))
            }
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, use strategy: MergeStrategy = .replacing, element: (Line, T) -> Line) -> Line {
        
        guard let value = value else {
            return self
        }
        
        switch strategy {
        case .combining:
            return self.combine(element(self, value as T))
            
        case .replacing:
            return self.replace(element(self, value as T))
        }
    }
}

extension Line: GlobalVectorAttributes {
    
    public func id(_ value: String) -> Line {
        return mutate(id: .init(value, context: .tainted(.html)))
    }
    
    public func tabIndex(_ value: Int) -> Line {
        return mutate(tabindex: .init(value, context: .trusted))
    }
    
    public func `class`(_ names: [String]) -> Line {
        return self.mutate(class: .init(EnumeratedList(values: names, separator: " "), context: .tainted(.html)))
    }
    
    public func `class`(_ names: String...) -> Line {
        return self.mutate(class: .init(EnumeratedList(values: names, separator: " "), context: .tainted(.html)))
    }
    
    public func style(_ value: String) -> Line {
        return self.mutate(style: .init(value, context: .tainted(.css)))
    }
    
    public func fill(_ color: String, opacity: Double? = nil) -> Line {

        var copy = self
        
        copy = copy.mutate(fill: .init(color, context: .tainted(.html)))
        
        if let opacity = opacity {
            copy = copy.mutate(fillopacity: .init(opacity, context: .trusted))
        }
        
        return copy
    }
    
    public func stroke(_ color: String, width: Int? = nil, opacity: Double? = nil, cap: Values.Linecap? = nil, join: Values.Linejoin? = nil) -> Line {

        var copy = self
        
        copy = copy.mutate(stroke: .init(color, context: .tainted(.html)))
        
        if let width = width {
            copy = copy.mutate(strokewidth: .init(width, context: .trusted))
        }
        
        if let opacity = opacity {
            copy = copy.mutate(strokeopacity: .init(opacity, context: .trusted))
        }
        
        if let cap = cap {
            copy = copy.mutate(strokelinecap: .init(cap.rawValue, context: .trusted))
        }
        
        if let join = join {
            copy = copy.mutate(strokelinejoin: .init(join.rawValue, context: .trusted))
        }
        
        return copy
    }
    
    public func custom(key: String, value: String, context: EscapeContext = .tainted(.html)) -> Line {
        return mutate(key: key, value: .init(value, context: context))
    }
    
    public func custom(key: String, value: Int) -> Line {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Double) -> Line {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Bool) -> Line {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Float) -> Line {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: EnvironmentValue, context: EscapeContext = .tainted(.html)) -> Line {
        return mutate(key: key, value: .init(value, context: context))
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

    internal var attributes: OrderedDictionary<String, AttributeData>?

    internal var content: [Content]
    
    internal var context: EscapeContext

    /// Create a polygon.
    ///
    /// - Parameter content: The polygon's content.
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        
        self.context = .tainted(.html)
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, AttributeData>? = nil, context: EscapeContext = .tainted(.html), content: [Content] = []) {
        
        self.attributes = attributes
        self.context = context
        self.content = content
    }
    
    public func modify(if condition: Bool, use strategy: MergeStrategy = .replacing, element: (Polygon) -> Polygon) -> Polygon {
        
        if condition {

            switch strategy {
            case .combining:
                return self.combine(element(self))
                
            case .replacing:
                return self.replace(element(self))
            }
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, use strategy: MergeStrategy = .replacing, element: (Polygon, T) -> Polygon) -> Polygon {
        
        guard let value = value else {
            return self
        }
        
        switch strategy {
        case .combining:
            return self.combine(element(self, value as T))
            
        case .replacing:
            return self.replace(element(self, value as T))
        }
    }
}

extension Polygon: GlobalVectorAttributes, PointsAttribute {
    
    public func id(_ value: String) -> Polygon {
        return mutate(id: .init(value, context: .tainted(.html)))
    }
    
    public func tabIndex(_ value: Int) -> Polygon {
        return mutate(tabindex: .init(value, context: .trusted))
    }
    
    public func `class`(_ names: [String]) -> Polygon {
        return self.mutate(class: .init(EnumeratedList(values: names, separator: " "), context: .tainted(.html)))
    }
    
    public func `class`(_ names: String...) -> Polygon {
        return self.mutate(class: .init(EnumeratedList(values: names, separator: " "), context: .tainted(.html)))
    }
    
    public func style(_ value: String) -> Polygon {
        return self.mutate(style: .init(value, context: .tainted(.css)))
    }
    
    public func fill(_ color: String, opacity: Double? = nil) -> Polygon {

        var copy = self
        
        copy = copy.mutate(fill: .init(color, context: .tainted(.html)))
        
        if let opacity = opacity {
            copy = copy.mutate(fillopacity: .init(opacity, context: .trusted))
        }
        
        return copy
    }
    
    public func stroke(_ color: String, width: Int? = nil, opacity: Double? = nil, cap: Values.Linecap? = nil, join: Values.Linejoin? = nil) -> Polygon {

        var copy = self
        
        copy = copy.mutate(stroke: .init(color, context: .tainted(.html)))
        
        if let width = width {
            copy = copy.mutate(strokewidth: .init(width, context: .trusted))
        }
        
        if let opacity = opacity {
            copy = copy.mutate(strokeopacity: .init(opacity, context: .trusted))
        }
        
        if let cap = cap {
            copy = copy.mutate(strokelinecap: .init(cap.rawValue, context: .trusted))
        }
        
        if let join = join {
            copy = copy.mutate(strokelinejoin: .init(join.rawValue, context: .trusted))
        }
        
        return copy
    }
    
    public func points(_ value: String) -> Polygon {
        return self.mutate(points: .init(value, context: .tainted(.html)))
    }
    
    public func custom(key: String, value: String, context: EscapeContext = .tainted(.html)) -> Polygon {
        return mutate(key: key, value: .init(value, context: context))
    }
    
    public func custom(key: String, value: Int) -> Polygon {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Double) -> Polygon {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Bool) -> Polygon {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Float) -> Polygon {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: EnvironmentValue, context: EscapeContext = .tainted(.html)) -> Polygon {
        return mutate(key: key, value: .init(value, context: context))
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

    internal var attributes: OrderedDictionary<String, AttributeData>?

    internal var content: [Content]
    
    internal var context: EscapeContext

    /// Create a polyline.
    ///
    /// - Parameter content: The polyline's content.
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        
        self.context = .tainted(.html)
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, AttributeData>? = nil, context: EscapeContext = .tainted(.html), content: [Content] = []) {
        
        self.attributes = attributes
        self.context = context
        self.content = content
    }
    
    public func modify(if condition: Bool, use strategy: MergeStrategy = .replacing, element: (Polyline) -> Polyline) -> Polyline {
        
        if condition {

            switch strategy {
            case .combining:
                return self.combine(element(self))
                
            case .replacing:
                return self.replace(element(self))
            }
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, use strategy: MergeStrategy = .replacing, element: (Polyline, T) -> Polyline) -> Polyline {
        
        guard let value = value else {
            return self
        }
        
        switch strategy {
        case .combining:
            return self.combine(element(self, value as T))
            
        case .replacing:
            return self.replace(element(self, value as T))
        }
    }
}

extension Polyline: GlobalVectorAttributes, PointsAttribute {
    
    public func id(_ value: String) -> Polyline {
        return mutate(id: .init(value, context: .tainted(.html)))
    }
    
    public func tabIndex(_ value: Int) -> Polyline {
        return mutate(tabindex: .init(value, context: .trusted))
    }
    
    public func `class`(_ names: [String]) -> Polyline {
        return self.mutate(class: .init(EnumeratedList(values: names, separator: " "), context: .tainted(.html)))
    }
    
    public func `class`(_ names: String...) -> Polyline {
        return self.mutate(class: .init(EnumeratedList(values: names, separator: " "), context: .tainted(.html)))
    }
    
    public func style(_ value: String) -> Polyline {
        return self.mutate(style: .init(value, context: .tainted(.css)))
    }
    
    public func fill(_ color: String, opacity: Double? = nil) -> Polyline {

        var copy = self
        
        copy = copy.mutate(fill: .init(color, context: .tainted(.html)))
        
        if let opacity = opacity {
            copy = copy.mutate(fillopacity: .init(opacity, context: .trusted))
        }
        
        return copy
    }
    
    public func stroke(_ color: String, width: Int? = nil, opacity: Double? = nil, cap: Values.Linecap? = nil, join: Values.Linejoin? = nil) -> Polyline {

        var copy = self
        
        copy = copy.mutate(stroke: .init(color, context: .tainted(.html)))
        
        if let width = width {
            copy = copy.mutate(strokewidth: .init(width, context: .trusted))
        }
        
        if let opacity = opacity {
            copy = copy.mutate(strokeopacity: .init(opacity, context: .trusted))
        }
        
        if let cap = cap {
            copy = copy.mutate(strokelinecap: .init(cap.rawValue, context: .trusted))
        }
        
        if let join = join {
            copy = copy.mutate(strokelinejoin: .init(join.rawValue, context: .trusted))
        }
        
        return copy
    }
    
    public func points(_ value: String) -> Polyline {
        return self.mutate(points: .init(value, context: .tainted(.html)))
    }
    
    public func custom(key: String, value: String, context: EscapeContext = .tainted(.html)) -> Polyline {
        return mutate(key: key, value: .init(value, context: context))
    }
    
    public func custom(key: String, value: Int) -> Polyline {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Double) -> Polyline {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Bool) -> Polyline {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Float) -> Polyline {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: EnvironmentValue, context: EscapeContext = .tainted(.html)) -> Polyline {
        return mutate(key: key, value: .init(value, context: context))
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

    internal var attributes: OrderedDictionary<String, AttributeData>?

    internal var content: [Content]
    
    internal var context: EscapeContext

    /// Create a path.
    ///
    /// - Parameter content: The path's content.
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        
        self.context = .tainted(.html)
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, AttributeData>? = nil, context: EscapeContext = .tainted(.html), content: [Content] = []) {
        
        self.attributes = attributes
        self.context = context
        self.content = content
    }
    
    public func modify(if condition: Bool, use strategy: MergeStrategy = .replacing, element: (Path) -> Path) -> Path {
        
        if condition {

            switch strategy {
            case .combining:
                return self.combine(element(self))
                
            case .replacing:
                return self.replace(element(self))
            }
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, use strategy: MergeStrategy = .replacing, element: (Path, T) -> Path) -> Path {
        
        guard let value = value else {
            return self
        }
        
        switch strategy {
        case .combining:
            return self.combine(element(self, value as T))
            
        case .replacing:
            return self.replace(element(self, value as T))
        }
    }
}

extension Path: GlobalVectorAttributes, DrawAttribute {
    
    public func id(_ value: String) -> Path {
        return mutate(id: .init(value, context: .tainted(.html)))
    }
    
    public func tabIndex(_ value: Int) -> Path {
        return mutate(tabindex: .init(value, context: .trusted))
    }
    
    public func `class`(_ names: [String]) -> Path {
        return self.mutate(class: .init(EnumeratedList(values: names, separator: " "), context: .tainted(.html)))
    }
    
    public func `class`(_ names: String...) -> Path {
        return self.mutate(class: .init(EnumeratedList(values: names, separator: " "), context: .tainted(.html)))
    }
    
    public func style(_ value: String) -> Path {
        return self.mutate(style: .init(value, context: .tainted(.css)))
    }

    public func fill(_ color: String, opacity: Double? = nil) -> Path {

        var copy = self
        
        copy = copy.mutate(fill: .init(color, context: .tainted(.html)))
        
        if let opacity = opacity {
            copy = copy.mutate(fillopacity: .init(opacity, context: .trusted))
        }
        
        return copy
    }
    
    public func stroke(_ color: String, width: Int? = nil, opacity: Double? = nil, cap: Values.Linecap? = nil, join: Values.Linejoin? = nil) -> Path {

        var copy = self
        
        copy = copy.mutate(stroke: .init(color, context: .tainted(.html)))
        
        if let width = width {
            copy = copy.mutate(strokewidth: .init(width, context: .trusted))
        }
        
        if let opacity = opacity {
            copy = copy.mutate(strokeopacity: .init(opacity, context: .trusted))
        }
        
        if let cap = cap {
            copy = copy.mutate(strokelinecap: .init(cap.rawValue, context: .trusted))
        }
        
        if let join = join {
            copy = copy.mutate(strokelinejoin: .init(join.rawValue, context: .trusted))
        }
        
        return copy
    }
    
    public func draw(_ value: String) -> Path {
        return self.mutate(draw: .init(value, context: .tainted(.html)))
    }
    
    public func custom(key: String, value: String, context: EscapeContext = .tainted(.html)) -> Path {
        return mutate(key: key, value: .init(value, context: context))
    }
    
    public func custom(key: String, value: Int) -> Path {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Double) -> Path {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Bool) -> Path {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Float) -> Path {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: EnvironmentValue, context: EscapeContext = .tainted(.html)) -> Path {
        return mutate(key: key, value: .init(value, context: context))
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

    internal var attributes: OrderedDictionary<String, AttributeData>?

    internal var content: [Content]
    
    internal var context: EscapeContext

    /// Create a group.
    ///
    /// - Parameter content: The group's content.
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        
        self.context = .tainted(.html)
        self.content = content()
    }

    internal init(attributes: OrderedDictionary<String, AttributeData>?, context: EscapeContext, content: [Content]) {
        
        self.attributes = attributes
        self.context = context
        self.content = content
    }
    
    public func modify(if condition: Bool, use strategy: MergeStrategy = .replacing, element: (Group) -> Group) -> Group {
        
        if condition {

            switch strategy {
            case .combining:
                return self.combine(element(self))
                
            case .replacing:
                return self.replace(element(self))
            }
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, use strategy: MergeStrategy = .replacing, element: (Group, T) -> Group) -> Group {
        
        guard let value = value else {
            return self
        }
        
        switch strategy {
        case .combining:
            return self.combine(element(self, value as T))
            
        case .replacing:
            return self.replace(element(self, value as T))
        }
    }
}

extension Group: GlobalVectorAttributes {

    public func id(_ value: String) -> Group {
        return mutate(id: .init(value, context: .tainted(.html)))
    }

    public func tabIndex(_ value: Int) -> Group {
        return mutate(tabindex: .init(value, context: .trusted))
    }

    public func `class`(_ names: [String]) -> Group {
        return self.mutate(class: .init(EnumeratedList(values: names, separator: " "), context: .tainted(.html)))
    }
    
    public func `class`(_ names: String...) -> Group {
        return self.mutate(class: .init(EnumeratedList(values: names, separator: " "), context: .tainted(.html)))
    }

    public func style(_ value: String) -> Group {
        return self.mutate(style: .init(value, context: .tainted(.css)))
    }

    public func fill(_ color: String, opacity: Double? = nil) -> Group {

        var copy = self
        
        copy = copy.mutate(fill: .init(color, context: .tainted(.html)))
        
        if let opacity = opacity {
            copy = copy.mutate(fillopacity: .init(opacity, context: .trusted))
        }
        
        return copy
    }
    
    public func stroke(_ color: String, width: Int? = nil, opacity: Double? = nil, cap: Values.Linecap? = nil, join: Values.Linejoin? = nil) -> Group {

        var copy = self
        
        copy = copy.mutate(stroke: .init(color, context: .tainted(.html)))
        
        if let width = width {
            copy = copy.mutate(strokewidth: .init(width, context: .trusted))
        }
        
        if let opacity = opacity {
            copy = copy.mutate(strokeopacity: .init(opacity, context: .trusted))
        }
        
        if let cap = cap {
            copy = copy.mutate(strokelinecap: .init(cap.rawValue, context: .trusted))
        }
        
        if let join = join {
            copy = copy.mutate(strokelinejoin: .init(join.rawValue, context: .trusted))
        }
        
        return copy
    }
    
    public func custom(key: String, value: String, context: EscapeContext = .tainted(.html)) -> Group {
        return mutate(key: key, value: .init(value, context: context))
    }
    
    public func custom(key: String, value: Int) -> Group {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Double) -> Group {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Bool) -> Group {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Float) -> Group {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: EnvironmentValue, context: EscapeContext = .tainted(.html)) -> Group {
        return mutate(key: key, value: .init(value, context: context))
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

    internal var attributes: OrderedDictionary<String, AttributeData>?

    internal var content: [Content]
    
    internal var context: EscapeContext

    /// Create a use.
    ///
    /// - Parameter content: The use's content.
    public init(@ContentBuilder<Content> content: () -> [Content]) {
        
        self.context = .tainted(.html)
        self.content = content()
    }
    
    internal init(attributes: OrderedDictionary<String, AttributeData>? = nil, context: EscapeContext = .tainted(.html), content: [Content] = []) {
        
        self.attributes = attributes
        self.context = context
        self.content = content
    }
    
    public func modify(if condition: Bool, use strategy: MergeStrategy = .replacing, element: (Use) -> Use) -> Use {
        
        if condition {

            switch strategy {
            case .combining:
                return self.combine(element(self))
                
            case .replacing:
                return self.replace(element(self))
            }
        }
        
        return self
    }
    
    public func modify<T>(unwrap value: T?, use strategy: MergeStrategy = .replacing, element: (Use, T) -> Use) -> Use {
        
        guard let value = value else {
            return self
        }
        
        switch strategy {
        case .combining:
            return self.combine(element(self, value as T))
            
        case .replacing:
            return self.replace(element(self, value as T))
        }
    }
}

extension Use: GlobalVectorAttributes, ReferenceAttribute, WidthAttribute, HeightAttribute, PositionPointAttribute {

    public func id(_ value: String) -> Use {
        return mutate(id: .init(value, context: .tainted(.html)))
    }
    
    public func tabIndex(_ value: Int) -> Use {
        return mutate(tabindex: .init(value, context: .trusted))
    }
    
    public func reference(_ value: String) -> Use {
        return self.mutate(href: .init(value, context: .tainted(.url)))
    }
    
    public func position(x: Int, y: Int) -> Use {
        return self.mutate(x: .init(x, context: .trusted)).mutate(y: .init(x, context: .trusted))
    }
    
    public func position(x: Double, y: Double) -> Use {
        return self.mutate(x: .init(x, context: .trusted)).mutate(y: .init(x, context: .trusted))
    }
    
    public func position(_ point: UnitPoint) -> Use {
        return self.mutate(x: .init(point.x, context: .trusted)).mutate(y: .init(point.y, context: .trusted))
    }
    
    public func width(_ size: Int) -> Use {
        return self.mutate(width: .init(size, context: .trusted))
    }
    
    public func height(_ size: Int) -> Use {
        return self.mutate(height: .init(size, context: .trusted))
    }
    
    public func `class`(_ names: [String]) -> Use {
        return self.mutate(class: .init(EnumeratedList(values: names, separator: " "), context: .tainted(.html)))
    }
    
    public func `class`(_ names: String...) -> Use {
        return self.mutate(class: .init(EnumeratedList(values: names, separator: " "), context: .tainted(.html)))
    }
    
    public func style(_ value: String) -> Use {
        return self.mutate(style: .init(value, context: .tainted(.css)))
    }
    
    public func fill(_ color: String, opacity: Double? = nil) -> Use {

        var copy = self
        
        copy = copy.mutate(fill: .init(color, context: .tainted(.html)))
        
        if let opacity = opacity {
            copy = copy.mutate(fillopacity: .init(opacity, context: .trusted))
        }
        
        return copy
    }
    
    public func stroke(_ color: String, width: Int? = nil, opacity: Double? = nil, cap: Values.Linecap? = nil, join: Values.Linejoin? = nil) -> Use {

        var copy = self
        
        copy = copy.mutate(stroke: .init(color, context: .tainted(.html)))
        
        if let width = width {
            copy = copy.mutate(strokewidth: .init(width, context: .trusted))
        }
        
        if let opacity = opacity {
            copy = copy.mutate(strokeopacity: .init(opacity, context: .trusted))
        }
        
        if let cap = cap {
            copy = copy.mutate(strokelinecap: .init(cap.rawValue, context: .trusted))
        }
        
        if let join = join {
            copy = copy.mutate(strokelinejoin: .init(join.rawValue, context: .trusted))
        }
        
        return copy
    }
    
    public func custom(key: String, value: String, context: EscapeContext = .tainted(.html)) -> Use {
        return mutate(key: key, value: .init(value, context: context))
    }
    
    public func custom(key: String, value: Int) -> Use {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Double) -> Use {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Bool) -> Use {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: Float) -> Use {
        return mutate(key: key, value: .init(value, context: .trusted))
    }
    
    public func custom(key: String, value: EnvironmentValue, context: EscapeContext = .tainted(.html)) -> Use {
        return mutate(key: key, value: .init(value, context: context))
    }
}
