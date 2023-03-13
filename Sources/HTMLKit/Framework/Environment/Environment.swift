import Foundation

/// A type that represents the environment
public struct Environment {
    
    /// The current  time zone of the environment
    public var timeZone: TimeZone?
    
    /// The current calender of the environment
    public var calendar: Calendar?
    
    /// The current local of the environment
    public var locale: Locale?
    
    /// The current color scheme of the environment
    public var colorScheme: String?
}
