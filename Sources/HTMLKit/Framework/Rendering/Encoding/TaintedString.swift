/// A string that represents a untrusted string
/// 
/// The tainted string comes from a untrusted source and must be escaped by the renderer,
/// before it is getting consumed.
internal struct TaintedString: Content {
    
    internal enum Context {

        /// The context within a html context
        internal enum Context {
            
            /// Consider an attribute value
            case attribute
            
            /// Consider an element body
            case element
        }
        
        /// Consider an html context
        case html(Context)
        
        /// Consider a css context
        case css
        
        /// Consider a js context
        case js
    }
    
    /// The string value marked as tainted
    internal let value: String
    
    /// The context of the source of the string
    internal let context: Context
    
    /// Create a tainted string
    /// 
    /// - Parameters:
    ///   - value: The string value
    ///   - context: The context the string is coming from
    internal init(_ value: String, as context: Context) {
        
        self.value = value
        self.context = context
    }
}
