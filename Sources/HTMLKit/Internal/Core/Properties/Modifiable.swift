/// The protcol is for
///
///
public protocol Modifiable {
    
    /// The func is for
    ///
    ///
    func modify(if condition: Bool, modifyer: (Self) -> Self) -> Self
    
    /// The func is for
    ///
    ///
    func modify<Value>(unwrap value: TemplateValue<Value?>, modifyer: (TemplateValue<Value>, Self) -> Self) -> Self
}
