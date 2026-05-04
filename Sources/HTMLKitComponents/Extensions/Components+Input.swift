import HTMLKit

extension HTMLKit.Input {
    
    /// Supply a short hint.
    ///
    /// - Parameter value: A container holding the concrete prompt type.
    ///
    /// - Returns: The input
    internal func placeholder(_ value: DynamicString) -> HTMLKit.Input {
        
        switch value {
        case .localized(let value, let tableName):
            return self.placeholder(value, tableName: tableName)
            
        case .literal(let value):
            return self.placeholder(value)
            
        default:
            return self
        }
    }
}

extension HTMLKit.TextArea {
    
    /// Supply a short hint.
    ///
    /// - Parameter value: The container that holds the prompt types.
    ///
    /// - Returns: The text area
    internal func placeholder(_ value: DynamicString) -> HTMLKit.TextArea {
        
        switch value {
        case .localized(let value, let tableName):
            return self.placeholder(value, tableName: tableName)
            
        case .literal(let value):
            return self.placeholder(value)
            
        default:
            return self
        }
    }
}
