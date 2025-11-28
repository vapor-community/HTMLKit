public struct SubmitAction: Action {
    
    public var actions: [String] = []
    
    public func validate(_ target: String, _ validators: [Validator]) -> SubmitAction {
        
        var copy = self
        
        if !validators.isEmpty {
            
            let result = validators.map { "{\"field\":\"\($0.field)\",\"rule\":\"\($0.rule)\"}" }
            
            copy.actions.append("$('#\(target.escape())').validate('[\(result.joined(separator: ","))]');")
            
            return copy
        }
        
        copy.actions.append("$('#\(target.escape())').validate('[]');")
        
        return copy
    }
}
