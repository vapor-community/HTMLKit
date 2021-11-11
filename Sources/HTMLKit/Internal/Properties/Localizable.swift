/// The protocol defines
///
///
public protocol Localizable {
    
    init(_ localizedKey: String)
    
    init<B>(_ localizedKey: String, with context: TemplateValue<B>) where B: Encodable
}

extension Localizable {
    
    public init<T>(_ localizedKey: String, with context: T) where T: Encodable {
        self.init(localizedKey, with: TemplateValue<T>.constant(context))
    }
}
