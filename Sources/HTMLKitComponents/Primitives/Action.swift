public protocol Action {
    
    var actions: [String] { get set }
}

extension Action {
    
    public var description: String {
        return actions.joined()
    }
}
