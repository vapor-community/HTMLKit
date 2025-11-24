import OrderedCollections

/// The alias combines the global attributes of the vector attributes.
@_documentation(visibility: internal)
public typealias GlobalVectorAttributes = IdentifierAttribute & TabulatorAttribute & ClassAttribute & StyleAttribute & FillAttribute & FillOpacityAttribute & StrokeAttribute & StrokeWidthAttribute & StrokeOpacityAttribute & StrokeLineCapAttribute & StrokeLineJoinAttribute

/// A type that provides the `draw` modifier.
@_documentation(visibility: internal)
public protocol DrawAttribute: Attribute {

    /// Draw a path.
    ///
    /// ```swift
    /// Vector {
    ///     Path {
    ///     }
    ///     .draw("M150...")
    /// }
    /// ```
    /// - Parameter path: The path to draw.
    ///
    /// - Returns: The element
    func draw(_ path: String) -> Self
}

extension DrawAttribute where Self: ContentNode {

    internal func mutate(draw value: String) -> Self {
        return self.mutate(key: "d", value: value)
    }
}

/// A type that provides the `fill` modifier.
@_documentation(visibility: internal)
public protocol FillAttribute: Attribute {
    
    /// Fill the shape.
    ///
    /// ```swift
    /// Vector {
    ///     Circle {
    ///     }
    ///     .fill("black")
    /// }
    /// ```
    ///
    /// - Parameter color: The color to fill shape with.
    ///
    /// - Returns: The element
    func fill(_ color: String) -> Self
}

extension FillAttribute where Self: ContentNode {
    
    internal func mutate(fill value: String) -> Self {
        return self.mutate(key: "fill", value: value)
    }
}

/// A type that provides the `fillOpacity` modifier.
@_documentation(visibility: internal)
public protocol FillOpacityAttribute: Attribute {
    
    /// Define the opacity of the filling.
    ///
    /// ```swift
    /// Vector {
    ///     Circle {
    ///     }
    ///     .fillOpacity(0.5)
    /// }
    /// ```
    ///
    /// - Parameter value: The opacity to apply.
    ///
    /// - Returns: The element
    func fillOpacity(_ value: Double) -> Self
}

extension FillOpacityAttribute where Self: ContentNode {
    
    internal func mutate(fillopacity value: Double) -> Self {
        return self.mutate(key: "fill-opacity", value: value)
    }
}

/// A type that provides the `stroke` modifier.
@_documentation(visibility: internal)
public protocol StrokeAttribute: Attribute {
    
    /// Set the stroke for the shape.
    ///
    /// ```swift
    /// Vector {
    ///     Circle {
    ///     }
    ///     .stroke("#000000")
    /// }
    /// ```
    ///
    /// - Parameter color: The color to fill the stroke with.
    ///
    /// - Returns: The element
    func stroke(_ color: String) -> Self
}

extension StrokeAttribute where Self: ContentNode {
    
    internal func mutate(stroke value: String) -> Self {
        return self.mutate(key: "stroke", value: value)
    }
}

/// A type that provides the `strokeWidth` modifier.
@_documentation(visibility: internal)
public protocol StrokeWidthAttribute: Attribute {
    
    /// Set the thickness of the stroke.
    ///
    /// ```swift
    /// Vector {
    ///     Circle {
    ///     }
    ///     .strokeWidth(3)
    /// }
    /// ```
    ///
    /// - Parameter size: The thickness to apply to the stroke.
    ///
    /// - Returns: The element
    func strokeWidth(_ size: Int) -> Self
}

extension StrokeWidthAttribute where Self: ContentNode {
    
    internal func mutate(strokewidth value: Int) -> Self {
        return self.mutate(key: "stroke-width", value: value)
    }
}

/// A type that provides the `strokeOpacity` modifier.
@_documentation(visibility: internal)
public protocol StrokeOpacityAttribute: Attribute {
    
    /// Set the opacity for the stroke.
    ///
    /// ```swift
    /// Vector {
    ///     Line {
    ///     }
    ///     .strokeOpacity(0.8)
    /// }
    /// ```
    ///
    /// - Parameter value: The level to apply to the stroke.
    ///
    /// - Returns: The element
    func strokeOpacity(_ value: Double) -> Self
}

extension StrokeOpacityAttribute where Self: ContentNode {
    
    internal func mutate(strokeopacity value: Double) -> Self {
        return self.mutate(key: "stroke-opacity", value: value)
    }
}

/// A type that provides the `strokeLineCap` modifier.
@_documentation(visibility: internal)
public protocol StrokeLineCapAttribute: Attribute {
    
