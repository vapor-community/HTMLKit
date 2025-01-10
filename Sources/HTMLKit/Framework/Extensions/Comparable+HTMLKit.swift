extension Comparable {
    
    /// Checks for equality
    ///
    /// - Parameters:
    ///   - other: The other value to compare
    ///
    /// - Returns: The result
    internal func equal(_ other: Any) -> Bool {

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
    internal func unequal(_ other: Any) -> Bool {
        return !equal(other)
    }

    /// Checks for a greater value
    ///
    /// - Parameters:
    ///   - other: The other value to compare
    ///
    /// - Returns: The result
    internal func greater(_ other: Any) -> Bool {

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
    internal func less(_ other: Any) -> Bool {
        return !greater(other)
    }
}
