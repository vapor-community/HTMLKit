extension Comparable {
    
    /// Checks for equality
    ///
    /// - Parameters:
    ///   - other: The other value to compare
    ///
    /// - Returns: The result
    public func equal(_ other: Any) -> Bool {

        guard let other = other as? Self else {
            return false
        }

        return other == self
    }

    /// Checks for inequality
    ///
    /// - Parameters:
    ///   - other: The other value to compare
    ///
    /// - Returns: The result
    public func unequal(_ other: Any) -> Bool {
        return !equal(other)
    }

    /// Checks for a greater value
    ///
    /// - Parameters:
    ///   - other: The other value to compare
    ///
    /// - Returns: The result
    public func greater(_ other: Any) -> Bool {

        guard let other = other as? Self else {
            return false
        }

        return other > self
    }

    /// Checks for smaller value
    ///
    /// - Parameters:
    ///   - other: The other value to compare
    ///
    /// - Returns: The result
    public func less(_ other: Any) -> Bool {
        return !greater(other)
    }
}
