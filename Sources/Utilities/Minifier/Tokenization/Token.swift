/// A Type that represents a javascript token
internal protocol Token {
    
    var value: String { get set }
    
    func present() -> String
}