    /// Set the shape of the stroke end.
    ///
    /// ```swift
    /// Vector {
    ///     Line {
    ///     }
    ///     .strokeLineCap(.butt)
    /// }
    /// ```
    ///
    /// - Parameter value: The shape to end the stroke.
    ///
    /// - Returns: The element
    func strokeLineCap(_ value: Values.Linecap) -> Self
}

extension StrokeLineCapAttribute where Self: ContentNode {
    
    internal func mutate(strokelinecap value: String) -> Self {
        return self.mutate(key: "stroke-linecap", value: value)
    }
}

/// A type that provides the `strokeLineJoin` modifier.
@_documentation(visibility: internal)
public protocol StrokeLineJoinAttribute: Attribute {
    
    /// Set the shape of the stroke join.
    ///
    /// ```swift
    /// Vector {
    ///     Line {
    ///     }
    ///     .strokeLineJoin(.miter)
    /// }
    /// ```
    ///
    /// - Parameter value: The shape when two lines meet.
    ///
    /// - Returns: The element
    func strokeLineJoin(_ value: Values.Linejoin) -> Self
}

extension StrokeLineJoinAttribute where Self: ContentNode {
    
    internal func mutate(strokelinejoin value: String) -> Self {
        return self.mutate(key: "stroke-linejoin", value: value)
    }
}

/// A type that provides the `radius` modifier.
@_documentation(visibility: internal)
public protocol RadiusAttribute: Attribute {
    
    /// Specify a radius for the circle.
    ///
    /// ```swift
    /// Vector {
    ///     Circle {
    ///     }
    ///     .radius(30)
    /// }
    /// ```
    ///
    /// - Parameter size: The size of the radius to apply.
    ///
    /// - Returns: The element
    func radius(_ size: Int) -> Self
}

extension RadiusAttribute where Self: ContentNode {
    
    internal func mutate(radius value: Int) -> Self {
        return self.mutate(key: "r", value: value)
    }
}

/// A type that provides the `positionPoint` modifier.
@_documentation(visibility: internal)
public protocol PositionPointAttribute: Attribute {
    
    /// Set the position of the shape.
    ///
    /// ```Swift
    /// Vector {
    ///     Rectangle {
    ///     }
    ///     .position(x: 50, y: 50)
    /// }
    /// ```
    /// 
    /// - Parameters:
    ///   - x: The horizontal coordinate to position the shape.
    ///   - y: The vertical coordinate to position the shape
    ///
    /// - Returns: The element
    func position(x: Int, y: Int) -> Self
    
    /// Set the position of the shape.
    /// 
    /// ```Swift
    /// Vector {
    ///     Rectangle {
    ///     }
    ///     .position(x: 50.0, y: 50.0)
    /// }
    /// ```
    /// 
    /// - Parameters:
    ///   - x: The horizontal coordinate to position the shape.
    ///   - y: The vertical coordinate to position the shape
    /// 
    /// - Returns: The element
    func position(x: Double, y: Double) -> Self
    
    /// Set the position of the shape.
    ///
    /// ```Swift
    /// Vector {
    ///     Rectangle {
    ///     }
    ///     .position(UnitPoint(x: 50, y: 50))
    /// }
    /// ```
    /// - Parameter point: The coordinates to position the shape.
    ///
    /// - Returns: The element
    func position(_ point: UnitPoint) -> Self
}

extension PositionPointAttribute where Self: ContentNode {
    
    internal func mutate(x value: String) -> Self {
        return self.mutate(key: "x", value: value)
    }
    
    internal func mutate(y value: String) -> Self {
        return self.mutate(key: "y", value: value)
    }
}

/// A type that provides the `radiusPoint` modifier.
@_documentation(visibility: internal)
public protocol RadiusPointAttribute: Attribute {
    
    /// Apply a corner radius to the shape.
    ///
    /// ```swift
    /// Vector {
    ///     Rectangle {
    ///     }
    ///     .radius(x: 50, y: 50)
    /// }
    /// ```
    /// 
    /// - Parameters:
    ///   - x: The horizontal coordinate to round off corner.
    ///   - y: The vertical coordinate to round off corner.
    ///   
    /// - Returns: The element
    func radius(x: Int, y: Int) -> Self
    
    /// Apply a corner radius to the shape.
    ///
    /// ```swift
    /// Vector {
    ///     Rectangle {
    ///     }
    ///     .radius(x: 50, y: 50)
    /// }
    /// ```
    /// 
    /// - Parameters:
    ///   - x: The horizontal coordinate to round off corner.
    ///   - y: The vertical coordinate to round off corner.
    ///
    /// - Returns: The element
    func radius(x: Double, y: Double) -> Self
    
    /// Apply a corner radius to the shape.
    ///
    /// ```swift
    /// Vector {
    ///     Rectangle {
    ///     }
    ///     .radius(UnitPoint(x: 50, y: 50))
    /// }
    /// ```
    /// - Parameter point: The coordinates to round off corners.
    ///
    /// - Returns: The element
    func radius(_ point: UnitPoint) -> Self
}

