/// A struct that can be brewed
public protocol BrewableFormula {
    
    /// Brews a mappable object in to a formula
    ///
    ///     formula.add(string: "<\(nodeName)/>")   // A constant string
    ///     formula.add(self)                       // Not able to be predetermand
    ///
    /// - Parameter formula: The formula to brew in to
    /// - Throws: If there occured some error
    func brew<T>(_ formula: HTML.Renderer.Formula<T>) throws
}
