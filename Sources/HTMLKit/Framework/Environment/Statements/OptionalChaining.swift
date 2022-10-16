/// The function is for
public struct Unwrap: GlobalElement {

    internal let content: IF
    
    internal init(content: IF) {
        self.content = content
    }

    public init<T>(_ value: TemplateValue<T?>, @ContentBuilder<AnyContent> content: (TemplateValue<T>) -> AnyContent) {
        
        var ifContent: AnyContent = ""
        
        if value.isMasqueradingOptional {
            
            ifContent = content(value.unsafeCast(to: T.self))
            
        } else {
            
            switch value {
            case .constant(let value):
                
                if value != nil {
                    ifContent = content(.constant(value!))
                }
                
            case .dynamic(let variable):
                ifContent = content(.dynamic(variable.unsafelyUnwrapped))
            }
        }
        
        self.content = IF(value.isDefined) {
            ifContent
        }
    }

    public func `else`(@ContentBuilder<AnyContent> content: () -> AnyContent) -> AnyContent {
        self.content.else(content: content)
    }
}

extension Unwrap: AnyContent {
    
    public func prerender(_ formula: Formula) throws {
        try content.prerender(formula)
    }
    
    public func render<T>(with manager: ContextManager<T>) throws -> String {
        try content.render(with: manager)
    }
}
