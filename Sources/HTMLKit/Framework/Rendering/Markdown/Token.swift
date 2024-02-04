/// A type that represents a markdown token
internal protocol Token {
    
    /// The value of the token
    var value: String { get set }
    
    /// Renders a token into its HTML representation
    func render() -> String
}

internal protocol BlockToken: Token {
    
    /// The descendants of the token
    var children: [Token] { get set }
}

extension BlockToken {
    
    mutating func add(child: Token) {
        self.children.append(child)
    }
}
