/// A type that represents the translation within the translation table.
internal struct Translation: Sendable {
    
    /// The value of the translation.
    internal let value: String
    
    /// The comment describing the context.
    internal let comment: String?
    
    /// Creates a translation.
    /// 
    /// - Parameters:
    ///   - value: The value for the translation.
    ///   - comment: The comment for some context.
    internal init(value: String, comment: String? = nil) {
        
        self.value = value
        self.comment = comment
    }
}
