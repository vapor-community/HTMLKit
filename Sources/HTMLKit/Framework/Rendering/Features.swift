/// An option set of features.
public struct Features: Swift.OptionSet {
    
    public var rawValue: Int
    
    public static let markdown = Features(rawValue: 1 << 0)
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
}
