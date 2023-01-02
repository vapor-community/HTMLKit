import Foundation

/// A property wrapper type to initate an environment object
@frozen @propertyWrapper public struct EnvironmentObject<Value> {
    
    /// The wrapped value
    public var wrappedValue: Wrapper<Value>
    
    /// Converts the type into the wrapped value
    public init(_ type: Value.Type) {
        
        self.wrappedValue = .init()
    }
    
    /// A type, that holds the environment object informationen
    @dynamicMemberLookup public struct Wrapper<Value> {
        
        /// The path of the parent
        internal var parent: AnyKeyPath?
        
        /// The path of the value
        internal var path: AnyKeyPath
        
        /// Initiates a wrapper
        public init() {
            
            self.path = \Value.self
        }
        
        /// Initiates a wrapper with the necessary information for the environment object
        internal init(parent: AnyKeyPath, path: AnyKeyPath) {
            
            self.parent = parent
            self.path = path
        }
        
        /// Looks up for a containing property
        public subscript<T>(dynamicMember member: KeyPath<Value, T>) -> EnvironmentValue {
            
            guard let newPath = self.path.appending(path: member) else {
                fatalError()
            }
            
            if let parent = self.parent {
                return .init(parentPath: parent, valuePath: newPath)
            }
            
            return .init(parentPath: self.path, valuePath: newPath)
        }
        
        /// Looks up for a containing model
        public subscript<T>(dynamicMember member: KeyPath<Value, T>) -> Wrapper<T> where T: ViewModel {
            
            guard let newPath = self.path.appending(path: member) else {
                fatalError()
            }
            
            return .init(parent: self.path, path: newPath)
        }
    }
}

/// A type, that defines a view model
public protocol ViewModel: Encodable {}
