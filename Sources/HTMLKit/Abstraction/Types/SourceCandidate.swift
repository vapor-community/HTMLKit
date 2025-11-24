import Foundation

/// A type that represents a source candidate.
/// 
/// The candidate is used to define an alternative source with an additional condition.
/// 
/// ```swift
/// Image()
///     .source("...png")
///     .sourceSet(
///         SourceCandidate("...png", width: 1024),
///         SourceCandiate("...png", width: 1680)
///     )
/// ```
public struct SourceCandidate {
    
    /// An enumeration of potential pixel densities.
    public enum PixelDensity {
        
        /// Specifies a 1:1 density.
        case regular
        
        /// Specifies a 2:1 density.
        case high
        
        /// Specifies a 3:1 density.
        case ultra
        
        /// The raw representation of the type.
        internal var rawValue: String {
            
            switch self {
            case .regular:
                return "1x"
                
            case .high:
                return "2x"
                
            case .ultra:
                return "3x"
            }
        }
    }
    
    /// The source path of the candidate.
    internal let source: String
    
    /// The potential condition of the candidate.
    internal let condition: String?
    
    /// The raw representation of the type.
    internal var rawValue: String {
        
        if let condition = self.condition {
            return "\(source) \(condition)"
        }
        
        return source
    }
    
    /// Create a source candidate.
    /// 
    /// - Parameters:
    ///   - source: The url path to load from.
    ///   - width: The width to apply.
    public init(_ source: String) {
        
        self.source = source
        self.condition = nil
    }
    
    /// Create a source candidate.
    /// 
    /// - Parameters:
    ///   - source: The url path to load from.
    ///   - width: The width to apply.
    public init(_ source: String, width: Int) {
        
        self.source = source
        self.condition = "\(width)w"
    }
    
    /// Create a source candidate.
    /// 
    /// - Parameters:
    ///   - source: The url path to load from.
    ///   - density: The density to apply.
    public init(_ source: String, density: Int) {
        
        self.source = source
        self.condition = "\(density)x"
    }
    
    /// Create a source candidate.
    /// 
    /// - Parameters:
    ///   - source: The url path to load from.
    ///   - density: The density to apply.
    public init(_ source: String, density: PixelDensity) {
        
        self.source = source
        self.condition = density.rawValue
    }
}
