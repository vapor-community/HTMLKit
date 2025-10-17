public struct UnitPoint {
    
    /// A enumeration of potential point formats
    public enum PointFormat {
        
        /// Indicates an absolute value.
        case absolute
            
        /// Indicates an relative value.
        case relative
    }
    
    /// The horizontal position of the point
    internal var x: String
    
    /// The vertical position of the point
    internal var y: String
    
    /// Create a point.
    /// 
    /// - Parameters:
    ///   - x: The horizontal coordinate to place the point.
    ///   - y: The vertical coordinate to place the point.
    ///   - format: Whether the coordinates should be relative.
    public init(x: Double, y: Double, format: PointFormat = .absolute) {
    
        if case format = .relative {
            
            self.x = "\(x)%"
            self.y = "\(y)%"
            
        } else {
            
            self.x = "\(x)"
            self.y = "\(y)"
        }
    }
    
    /// Create a point.
    /// 
    /// - Parameters:
    ///   - x: The horizontal coordinate to place the point.
    ///   - y: The vertical coordinate to place the point.
    ///   - format: Whether the coordinates should be relative.
    public init(x: Int, y: Int, format: PointFormat = .absolute) {
        
        if case format = .relative {
            
            self.x = "\(x)%"
            self.y = "\(y)%"
            
        } else {
            
            self.x = "\(x)"
            self.y = "\(y)"
        }
    }
}
