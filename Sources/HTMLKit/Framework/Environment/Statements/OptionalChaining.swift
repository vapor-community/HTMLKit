/*
 Abstract:
 The file contains statements for optional chaining.
 
 Markings:
 - Unwrap
 */

/// The function is for
public struct Unwrap {

    internal let content: IF
    
    internal init(content: IF) {
        self.content = content
    }

    public init<T>(_ value: TemplateValue<T?>, @ContentBuilder<Content> content: (TemplateValue<T>) -> Content) {
        
        var ifContent: Content = ""
        
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

    public func `else`(@ContentBuilder<Content> content: () -> Content) -> Content {
        self.content.else(content: content)
    }
}

extension Unwrap: Node {
    
    func prerender(with formula: Formula) {
        content.prerender(with: formula)
    }
    
    func render<T>(with manager: ContextManager<T>) -> String {
        return content.render(with: manager)
    }
}
