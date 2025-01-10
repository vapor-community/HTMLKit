import Foundation

/// A property wrapper type to provide access to an environment object
///
/// An environment object allows to read shared environment data.
@frozen @propertyWrapper public struct EnvironmentObject<ObjectType> {
    
    /// The wrapped object
    public var wrappedValue: Wrapper<ObjectType>
    
    /// Initialiizes the environment object
    public init(_ type: ObjectType.Type) {
        
        self.wrappedValue = .init()
    }
    
    /// A wrapper, that holds the object informationen
    @dynamicMemberLookup public struct Wrapper<WrapperType> {
        
        /// The path of the parent
        internal var parent: AnyKeyPath?
        
        /// The path of the value
        internal var path: AnyKeyPath
        
        /// Initializes the wrapper
        public init() {
            
            self.path = \WrapperType.self
        }
        
        /// Initializes the wrapper
        ///
        /// - Parameters:
        ///   - parent: The path of the parent
        ///   - path: The path of the value
        internal init(parent: AnyKeyPath, path: AnyKeyPath) {
            
            self.parent = parent
            self.path = path
        }
        
        /// Accesses a wrapped value for a given key path dynamically
        ///
        /// - Returns: An environment value
        public subscript<T>(dynamicMember member: KeyPath<WrapperType, T>) -> EnvironmentValue {
            
            guard let newPath = self.path.appending(path: member) else {
                fatalError()
            }
            
            if let parent = self.parent {
                return .init(parentPath: parent, valuePath: newPath)
            }
            
            return .init(parentPath: self.path, valuePath: newPath)
        }
        
        ///  Accesses a wrapped model object for a given key path dynamically
        ///
        /// - Returns: An environment value
        public subscript<T>(dynamicMember member: KeyPath<WrapperType, T>) -> Wrapper<T> where T: ViewModel {
            
            guard let newPath = self.path.appending(path: member) else {
                fatalError()
            }
            
            return .init(parent: self.path, path: newPath)
        }
    }
}

/// A type, that defines a view model
public protocol ViewModel: Encodable {}
