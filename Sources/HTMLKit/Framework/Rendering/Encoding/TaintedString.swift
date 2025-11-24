/// A type that represents an untrusted string.
/// 
/// The tainted string comes from an untrusted source and must be escaped by the renderer,
/// before it is getting consumed.
internal struct TaintedString: Content {
    
    /// An enumeration of potential source contexts
    internal enum Context {

        /// The subcontext within a source context
        internal enum Subcontext {
            
            /// Consider an attribute value
            case attribute
            
            /// Consider an element body
            case element
        }
        
        /// Consider an HTML context
        case html(Subcontext)
        
        /// Consider a CSS context
        case css(Subcontext)
        
        /// Consider a JS context
        case js(Subcontext)
    }
    
    /// The string value marked as tainted
    internal let value: String
    
    /// The context of the source of the string
    internal let context: Context
    
    /// Create a tainted string.
    /// 
    /// - Parameters:
    ///   - value: The string value
    ///   - context: The context the string is coming from
    internal init(_ value: String, as context: Context) {
        
        self.value = value
        self.context = context
    }
}
