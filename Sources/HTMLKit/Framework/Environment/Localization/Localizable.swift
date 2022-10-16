/*
 Abstract:
 The file contains the default definition of a localizable element. It defines which properties and methods a content should come with.
 */

/// The protocol defines
public protocol Localizable {
    
    init(_ localizedKey: String)
    
    init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B: Encodable
}

extension Localizable {
    
    public init<T>(_ localizedKey: String, with context: T) where T: Encodable {
        self.init(localizedKey, with: TemplateValue<T>.constant(context))
    }
}
