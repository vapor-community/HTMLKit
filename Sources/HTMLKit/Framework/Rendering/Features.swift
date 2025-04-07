/// An option set of different features
///
/// The feature set provides the flexibility to enable experimental features if desired.
public struct Features: Swift.OptionSet {
    
    public var rawValue: Int
    
    /// A flag that indicates whether the renderer should use markdown
    public static let markdown = Features(rawValue: 1 << 0)
    
    /// A flag that indicates whether the renderer should encode input
    public static let escaping = Features(rawValue: 1 << 1)
    
    /// Initializes the feature set
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
}
