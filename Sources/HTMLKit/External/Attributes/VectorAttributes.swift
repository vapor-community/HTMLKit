/// ## Description
/// The file contains the basic attribute handlers.
///
/// ## Note
/// If you about to add something to the file, stick to the official documentation to keep the code consistent.
///
/// ## Authors
/// Mats Moll: https://github.com/matsmoll
/// Mattes Mohr: https://github.com/mattesmohr

import OrderedCollections

/// ## Description
/// The alias combines the global attributes.
///
/// ## References
public typealias GlobalVectorAttributes = IdentifierAttribute & TabulatorAttribute & ClassAttribute & StyleAttribute & FillAttribute & FillOpacityAttribute & StrokeAttribute & StrokeWidthAttribute & StrokeOpacityAttribute & StrokeLineCapAttribute & StrokeLineJoinAttribute

/// ## Description
/// The protocol provides the element with the fill handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-option-selected
///
public protocol FillAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func fill(_ value: String) -> Self
}

extension FillAttribute {
    
    internal var key: String { "fill" }
}

extension FillAttribute where Self: ContentNode {
    
    internal func mutate(fill value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

/// ## Description
/// The protocol provides the element with the fill-opacity handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-option-selected
///
public protocol FillOpacityAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func fillOpacity(_ value: Double) -> Self
}

extension FillOpacityAttribute {
    
    internal var key: String { "fill-opacity" }
}

extension FillOpacityAttribute where Self: ContentNode {
    
    internal func mutate(fillopacity value: Double) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

/// ## Description
/// The protocol provides the element with the stroke handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-option-selected
///
public protocol StrokeAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func stroke(_ value: String) -> Self
}

extension StrokeAttribute {
    
    internal var key: String { "stroke" }
}

extension StrokeAttribute where Self: ContentNode {
    
    internal func mutate(stroke value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

/// ## Description
/// The protocol provides the element with the stroke-width handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-option-selected
///
public protocol StrokeWidthAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func strokeWidth(_ size: Int) -> Self
}

extension StrokeWidthAttribute {
    
    internal var key: String { "stroke-width" }
}

extension StrokeWidthAttribute where Self: ContentNode {
    
    internal func mutate(strokewidth value: Int) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

/// ## Description
/// The protocol provides the element with the stroke-opacity handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-option-selected
///
public protocol StrokeOpacityAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func strokeOpacity(_ value: Double) -> Self
}

extension StrokeOpacityAttribute {
    
    internal var key: String { "stroke-opacity" }
}

extension StrokeOpacityAttribute where Self: ContentNode {
    
    internal func mutate(strokeopacity value: Double) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

/// ## Description
/// The protocol provides the element with the stroke-linecap handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-option-selected
///
public protocol StrokeLineCapAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func strokeLineCap(_ type: Linecap) -> Self
}

extension StrokeLineCapAttribute {
    
    internal var key: String { "stroke-linecap" }
}

extension StrokeLineCapAttribute where Self: ContentNode {
    
    internal func mutate(strokelinecap value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

/// ## Description
/// The protocol provides the element with the stroke-linejoin handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-option-selected
///
public protocol StrokeLineJoinAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func strokeLineJoin(_ type: Linejoin) -> Self
}

extension StrokeLineJoinAttribute {
    
    internal var key: String { "stroke-linejoin" }
}

extension StrokeLineJoinAttribute where Self: ContentNode {
    
    internal func mutate(strokelinejoin value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

/// ## Description
/// The protocol provides the element with the radius handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-option-selected
///
public protocol RadiusAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func radius(_ size: Int) -> Self
}

extension RadiusAttribute {
    
    internal var key: String { "r" }
}

extension RadiusAttribute where Self: ContentNode {
    
    internal func mutate(radius value: Int) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}

/// ## Description
/// The protocol provides the element with the radius handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-option-selected
///
public protocol PositionPointAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func positionPoint(_ point: Point) -> Self
}

extension PositionPointAttribute where Self: ContentNode {
    
    internal func mutate(radius: Point) -> Self {
        
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

/// ## Description
/// The protocol provides the element with the radius handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-option-selected
///
public protocol RadiusPointAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func radiusPoint(_ point: Point) -> Self
}

extension RadiusPointAttribute where Self: ContentNode {
    
    internal func mutate(radius: Point) -> Self {
        
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

/// ## Description
/// The protocol provides the element with the radius handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-option-selected
///
public protocol CenterPointAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func centerPoint(_ point: Point) -> Self
}

extension CenterPointAttribute where Self: ContentNode {
    
    internal func mutate(centerpoint: Point) -> Self {
        
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

/// ## Description
/// The protocol provides the element with the viewbox handler.
///
/// ## References
/// https://html.spec.whatwg.org/#attr-option-selected
///
public protocol ViewBoxAttribute: AnyAttribute {
    
    /// The func adds
    ///
    ///
    func viewBox(_ value: String) -> Self
}

extension ViewBoxAttribute {
    
    internal var key: String { "viewbox" }
}

extension ViewBoxAttribute where Self: ContentNode {
    
    internal func mutate(viewbox value: String) -> Self {
        
        guard var attributes = self.attributes else {
            return .init(attributes: set(key: key, value: value), content: content)
        }
        
        return .init(attributes: update(key: key, value: value, on: &attributes), content: content)
    }
}
