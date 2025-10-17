import Foundation

/// The validator for the form validation.
public struct Validator: Encodable {
    
    public enum Rule: String {
        
        /// The field must have a value.
        case value = "value"
        
        /// The field must have a valid email format.
        case email = "email"
        
        /// The field must have a valid number format.
        case number = "number"
        
        /// The field must have a valid date format.
        case date = "date"
        
        /// The field must have a valid url format.
        case url = "url"
    }
    
    /// The name of the field.
    internal var field: String
    
    /// The rule of validation.
    internal var rule: String
    
    /// Initiates a validator.
    public init(field: String, rule: Rule) {
        
        self.field = field
        self.rule = rule.rawValue
    }
}
