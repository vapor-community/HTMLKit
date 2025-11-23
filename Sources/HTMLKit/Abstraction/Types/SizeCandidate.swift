/// A type that represents a size candidate.
/// 
/// The candidate is used to define the conditions under which the size should then be applied.
/// 
/// ```swift
/// Image()
///     .source("...png")
///     .sourceSet(..., ...)
///     .sizes(
///         SizeCandidate("100vw", conditions: .maxWidth("1680px")), 
///         SizeCandidate("80vw")
///     )
/// ```
public struct SizeCandidate {
    
    /// An enumeration of potential interface orientations.
    public enum InterfaceOrientation {
        
        /// Indicates a landscape orientation.
        case landscape
        
        /// Indicates a portrait orientation.
        case portrait
        
        /// The raw representation of the type.
        internal var rawValue: String {
            
            switch self {
            case .landscape:
                return "landscape"
                
            case .portrait:
                return "portrait"
            }
        }   
    }
    
    /// An enumeration of potential width conditions.
    public enum SizeCondition {
        
        /// Specifies the maximum width.
        case maxWidth(String)
        
        /// Specifies the target width.
        case width(String)
        
        /// Specifies the minimum width.
        case minWidth(String)
        
        /// Specifies a interface orientation.
        case orientation(InterfaceOrientation)
        
        /// The raw representation of the type.
        internal var rawValue: String {
            
            switch self {
            case .maxWidth(let width):
                return "(max-width: \(width))"
                
            case .width(let width):
                return "(width: \(width))"
                
            case .minWidth(let width):
                return "(min-width: \(width))"
                
            case .orientation(let orientation):
                return "(orientation: \(orientation.rawValue))"
            }
        }
    }
    
    /// The size of the candidate.
    internal let size: String
    
    /// The potential conditions of the candidate.
    internal let conditions: [SizeCondition]?
    
    /// The raw representation of the type.
    internal var rawValue: String {
        
        if let conditions = self.conditions {
            return "\(conditions.map { $0.rawValue }.joined(separator: " and ")) \(size)"
        }
        
        return size
    }
    
    /// Create a size candidate.
    /// 
    /// - Parameters:
    ///   - size: The width to apply.
    ///   - conditions: The conditions under which the size should be applied.
    public init(_ size: String, conditions: [SizeCondition]? = nil) {
        
        self.size = size
        self.conditions = conditions
    }
    
    /// Create a size candidate.
    /// 
    /// - Parameters:
    ///   - size: The width to apply.
    ///   - conditions: The conditions under which the size should be applied.
    public init(_ size: String, conditions: SizeCondition...) {
        
        self.size = size
        self.conditions = conditions
    }
}
