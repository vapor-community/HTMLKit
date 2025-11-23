/// A type that represents a media query.
/// 
/// The query is used to define the conditions under which the resource should then be applied.
/// 
/// ```swift
/// Link()
///     .reference("https://...")
///     .media(
///         MediaQuery(.screen, features: .orientation(.landscape)),
///         MediaQuery(.print, features: .resolution("300dpi"))
///     )
/// ```
public struct MediaQuery {
    
    /// An enumeration of potential interface orientations.
    public enum InterfaceOrientation {
        
        /// Indicates a landscape orientation.
        case landscape
        
        /// Indicates a portrait orientation.
        case portrait
        
        internal var rawValue: String {
            
            switch self {
            case .landscape:
                return "landscape"
                
            case .portrait:
                return "portrait"
            }
        }   
    }
    
    /// An enumeration of potential media features.
    public enum MediaFeature {
        
        /// Specifies the minimum target width.
        case minWidth(String)
        
        /// Specifies the target width.
        case width(String)
        
        /// Specifies the maximum target width.
        case maxWidth(String)
        
        /// Specifies the minimum target height.
        case minHeight(String)
        
        /// Specifies the target height.
        case height(String)
        
        /// Specifies the maximum target height.
        case maxHeight(String)
        
        /// Specifies the aspect ratio.
        case aspectRatio(String)
        
        /// Specifies the interface orientation.
        case orientation(InterfaceOrientation)
        
        /// Specifies the minimum display resolution.
        case minResolution(String)
        
        /// Specifies the display resolution.
        case resolution(String)
        
        /// Specifies the maximum display resolution.
        case maxResolution(String)
        
        /// Specifies the color depth.
        case color(Int?)
        
        internal var rawValue: String {
            
            switch self {
            case .minWidth(let length):
                return "(min-width: \(length))"
                
            case .width(let length):
                return "(width: \(length))"
                
            case .maxWidth(let length):
                return "(max-width: \(length))"
                
            case .minHeight(let length):
                return "(min-height: \(length))"
                
            case .height(let length):
                return "(height: \(length))"
                
            case .maxHeight(let length):
                return "(max-height: \(length))"
                
            case .aspectRatio(let ratio):
                return "(aspect-ratio: \(ratio))"
                
            case .orientation(let orientation):
                return "(orientation: \(orientation.rawValue))"
                
            case .minResolution(let pixel):
                return "(min-resolution: \(pixel))"
                
            case .resolution(let pixel):
                return "(resolution: \(pixel))"
                
            case .maxResolution(let pixel):
                return "(max-resolution: \(pixel))"
                
            case .color(let depth):
                
                if let depth {
                    return "(color: \(depth))"
                }
                
                return "(color)"
            }
        }
    }
    
    /// An enumeration of potential media devices.
    public enum MediaTarget: String {
        
        /// Matches all devices.
        case all
        
        /// Matches screen devices.
        case screen
        
        /// Matches printer devices.
        case print
    }
    
    /// The target of the query.
    internal let target: MediaTarget
    
    /// The potential features of the query.
    internal let features: [MediaFeature]?
    
    /// The raw representation of the type.
    internal var rawValue: String {

        if let features = self.features {
            return "\(target.rawValue) and \(features.map { $0.rawValue }.joined(separator: " and "))"
        }
        
        return "\(target.rawValue)"
    }

    /// Create a media query.
    /// 
    /// - Parameters:
    ///   - target: The media to target.
    ///   - features: The features to match to the target.
    public init(_ target: MediaTarget, features: [MediaFeature]? = nil) {
        
        self.target = target
        self.features = features
    }
    
    /// Create a media query.
    /// 
    /// - Parameters:
    ///   - target: The media to target.
    ///   - features: The features to match to the target.
    public init(_ target: MediaTarget, features: MediaFeature...) {
        
        self.target = target
        self.features = features
    }
}
