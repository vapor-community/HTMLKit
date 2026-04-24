import OrderedCollections

/// The alias combines the global attributes of the vector attributes.
@_documentation(visibility: internal)
public typealias GlobalVectorAttributes = IdentifierAttribute & TabulatorAttribute & ClassAttribute & StyleAttribute & FillAttribute & StrokeAttribute

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

    internal func mutate(draw value: AttributeData) -> Self {
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
    ///     .fill("black", opacity: 0.5)
    /// }
    /// ```
    ///
    /// - Parameter color: The color to fill shape with.
    /// - Parameter opacity: The opacity to apply.
    ///
    /// - Returns: The element
    func fill(_ color: String, opacity: Double?) -> Self
}

extension FillAttribute where Self: ContentNode {
    
    internal func mutate(fill value: AttributeData) -> Self {
        return self.mutate(key: "fill", value: value)
    }
    
    internal func mutate(fillopacity value: AttributeData) -> Self {
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
    ///     .stroke("#000000", width: 1, opacity: 0.5, cap: .square, join: .bevel)
    /// }
    /// ```
    ///
    /// - Parameter color: The color to fill the stroke with.
    /// - Parameter width: The thickness to apply to the stroke.
    /// - Parameter opacity: The level to apply to the stroke.
    /// - Parameter cap: The shape to end the stroke.
    /// - Parameter join: The shape when two lines meet.
    ///
    /// - Returns: The element    
    func stroke(_ color: String, width: Int?, opacity: Double?, cap: Values.Linecap?, join: Values.Linejoin?) -> Self
}

extension StrokeAttribute where Self: ContentNode {
    
    internal func mutate(stroke value: AttributeData) -> Self {
        return self.mutate(key: "stroke", value: value)
    }
    
    internal func mutate(strokewidth value: AttributeData) -> Self {
        return self.mutate(key: "stroke-width", value: value)
    }
    
    internal func mutate(strokeopacity value: AttributeData) -> Self {
        return self.mutate(key: "stroke-opacity", value: value)
    }
    
    internal func mutate(strokelinecap value: AttributeData) -> Self {
        return self.mutate(key: "stroke-linecap", value: value)
    }
    
    internal func mutate(strokelinejoin value: AttributeData) -> Self {
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
    
    internal func mutate(radius value: AttributeData) -> Self {
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
    
    internal func mutate(x value: AttributeData) -> Self {
        return self.mutate(key: "x", value: value)
    }
    
    internal func mutate(y value: AttributeData) -> Self {
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
    
    internal func mutate(rx value: AttributeData) -> Self {
        return self.mutate(key: "rx", value: value)
    }
    
    internal func mutate(ry value: AttributeData) -> Self {
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
    
    internal func mutate(cx value: AttributeData) -> Self {
        return self.mutate(key: "cx", value: value)
    }
    
    internal func mutate(cy value: AttributeData) -> Self {
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
    
    internal func mutate(viewbox value: AttributeData) -> Self {
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
    
    internal func mutate(namespace value: AttributeData) -> Self {
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
    
    internal func mutate(points value: AttributeData) -> Self {
        return self.mutate(key: "points", value: value)
    }
}
