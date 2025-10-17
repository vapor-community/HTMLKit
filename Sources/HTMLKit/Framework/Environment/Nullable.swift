/// A type that represent a nullable value.
///
/// > Note: This protocol is intended as a temporary workaround.
@_documentation(visibility: internal)
internal protocol Nullable {
    
    /// Checks whether the value is absent without needing to know the underlying type.
    var isNull: Bool { get }
}
