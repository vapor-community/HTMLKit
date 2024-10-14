/*
 Abstract:
 The file contains the default definition of a localizable element. It defines which properties and methods a content should come with.
 */

/// A protocol that defines a type capable of being localized.
@_documentation(visibility: internal)
public protocol Localizable {
    
    init(_ localizedKey: String, tableName: String?, interpolation: Any...)
}
