/*
 Abstract:
 The file contains the default definition of a localizable element. It defines which properties and methods a content should come with.
 */

/// The protocol defines
public protocol Localizable {
    
    init(_ localizedKey: String)
    
    init(_ localizedKey: String, with context: some Encodable)
}

extension Localizable {
    
    public init(_ localizedKey: String, with context: some Encodable) {
        self.init(localizedKey, with: context)
    }
}
