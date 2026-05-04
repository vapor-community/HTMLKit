/// A type that represents a keyboard shortcut.
public struct KeyboardShortcut: Sendable {
    
    /// A type thats represents an action key.
    public struct ActionKey: ExpressibleByUnicodeScalarLiteral, Sendable {
        
        /// Represents the enter key.
        public static let enter = ActionKey("Enter")
        
        /// Represents the spacebar key.
        public static let space = ActionKey("Space")
        
        /// Represents the tab key.
        public static let tab = ActionKey("Tab")
        
        /// Represents the escape key.
        public static let escape = ActionKey("Escape")
        
        /// Represents the delete key.
        public static let delete = ActionKey("Backspace")
        
        internal let value: String
        
        /// Create an action key.
        /// 
        /// - Parameter value: The character that represents the key.
        public init(unicodeScalarLiteral value: String) {
            self.value = value
        }
        
        internal init(_ value: String) {
            self.value = value
        }
    }
    
    /// An enumeration of modifier keys.
    public enum ModifierKey: String, Sendable {
        
        /// Represents the alt key.
        case alt = "Alt"
        
        /// Represents the command key.
        case command = "Command"
        
        /// Represents the shift key.
        case shift = "Shift"
        
        /// Represents the control key.
        case control = "Control"
    }
    
    /// The action key that triggers the shortcut.
    private let key: ActionKey
    
    /// The potential modifier keys to use in conjuction.
    private let modifiers: [ModifierKey]?
    
    /// The raw representation of the type.
    internal var rawValue: String {
        
        if let modifiers = modifiers {
            return "\(modifiers.map { $0.rawValue }.joined(separator: "+"))+\(key.value)"
        }
        
        return key.value
    }
    
    /// Create a keyboard shortcut.
    /// 
    /// - Parameters:
    ///   - key: The action key to use.
    ///   - modifiers: The modifier keys to use in conjuction.
    public init(_ key: ActionKey, modifiers: [ModifierKey]? = nil) {
    
        self.key = key
        self.modifiers = modifiers
    }
    
    /// Create a keyboard shortcut.
    /// 
    /// - Parameters:
    ///   - key: The action key to use.
    ///   - modifiers: The modifier keys to use in conjuction.
    public init(_ key: ActionKey, modifiers: ModifierKey...) {
    
        self.key = key
        self.modifiers = modifiers
    }
}
