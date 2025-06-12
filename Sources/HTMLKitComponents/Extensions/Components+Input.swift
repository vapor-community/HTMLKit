import HTMLKit

extension HTMLKit.Input {
    
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
    
    internal func placeholder(_ value: PromptType) -> HTMLKit.TextArea {
        
        switch value {
        case .string(let string):
            return self.placeholder(string)
            
        case .value(let value):
            return self.placeholder(value)
        }
    }
}
