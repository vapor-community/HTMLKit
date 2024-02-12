extension Renderer {
    
    public struct FeatureSet: OptionSet {
        
        public var rawValue: Int
        
        public static let markdown = FeatureSet(rawValue: 1 << 0)
        
        public init(rawValue: Int) {
            self.rawValue = rawValue
        }
    }

}
