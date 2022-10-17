/*
 Abstract:
 The file contains the protocols for the vector html-attributes.

 Note:
 If you about to add something to the file, stick to the official documentation to keep the code consistent.
 */

import OrderedCollections

/// The alias combines the global attributes of the vector attributes.
public typealias GlobalVectorAttributes = IdentifierAttribute & TabulatorAttribute & ClassAttribute & StyleAttribute & FillAttribute & FillOpacityAttribute & StrokeAttribute & StrokeWidthAttribute & StrokeOpacityAttribute & StrokeLineCapAttribute & StrokeLineJoinAttribute

/// The protocol provides the element with the draw handler.
public protocol DrawAttribute: AnyAttribute {

    /// The function represents the html-attribute 'd'.
    ///
    /// ```html
    /// <tag d="" />
    /// ```
    func draw(_ value: String) -> Self
}

extension DrawAttribute {

    internal var key: String { "d" }
}

extension DrawAttribute where Self: ContentNode {

    internal func mutate(draw value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}


/// The protocol provides the element with the fill handler.
public protocol FillAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'fill'.
    ///
    /// ```html
    /// <tag fill="" />
    /// ```
    func fill(_ value: String) -> Self
}

extension FillAttribute {
    
    internal var key: String { "fill" }
}

extension FillAttribute where Self: ContentNode {
    
    internal func mutate(fill value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the fill-opacity handler.
public protocol FillOpacityAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'fill-opacity"'.
    ///
    /// ```html
    /// <tag fill-opacity="" />
    /// ```
    func fillOpacity(_ value: Double) -> Self
}

extension FillOpacityAttribute {
    
    internal var key: String { "fill-opacity" }
}

extension FillOpacityAttribute where Self: ContentNode {
    
    internal func mutate(fillopacity value: Double) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the stroke handler.
public protocol StrokeAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'stroke'.
    ///
    /// ```html
    /// <tag stroke="" />
    /// ```
    func stroke(_ value: String) -> Self
}

extension StrokeAttribute {
    
    internal var key: String { "stroke" }
}

extension StrokeAttribute where Self: ContentNode {
    
    internal func mutate(stroke value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the stroke-width handler.
public protocol StrokeWidthAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'stroke-width'.
    ///
    /// ```html
    /// <tag stroke-width="" />
    /// ```
    func strokeWidth(_ size: Int) -> Self
}

extension StrokeWidthAttribute {
    
    internal var key: String { "stroke-width" }
}

extension StrokeWidthAttribute where Self: ContentNode {
    
    internal func mutate(strokewidth value: Int) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the stroke-opacity handler.
public protocol StrokeOpacityAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'stroke-opacity'.
    ///
    /// ```html
    /// <tag stroke-opacity="" />
    /// ```
    func strokeOpacity(_ value: Double) -> Self
}

extension StrokeOpacityAttribute {
    
    internal var key: String { "stroke-opacity" }
}

extension StrokeOpacityAttribute where Self: ContentNode {
    
    internal func mutate(strokeopacity value: Double) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the stroke-linecap handler.
public protocol StrokeLineCapAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'stroke-linecap'.
    ///
    /// ```html
    /// <tag stroke-linecap="" />
    /// ```
    func strokeLineCap(_ value: Values.Linecap) -> Self
}

extension StrokeLineCapAttribute {
    
    internal var key: String { "stroke-linecap" }
}

extension StrokeLineCapAttribute where Self: ContentNode {
    
    internal func mutate(strokelinecap value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the stroke-linejoin handler.
public protocol StrokeLineJoinAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'stroke-linejoin'.
    ///
    /// ```html
    /// <tag stroke-linejoin="" />
    /// ```
    func strokeLineJoin(_ value: Values.Linejoin) -> Self
}

extension StrokeLineJoinAttribute {
    
    internal var key: String { "stroke-linejoin" }
}

extension StrokeLineJoinAttribute where Self: ContentNode {
    
    internal func mutate(strokelinejoin value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the radius handler.
public protocol RadiusAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'r'.
    ///
    /// ```html
    /// <tag r="" />
    /// ```
    func radius(_ size: Int) -> Self
}

extension RadiusAttribute {
    
    internal var key: String { "r" }
}

extension RadiusAttribute where Self: ContentNode {
    
    internal func mutate(radius value: Int) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}

/// The protocol provides the element with the radius handler.
public protocol PositionPointAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'x' and 'y'.
    ///
    /// ```html
    /// <tag x="" y="" />
    /// ```
    func positionPoint(_ point: Geometrics.Point) -> Self
}

extension PositionPointAttribute where Self: ContentNode {
    
    internal func mutate(radius: Geometrics.Point) -> Self {
        
        guard var attributes = self.attributes else {
            
            var attributes = OrderedDictionary<String, Any>()
            attributes["x"] = radius.x
            attributes["y"] = radius.y
            
            return .init(attributes: attributes, content: content)
        }
        
        attributes["x"] = radius.x
        attributes["y"] = radius.y
        
        return .init(attributes: attributes, content: content)
    }
}

/// The protocol provides the element with the radius handler.
public protocol RadiusPointAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'rx' and 'ry'.
    ///
    /// ```html
    /// <tag rx="" ry="" />
    /// ```
    func radiusPoint(_ point: Geometrics.Point) -> Self
}

extension RadiusPointAttribute where Self: ContentNode {
    
    internal func mutate(radius: Geometrics.Point) -> Self {
        
        guard var attributes = self.attributes else {
            
            var attributes = OrderedDictionary<String, Any>()
            attributes["rx"] = radius.x
            attributes["ry"] = radius.y
            
            return .init(attributes: attributes, content: content)
        }
        
        attributes["rx"] = radius.x
        attributes["ry"] = radius.y
        
        return .init(attributes: attributes, content: content)
    }
}

/// The protocol provides the element with the radius handler.
public protocol CenterPointAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'cx' and 'cy'.
    ///
    /// ```html
    /// <tag cx="" cy="" />
    /// ```
    func centerPoint(_ point: Geometrics.Point) -> Self
}

extension CenterPointAttribute where Self: ContentNode {
    
    internal func mutate(centerpoint: Geometrics.Point) -> Self {
        
        guard var attributes = self.attributes else {
            
            var attributes = OrderedDictionary<String, Any>()
            attributes["cx"] = centerpoint.x
            attributes["cy"] = centerpoint.y
            
            return .init(attributes: attributes, content: content)
        }
        
        attributes["cx"] = centerpoint.x
        attributes["cy"] = centerpoint.y
        
        return .init(attributes: attributes, content: content)
    }
}

/// The protocol provides the element with the viewbox handler.
public protocol ViewBoxAttribute: AnyAttribute {
    
    /// The function represents the html-attribute 'viewbox'.
    ///
    /// ```html
    /// <tag viewbox="" />
    /// ```
    func viewBox(_ value: String) -> Self
}

extension ViewBoxAttribute {
    
    internal var key: String { "viewbox" }
}

extension ViewBoxAttribute where Self: ContentNode {
    
    internal func mutate(viewbox value: String) -> Self {
        return self.mutate(key: self.key, value: value)
    }
}
