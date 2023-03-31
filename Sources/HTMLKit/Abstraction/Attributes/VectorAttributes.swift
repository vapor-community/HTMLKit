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
public protocol DrawAttribute: Attribute {

    /// The function represents the html-attribute 'd'.
    ///
    /// ```html
    /// <tag d="" />
    /// ```
    func draw(_ value: String) -> Self
}

extension DrawAttribute where Self: ContentNode {

    internal func mutate(draw value: String) -> Self {
        return self.mutate(key: "d", value: value)
    }
}


/// The protocol provides the element with the fill handler.
public protocol FillAttribute: Attribute {
    
    /// The function represents the html-attribute 'fill'.
    ///
    /// ```html
    /// <tag fill="" />
    /// ```
    func fill(_ value: String) -> Self
}

extension FillAttribute where Self: ContentNode {
    
    internal func mutate(fill value: String) -> Self {
        return self.mutate(key: "fill", value: value)
    }
}

/// The protocol provides the element with the fill-opacity handler.
public protocol FillOpacityAttribute: Attribute {
    
    /// The function represents the html-attribute 'fill-opacity"'.
    ///
    /// ```html
    /// <tag fill-opacity="" />
    /// ```
    func fillOpacity(_ value: Double) -> Self
}

extension FillOpacityAttribute where Self: ContentNode {
    
    internal func mutate(fillopacity value: Double) -> Self {
        return self.mutate(key: "fill-opacity", value: value)
    }
}

/// The protocol provides the element with the stroke handler.
public protocol StrokeAttribute: Attribute {
    
    /// The function represents the html-attribute 'stroke'.
    ///
    /// ```html
    /// <tag stroke="" />
    /// ```
    func stroke(_ value: String) -> Self
}

extension StrokeAttribute where Self: ContentNode {
    
    internal func mutate(stroke value: String) -> Self {
        return self.mutate(key: "stroke", value: value)
    }
}

/// The protocol provides the element with the stroke-width handler.
public protocol StrokeWidthAttribute: Attribute {
    
    /// The function represents the html-attribute 'stroke-width'.
    ///
    /// ```html
    /// <tag stroke-width="" />
    /// ```
    func strokeWidth(_ size: Int) -> Self
}

extension StrokeWidthAttribute where Self: ContentNode {
    
    internal func mutate(strokewidth value: Int) -> Self {
        return self.mutate(key: "stroke-width", value: value)
    }
}

/// The protocol provides the element with the stroke-opacity handler.
public protocol StrokeOpacityAttribute: Attribute {
    
    /// The function represents the html-attribute 'stroke-opacity'.
    ///
    /// ```html
    /// <tag stroke-opacity="" />
    /// ```
    func strokeOpacity(_ value: Double) -> Self
}

extension StrokeOpacityAttribute where Self: ContentNode {
    
    internal func mutate(strokeopacity value: Double) -> Self {
        return self.mutate(key: "stroke-opacity", value: value)
    }
}

/// The protocol provides the element with the stroke-linecap handler.
public protocol StrokeLineCapAttribute: Attribute {
    
    /// The function represents the html-attribute 'stroke-linecap'.
    ///
    /// ```html
    /// <tag stroke-linecap="" />
    /// ```
    func strokeLineCap(_ value: Values.Linecap) -> Self
}

extension StrokeLineCapAttribute where Self: ContentNode {
    
    internal func mutate(strokelinecap value: String) -> Self {
        return self.mutate(key: "stroke-linecap", value: value)
    }
}

/// The protocol provides the element with the stroke-linejoin handler.
public protocol StrokeLineJoinAttribute: Attribute {
    
    /// The function represents the html-attribute 'stroke-linejoin'.
    ///
    /// ```html
    /// <tag stroke-linejoin="" />
    /// ```
    func strokeLineJoin(_ value: Values.Linejoin) -> Self
}

extension StrokeLineJoinAttribute where Self: ContentNode {
    
    internal func mutate(strokelinejoin value: String) -> Self {
        return self.mutate(key: "stroke-linejoin", value: value)
    }
}

/// The protocol provides the element with the radius handler.
public protocol RadiusAttribute: Attribute {
    
    /// The function represents the html-attribute 'r'.
    ///
    /// ```html
    /// <tag r="" />
    /// ```
    func radius(_ size: Int) -> Self
}

extension RadiusAttribute where Self: ContentNode {
    
    internal func mutate(radius value: Int) -> Self {
        return self.mutate(key: "r", value: value)
    }
}

/// The protocol provides the element with the radius handler.
public protocol PositionPointAttribute: Attribute {
    
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
public protocol RadiusPointAttribute: Attribute {
    
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
public protocol CenterPointAttribute: Attribute {
    
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
public protocol ViewBoxAttribute: Attribute {
    
    /// The function represents the html-attribute 'viewbox'.
    ///
    /// ```html
    /// <tag viewbox="" />
    /// ```
    func viewBox(_ value: String) -> Self
}

extension ViewBoxAttribute where Self: ContentNode {
    
    internal func mutate(viewbox value: String) -> Self {
        return self.mutate(key: "viewbox", value: value)
    }
}

/// The protocol provides the element with the viewbox handler.
public protocol NamespaceAttribute: Attribute {
    
    /// The function represents the html-attribute 'viewbox'.
    ///
    /// ```html
    /// <tag viewbox="" />
    /// ```
    func namespace(_ value: String) -> Self
}

extension NamespaceAttribute where Self: ContentNode {
    
    internal func mutate(namespace value: String) -> Self {
        return self.mutate(key: "xmlns", value: value)
    }
}
