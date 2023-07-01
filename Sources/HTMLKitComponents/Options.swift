/*
 Abstract:
 The file contains the option sets.
 */

public struct EdgeSet: OptionSet {
    
    public var rawValue: Int
    
    public static let top = EdgeSet(rawValue: 1 << 0)
    public static let bottom = EdgeSet(rawValue: 1 << 1)
    public static let leading = EdgeSet(rawValue: 1 << 2)
    public static let trailing = EdgeSet(rawValue: 2 << 3)
    public static let horizontal = EdgeSet(rawValue: 3 << 4)
    public static let vertical = EdgeSet(rawValue: 4 << 5)
    
    public static let all: EdgeSet = [.top, .bottom, .leading, .trailing]
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
}
