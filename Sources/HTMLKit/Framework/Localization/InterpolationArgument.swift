import Foundation

/// An enum that represents the data types of arguments used in interpolation.
///
/// Each case corresponds to a specific data type and provides a placeholder
/// that can be used for replacing values in the localized string.
@_documentation(visibility: internal)
public enum InterpolationArgument: Sendable {
    
    /// Holds an integer value
    case int(Int)
    
    /// Holds a string value
    case string(String)
    
    /// Holds a double value
    case double(Double)
    
    /// Holds a float value
    case float(Float)
    
    /// Holds a date value
    case date(Date)
    
    /// The placeholder used for string interpolation
    internal var placeholder: String {
        
        switch self {
        case .int(_):
            return "%lld"
            
        case .string(_):
            return "%@"
            
        case .double(_):
            return "%f"
            
        case .float(_):
            return "%f"
            
        case .date(_):
            return "%@"
        }
    }
}
