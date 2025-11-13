/// A type that represents a media query.
public struct MediaQuery {
    
    /// An enumeration of potential interface orientations.
    public enum InterfaceOrientation {
        
        /// Describes an landscape orientation.
        case landscape
        
        /// Describes an portrait orientation.
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
        
        /// Describes the minimum target width.
        case minWidth(String)
        
        /// Describes the target width.
        case width(String)
        
        /// Describes the maximum target width.
        case maxWidth(String)
        
        /// Describes the minimum target height.
        case minHeight(String)
        
        /// Describes the target height.
        case height(String)
        
        /// Describes the maximum target height.
        case maxHeight(String)
        
        /// Describes the aspect ratio.
        case aspectRatio(String)
        
        /// Describes the interface orientation.
        case orientation(InterfaceOrientation)
        
        /// Describes the minimum display resolution.
        case minResolution(String)
        
        /// Describes the display resolution.
        case resolution(String)
        
        /// Describes the maximum display resolution.
        case maxResolution(String)
        
        /// Describes the he color depth.
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
    public enum MediaDevice: String {
        
        /// Matches all devices.
        case all
        
        /// Matches screen devices.
        case screen
        
        /// Matches printer devices.
        case print
    }
    
    /// The target of the query.
    internal let target: MediaDevice
    
    /// The features of the query.
    internal let features: [MediaFeature]?
    
    /// The raw representation of the type
    internal var rawValue: String {

        if let features = self.features {
            return "\(target.rawValue) and \(features.map { $0.rawValue }.joined(separator: " and "))"
        }
        
        return "\(target.rawValue)"
    }

    /// Create a media query.
    /// 
    /// - Parameters:
    ///   - target: The device to target.
    ///   - features: The features to match to the target.
    public init(target: MediaDevice, features: [MediaFeature]? = nil) {
        
        self.target = target
        self.features = features
    }
    
    /// Create a media query.
    /// 
    /// - Parameters:
    ///   - target: The device to target.
    ///   - features: The features to match to the target.
    public init(target: MediaDevice, features: MediaFeature...) {
        
        self.target = target
        self.features = features
    }
}
