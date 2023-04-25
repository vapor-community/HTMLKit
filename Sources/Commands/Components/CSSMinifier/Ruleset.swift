/// A type for a css ruleset
internal class Ruleset {
    
    /// A enumeration of the ruleset variations
    internal enum SelectorType {
        
        /// Indicates the set is about an element
        case element
        
        /// Indicates the set is about a class
        case `class`
        
        /// Indicates the set is about a id
        case id
        
        /// Indicates the set is about a root
        case root
        
        /// Indicates the set is about a media query
        case query
    }
    
    /// The selector of the ruleset
    internal var selector: String
    
    /// The type of the ruleset
    private var type: SelectorType
    
    /// The children sets of a ruleset
    private var sets: [Ruleset]?
    
    /// The temporary slot for a declaration
    private var declarations: [Declaration]?
    
    /// Initiates a ruleset
    internal init(type: SelectorType, selector: String) {
        
        self.type = type
        self.selector = selector
    }
    
    /// Adds a declaration
    internal func add(declaration: Declaration) {
        
        if var declarations = self.declarations {
            
            declarations.append(declaration)
            
            self.declarations = declarations
            
        } else {
            self.declarations = [declaration]
        }
    }
    
    /// Adds a ruleset
    internal func add(ruleset: Ruleset) {
        
        if var sets = self.sets {
            
            sets.append(ruleset)
            
            self.sets = sets
            
        } else {
            self.sets = [ruleset]
        }
    }
    
    /// Minfiies a ruleset
    internal func minify() -> String {
        
        var yield = "\(selector.trimmingCharacters(in: .whitespaces)){"
        
        if let sets = self.sets {
            yield = yield + sets.map { $0.minify()}.joined()
        }
        
        if let declarations = self.declarations {
            yield = yield + declarations.map { $0.minify()}.joined(separator: ";")
        }
        
        yield = yield + "}"
        
        return yield
    }
}
