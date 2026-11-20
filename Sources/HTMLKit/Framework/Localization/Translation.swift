/// A type that represents the translation within the translation table.
internal struct Translation: Sendable {
    
    /// The plural cases of the translation.
    private var cases: [PluralCategory: String]
    
    /// The comment describing the context.
    internal let comment: String?
    
    /// Creates a translation.
    /// 
    /// - Parameters:
    ///   - value: The value for the translation.
    ///   - comment: The comment for some context.
    internal init(default value: String, comment: String? = nil) {
        
        self.cases = [.other: value]
        self.comment = comment
    }
    
    internal mutating func append(_ value: String?, for category: PluralCategory) {
        
        if let value = value {
            self.cases[category] = value
        }
    }
    
    internal func retrieve(for key: PluralCategory) -> String {
        return cases[key] ?? cases[.other]!
    }
}
