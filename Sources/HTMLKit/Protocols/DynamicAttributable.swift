
/// A protocol making it possible to add dynamic attributes
public protocol DynamicAttributable: AttributableNode {

    associatedtype Root: ContextualTemplate

    /// Adds a dynamic attribute to a node
    ///
    /// - Parameters:
    ///   - attribute: The attribute to add
    ///   - condition: The condition decicing when to add the attribute
    /// - Returns: A node with the new attribute
    func addDynamic(_ attribute: HTML.AttributeNode, with condition: HTML.IF<Root>.Condition) -> Self
}


extension DynamicAttributable {

    /// Adds an dynamic attribute to a node. This may or may not be added to the renderd view based on the context given
    ///
    /// - Parameters:
    ///   - condition: The condition used to evaluate when to add the attributes
    ///   - attributes: The attributes to add
    /// - Returns: A copy of the node with a dynamic attribute
    public func `if`(_ condition: HTML.IF<Root>.Condition, add attributes: HTML.AttributeNode...) -> Self {
        var copy = self
        for attribute in attributes {   // Need to create a new `IF.Condition` since it is a referance type and will cause a weird bug otherwise
            copy = copy.addDynamic(attribute, with: .init(condition: condition.condition))
        }
        return copy
    }

    /// Adds an dynamic attribute to a node. This may or may not be added to the renderd view based on the context given
    ///
    ///     dynamic(div).class("foo").if(\.isChecked, add .checked)
    ///
    /// - Parameters:
    ///   - condition: The condition used to evaluate when to add the attributes
    ///   - attributes: The attributes to add
    /// - Returns: A copy of the node with a dynamic attribute
    public func `if`(_ path: KeyPath<Root.Context, Bool>, add attributes: HTML.AttributeNode...) -> Self {
        var copy = self
        let condition = BoolCondition<Root>(path: path)
        for attribute in attributes {   // Need to create a new `IF.Condition` since it is a referance type and will cause a weird bug otherwise
            copy = copy.addDynamic(attribute, with: HTML.IF<Root>.Condition(condition: condition))
        }
        return copy
    }
}