extension RadiusPointAttribute where Self: ContentNode {
    
    internal func mutate(rx value: String) -> Self {
        return self.mutate(key: "rx", value: value)
    }
    
    internal func mutate(ry value: String) -> Self {
        return self.mutate(key: "ry", value: value)
    }
}

/// A type that provides the `centerPoint` modifier.
@_documentation(visibility: internal)
public protocol CenterPointAttribute: Attribute {
    
    /// Set the center point of the shape.
    ///
    /// ```swift
    /// Vector {
    ///     Circle {
    ///     }
    ///     .center(x: 50, y: 50)
    /// }
    /// ```
    /// 
    /// - Parameters:
    ///   - x: The horizontal coordinate to use as the center.
    ///   - y: The vertical coordinate to use as the center.
    /// 
    /// - Returns: The element

    func center(x: Int, y: Int) -> Self
    
    /// Set the center point of the shape.
    ///
    /// ```swift
    /// Vector {
    ///     Circle {
    ///     }
    ///     .center(x: 50.0, y: 50.0)
    /// }
    /// ```
    /// 
    /// - Parameters:
    ///   - x: The horizontal coordinate to use as the center.
    ///   - y: The vertical coordinate to use as the center.
    ///
    /// - Returns: The element
    func center(x: Double, y: Double) -> Self
    
    
    /// Set the center point of the shape.
    ///
    /// ```swift
    /// Vector {
    ///     Circle {
    ///     }
    ///     .center(UnitPoint(x: 50, y: 50))
    /// }
    /// ```
    /// - Parameter point: The coordinates to use as the center.
    ///
    /// - Returns: The element
    func center(_ point: UnitPoint) -> Self
}

extension CenterPointAttribute where Self: ContentNode {
    
    internal func mutate(cx value: String) -> Self {
        return self.mutate(key: "cx", value: value)
    }
    
    internal func mutate(cy value: String) -> Self {
        return self.mutate(key: "cy", value: value)
    }
}

/// A type that provides the `viewBox` modifier.
@_documentation(visibility: internal)
public protocol ViewBoxAttribute: Attribute {
    
    /// Set the view box for the vector.
    /// 
    /// ```swift
    /// Vector {
    /// }
    /// .viewBox(x: 0, y: 0, width: 400, height: 200")
    /// ```
    /// 
    /// - Parameters:
    ///   - x: The horizontal coordinate to use for the origin.
    ///   - y: The vertical coordinate to use for the origin.
    ///   - width: The width of the viewport
    ///   - height: The height of the viewport
    /// 
    /// - Returns: The element
    func viewBox(x: Int, y: Int, width: Int, height: Int) -> Self
    
    /// Set the view box for the vector.
    ///
    /// ```swift
    /// Vector {
    /// }
    /// .viewBox(x: 0.0, y: 0.0, width: 400.0, height: 200.0")
    /// ```
    /// 
    /// - Parameters:
    ///   - x: The horizontal coordinate to use for the origin.
    ///   - y: The vertical coordinate to use for the origin.
    ///   - width: The width of the viewport
    ///   - height: The height of the viewport
    /// 
    /// - Returns: The element
    func viewBox(x: Double, y: Double, width: Double, height: Double) -> Self
}

extension ViewBoxAttribute where Self: ContentNode {
    
    internal func mutate(viewbox value: String) -> Self {
        return self.mutate(key: "viewbox", value: value)
    }
}

/// A type that provides the `namespace` modifier.
@_documentation(visibility: internal)
public protocol NamespaceAttribute: Attribute {
    
    /// Specify the namespace for the vector.
    ///
    /// ```swift
    /// Vector {
    /// }
    /// .namespace("http://...")
    /// ```
    ///
    /// - Parameter url: The url to refer to.
    ///
    /// - Returns: The element
    func namespace(_ url: String) -> Self
}

extension NamespaceAttribute where Self: ContentNode {
    
    internal func mutate(namespace value: String) -> Self {
        return self.mutate(key: "xmlns", value: value)
    }
}

/// A type that provides the `points` modifier.
@_documentation(visibility: internal)
public protocol PointsAttribute: Attribute {
    
    /// Define a list of points.
    ///
    /// ```swift
    /// Vector {
    ///     Polyline {
    ///     }
    ///     .points("50, 25, 21...")
    /// }
    /// ```
    ///
    /// - Parameter value: The vertices used for the polyline.
    ///
    /// - Returns: The element
    func points(_ value: String) -> Self
}

extension PointsAttribute where Self: ContentNode {
    
    internal func mutate(points value: String) -> Self {
        return self.mutate(key: "points", value: value)
    }
}
