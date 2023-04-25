/// A type for a css declaration
internal class Declaration {
    
    /// A enumeration of the declaration variations
    internal enum DeclarationType {
        
        /// Indicates the declaration is a property
        case property
        
        /// Indicates the declaration is a variable
        case variable
    }
    
    /// The type of the declaration
    private var type: DeclarationType
    
    /// The property of the declaration
    internal var property: String
    
    /// The value of the declaration
    internal var value: String
    
    /// Initiates a declaration
    internal init(type: DeclarationType, property: String) {
        
        self.type = type
        self.property = property
        self.value = ""
    }
    
    /// MInifies the declaration
    internal func minify() -> String {
        return "\(property):\(value.trimmingCharacters(in: .whitespaces))"
    }
}
