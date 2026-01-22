/// A type that holds the data.
public struct AttributeData {
    
    /// A type that holds the data.
    internal enum DataValue {
        
        /// A string value
        case string(String)
        
        /// A int value
        case int(Int)
        
        /// A double value
        case double(Double)
        
        /// A booleanl value
        case bool(Bool)
        
        /// A float value
        case float(Float)
        
        /// A localized string
        case localized(LocalizedString)
        
        /// A environment value
        case environment(EnvironmentValue)
    }
    
    /// The
    internal var context: EscapeContext
    
    /// The actual data value.
    internal var value: DataValue
    
    /// Create a string attribute.
    /// 
    /// - Parameters:
    ///   - value: The string value
    ///   - context: Whether the value is safe
    public init(_ value: String, context: EscapeContext) {
        
        self.context = context
        self.value = .string(value)
    }
    
    /// Create a int attribute.
    /// 
    /// - Parameters:
    ///   - value: The int value
    ///   - context: Whether the value is safe
    public init(_ value: Int, context: EscapeContext) {
        
        self.context = context
        self.value = .int(value)
    }
    
    /// Create a double attribute.
    /// 
    /// - Parameters:
    ///   - value: The double value
    ///   - context: Whether the value is safe
    public init(_ value: Double, context: EscapeContext) {
        
        self.context = context
        self.value = .double(value)
    }
    
    /// Create a bool attribute.
    /// 
    /// - Parameters:
    ///   - value: The string value
    ///   - context: Whether the value is safe
    public init(_ value: Bool, context: EscapeContext) {
        
        self.context = context
        self.value = .bool(value)
    }
    
    /// Create a float attribute.
    /// 
    /// - Parameters:
    ///   - value: The float value
    ///   - context: Whether the value is safe
    public init(_ value: Float, context: EscapeContext) {
        
        self.context = context
        self.value = .float(value)
    }
    
    /// Create a localiized attribute.
    /// 
    /// - Parameters:
    ///   - value: The string value
    ///   - context: Whether the value is safe
    public init(_ value: LocalizedString, context: EscapeContext) {
        
        self.context = context
        self.value = .localized(value)
    }
    
    /// Create a environment attribute.
    /// 
    /// - Parameters:
    ///   - value: The string value
    ///   - context: Whether the value is safe
    public init(_ value: EnvironmentValue, context: EscapeContext) {
        
        self.context = context
        self.value = .environment(value)
    }
}
