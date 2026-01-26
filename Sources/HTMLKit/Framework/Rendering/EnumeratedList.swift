/// A value type that holds a set of values along with its separator.
@_documentation(visibility: internal)
public struct EnumeratedList {
    
    /// The values within the list.
    internal let values: [String]
    
    /// The separator for the list.
    internal let separator: String
    
    /// Create a enumerated list.
    /// 
    /// - Parameters:
    ///   - values: The values to enumerate.
    ///   - separator: The separator to enumerate with.
    internal init(values: [String], separator: String) {
        
        self.values = values
        self.separator = separator
    }
    
    /// The string represenation of the list.
    internal var description: String {
        return values.joined(separator: separator)
    }
}

extension EnumeratedList {
    
    internal init(values: [SizeCandidate], separator: String) {
        
        self.values = values.map(\.rawValue)
        self.separator = separator
    }
    
    internal init(values: [SourceCandidate], separator: String) {
        
        self.values = values.map(\.rawValue)
        self.separator = separator
    }
    
    internal init(values: [MediaQuery], separator: String) {
        
        self.values = values.map(\.rawValue)
        self.separator = separator
    }
    
    internal init(values: [Values.Media], separator: String) {
        
        self.values = values.map(\.rawValue)
        self.separator = separator
    }
    
    internal init(values: [Values.Completion], separator: String) {
        
        self.values = values.map(\.rawValue)
        self.separator = separator
    }
    
    internal init(values: [Values.Permission], separator: String) {
     
        self.values = values.map(\.rawValue)
        self.separator = separator
    }
}

extension EnumeratedList: Equatable {
    
    public static func == (lhs: EnumeratedList, rhs: EnumeratedList) -> Bool {
        return lhs.values == rhs.values && lhs.separator == rhs.separator
    }
}
