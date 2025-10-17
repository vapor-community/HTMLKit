import HTMLKit

extension HTMLKit.Input {
    
    /// Supply a short hint.
    ///
    /// - Parameter value: A container holding the concrete prompt type.
    ///
    /// - Returns: The input
    internal func placeholder(_ value: PromptType) -> HTMLKit.Input {
        
        switch value {
        case .string(let string):
            return self.placeholder(string)
            
        case .value(let value):
            return self.placeholder(value)
        }
    }
}

extension HTMLKit.TextArea {
    
    /// Supply a short hint.
    ///
    /// - Parameter value: The container that holds the prompt types.
    ///
    /// - Returns: The text area
    internal func placeholder(_ value: PromptType) -> HTMLKit.TextArea {
        
        switch value {
        case .string(let string):
            return self.placeholder(string)
            
        case .value(let value):
            return self.placeholder(value)
        }
    }
}
