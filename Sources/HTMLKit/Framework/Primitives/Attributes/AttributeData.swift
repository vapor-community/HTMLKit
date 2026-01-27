/// A type that represents the attribute data.
@_documentation(visibility: internal)
public struct AttributeData {
    
    /// An enumeration of potential values.
    internal enum Value {
        
        /// A string value.
        case string(String)
        
        /// An integer value.
        case int(Int)
        
        /// A double value.
        case double(Double)
        
        /// A boolean value.
        case bool(Bool)
        
        /// A float value.
        case float(Float)
        
        /// A localized string.
        case localized(LocalizedString)
        
        /// An environment value.
        case environment(EnvironmentValue)
        
        /// An enumerated list.
        case list(EnumeratedList)
    }
    
    /// The context of the data.
    internal var context: EscapeContext
    
    /// The value of the data.
    internal var value: Value
    
    /// Create a string attribute.
    /// 
    /// - Parameters:
    ///   - value: The string value.
    ///   - context: Whether the value is trustworthy.
    public init(_ value: String, context: EscapeContext) {
        
        self.context = context
        self.value = .string(value)
    }
    
    /// Create an int attribute.
    /// 
    /// - Parameters:
    ///   - value: The int value.
    ///   - context: Whether the value is trustworthy.
    public init(_ value: Int, context: EscapeContext) {
        
        self.context = context
        self.value = .int(value)
    }
    
    /// Create a double attribute.
    /// 
    /// - Parameters:
    ///   - value: The double value
    ///   - context: Whether the value is trustworthy.
    public init(_ value: Double, context: EscapeContext) {
        
        self.context = context
        self.value = .double(value)
    }
    
    /// Create a bool attribute.
    /// 
    /// - Parameters:
    ///   - value: The string value
    ///   - context: Whether the value is trustworthy.
    public init(_ value: Bool, context: EscapeContext) {
        
        self.context = context
        self.value = .bool(value)
    }
    
    /// Create a float attribute.
    /// 
    /// - Parameters:
    ///   - value: The float value.
    ///   - context: Whether the value is trustworthy.
    public init(_ value: Float, context: EscapeContext) {
        
        self.context = context
        self.value = .float(value)
    }
    
    /// Create a localiized attribute.
    /// 
    /// - Parameters:
    ///   - value: The string value.
    ///   - context: Whether the value is trustworthy.
    public init(_ value: LocalizedString, context: EscapeContext) {
        
        self.context = context
        self.value = .localized(value)
    }
    
    /// Create an environment attribute.
    /// 
    /// - Parameters:
    ///   - value: The string value.
    ///   - context: Whether the value is safe
    public init(_ value: EnvironmentValue, context: EscapeContext) {
        
        self.context = context
        self.value = .environment(value)
    }
    
    /// Create an enumerated attribute.
    /// 
    /// - Parameters:
    ///   - value: The enumerated list.
    ///   - context: Whether the list is safe
    public init(_ value: EnumeratedList, context: EscapeContext) {
        
        self.context = context
        self.value = .list(value)
    }
}
