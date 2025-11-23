/// A type represents a unit point.
/// 
/// The point is used to define a position by two coordinates.
/// 
/// ```swift
/// Vector {
///     Circle {
///     }
///     .center(UnitPoint(x: 50, y: 50))
/// }
/// ```
public struct UnitPoint {
    
    /// An enumeration of potential point formats.
    public enum PointFormat {
        
        /// Indicates an absolute value.
        case absolute
            
        /// Indicates an relative value.
        case relative
        
        /// Returns the string representation based on the format.
        func string(from value: Int) -> String {
            
            switch self {
            case .absolute:
                return "\(value)"
                
            case .relative:
                return "\(value)%"
            }
        }
        
        /// Returns the string representation based on the format.
        func string(from value: Double) -> String {
            
            switch self {
            case .absolute:
                return "\(value)"
                
            case .relative:
                return "\(value)%"
            }
        }
    }
    
    /// The horizontal coordinate of the point.
    internal var x: String
    
    /// The vertical coordinate of the point.
    internal var y: String
    
    /// Create a point.
    /// 
    /// - Parameters:
    ///   - x: The horizontal coordinate to place the point.
    ///   - y: The vertical coordinate to place the point.
    ///   - format: Whether the coordinates should be relative.
    public init(x: Double, y: Double, format: PointFormat = .absolute) {
        
        self.x = format.string(from: x)
        self.y = format.string(from: y)
    }
    
    /// Create a point.
    /// 
    /// - Parameters:
    ///   - x: The horizontal coordinate to place the point.
    ///   - y: The vertical coordinate to place the point.
    ///   - format: Whether the coordinates should be relative.
    public init(x: Int, y: Int, format: PointFormat = .absolute) {

        self.x = format.string(from: x)
        self.y = format.string(from: y)
    }
}
