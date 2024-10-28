import Foundation

/// A set of predefined environment keys
///
/// The keys are used on the environment modifiers to configure various settings for the environment.
public struct EnvironmentKeys: Hashable {
    
    /// A key used to configure the environment's calendar
    public var calender: Calendar
    
    /// A key used to configure the environment's time zone
    public var timeZone: TimeZone
    
    /// A key used to configure the environment's locale
    public var locale: Locale
    
    /// A key used  to configure the environment's color scheme
    public var colorScheme: String
}
