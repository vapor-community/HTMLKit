/// A type, that defines a view model
public protocol ViewModel: Encodable {
}

extension ViewModel {
    
    public func encode(to encoder: Encoder) throws {}
}
