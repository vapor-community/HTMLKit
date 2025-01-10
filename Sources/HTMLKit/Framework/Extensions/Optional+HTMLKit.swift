extension Optional: Nullable {
    
    internal var isNull: Bool {
        return self == nil
    }
}

extension Optional: Content {
}
