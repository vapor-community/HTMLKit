public struct Charset: ExpressibleByStringLiteral {
    internal let value: String
    
    public init(stringLiteral value: String) {
        self.value = value
    }
    
    public static let utf8: Charset = "UTF-8"
}
