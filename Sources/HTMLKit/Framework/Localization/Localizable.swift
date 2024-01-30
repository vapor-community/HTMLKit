/*
 Abstract:
 The file contains the default definition of a localizable element. It defines which properties and methods a content should come with.
 */

/// The protocol defines
@_documentation(visibility: internal)
public protocol Localizable {
    
    init(_ localizedKey: String, tableName: String?, interpolation: Any...)
}
