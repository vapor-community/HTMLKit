/// The protcol is for
public protocol Modifiable {
    
    /// The func is for
    func modify(if condition: Bool, element: (Self) -> Self) -> Self
    
    /// The func is for
    func modify<T>(unwrap value: TemplateValue<T?>, element: (Self, TemplateValue<T>) -> Self) -> Self
}
