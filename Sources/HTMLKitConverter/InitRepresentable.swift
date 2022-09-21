public protocol InitRepresentable {
    
    init?(value: String)
}

extension String: InitRepresentable {
    
    public init?(value: String) {
        self.init(value)
    }
}

extension Float: InitRepresentable {
    
    public init?(value: String) {
        self.init(value)
    }
}

extension Int: InitRepresentable {
    
    public init?(value: String) {
        self.init(value)
    }
}

extension Double: InitRepresentable {
    
    public init?(value: String) {
        self.init(value)
    }
}

extension Bool: InitRepresentable {
    
    public init?(value: String) {
        self.init(value)
    }
}
