import Foundation

/// A type that represents a source candidate.
/// 
/// ```swift
/// Image()
///     .sourceSet(SourceCandidate("...png", width: 100), SourceCandiate("...png", density: .ultra))
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
    
    /// The url path of the candidate.
    internal let source: URL
    
    /// The condition of the candidate.
    internal let condition: String
    
    internal var rawValue: String {
        return "\(source) \(condition)"
    }
    
    /// Create a source candidate.
    /// 
    /// - Parameters:
    ///   - source: The url path to load from.
    ///   - width: The width to apply.
    public init(_ source: URL, width: Int) {
        
        self.source = source
        self.condition = "\(width)w"
    }
    
    /// Create a source candidate.
    /// 
    /// - Parameters:
    ///   - source: The url path to load from.
    ///   - density: The density to apply.
    public init(_ source: URL, density: Int) {
        
        self.source = source
        self.condition = "\(density)x"
    }
    
    /// Create a source candidate.
    /// 
    /// - Parameters:
    ///   - source: The url path to load from.
    ///   - density: The density to apply.
    public init(_ source: URL, density: PixelDensity) {
        
        self.source = source
        self.condition = density.rawValue
    }
}
