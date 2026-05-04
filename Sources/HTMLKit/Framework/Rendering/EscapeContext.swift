/// A companion type that informs about trusted or tainted content.
@_documentation(visibility: internal)
public enum EscapeContext {
    
    /// The subcontext that describes the content.
    public enum Subcontext {
        
        /// Consider an HTML context.
        case html
        
        /// Consider a CSS context.
        case css
        
        /// Consider a JS context.
        case js
        
        /// Consider a URL context.
        case url
    }
    
    /// Whether the content is considered trusted.
    case trusted
    
    /// Whether the content is considered tainted.
    case tainted(Subcontext)
}
