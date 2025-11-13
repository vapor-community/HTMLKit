/// A type that represents a size candidate.
/// 
/// ```swift
/// Image()
///     .sizes(SizeCandidate("100vw", condition: .maximum("100vw")), SizeCandidate("100vw"))
/// ```
public struct SizeCandidate {
    
    /// An enumeration of potential width conditions
    public enum SizeCondition {
        
        /// Specifies the maximum width.
        case maximum(String)
        
        /// Specifies the minimum width.
        case minimum(String)
        
        /// Specifies a landscape orientation
        case landscape
        
        /// Specifies a portrait orientation
        case portrait
        
        /// The raw representation of the type
        internal var rawValue: String {
            
            switch self {
            case .maximum(let width):
                return "(max-width: \(width))"
                
            case .minimum(let width):
                return "(min-width: \(width))"
                
            case .landscape:
                return "(orientation: landscape)"
                
            case .portrait:
                return "(orientation: portrait)"
            }
        }
    }
    
    /// The size of the candidate.
    internal let size: String
    
    /// The condition of the candidate.
    internal let condition: String?
    
    /// The raw representation of the type
    internal var rawValue: String {
        
        if let condition = self.condition {
            return "\(condition) \(size)"
        }
        
        return size
    }
    
    /// Create a size candidate.
    /// 
    /// - Parameters:
    ///   - size: The width to apply.
    public init(_ size: String) {
        
        self.size = size
        self.condition = nil
    }
    
    /// Create a size candidate.
    /// 
    /// - Parameters:
    ///   - size: The width to apply.
    ///   - condition: The width of the view at which the size should be applied.
    public init(_ size: String, condition: String) {
        
        self.size = size
        self.condition = condition
    }
    
    /// Create a size candidate.
    /// 
    /// - Parameters:
    ///   - size: The width to apply.
    ///   - condition: The width of the view at which the size should be applied.
    public init(_ size: String, condition: SizeCondition) {
        
        self.size = size
        self.condition = condition.rawValue
    }
}
