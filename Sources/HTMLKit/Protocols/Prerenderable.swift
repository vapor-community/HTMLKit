/// A struct that can be brewed
public protocol Prerenderable {
    
    /// Brews a mappable object in to a formula
    ///
    ///     formula.add(string: "<\(name)/>")   // A constant string
    ///     formula.add(self)                   // Not able to be predetermined
    ///
    /// - Parameter formula: The formula to brew in to
    /// - Throws: If there occured some error
    
}
